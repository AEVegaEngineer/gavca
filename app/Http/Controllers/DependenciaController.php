<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

use gavca\dependencia;

class DependenciaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }
    /**
     * CREA UNA NUEVA DEPENDENCIA ENTRE UNA RECETA Y UN PRODUCTO DE ETAPA ANTERIOR.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function addDependencia(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            $padre = $request->input('rec_nombre');
            $hijo = $request->input('product');
            $dependencia = dependencia::where('dep_padre',$padre)->where('dep_hijo',$hijo)->first();
            if($dependencia === null){
                dependencia::create([
                    'dep_padre' => $padre,
                    'dep_hijo' => $hijo,
                ]);
                return response()->json(['response' => array(
                    'message' => 'Se ha creado la dependencia correctamente.',
                )]);   
            }else{
                return response()->json(['response' => array(
                    'message' => 'Error, esta dependencia ya existe.',
                )]);  
            }                 
            
        }
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
