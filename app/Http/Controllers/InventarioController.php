<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;
use gavca\producciona;
use gavca\produccionb;
use gavca\produccionc;
use gavca\cajabanco;
use gavca\materiaprima;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

use PDF;

include 'Soporte/formatoFechaMesLong.php';
class InventarioController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }
    public function InventarioPA(){
        $fecha_caja_actual = getFechaCajaActual();
        $inventarios = producciona::leftJoin('recetas', 'recetas.rec_nombre', '=', 'producciona.rec_nombre')
                ->paginate(15);
        $proc = "Proceso A";
        return view('inventario.index',compact('inventarios','proc','fecha_caja_actual'));
    }
    public function InventarioPB(){
        $fecha_caja_actual = getFechaCajaActual();
        $inventarios = produccionb::leftJoin('recetas', 'recetas.rec_nombre', '=', 'produccionb.rec_nombre')
                ->paginate(15);
        $proc = "Proceso B";
        return view('inventario.index',compact('inventarios','proc','fecha_caja_actual'));
    }
    public function InventarioPC(){
        $fecha_caja_actual = getFechaCajaActual();
        $inventarios = produccionc::leftJoin('recetas', 'recetas.rec_nombre', '=', 'produccionc.rec_nombre')
                ->paginate(15);
        $proc = "Proceso C (Terminados)";
        return view('inventario.index',compact('inventarios','proc','fecha_caja_actual'));
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
     * GENERA EL REPORTE DE LOS DIFERENTES INVENTARIOS PARA LA FECHA ACTUAL DE CAJA     
     *
     * @param  date $fecha
     * @param  string  $inventario
     * @return pdf stream
     */
    public function reporte($fecha, $inventario)
    {
        //return $fecha." ".$inventario;
        //$fecha_formateada = date('Y-m-d',$fecha);
         
        $fecha_formateada = Carbon::parse($fecha);        
        $mes_long = getMesLong($fecha);   

        if($inventario == "Proceso A")
        {
            $inventarios = producciona::leftJoin('recetas', 'recetas.rec_nombre', '=', 'producciona.rec_nombre')
                ->get();
        }
        else if($inventario == "Proceso B")
        {
            $inventarios = produccionb::leftJoin('recetas', 'recetas.rec_nombre', '=', 'produccionb.rec_nombre')
                ->get();
        }
        else if($inventario == "Proceso C (Terminados)")
        {
            $inventarios = produccionc::leftJoin('recetas', 'recetas.rec_nombre', '=', 'produccionc.rec_nombre')
                ->get();            
        }
        else if($inventario == "Materia Prima")
        {
            //Devuelve una vista distinta para las materias primas
            $materiasprimas = materiaprima::leftJoin('parametros', 'parametros.par_codigo', '=', 'materiasprimas.mp_codigo')
                ->orderBy('parametros.par_nombre','asc')
                ->get();
            $pdf = PDF::loadView('materiaprima.reporte-existencias', compact('materiasprimas','mes_long','fecha_formateada')); 
            $pdf->save(storage_path('reportes/Inventarios/'.$inventario.'/Reporte '.$inventario.' '.$fecha_formateada->year.'-'.$mes_long.'.pdf'));
            return $pdf->stream('Reporte '.$inventario.' '.$fecha_formateada->year.'-'.$mes_long.'.pdf');
        }
        //Devuelve vista genérica para Inventarios
        $proc = $inventario;
        $pdf = PDF::loadView('inventario.reporte-existencias', compact('inventarios','proc','mes_long','fecha_formateada')); 
        $pdf->save(storage_path('reportes/Inventarios/'.$inventario.'/Reporte '.$inventario.' '.$fecha_formateada->year.'-'.$mes_long.'.pdf'));
        return $pdf->stream('Reporte '.$inventario.' '.$fecha_formateada->year.'-'.$mes_long.'.pdf');           
        
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
function getFechaCajaActual()
{
    $fecha_caja_actual = cajabanco::where('cb_activo',1)->latest()->first()->cb_fecha;
    $fecha_caja_actual = date("Y-m-d", strtotime($fecha_caja_actual));
    return $fecha_caja_actual;
}
