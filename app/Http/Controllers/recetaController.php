<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use gavca\receta;
use gavca\Http\Requests;
use gavca\Http\Requests\RecetaCreateRequest;
use gavca\Http\Requests\RecetaUpdateRequest;
use gavca\Http\Controllers\Controller;

class recetaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$recetas = receta::paginate(30);
        $recetas = DB::table('recetas')
                ->where('rec_activo','si')
                ->orderBy('rec_proc', 'asc')
                ->orderBy('rec_nombre', 'asc')
                ->orderBy('rec_activo', 'desc')
                ->paginate(15);
        return view('receta.index',compact('recetas'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('receta.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(RecetaCreateRequest $request)
    {
        receta::create([
            'rec_nombre' => $request['rec_nombre'],
            'rec_activo' => $request['rec_activo'],
            'rec_proc' => $request['rec_proc'],
            'rec_unidad' => $request['rec_unidad'],
            ]);

        return redirect('/receta')->with('message','Receta creada exitosamente');
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
        $receta = receta::find($id);
        return view('receta.edit',['receta'=>$receta]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(RecetaUpdateRequest $request, $id)
    {
        $receta = receta::find($id);
        $receta->fill($request->all());
        $receta->save();

        return redirect('/receta')->with('message','Receta actualizada exitosamente');
    }

    /**
     * Si la receta esta activa la envia a la papelera, si esta en la papelera la hace activa.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function trash($id)
    {
        $receta = receta::where('id',$id)->first();
        if($receta->rec_activo == 'si'){
            receta::where('id',$id)
                ->update(['rec_activo' => 'no']);
            return redirect('/receta/view_trash')->with('message','Receta desactivada correctamente');
            
        }else{
            receta::where('id',$id)
                ->update(['rec_activo' => 'si']);
            return redirect('/receta')->with('message','Receta reactivada correctamente');
            
        }      
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function view_trash()
    {
        $recetas = DB::table('recetas')
            ->where('rec_activo','no')
            ->orderBy('rec_proc', 'asc')
            ->orderBy('rec_nombre', 'asc')
            ->orderBy('rec_activo', 'desc')
            ->paginate(15);
        return view('papelera.receta',compact('recetas'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        receta::destroy($id);
        return redirect('/receta/view_trash')->with('message','Receta eliminada exitosamente');
    }
}
