<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;
use gavca\insumousado;
use gavca\insumo;

use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class InsumoUsadoController extends Controller
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
        //retorna por post
        if ($request->isMethod('post')){  
            //si este proceso productivo ya tiene otro insumo con este mismo nombre no lo dejo guardar
            $insumo = $request->input('insumo');
            $rec_nombre = $request->input('rec_nombre');
            $insing_ratio = $request->input('insing_ratio');
            $insing_default = $request->input('insing_default');
            
            $insumosusados = insumousado::where('rec_nombre',$rec_nombre)
                ->where('insing_insumo', $insumo)
                ->first();            
            
            if($insumosusados!==null){                
                return response()->json(['response' => array('message' => 'Error: El insumo ya existe en este proceso productivo','insumosusados'=>$insumosusados)]);
            }else{
                insumousado::create([
                    'rec_nombre' => $rec_nombre,
                    'insing_insumo' => $insumo,
                    'insing_ratio' => $insing_ratio,
                    'insing_default' => $insing_default,
                ]);
                return response()->json(['response' => array('message' => 'El insumo se ha agregado a la proceso productivo')]);
            }
        }
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
        $rec_nombre = insumousado::where('id', $id)->select('rec_nombre')->first();
        insumousado::destroy($id);
        return redirect('/ingrediente/'.$rec_nombre->rec_nombre.'/edit')->with('message','Insumo eliminado del proceso productivo exitosamente');
    }
}
