<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use gavca\ingrediente;
use gavca\parametro;
use gavca\insumo;
use gavca\insumousado;
use gavca\receta;
use gavca\aumento;
use gavca\salario;
use gavca\producciona;
use gavca\produccionb;
use gavca\dependencia;

use gavca\Http\Requests;
use gavca\Http\Requests\IngredienteCreateRequest;
use gavca\Http\Requests\IngredienteUpdateRequest;
use gavca\Http\Controllers\Controller;

class IngredienteController extends Controller
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
        
    }

    /**
     * llamada ajax por $.post que devuelve los apartamentos segun la torre  * dada
     *
     * @return \Illuminate\Http\Response
     */

    public function addIngrediente(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            //si esta receta ya tiene otro ingrediente con este mismo nombre no lo dejo guardar
            $ingrediente = $request->input('ingrediente');
            $rec_nombre = $request->input('rec_nombre');
            $ing_ratio = $request->input('ing_ratio');
            $ing_default = $request->input('ing_default');

            $ingredientes = DB::table('ingredientes')
                ->where('rec_nombre',$rec_nombre)
                ->where('ing_ingrediente', $ingrediente)
                ->get();
            $found = 0;
            foreach ($ingredientes as $ing) {
                if($ing->ing_ingrediente == $ingrediente)
                    $found = 1;
            }
            $ing = ingrediente::where('ing_ingrediente', $ingrediente)->get();
            
            if($found == 1){
                return response()->json(['response' => array('message' => 'Error: El parámetro ya existe en este proceso productivo')]);
            }else{
                ingrediente::create([
                    'rec_nombre' => $rec_nombre,
                    'ing_ingrediente' => $ingrediente,
                    'ing_ratio' => $ing_ratio,
                    'ing_default' => $ing_default,
                ]);
                return response()->json(['response' => array('message' => 'El parámetro se ha agregado al proceso productivo')]);
            }
        }
    }

    public function addProduct(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            //si esta receta ya tiene otro ingrediente con este mismo nombre no lo dejo guardar
            $producto = $request->input('product');
            $rec_nombre = $request->input('rec_nombre');

            $ingredientes = DB::table('ingredientes')
                ->where('rec_nombre',$rec_nombre)
                ->where('ing_ingrediente', $producto)
                ->first();
            
            if($ingredientes!=null){
                return response()->json(['response' => array('message' => 'Error: El parámetro ya existe en este proceso productivo')]);
            }else{
                ingrediente::create([
                    'rec_nombre' => $rec_nombre,
                    'ing_ingrediente' => $producto,
                ]);
                return response()->json(['response' => array('message' => 'El parámetro se ha agregado al proceso productivo')]);
            }
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        //return view('ingrediente.create',compact('rec_nombre'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(IngredienteCreateRequest $request)
    {
        ingrediente::create([
            'rec_nombre' => $request['rec_nombre'],
            'ing_ingrediente' => $request['ing_ingrediente'],
            ]);

        return redirect('/ingrediente/'.$request->rec_nombre.'/edit')->with('message','Ingrediente agregado exitosamente');
    }

    /**
     * Display the specified resource.
     * Modifiqué el metodo para que muestre un formulario de registro para el nuevo 
     * ingrediente.
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $parametros = parametro::All(['id', 'par_nombre']);
        $rec_nombre = $id;
        return view('ingrediente.create',compact('rec_nombre','parametros'));
    }

    /**
     * Show the form for editing the specified resource.
     * Modifiqué el método para que muestre la lista de los ingredientes ya creados
     * y un botón para crear nuevos
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {        
        //$ingredientes = ingrediente::where('rec_nombre', $id)->get();
        $productosa = receta::where('rec_proc','PA')->get();
        $productosb = receta::where('rec_proc','PB')->get();
        $dependencias = dependencia::where('dep_padre',$id)->get();
        $receta = receta::where('rec_nombre',$id)->first();
        $aumentos = aumento::All();
        $salarios = salario::All();
        $parametros_all = DB::table('parametros')->orderBy('par_nombre', 'asc')->get();
        $produccion = 1;
        $ide = $receta->id;
        $insumos = insumo::get();
        $insumosusados = insumousado::where('rec_nombre',$id)->get();
        $parametros = parametro::leftJoin('ingredientes', 'ingredientes.ing_ingrediente', '=', 'parametros.par_nombre')
        ->where('ingredientes.rec_nombre', $id)
        ->select("ingredientes.id", 'parametros.par_nombre', 'parametros.par_unidad', 'parametros.par_costo')
        ->get();
        //return $salarios;
        $rec_nombre = $id;
        return view('ingrediente.edit',compact('dependencias','aumentos','salarios','receta','ide','rec_nombre','parametros','produccion','parametros_all','productosa','productosb','insumos','insumosusados'));
        
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
        $rec_nombre = ingrediente::where('id', $id)->select('rec_nombre')->first();
        ingrediente::destroy($id);
        return redirect('/ingrediente/'.$rec_nombre->rec_nombre.'/edit')->with('message','Ingrediente eliminado del proceso productivo exitosamente');
    }
    

}
