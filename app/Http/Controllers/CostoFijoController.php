<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use gavca\costofijo;
use gavca\produccionmes;
use gavca\miscelaneos;
use gavca\Http\Requests\CostofijoCreateRequest;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class CostoFijoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $costofijos = costofijo::All();
        $costo_mensual_total = 0;
        foreach ($costofijos as $costofijo) {
            $costo_mensual_total+=$costofijo->cf_montomes;
        }

        $produccionmess = produccionmes::where('id', 1)->first();
        $costo_fijo_unitario = $costo_mensual_total/$produccionmess->produccion;
        DB::table('miscelaneos')
            ->where('id', 1)
            ->update(['std_x_frasco' => $costo_fijo_unitario]);
        return view('costofijo.index',compact('costofijos','produccionmess','costo_fijo_unitario'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('costofijo.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CostofijoCreateRequest $request)
    {
        costofijo::create([
            'cf_concepto' => $request['cf_concepto'],
            'cf_montomes' => $request['cf_montomes'],
            'cf_estandar' => $request['cf_estandar'],
            ]);

        return redirect('/costofijo')->with('message','Nuevo costo fijo agregado exitosamente');
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
        $costofijo = costofijo::find($id);
        return view('costofijo.edit',['costofijo'=>$costofijo]);
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
        $costofijo = costofijo::find($id);
        $costofijo->fill($request->all());
        $costofijo->save();

        return redirect('/costofijo')->with('message','Costo fijo actualizado exitosamente');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        costofijo::destroy($id);
        return redirect('/costofijo')->with('message','Costo fijo eliminado exitosamente');
    }
}
