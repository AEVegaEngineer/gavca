<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use gavca\producciona;
use gavca\produccionb;
use gavca\produccionc;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class InventarioController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }
    public function InventarioPA(){
        $inventarios = producciona::leftJoin('recetas', 'recetas.rec_nombre', '=', 'producciona.rec_nombre')
                ->paginate(15);
        $proc = "Proceso A";
        return view('inventario.index',compact('inventarios','proc'));
    }
    public function InventarioPB(){
        $inventarios = produccionb::leftJoin('recetas', 'recetas.rec_nombre', '=', 'produccionb.rec_nombre')
                ->paginate(15);
        $proc = "Proceso B";
        return view('inventario.index',compact('inventarios','proc'));
    }
    public function InventarioPC(){
        $inventarios = produccionc::leftJoin('recetas', 'recetas.rec_nombre', '=', 'produccionc.rec_nombre')
                ->paginate(15);
        $proc = "Proceso C (Terminados)";
        return view('inventario.index',compact('inventarios','proc'));
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
