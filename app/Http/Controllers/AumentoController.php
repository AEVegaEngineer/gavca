<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use gavca\aumento;
use gavca\Http\Requests;
use gavca\Http\Requests\AumentoCreateRequest;
use gavca\Http\Requests\AumentoUpdateRequest;
use gavca\Http\Controllers\Controller;

class AumentoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('admin');
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
        return view('aumento.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AumentoCreateRequest $request)
    {
        aumento::create([
            'aum_aumento' => $request['aum_aumento'],
            'aum_descripcion' => $request['aum_descripcion'],
            ]);

        return redirect('/salario/1/edit')->with('message','Aumento registrado exitosamente');
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
        $aumento = aumento::find($id);
        return view('aumento.edit',['aumento'=>$aumento]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(AumentoCreateRequest $request, $id)
    {
        $aumento = aumento::find($id);
        $aumento->fill($request->all());
        $aumento->save();

        return redirect('/salario/1/edit')->with('message','Aumento actualizado exitosamente');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        aumento::destroy($id);
        return redirect('/salario/1/edit')->with('message','Aumento eliminado exitosamente');
    }
}
