<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use carbon;
use DB;
use gavca\insumo;
use gavca\insumousado;
use gavca\Http\Requests;
use gavca\Http\Requests\InsumoCreateRequest;
use gavca\Http\Requests\InsumoUpdateRequest;
use gavca\Http\Controllers\Controller;

class InsumoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('adminotipo1', ['except' => ['index','show']]);        
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $insumos = insumo::orderBy('ins_nombre', 'asc')->paginate(15);        
        return view('insumo.index',compact('insumos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('insumo.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(InsumoCreateRequest $request)
    {
        insumo::create([
            'ins_nombre' => $request['ins_nombre'],
            'ins_unidad' => $request['ins_unidad'],
            'ins_costo' => $request['ins_costo'],
            'ins_observacion' => $request['ins_observacion'],
            ]);
        
        return redirect('/insumo')->with('message','Insumo creado exitosamente');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $insumo = insumo::find($id);
        $insumousado = insumousado::where('insing_insumo',$insumo->ins_nombre)->first();
        $colision = 1;
        if($insumousado === null){
            $colision = 0;
        }
        return view('insumo.delete',['insumo'=>$insumo,'colision'=>$colision]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $insumo = insumo::find($id);
        return view('insumo.edit',['insumo'=>$insumo]);
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
        $insumo = insumo::where('id', '=', $id)->first();
        /*si el costo se actualizó, guarda la fecha y la hora en par_cost_updated*/
        if($insumo->ins_costo != $request['ins_costo']){
            $mytime = Carbon\Carbon::now();
            insumo::where('id', '=', $id)
                ->update(['ins_cost_updated' => $mytime]);
            //return $mytime->toDateTimeString();
        }        
        
        $insumo = insumo::find($id);
        $insumo->fill($request->all());
        $insumo->save();

        return redirect('/insumo')->with('message','Insumo actualizado exitosamente');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        insumo::destroy($id);
        return redirect('/insumo')->with('message','Insumo eliminado exitosamente');
    }
}
