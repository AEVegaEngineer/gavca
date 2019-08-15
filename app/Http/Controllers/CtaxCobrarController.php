<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Carbon\Carbon;
use gavca\banco;
use gavca\ctaxcobrar;
use gavca\cajabanco;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class CtaxCobrarController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('adminotipo1', ['except' => ['show']]);         
    }
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
        //SUMANDO FONDOS A CAJABANCO
        $cliente = $request["cliente"];
        $entidad;
        if($request["banco_o_caja"] == "caja"){
            $entidad = null;
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
            'cb_debe_haber' => 'DEBE',
            'cb_fecha' => $request['fecha'],
            'cb_concepto' => 'Cobro de deuda a cliente '.$cliente,
            'cb_monto' => $request['abono'],
            'cb_saldo' => $saldo+$request['abono'],
        ]);

        $ctasxcobrar = ctaxcobrar::where('cta_cli_codigo',$cliente)
            ->where('cta_concepto','!=','Cobro de deuda')
            ->get();  
        //creo $abono para iterar a través de todas las cuentas de este cliente
        //cuando consiga una cuenta con un monto que el abono pueda pagar se
        //marca como pagada y se continua iterando, apenas no se puede pagar
        //una deuda se termina el ciclo.
        $cobros = ctaxcobrar::where('cta_cli_codigo',$cliente)
            ->where('cta_concepto','Cobro de deuda')
            ->get(); 
        $acumulado=0;
        foreach ($cobros as $key => $cobro) {
            $acumulado += $cobro->cta_monto;
        }          
        $abono = $acumulado+$request['abono'];
        $concepto = "Cobro de deuda - ".$request['concepto'];
        foreach ($ctasxcobrar as $key => $cuenta) {
            if($cuenta->cta_monto <= $abono){
                $abono -= $cuenta->cta_monto;
                ctaxcobrar::where('id',$cuenta->id)
                    ->update(['cta_pagada' => 1]);
            }else{
                break;
            }
        }    
        if($entidad == null)
        	$entidad = "Caja Chica";
        ctaxcobrar::create([
            'cta_cli_codigo' => $cliente,
            'cta_monto' => $request['abono'],
            'cta_concepto' => $concepto,
            'cta_fecha' => $request['fecha'],
            'cta_entidad' => $entidad,
        ]);
        $request->session()->flash('message', 'Se ha abonado a la deuda correctamente.');
        $ctasxcobrar = ctaxcobrar::where('cta_cli_codigo',$cliente)->get();  
        return view('ctasxcobrar.show',compact('ctasxcobrar','cliente'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($cliente)
    {
        //$ctasxcobrar = ctaxcobrar::where('cta_cli_codigo',$cliente)->get();

        $ctasxcobrar = ctaxcobrar::where('cuentasxcobrar.cta_cli_codigo',$cliente)->get();
        return view('ctasxcobrar.show',compact('cliente','ctasxcobrar'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function view($id)
    {
        $ctasxcobrar = ctaxcobrar::where('id',$id)->first();
        return view('ctasxcobrar.view',compact('ctasxcobrar'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($cliente)
    {
        //filtro si la fecha que esta set es un dia cerrado, si lo es devuelva seleccionar fecha y muestre mensaje de error
        $fecha = session('caja_fecha');               
        if(isset($fecha)){
            $ctasxcobrar = ctaxcobrar::where('cta_cli_codigo',$cliente)->get();
            $deuda=0;
            foreach ($ctasxcobrar as $key => $cuenta) {
                $findme = 'Cobro';
                $pos = strpos($cuenta->cta_concepto, $findme);
                if($pos === false)
                    $deuda+=$cuenta->cta_monto;
                else
                    $deuda-=$cuenta->cta_monto;                
            }
            $fecha = session('caja_fecha'); 
            $bancos = banco::lists('ban_nombre', 'ban_nombre');
            return view('ctasxcobrar.edit',compact('cliente','bancos','deuda','fecha'));
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
