<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use gavca\banco;
use gavca\cajabanco;
use gavca\Http\Requests\BancoCreateRequest;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class BancoController extends Controller
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
        $bancos = banco::paginate(15);
        return view('banco.index',compact('bancos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('banco.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BancoCreateRequest $request)
    {
        banco::create([
            'ban_nombre' => $request["ban_nombre"],
        ]);
        return redirect('/banco')->with('message','Banco registrado exitosamente');
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
        $banco = banco::find($id);
        return view('banco.edit',['banco'=>$banco]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(BancoCreateRequest $request)
    {
        cajabanco::where('cb_entidad',$request['old_name'])
            ->update(['cb_entidad'=>$request['ban_nombre']]);
        $id = $request['id'];
        $banco = banco::find($id);
        $banco->fill($request->all());
        $banco->save();
        return redirect('/banco')->with('message','Banco actualizado exitosamente');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $sujeto = banco::where('id',$id)->first()->ban_nombre;
        if(cajabanco::where('cb_entidad',$sujeto)->first() !== null)
        {
            return redirect('/banco')->with('message-error', "Ya no se puede eliminar este banco ya que cuenta con transacciones hechas en el módulo de Caja Banco.");  
        }        
        banco::destroy($id);        
            return redirect('/banco')->with('message','Banco eliminado exitosamente');      
    }
}
