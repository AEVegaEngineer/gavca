<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use gavca\salario;
use gavca\aumento;
use gavca\Http\Requests;
use gavca\Http\Requests\SalarioUpdateRequest;
use gavca\Http\Controllers\Controller;

class SalarioController extends Controller
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
        $salarios = salario::All();
        $aumentos = aumento::All();
        return view('salario.index',compact('salarios','aumentos'));
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
     * GUARDAR EL SALARIO INTEGRAL EN DB
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeSalario(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
           
            $salario_integral = $request->input('salario');

            salario::where('id', 1)
              ->update(['salario_integral' => $salario_integral]);

            return response()->json(['response' => array('message' => 'El salario  se ha actualizado')]);        
            
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
        $salario = salario::find($id);
        $aumentos = aumento::All(); 
        return view('salario.edit',compact('salario','aumentos'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(SalarioUpdateRequest $request, $id)
    {
        $salario = salario::find($id);
        $salario->fill($request->all());
        $salario->save();

        return redirect('/salario/1/edit')->with('message','Salario y unidad tributaria actualizados exitosamente');
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
