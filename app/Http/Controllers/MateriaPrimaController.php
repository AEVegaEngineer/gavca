<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use gavca\materiaprima;
use gavca\parametro;
use gavca\cajabanco;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;

class MateriaPrimaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
    }
    /*PARA PRACTICIDAD AL ADMINISTRADOR SE LE PERMITIRÁ INSERTAR DATA DIRECTAMENTE EN BASE DE DATOS*/
    /*
    TOMA VALORES DE DOS TABLAS DISTINTAS, LA PRIMERA TABLA TIENE DATOS DE MATERIAS PRIMAS QUE ESTAN REGISTRADAS COMO PARÁMETROS, POR LO QUE SÓLO SE NECESITA SABER SU CANTIDAD, LA SEGUNDA TABLA TIENE DATOS DE MATERIAS PRIMAS QUE SE ACABAN DE CREAR, POR LO TANTO SE DEBEN CREAR LOS PARAMETROS TAMBIÉN.
    */
    public function insert()
    {
        /*lista solo las materias primas existentes*/
        /*
        $existentes = DB::table('parametros')
            ->leftJoin('materiasprimas', 'parametros.par_codigo', '=', 'materiasprimas.mp_codigo')
            ->whereNotNull('materiasprimas.mp_codigo')
            ->get();
        */
        /*lista todos los parametros*/
        $existentes = parametro::All();
        //return $existentes;
        return view('materiaprima.insert',compact('existentes'));
    }
    /*REVISA SI LA MP EXISTE EN DB, SI EXISTE ACTUALIZA LA EXISTENCIA SUMANDOLA, SI NO CREA EL MP*/
    public function createMP(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            
            $mp_codigo = $request->input('mp_codigo');
            
            $par = materiaprima::where('mp_codigo', $mp_codigo)->first();

            if($par == null){
                //crea
                materiaprima::create([
                'mp_codigo' => $request['mp_codigo'],
                'mp_cantidad' => $request['mp_cantidad'],           
                ]);
                return response()->json(['response' => array('message' => 'creado')]);
            }else{
                //actualiza
                $ncantidad = $request['mp_cantidad']+$par->mp_cantidad;
                $request['mp_cantidad'] = $ncantidad;
                $materiaprima = materiaprima::find($par->id);
                $materiaprima->fill($request->all());
                $materiaprima->save();

                return response()->json(['response' => array('message' => 'actualizado')]);
            }

            //muestra confirmación en formato json en el navegador
            return response()->json(['response' => array(
                'message' => 'Stored'
            )]);  

        }

    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fecha_caja_actual = cajabanco::where('cb_activo',1)->latest()->first()->cb_fecha;
        $fecha_caja_actual = date("Y-m-d", strtotime($fecha_caja_actual));
        $materiasprimas = materiaprima::leftJoin('parametros', 'parametros.par_codigo', '=', 'materiasprimas.mp_codigo')
                ->orderBy('parametros.par_nombre','asc')
                ->select('materiasprimas.mp_codigo','parametros.par_nombre','parametros.par_unidad','materiasprimas.mp_cantidad','materiasprimas.updated_at')
                ->paginate(15);

        return view('materiaprima.index',compact('materiasprimas','fecha_caja_actual'));
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
        //INSERTA VALORES DIRECTAMENTE EN MATERIA PRIMA

        //para las materias primas ya existentes en parámetros
        if(isset($request["ex_nombre"])){
            foreach ($request["ex_nombre"] as $i => $nombre) {
                $codigo = parametro::where('par_nombre',$nombre)->first()->par_codigo;
                $existencia = materiaprima::where('mp_codigo',$codigo)->first();
                if($existencia === null){
                    materiaprima::create([
                        'mp_codigo' => $codigo,
                        'mp_cantidad' => $request['ex_cantidad'][$i],           
                    ]);
                }else{
                    DB::table('materiasprimas') ->where('mp_codigo', $codigo) ->update([
                        'mp_codigo' => $codigo,
                        'mp_cantidad' => $request['ex_cantidad'][$i],
                    ]);
                }                
            }
        }
        
        //para cada materia prima no existente ni en parámetros ni en materiasprimas
        if(isset($request["noex_nombre"])){
            foreach ($request["noex_nombre"] as $key => $nombre) {
                //genero el código para cada parametro
                $n = 0;
                //itero para buscar el numero
                for ($i=0; $i < 99999; $i++) { 
                    if($request['noex_perecedero'][$key] == 'si')
                        $pattern = "MP";
                    else
                        $pattern = "MI";
                    //cuento digitos
                    $n = 0; 
                    $floor = $i;           
                    do{
                        $floor = floor($floor / 10);
                        $n++;
                    } while ($floor > 0);
                    
                    //segun la cantidad de numeros agrego ceros para completar 5 cifras
                    $limit = 5-$n;
                    //return $limit;
                    for ($j=0; $j < $limit; $j++) { 
                        $pattern = $pattern."0";
                    }            
                    //concateno el patron con el numero
                    $code = $pattern.$i;  
                    //si no hay ningun numero como este registrado sal del loop y registre
                    $parametro = parametro::where('par_codigo', '=', $code)->first();

                    if ($parametro === null) {
                        break;
                    }
                    
                }

                parametro::create([
                    'par_codigo' => $code,
                    'par_nombre' => $request['noex_nombre'][$key],
                    'par_unidad' => $request['noex_unidad'][$key],
                    'par_costo' => $request['noex_costo'][$key],
                    'par_observacion' => "",
                ]);
                materiaprima::create([
                    'mp_codigo' => $code,
                    'mp_cantidad' => $request['noex_cantidad'][$key],           
                ]);
            }
        }
        return redirect('/materiaprima')->with('message','Existencias en materias primas actualizadas exitosamente');
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
