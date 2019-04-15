<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use carbon;
use DB;
use gavca\parametro;
use gavca\ingrediente;
use gavca\Http\Requests;
use gavca\Http\Requests\ParametroCreateRequest;
use gavca\Http\Requests\ParametroUpdateRequest;
use gavca\Http\Controllers\Controller;

class ParametroController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }
    //Función ajax que devuelve la unidad de un parametro dado
    public function getParam(Request $request)
    {
        if ($request->isMethod('post')){  
           
            $parametro = parametro::where('par_nombre', $request['par_nombre'])
                ->first();
                /*
            $parametro = DB::table('parametros')
                    ->where('par_nombre', $request['par_nombre'])->first();
                    */
            
            return response()->json(['parametro' => $parametro]); 
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $parametros = DB::table('parametros')
                ->orderBy('par_nombre', 'asc')->paginate(15);
        
        return view('parametro.index',compact('parametros'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('parametro.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ParametroCreateRequest $request)
    {
        $pattern = $request['par_radio'];
        $par_codigo = crearCodigoParametro($pattern);        

        parametro::create([
            'par_codigo' => $par_codigo,
            'par_nombre' => $request['par_nombre'],
            'par_unidad' => $request['par_unidad'],
            'par_costo' => $request['par_costo'],
            'par_observacion' => $request['par_observacion'],
            ]);
        
        return redirect('/parametro')->with('message','Parámetro creado exitosamente');
        
        //return "estoy en store";
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {        
        $parametro = parametro::find($id);
        $ingrediente = ingrediente::where('ing_ingrediente',$parametro->par_nombre)->first();
        $colision = 0;
        if($ingrediente === null){
            $colision = 0;
        }else{
            $colision = 1;
        }
        return view('parametro.delete',['parametro'=>$parametro,'colision'=>$colision]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $parametro = parametro::find($id);
        return view('parametro.edit',['parametro'=>$parametro]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function replace(array $input)
    {
        $this->getInputSource()->replace($input);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ParametroUpdateRequest $request, $id)
    {    

        $parametro = parametro::where('id', '=', $id)->first();
        /*si el costo se actualizó, guarda la fecha y la hora en par_cost_updated*/
        if($parametro->par_costo != $request['par_costo']){
            $mytime = Carbon\Carbon::now();
            parametro::where('id', '=', $id)
                ->update(['par_cost_updated' => $mytime]);
            //return $mytime->toDateTimeString();
        }
        /*genero codigo*/
        $pattern = "";
        $random = "";
        $code = "";
        if(substr($parametro->par_codigo, 0,2) == $request['par_radio']){
            //no cambio el codigo
            $request["par_codigo"] = $parametro->par_codigo;
        }else{
            //si cambio el codigo
            $request["par_codigo"] = crearCodigoParametro($request['par_radio']);
        }     
        
        
        $parametro = parametro::find($id);

        $parametro->fill($request->all());
        $parametro->save();

        return redirect('/parametro')->with('message','Parámetro actualizado exitosamente');
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        parametro::destroy($id);
        return redirect('/parametro')->with('message','Parámetro eliminado exitosamente');
    }
}
function crearCodigoParametro($pattern){
    $numero = 0;
    $n = 0;
    //itero para buscar el numero            
    $ultimoParametro = parametro::orderBy('updated_at','dsc')->first()->par_codigo;
    $ultimoParametro = str_replace("MI","",$ultimoParametro);
    $ultimoParametro = str_replace("MP","",$ultimoParametro);
    $ultimoParametro = (int)$ultimoParametro+1;
    $patron = $pattern;
    //cuento digitos
    $n = 0; 
    $floor = $ultimoParametro;           
    do{
        $floor = floor($floor / 10);
        $n++;
    } while ($floor > 0);
                
    //segun la cantidad de numeros agrego ceros para completar 5 cifras
    $limit = 5-$n;
    //return $limit;
    for ($j=0; $j < $limit; $j++) { 
        $patron = $patron."0";
    }            
    //concateno el patron con el numero
    $code = $patron.$ultimoParametro; 

    return $code;
}