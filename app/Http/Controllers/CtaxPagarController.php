<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Carbon\Carbon;
use gavca\cajabanco;
use gavca\ctaxpagar;
use gavca\banco;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class CtaxPagarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //RESTANDO FONDOS A CAJABANCO
        $prov = $request["prov"];
        $entidad;
        if($request["banco_o_caja"] == "caja"){
            $entidad = "Caja Chica";
        }else{
            $entidad = $request["banco"];
        }
        $saldo;
        $lastrecord = cajabanco::where('cb_entidad',$entidad)
            ->whereDate('cb_fecha','=',$request['fecha'])
            ->latest()
            ->first();
        if($lastrecord === null)
            $saldo = 0;
        else
            $saldo = $lastrecord->cb_saldo;
        cajabanco::create([
            'cb_entidad' => $entidad,
            'cb_debe_haber' => 'HABER',
            'cb_fecha' => $request['fecha'],
            'cb_concepto' => 'Pago de deuda de proveedor '.$prov,
            'cb_monto' => $request['abono'],
            'cb_saldo' => $saldo-$request['abono'],
        ]);

        $ctasxpagar = ctaxpagar::where('cta_prov_codigo',$prov)
            ->where('cta_concepto', 'NOT LIKE', '%Pago%')
            ->get();  
        //creo $abono para iterar a través de todas las cuentas de este proveedor
        //cuando consiga una cuenta con un monto que el abono pueda pagar se
        //marca como pagada y se continua iterando, apenas no se puede pagar
        //una deuda se termina el ciclo.
        $pagos = ctaxpagar::where('cta_prov_codigo',$prov)
            ->where('cta_concepto', 'LIKE', '%Pago%')
            ->get();
        $acumulado=0;
        foreach ($pagos as $key => $pago) {
            $acumulado += $pago->cta_monto;
        } 
        $abono = $acumulado+$request['abono'];
        $concepto = "Pago de deuda - ".$request["concepto"];
        foreach ($ctasxpagar as $key => $cuenta) {
            if($cuenta->cta_monto <= $abono){
                $abono -= $cuenta->cta_monto;
                ctaxpagar::where('id',$cuenta->id)
                    ->update(['cta_pagada' => 1]);
            }else{
                break;
            }
        }    
        ctaxpagar::create([
            'cta_prov_codigo' => $prov,
            'cta_monto' => $request['abono'],
            'cta_concepto' => $concepto,
            'cta_entidad' => $entidad,
            'cta_fecha'=> $request['fecha'],
        ]);
        $request->session()->flash('message', 'Se ha abonado a la deuda correctamente.');
        $ctasxpagar = ctaxpagar::where('cta_prov_codigo',$prov)->get();  
        return view('ctasxpagar.show',compact('ctasxpagar','prov'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($prov)
    {
        DB::table('cuentasxpagar')->where('cta_monto', '=', null)->delete();
        $ctasxpagar = ctaxpagar::where('cta_prov_codigo',$prov)->get();  
        //return $cardexs;
        return view('ctasxpagar.show',compact('ctasxpagar','prov'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function view($id)
    {
        $ctasxpagar = ctaxpagar::where('id',$id)->first();
        return view('ctasxpagar.view',compact('ctasxpagar'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($prov)
    {
        //filtro si la fecha que esta set es un dia cerrado, si lo es devuelva seleccionar fecha y muestre mensaje de error
        $fecha = session('caja_fecha');               
        if(isset($fecha)){
            $ctasxpagar = ctaxpagar::where('cta_prov_codigo',$prov)->get();
            $deuda=0;
            foreach ($ctasxpagar as $key => $cuenta) {
                $findme = 'Pago';
                $pos = strpos($cuenta->cta_concepto, $findme);
                if($pos === false)
                    $deuda+=$cuenta->cta_monto;
                else
                    $deuda-=$cuenta->cta_monto;                
            }
            $fecha = session('caja_fecha'); 
            $bancos = banco::lists('ban_nombre', 'ban_nombre');
            return view('ctasxpagar.edit',compact('prov','bancos','deuda','fecha'));
        }else{
            $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
            if($caja_actual !== null)
            {
                $caja_actual = new Carbon($caja_actual->cb_fecha);
                $caja_actual = $caja_actual->toDateString();
            }
            $ultima_caja = cajabanco::where('cb_activo',0)->latest()->first();
            if($ultima_caja !== null)
            {
                $ultima_caja = new Carbon($ultima_caja->cb_fecha);
                $ultima_caja = $ultima_caja->toDateString();
            }
            \Session::flash('message-error', 'Antes de registrar operaciones de compra, venta o producción debes seleccionar una fecha en caja, bajo la cual se registrarán las operaciones.');
            $hoy = Carbon::today()->toDateString();
            return view('caja.index',compact('hoy','caja_actual','ultima_caja'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
