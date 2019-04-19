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

use PDF;

include 'Soporte/formatoFechaMesLong.php';

class CardexMPController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }   
    /* 
    public function listCardexMP(){        
        $materiasprimas = cardexmp::leftJoin('parametros', 'parametros.par_codigo', '=', 'cardexmp.mp_codigo')
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
    */
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
                ->orderBy('cardexmp.id','dsc')
                ->paginate(15);
        $existencia = materiaprima::where('mp_codigo',$mp_codigo)->first()->mp_cantidad;
        return view('cardex.show',compact('cardexs','existencia'));
    }
    /**
     * GENERA EL REPORTE DEL CARDEX DE UN ITEM PARA UN MES DADO     
     *
     * @param  date $fecha
     * @param  string  $inventario
     * @return pdf stream
     */
    public function reporte($fecha, $mp_codigo)
    {
        $fecha_formateada = Carbon::parse($fecha);   
        $mes_long = getMesLong($fecha);   
        //Devuelve una vista distinta para las materias primas
        $cardexs = cardexmp::leftJoin('parametros', 'parametros.par_codigo', '=', 'cardexmp.mp_codigo')
                ->leftJoin('compras', 'compras.id', '=', 'cardexmp.car_compra_id')
                ->where('cardexmp.mp_codigo',$mp_codigo)
                ->whereYear('car_fecha','=',$fecha_formateada->year)
                ->whereMonth('car_fecha','=',$fecha_formateada->month)
                ->orderBy('cardexmp.id','dsc')
                ->get();
        return $cardexs;
        $existencia = materiaprima::where('mp_codigo',$mp_codigo)->first()->mp_cantidad;
        $pdf = PDF::loadView('cardex.reporte-cardex', compact('cardexs','existencia','mes_long','fecha_formateada')); 
        $pdf->save(storage_path('reportes/Cardex/Materia Prima/Reporte '.$cardexs[0]->par_nombre.' '.$fecha_formateada->year.'-'.$mes_long.'.pdf'));
        return $pdf->stream('Reporte '.$cardexs[0]->par_nombre.' '.$fecha_formateada->year.'-'.$mes_long.'.pdf');              
        
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
