<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Carbon\Carbon;
use gavca\compra;
use gavca\cajabanco;
use gavca\ctaxpagar;
use gavca\proveedor;
use gavca\cardexMP;
use gavca\materiaprima;
use gavca\parametro;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class CardexMPController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }
    public function logCardexMP(Request $request)
    {
        $comp_doc = $request["comp_doc"];  
        $id = $request["id"];  
        $entidad = $request["entidad"];
        //actualizo los montos de compra
        //Reviso si el código ya esta utilizado, si lo esta se generará otro.

        /*ACTUALIZANDO EL MONTO EN CAJA*/
        $transaccion = cajabanco::where('cb_entidad', $entidad)
            ->orderBy('id','dsc')
            ->get()
            ->take(2);
        //return $transaccion;
        if($transaccion->count()>1){
            $anterior = $transaccion[1];
            $saldo = $anterior->cb_saldo;
        }else{
            $saldo = 0;
        }
        //Actualizo el monto en compra
        compra::where('id', $request['id'])->update(array('comp_monto' => $request['comp_monto']));
        /*INICIO DE MODIFICACIÓN DE MONTO DE CUENTAS*/
        $target = ctaxpagar::where('cta_compra_id', $request['id'])->first();
        
        if($target === null){
            cajabanco::where('cb_compra_id', $request['id'])->update(array(
                'cb_monto' => $request['comp_monto'],
                'cb_saldo' => $saldo-$request['comp_monto'],
            ));
        }else{
            //aparte de actualizar el monto dentro de ctaxpagar tengo q actualizar el saldo del proveedor
            ctaxpagar::where('cta_compra_id', $request['id'])->update(array('cta_monto' => $request['comp_monto']));
            $prov = ctaxpagar::where('cta_compra_id', $request['id'])->first()->cta_prov_codigo;
            $saldo = proveedor::where('prov_codigo', $prov)->first()->prov_saldo;
            $n_saldo = $saldo + $request['comp_monto'];
            proveedor::where('prov_codigo', $prov)->update(array('prov_saldo' => $n_saldo));
        }        
        /*FIN DE MODIFICACIÓN DE MONTO DE CUENTAS*/
              
        foreach ($request["qty"] as $key => $qty) {
            //declaración de variables varias
            $mp_codigo = $request["codigo"][$key];  
            $qty = $request["qty"][$key]; 
            $cost = $request["cost"][$key];  
            $alicuota = $request["alicuota"][$key];  
            $ivamonto = $request["ivamonto"][$key]; 

            //RECORRO LOS UPDATES QUE ESTEN SET Y ACTUALIZO SEGUN EL VALOR DEL UPDATE (EL CODIGO DE PARAMETRO)

            if ( isset($request["update"])){
                foreach ($request["update"] as $key => $value) {
                    if ($mp_codigo == $value) {
                        parametro::where('par_codigo',$value)
                            ->update(['par_costo'=>$cost]);
                    }                    
                }                
            }
            //FIN DE ACTUALIZACIÓN DE PARÁMETROS

            //CREO LOS ARTÍCULOS COMPRADOS DENTRO DE CARDEXMP       
            $mp = materiaprima::where('mp_codigo', $mp_codigo)->latest()->first();
            if($mp === NULL){
                $valor_anterior = 0;
            }else{
                $valor_anterior = $mp->mp_cantidad;
            }            
            $valor_actual = $valor_anterior + $request["qty"][$key];
            cardexMP::create([
                'mp_codigo' => $mp_codigo,
                'comp_doc' => $request['comp_doc'],
                'car_costo' => $cost,
                'car_valor_anterior' => $valor_anterior,
                'car_valor_actual' => $valor_actual,  
                'car_alicuota' => $alicuota,  
                'car_iva' => $ivamonto,
                'car_compra_id' => $id,         
            ]);
            //FIN DE CREACION DE LOS ARTÍCULOS COMPRADOS DENTRO DE CARDEXMP

            //CREO LA EXISTENCIA DE MATERIA PRIMA           
            if($mp == null){
                //crea
                materiaprima::create([
                    'mp_codigo' => $mp_codigo,
                    'mp_cantidad' => $qty,           
                ]);                
            }else{
                //actualiza                
                $existente = $mp->mp_cantidad;
                materiaprima::where('id', $mp->id)->update(array(
                    'mp_cantidad' => $existente+$qty
                ));                               
            }
            //FIN DE CREACION DE EXISTENCIA DE MATERIA PRIMA
        }
        return redirect('/compra')->with('message','Compra registrada exitosamente');
    }
    public function listCardexMP(){        
        $materiasprimas = cardexmp::leftJoin('parametros', 'parametros.par_codigo', '=', 'cardexmp.mp_codigo')
                ->orderBy('cardexmp.mp_codigo', 'asc')
                ->orderBy('cardexmp.mp_codigo', 'asc')
                ->paginate(15);

        $who = "Inventario de Materias Primas";
        return view('cardex.materiaprima',compact('materiasprimas','who'));
    }
    public function listCardexPA(){
        $producciones = DB::table('produccion')->where('pro_etapa','PA')
                ->orderBy('pro_fecha', 'dsc')
                ->orderBy('rec_nombre', 'asc')
                ->paginate(15);
        $who = "Productos en Proceso A";
        return view('cardex.index',compact('producciones','who'));
    }
    public function listCardexPB(){
        $producciones = DB::table('produccion')->where('pro_etapa','PB')
                ->orderBy('pro_fecha', 'dsc')
                ->orderBy('rec_nombre', 'asc')
                ->paginate(15);
        $who = "Productos en Proceso B";
        return view('cardex.index',compact('producciones','who'));
    }
    public function listCardexPC(){
        $producciones = DB::table('produccion')->where('pro_etapa','PC')
                ->orderBy('pro_fecha', 'dsc')
                ->orderBy('rec_nombre', 'asc')
                ->paginate(15);
        $who = "Productos en Proceso C";
        return view('cardex.index',compact('producciones','who'));
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($mp_codigo)
    {
        $cardexs = cardexmp::leftJoin('parametros', 'parametros.par_codigo', '=', 'cardexmp.mp_codigo')
                ->leftJoin('compras', 'compras.id', '=', 'cardexmp.car_compra_id')
                ->where('cardexmp.mp_codigo',$mp_codigo)
                ->orderBy('cardexmp.id','asc')                
                ->get();
        $existencia = materiaprima::where('mp_codigo',$mp_codigo)->first()->mp_cantidad;       
        return view('cardex.show',compact('cardexs','existencia'));
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
