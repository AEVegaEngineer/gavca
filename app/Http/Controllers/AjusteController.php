<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use gavca\cajabanco;
use gavca\banco;
use gavca\cardexmp;
use gavca\materiaprima;
use gavca\producciona;
use gavca\produccionb;
use gavca\produccionc;
use Carbon\Carbon;
use DB;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class AjusteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('admin');
    }
    /**
     * Reiniciar la base de datos.
     *
     * @return \Illuminate\Http\Response
     */
    public function reiniciarDB()
    {
        DB::statement("UPDATE `proveedors` SET `prov_saldo` = 0 WHERE 1");
        DB::statement("UPDATE `clientes` SET `cli_saldo`=0 WHERE 1");
        DB::statement("DELETE FROM `cajabanco` WHERE 1");
        DB::statement("DELETE FROM `saldocaja` WHERE 1");
        DB::statement("DELETE FROM `compras` WHERE 1");
        DB::statement("DELETE FROM `ventas` WHERE 1");
        DB::statement("DELETE FROM `cajabanco` WHERE 1");
        DB::statement("DELETE FROM `materiasprimas` WHERE 1");
        DB::statement("DELETE FROM `producciona` WHERE 1");
        DB::statement("DELETE FROM `produccionb` WHERE 1");
        DB::statement("DELETE FROM `produccionc` WHERE 1");
        DB::statement("DELETE FROM `produccion` WHERE 1");
        DB::statement("DELETE FROM `requerimientos` WHERE 1");
        DB::statement("DELETE FROM `saldocaja` WHERE 1");
        DB::statement("DELETE FROM `totalesventas` WHERE 1");
        DB::statement("DELETE FROM `cuentasxpagar` WHERE 1");
        DB::statement("DELETE FROM `cuentasxcobrar` WHERE 1");
        DB::statement("DELETE FROM `cardexmp` WHERE 1");
        \Session::flash('message', "Las bases de datos han sido reiniciadas exitosamente.");  

        //Inicio de una nueva caja para operaciones.

        return view('ajustes.iniciarCaja');
    }
    /**
     * Iniciando actividades en todas las cajas para una fecha dada
     *
     * @return \Illuminate\Http\Response
     */
    public function iniciar(Request $request)
    {
        $fecha = $request["fecha"];
        $ref = new Carbon($fecha);
        $diaAnterior = $ref->subDay()->toDateString();

        $bancos = banco::All();
        $entidades = array(array("entidad" => "Caja Chica"));
        $mezcla = array_merge($entidades, $bancos->toArray()); 

        foreach ($mezcla as $key => $value) {
            if($key == 0)
                $entidad = "Caja Chica";
            else
                $entidad = $value["ban_nombre"];
            cajabanco::create([
                'cb_entidad' => $entidad,
                'cb_debe_haber' => 'HABER',
                'cb_fecha' => $diaAnterior,
                'cb_concepto' => 'Cierre del dia',
                'cb_saldo' => 0,
                'cb_activo' => 0,
            ]);
            cajabanco::create([
                'cb_entidad' => $entidad,
                'cb_debe_haber' => 'HABER',
                'cb_fecha' => $fecha,
                'cb_concepto' => 'Inicio de caja',
                'cb_saldo' => 0,
            ]);
        }
        session(['caja_fecha' => $fecha]);   
        \Session::flash('message', "Las cajas han sido iniciadas correctamente para la fecha ingresada. Ya puedes ingresar en el menú Cajas.");  
        return view('ajustes.index');
    }    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('ajustes.index');
    }

    /**
     * Ajustes de inventario
     *
     * @return \Illuminate\Http\Response
     */
    public function inventario($target,$id)
    {        
        if($target == 'materiaprima')
            $existencia = materiaprima::where('mp_codigo',$id)->first()->mp_cantidad;
        else if($target == 'producciona')
            $front_target = 'Producción B';
        else if($target == 'produccionb')
            $front_target = 'Producción B';
        else if($target == 'produccionc')
            $front_target = 'Producción C';
        return view('ajustes.inventario',compact('target','id','existencia'));
    }
    /**
     * Guarda los ajustes de inventario
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function setinventario(Request $request)
    {         
        $entra=0;$sale=0;  
        $hoy = Carbon::today()->toDateString();
        if ($request["target"] == 'materiaprima') {
            if(isset($request["entra"]) && !empty($request["entra"]))
            {
                $entra=$request["entra"];
            }
            if(isset($request["sale"]) && !empty($request["sale"]))
            {
                $sale=$request["sale"];
            }
            $existencia = materiaprima::where('mp_codigo',$request["id"])->first()->mp_cantidad;
            $nueva_existencia = $existencia + $entra - $sale;
            //cardexmp
            cardexMP::create([
                'mp_codigo' => $request['id'],
                'car_valor_anterior' => $existencia,
                'car_valor_actual' => $nueva_existencia,  
                'car_fecha' => $hoy,  
                'car_concepto' => 'Ajuste - '.$request['concepto'],
            ]);
            //inventario
            materiaprima::where('mp_codigo',$request["id"])
                ->update(["mp_cantidad" => $nueva_existencia]);
        }else if($request["target"] == 'producciona'){
            //produccion
        }
        else if($request["target"] == 'produccionb'){
            //produccion
        }
        else if($request["target"] == 'produccionc'){
            //produccion
        }
        \Session::flash('message', "Inventario actualizado correctamente."); 
        $materiasprimas = materiaprima::leftJoin('parametros', 'parametros.par_codigo', '=', 'materiasprimas.mp_codigo')
            ->paginate(15);
        return view('materiaprima.index',compact('materiasprimas'));
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
