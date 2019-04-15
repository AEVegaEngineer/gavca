<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;
use gavca\cajabanco;
use gavca\materiaprima;
use gavca\requerimiento;
use gavca\produccion;
use gavca\ingrediente;
use gavca\receta;
use gavca\aumento;
use gavca\salario;
use gavca\parametro;
use gavca\miscelaneo;
use gavca\producciona;
use gavca\produccionb;
use gavca\produccionc;
use gavca\dependencia;
use gavca\cardexmp;
use Carbon\Carbon;
use DB;
use gavca\Http\Requests;
use gavca\Http\Requests\ProduccionCreateRequest;
use gavca\Http\Controllers\Controller;

class ProduccionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('adminotipo1');
    }
    /**
     * MUESTRA LA LISTA DE LAS PRODUCCIONES
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {       
        $producciones = DB::table('produccion')
            ->whereNotNull('pro_costo')
            ->orderBy('id', 'dsc')
            ->paginate(15);
        return view('produccion.index',compact('producciones'));
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createProd($id)
    {
        //filtro si la fecha que esta set es un dia cerrado, si lo es devuelva seleccionar fecha y muestre mensaje de error
        $fecha = session('caja_fecha');               
        if(isset($fecha)){
            $existe = cajabanco::whereDate('cb_fecha','=',$fecha)->first();
            if($existe !== null && $existe->cb_activo == 0)
            {
                \Session::flash('message-error', 'Esta caja ya se encuentra cerrada y no permite nuevos registros, por favor, selecciona otra fecha en caja.');
                $hoy = Carbon::today()->toDateString();
                $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
                if($caja_actual !== null)
                {
                    $caja_actual = new Carbon($caja_actual->cb_fecha);
                    $caja_actual = $caja_actual->toDateString();
                }
                $ultima_caja = cajabanco::where('cb_activo',0)->latest()->first();
                if($ultima_caja !== null)
                {
                    $ultima_caja = new Carbon($ultima_caja->cb_fecha);
                    $ultima_caja = $ultima_caja->toDateString();
                }
                return view('caja.index',compact('hoy','caja_actual','ultima_caja'));
                
            }
            $receta = $id;
            $dependencias = dependencia::where('dep_padre',$id)->get();
            
            $producciones = DB::table('produccion')
                ->join('dependencias', 'produccion.rec_nombre', '=', 'dependencias.dep_hijo')
                ->where('dependencias.dep_padre',$id)
                ->whereNotNull('produccion.pro_costo')
                ->orderBy('produccion.pro_fecha', 'dsc')
                ->take(15) 
                // el take 15 tomara solo 15 producciones en general
                ->get(['produccion.id', 'produccion.pro_fecha','produccion.rec_nombre','produccion.pro_costo']);
            //return $producciones;
            return view('produccion.create',compact('receta','dependencias','producciones','fecha'));
        }else{
            $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
            if($caja_actual !== null)
            {
                $caja_actual = new Carbon($caja_actual->cb_fecha);
                $caja_actual = $caja_actual->toDateString();
            }
            $ultima_caja = cajabanco::where('cb_activo',0)->latest()->first();
            if($ultima_caja !== null)
            {
                $ultima_caja = new Carbon($ultima_caja->cb_fecha);
                $ultima_caja = $ultima_caja->toDateString();
            }
            \Session::flash('message-error', 'Antes de registrar operaciones de compra, venta o producción debes seleccionar una fecha en caja, bajo la cual se registrarán las operaciones.');
            $hoy = Carbon::today()->toDateString();
            return view('caja.index',compact('hoy','caja_actual','ultima_caja'));
        }
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

    /*COMIENZO DE MÉTODOS PARA AJUSTE DE INVENTARIOS*/
    /**
     * Muestra el formulario para los ajustes
     *
     * @return \Illuminate\Http\Response
     */
    public function insert($prod)
    {   
        if($prod == "PA"){
            $etapa = "PA";
            $producciones = producciona::All();
            
        }else if($prod == "PB"){
            $etapa = "PB";
            $producciones = produccionb::All();
        }else if($prod == "PC"){
            $etapa = "PC";
            $producciones = produccionc::All();
        }
        return view('produccion.insert',compact('producciones','etapa'));
    }
    /**
     * Hace los ajustes
     *
     * @return \Illuminate\Http\Response
     */
    public function adjust(Request $request)
    {        
        $etapa = $request["etapa"];   
        if(isset($request["ex_nombre"])){
            foreach ($request["ex_nombre"] as $i => $nombre) {
                if($etapa == 'PA'){
                    DB::table('producciona') ->where('rec_nombre', $nombre) ->update([
                        'pro_produccion' => $request['ex_cantidad'][$i],
                    ]); 
                }else if($etapa == 'PB'){
                    DB::table('produccionb') ->where('rec_nombre', $nombre) ->update([
                        'pro_produccion' => $request['ex_cantidad'][$i],
                    ]); 
                }else if($etapa == 'PC'){
                    DB::table('produccionc') ->where('rec_nombre', $nombre) ->update([
                        'pro_produccion' => $request['ex_cantidad'][$i],
                    ]); 
                }
            }
        }
        if($etapa == 'PA'){
            return redirect('/InventarioPA')->with('message','Existencias en materias primas actualizadas exitosamente');
        }else if($etapa == 'PB'){
            return redirect('/InventarioPB')->with('message','Existencias en materias primas actualizadas exitosamente');
        }else if($etapa == 'PC'){
            return redirect('/InventarioPC')->with('message','Existencias en materias primas actualizadas exitosamente');
        }

    }
    /*FIN DE MÉTODOS PARA AJUSTE DE INVENTARIOS*/

    /*CON LA MODIFICACIÓN DE TODA ESTA AREA TOCO PASAR TODOS LOS DATOS COMO POST AL SIGUIENTE FORMULARIO QUE SERIA REQ.BLADE.PHP, ALLI SE LLENAN LOS DATOS DE LOS REQUERIMIENTOS DE LAS DEPENDENCIAS Y SE COTEJAN CON LAS PRODUCCIONES, SI NO HAY EXISTENCIA DE ESAS DEPENDENCIAS NO SE PUEDE CREAR LA PRODUCCION.*/

    /**
     * PASA LOS DATOS DE LA PRODUCCION AL FORMULARIO REQ.BLADE.PHP
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */   

    public function pass(Request $request)
    {
        $fecha = $request['pro_fecha'];
        $rec_nombre = $request['rec_nombre'];
        $pro_produccion = $request['pro_produccion'];
        $pro_mano_obra = $request['pro_mano_obra'];

        // ACTUALIZO EL VALOR DE DEP_PRODUCCION EN DEPENDENCIAS EL CUAL
        // HACE REFERENCIA AL PRODUCTO, CON EL FIN DE SACAR DE AHI EL COSTO DEL 
        // PRODUCTO
        if(isset($request['dep_produccion'])){
            foreach ($request['dep_produccion'] as $dep_produccion => $valor) {
                $input = explode("_", $valor);            
                dependencia::where('dep_hijo',$input[1])
                    ->update(['dep_produccion' => $input[0]]);
            }
        }
        
        $ingredientes = ingrediente::where('rec_nombre',$rec_nombre)->get();
        $requerimientos = requerimiento::where('rec_nombre',$rec_nombre)->where('req_fecha',$fecha)->first();
        foreach ($ingredientes as $ingrediente) {            
            $par = parametro::where('par_nombre',$ingrediente->ing_ingrediente)->first();
            if($requerimientos === null){
                //return $ingrediente->ing_ingrediente."<br>".$ingrediente->ing_mark."<br>".$ingrediente->ing_ratio;
                requerimiento::create([
                    'req_fecha' => $fecha,
                    'rec_nombre' => $rec_nombre,
                    'req_ingrediente' => $ingrediente->ing_ingrediente,
                ]);
            }
        }
        $requerimientos = requerimiento::where('rec_nombre',$rec_nombre)->where('req_fecha',$fecha)->get();
        $dependencias = dependencia::where('dep_padre',$rec_nombre)->get();
        $cantidad_produccion = $pro_produccion;
        $rec_etapa = receta::where('rec_nombre',$rec_nombre)->first()->rec_etapa;
        
        /*
        DEBUG
        

        $debug = "rec_nombre: ".$rec_nombre."<br><br>"
        ."fecha: ".$fecha."<br><br>"
        ."requerimientos: ".$requerimientos."<br><br>"
        ."dependencias: ".$dependencias."<br><br>"
        ."cantidad_produccion: ".$cantidad_produccion."<br><br>"
        ."pro_mano_obra: ".$pro_mano_obra."<br><br>"
        ."rec_etapa: ".$rec_etapa."<br><br>";
        */
        /*
        $requerimientos = requerimiento::leftJoin('ingredientes', 'requerimientos.rec_nombre', '=', 'ingredientes.rec_nombre')
            ->where('requerimientos.req_fecha', $fecha)            
            ->where('requerimientos.rec_nombre', $rec_nombre) 
            ->select('requerimientos.req_total', 'requerimientos.rec_nombre', 'requerimientos.req_ingrediente', 'ingredientes.ing_default', 'ingredientes.ing_ratio')           
            ->get();
        */
        //return $requerimientos."<br><br>".$ingredientes;
        

        return view('produccion.req',compact('rec_nombre','fecha','requerimientos','dependencias','cantidad_produccion','pro_mano_obra','rec_etapa','ingredientes'));
    }
    
    /**
     * Display the specified resource.
     *
     * @param  $rec_nombre, $req_fecha
     * @return \Illuminate\Http\Response
     */
    public function verProduccion($id)
    {
        $rec_nombre = produccion::where('id',$id)->pluck('rec_nombre');
        $req_fecha = produccion::where('id',$id)->pluck('pro_fecha');        
        $recetas = receta::where('rec_nombre',$rec_nombre)->first();
        $produccion = produccion::where('id',$id)
            ->first();

        /*SECCIÓN PARA REVISAR QUE UNA PRODUCCIÓN SE PUEDA MODIFICAR*/
        $id_buscado = $produccion->id;
        $maximo = produccion::max('id');
        $rango = (int)$maximo - $id_buscado;
        $rango == 0 ? $rango = 1 : $rango;
        $producciones = produccion::orderBy('id','dsc')
            ->take($rango+1)
            ->get();
        
        
        $modificable = verificarModificable($producciones,$produccion,$id_buscado);
        //return $modificable ? "true" : "false";
        
        /*FIN DE SECCIÓN PARA REVISAR QUE UNA PRODUCCIÓN SE PUEDA MODIFICAR*/

        $aumentos = aumento::All();
        $salarios = salario::All();
        $miscelaneo = miscelaneo::where('id','1')->first();
        $cuenta = dependencia::where('dep_padre',$rec_nombre)->count();
        $dependencias = dependencia::leftJoin('recetas', 'recetas.rec_nombre', '=', 'dependencias.dep_hijo')
            ->leftJoin('produccion', 'produccion.rec_nombre', '=', 'dependencias.dep_hijo')
            ->where('produccion.id', '<', $id)
            ->select("produccion.pro_produccion", 'recetas.rec_unidad', 'dependencias.dep_hijo')
            ->orderBy('produccion.id','dsc')
            ->take($cuenta)
            ->get();
        $costos = DB::table('produccion')
            ->join('dependencias', 'produccion.id', '=', 'dependencias.dep_produccion')
            ->where('dependencias.dep_padre',$rec_nombre)
            ->select('produccion.pro_produccion', 'produccion.pro_costo', 'produccion.pro_mano_obra', 'produccion.rec_nombre')
            ->get();        
        $parametros = parametro::leftJoin('requerimientos', 'requerimientos.req_ingrediente', '=', 'parametros.par_nombre')
            ->where('requerimientos.req_fecha', $req_fecha)
            ->where('requerimientos.rec_nombre', $rec_nombre)
            ->select('requerimientos.req_total', 'parametros.par_nombre', 'parametros.par_unidad', 'parametros.par_costo')
            ->get();   

        produccion::where('id',$id)->
            update([
                'pro_costo' => calcularCostosUnitarios($dependencias,$parametros,$salarios,$produccion,$costos,$miscelaneo),
            ]);

        return view('produccion.produccion',compact('aumentos','salarios','produccion','recetas','rec_nombre','req_fecha','parametros','miscelaneo','dependencias','costos','modificable'));

    }

    /**
     * CREA UNA PRODUCCIÓN CON LOS DATOS PASADOS POR EL METODO pass QUE USA LOS DATOS APORTADOS POR EL FORMULARIO REQ.BLADE.PHP Y LOS QUE YA TRAIA GUARDADOS EN POST DESDE EL FORM CREATE
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */   

    public function store(ProduccionCreateRequest $request)
    {

        /*VARIABLES QUE SE USAN REPETIDAMENTE*/
        $fecha = $request['pro_fecha'];
        $rec_nombre = $request['rec_nombre'];
        $pro_produccion = $request['pro_produccion'];
        $pro_mano_obra = $request['pro_mano_obra'];
        

        /*CONTINUO CON EL REGISTRO*/
        $produccion_ya_existe = produccion::where('rec_nombre',$rec_nombre)
            ->where('pro_fecha',$fecha)
            ->whereNotNull('pro_costo')
            ->first();
        if($produccion_ya_existe!==null){
            \Session::flash('message', 'No puedes crear una producción con esa fecha para esa receta porque ya ha sido creada, modifícala o crea una nueva.');
            $recetas = DB::table('recetas')
                ->where('rec_activo','si')
                ->orderBy('rec_proc', 'asc')
                ->orderBy('rec_nombre', 'asc')
                ->orderBy('rec_activo', 'desc')
                ->paginate(15);
            return view('receta.index',compact('recetas'));
        }       

        //REVISO CUAL PRODUCCION SE ESTA LLEVANDO A CABO Y GUARDO ESE VALOR AL CREAR LA PRODUCCION
        $receta = receta::where('rec_nombre',$request['rec_nombre'])->first();

        

        /*SE DEBE REVISAR SI HAY EXISTENCIA DE MATERIA PRIMA COMPRADA PARA CREAR LA PRODUCCION*/
        foreach ($request["req_ingrediente"] as $key => $ingrediente) {
            $materiaprima = materiaprima::leftJoin('parametros', 'parametros.par_codigo', '=', 'materiasprimas.mp_codigo')
                ->where('parametros.par_nombre',$request["req_ingrediente"][$key])
                ->first();
            if($materiaprima === null){
                return redirect('produccion/'.$rec_nombre.'/create')->with('message-error', 'No hay suficiente '.$request["req_ingrediente"][$key].' para crear esta cantidad de producción!');  
            }else{
                $exist_mp = materiaprima::where('mp_codigo',$materiaprima->mp_codigo)
                    ->first()
                    ->mp_cantidad;
            }
            if($exist_mp === null || $exist_mp < $request["req_total"][$key]){
                return redirect('produccion/'.$rec_nombre.'/create')->with('message-error', 'No hay suficiente '.$request["req_ingrediente"][$key].' para crear esta cantidad de producción!');   
            }
        }
        /*
        Paso las dependencias de este padre como requerimientos para obtener el valor y actualizo el valor del requerimiento total de las dependencias para expresarla en la hoja de datos para los calculos.
        */        
        if($request["dependencia"] !== null){
            foreach ($request["dependencia"] as $key => $dependencia) {                
                dependencia::where('dep_padre', $rec_nombre)
                    ->where('dep_hijo', $request["dep_hijo"][$key])
                    ->update(['requerimiento' => $request["dependencia"][$key]]);
            }
        }
        /*
        REVISO CUALES SON LAS DEPENDENCIAS DE LA RECETA A CREAR Y CUALES SON LAS RECETAS HIJAS DE ESTA, SI HAY EXISTENCIA DE LAS RECETAS HIJAS SE PUEDE CREAR LA RECETA SI NO, NO.
        */
        if($receta->rec_proc != "PA"){
            $dependencias = dependencia::where('dep_padre',$rec_nombre)->get();
            foreach ($dependencias as $key => $dependencia) {
                $existencia;
                if($receta->rec_proc == "PB"){
                    $existencia = producciona::where('rec_nombre',$dependencia->dep_hijo)->first()->pro_produccion;     
                }else if($receta->rec_proc == "PC") {
                    $existencia = produccionb::where('rec_nombre',$dependencia->dep_hijo)->first()->pro_produccion; 
                }      
                if($existencia === null)
                    $existencia = 0;
                $requiere = dependencia::where('dep_padre',$dependencia->dep_padre)
                    ->where('dep_hijo',$dependencia->dep_hijo)
                    ->first()
                    ->requerimiento;
                
                if($requiere>$existencia){
                    return redirect('produccion/'.$rec_nombre.'/create')->with('message-error', 'No hay suficiente '.$dependencia->dep_hijo.' para crear esta cantidad de producción!');                
                }else{
                    $etapa_hijo;
                    
                    if($receta->rec_proc == "PB"){
                        producciona::where('rec_nombre',$dependencia->dep_hijo)
                        ->update(['pro_produccion' => $existencia-$requiere]);
                        $etapa_hijo = "PA";
                    }else if($receta->rec_proc == "PC"){
                        produccionb::where('rec_nombre',$dependencia->dep_hijo)
                        ->update(['pro_produccion' => $existencia-$requiere]);
                        $etapa_hijo = "PB";
                    }
                    
                    //CREO EL LOG DE CARDEX DE PRODUCCION PARA EL CAMBIO EN EL DEP_HIJO
                    
                    $prod = produccion::where('rec_nombre',$dependencia->dep_hijo)
                        ->orderBy('id', 'desc')
                        ->first();
                    $man_obr = $prod->pro_mano_obra;
                    $costo = $prod->pro_costo;
                    //$disponible = produccion::where('rec_nombre',$dependencia->dep_hijo)->first()->pro_disponible; 
                    
                    $disponible = produccion::where('produccion.rec_nombre',$dependencia->dep_hijo)
                        ->orderBy('produccion.id','dsc')                
                        ->take(1)
                        ->pluck('pro_disponible');
                        
                    $resta = $disponible-$requiere;                    
                    produccion::create([
                        'pro_fecha' => $fecha,
                        'rec_nombre' => $dependencia->dep_hijo,
                        'pro_etapa' => $etapa_hijo,
                        'pro_produccion' => $requiere,
                        'pro_disponible' => $resta,
                        'pro_mano_obra' => $man_obr,
                        'pro_costo' => $costo,
                        'pro_concepto' => 'Producción de '.$dependencia->dep_padre,
                    ]); 
                }
            }
        }

        
        
        /*SECCION PARA CREAR O ACTUALIZAR EL INVENTARIO DE PRODUCCION*/
        if($receta->rec_proc == "PA"){
            $producciona = producciona::where('rec_nombre',$rec_nombre)->first();
            if($producciona === null){
                producciona::create([
                    'rec_nombre' => $rec_nombre,
                    'pro_produccion' => $pro_produccion,
                ]);
            }else{
                producciona::where('rec_nombre',$rec_nombre)              
                    ->update(['pro_produccion' => $producciona->pro_produccion+$pro_produccion]);
            }
            
        }else if($receta->rec_proc == "PB"){
            $produccionb = produccionb::where('rec_nombre',$rec_nombre)->first();
            if($produccionb === null){
                produccionb::create([
                    'rec_nombre' => $rec_nombre,
                    'pro_produccion' => $pro_produccion,
                ]);
            }else{
                produccionb::where('rec_nombre',$rec_nombre)              
                    ->update(['pro_produccion' => $produccionb->pro_produccion+$pro_produccion]);
            }

        }else if($receta->rec_proc == "PC"){
            $produccionc = produccionc::where('rec_nombre',$rec_nombre)->first();
            if($produccionc === null){
                produccionc::create([
                    'rec_nombre' => $rec_nombre,
                    'pro_produccion' => $pro_produccion,
                ]);
            }else{
                produccionc::where('rec_nombre',$rec_nombre)              
                    ->update(['pro_produccion' => $produccionc->pro_produccion+$pro_produccion]);
            }
        }
        /*FIN DE SECCION PARA CREAR O ACTUALIZAR EL INVENTARIO DE PRODUCCION*/

        /*SECCION PARA GUARDAR LA PRODUCCIÓN EN CURSO*/
        $disponible = produccion::where('produccion.rec_nombre',$rec_nombre)
            ->orderBy('produccion.id','dsc')                
            ->take(1)
            ->pluck('pro_disponible');
        $producciones = produccion::where('pro_fecha',$fecha)->where('rec_nombre',$rec_nombre)->first();
        if($producciones === null){
            
            if($receta->rec_proc == "PB"){
                    $lote = DB::table('produccion')
                        ->where('pro_etapa','PB')
                        ->where('rec_nombre',$rec_nombre)
                        ->max('pro_lote');
                    if($lote === null)
                        $lote = 0;

                produccion::create([
                    'pro_fecha' => $fecha,
                    'rec_nombre' => $rec_nombre,
                    'pro_etapa' => $receta->rec_proc,
                    'pro_produccion' => $pro_produccion,
                    'pro_disponible' => $disponible+$pro_produccion,
                    'pro_mano_obra' => $pro_mano_obra,
                    'pro_lote' => $lote+1,
                    'pro_concepto' => 'Producción de '.$rec_nombre,
                ]);                        
            }else{
                produccion::create([
                    'pro_fecha' => $fecha,
                    'rec_nombre' => $rec_nombre,
                    'pro_etapa' => $receta->rec_proc,
                    'pro_produccion' => $pro_produccion,
                    'pro_disponible' => $disponible+$pro_produccion,
                    'pro_mano_obra' => $pro_mano_obra,
                    'pro_concepto' => 'Producción de '.$rec_nombre,
                ]);
            }
        }else{
            if($receta->rec_proc == "PB"){
                $lote = DB::table('produccion')
                    ->where('pro_etapa','PB')
                    ->where('rec_nombre',$rec_nombre)
                    ->max('pro_lote');
                produccion::where('pro_fecha',$fecha)->where('rec_nombre',$rec_nombre)->update([
                    'pro_fecha' => $fecha,
                    'rec_nombre' => $rec_nombre,
                    'pro_etapa' => $receta->rec_proc,
                    'pro_produccion' => $pro_produccion,
                    'pro_disponible' => $disponible+$pro_produccion,
                    'pro_mano_obra' => $pro_mano_obra,
                    'pro_lote' => $lote+1,
                    'pro_concepto' => 'Producción de '.$rec_nombre,
                ]);
            }else{
                produccion::where('pro_fecha',$fecha)->where('rec_nombre',$rec_nombre)->update([
                    'pro_fecha' => $fecha,
                    'rec_nombre' => $rec_nombre,
                    'pro_etapa' => $receta->rec_proc,
                    'pro_produccion' => $pro_produccion,
                    'pro_disponible' => $disponible+$pro_produccion,
                    'pro_mano_obra' => $pro_mano_obra,
                    'pro_concepto' => 'Producción de '.$rec_nombre,
                ]);
            }
        }
        /*FIN DE SECCION PARA GUARDAR LA PRODUCCIÓN EN CURSO*/
        /*
        Obtengo todos los ingredientes que pertenezcan a esta receta y creo sus campos de requerimientos, lo que significa que la fecha del requerimiento sera la misma fecha que la de la producción.
        */
        /*
        ACTUALIZO LOS REQUERIMIENTOS DE LOS INGREDIENTES DE LA PRODUCCION (NO LAS DEPENDENCIAS)        
        */
        $requerimientos = requerimiento::where('req_fecha',$fecha)->where('rec_nombre',$rec_nombre)->first();
        foreach ($request["req_ingrediente"] as $key => $ingrediente) {
            requerimiento::where('rec_nombre', $rec_nombre)
                ->where('req_fecha', $fecha)
                ->where('req_ingrediente', $request["req_ingrediente"][$key])
                ->update(['req_total' => $request["req_total"][$key]]);
            $materiaprima = materiaprima::leftJoin('parametros', 'parametros.par_codigo', '=', 'materiasprimas.mp_codigo')
                ->where('parametros.par_nombre',$request["req_ingrediente"][$key])
                ->first();
            
            /*AQUI VA EL LOG DE CARDEXMP PARA RESTAR LAS MATERIAS PRIMAS DEL CONSUMO POR PARTE DE LA PRODUCCIÓN */
            $concepto = "Producción de ".$rec_nombre;
            cardexmp::create([
                    'mp_codigo' => $materiaprima->mp_codigo,
                    'car_valor_anterior' => $materiaprima->mp_cantidad,
                    'car_valor_actual' => $materiaprima->mp_cantidad-$request["req_total"][$key],
                    'car_concepto' => $concepto,
                    'car_fecha' => $fecha,
                ]);
            /*ACTUALIZO LA CANTIDAD DE MATERIA PRIMA LUEGO DE HABER HECHO LA PRODUCCIÓN*/
            materiaprima::where('mp_codigo',$materiaprima->mp_codigo)
                ->update(['mp_cantidad' => $materiaprima->mp_cantidad-$request["req_total"][$key]]);

        }
        //MUESTRA EL FORMULARIO PARA LA EDICION DE LOS REQUERIMIENTOS DE LOS INGREDIENTES
        $produccion = produccion::where('rec_nombre',$rec_nombre)->first();
        $cantidad_produccion = $produccion->pro_produccion;
        $requerimientos = requerimiento::where('rec_nombre',$rec_nombre)->where('req_fecha',$fecha)->get();        
        //return $cantidad_produccion;
        /**/
        /**/
        /*RETORNANDO LA VISTA COMO EL METODO DE ARRIBA VERPRODUCCION*/
        $req_fecha = str_replace("-","/",$fecha);
        //return "aqui estoo ".$rec_nombre." ".$req_fecha;
        $recetas = receta::where('rec_nombre',$rec_nombre)->first();
        $produccion = produccion::where('rec_nombre',$rec_nombre)
            ->where('pro_fecha', $req_fecha)
            ->first();
        $aumentos = aumento::All();
        $salarios = salario::All();
        $miscelaneo = miscelaneo::where('id','1')->first();
        
        $cuenta = dependencia::where('dep_padre',$rec_nombre)->count();
        $dependencias = dependencia::leftJoin('recetas', 'recetas.rec_nombre', '=', 'dependencias.dep_hijo')
            ->leftJoin('produccion', 'produccion.rec_nombre', '=', 'dependencias.dep_hijo')
            ->where('produccion.id', '<', produccion::max('id'))
            ->select("produccion.pro_produccion", 'recetas.rec_unidad', 'dependencias.dep_hijo')
            ->orderBy('produccion.id','dsc')
            ->take($cuenta)
            ->get();

        $costos = DB::table('produccion')
            ->join('dependencias', 'produccion.id', '=', 'dependencias.dep_produccion')
            ->where('dependencias.dep_padre',$rec_nombre)
            ->select('produccion.pro_produccion', 'produccion.pro_costo', 'produccion.pro_mano_obra', 'produccion.rec_nombre')
            ->get();
        
        $parametros = parametro::leftJoin('requerimientos', 'requerimientos.req_ingrediente', '=', 'parametros.par_nombre')
        ->where('requerimientos.req_fecha', $req_fecha)
        ->where('requerimientos.rec_nombre', $rec_nombre)
        ->select('requerimientos.req_total', 'parametros.par_nombre', 'parametros.par_unidad', 'parametros.par_costo')
        ->get();        
        $id = produccion::max('id');
        produccion::where('id',$id)->
            update([
                'pro_costo' => calcularCostosUnitarios($dependencias,$parametros,$salarios,$produccion,$costos,$miscelaneo),
            ]);     
        $modificable = true;
        return view('produccion.produccion',compact('aumentos','salarios','produccion','recetas','rec_nombre','req_fecha','parametros','miscelaneo','dependencias','costos','modificable'));

    }

    /**
     * ACTUALIZA LOS REQUERIMIENTOS PARA LOS INGREDIENTES
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function req_upd(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            $req_total = $request->input('req_total');
            $rec_nombre = $request->input('rec_nombre');
            $req_fecha = $request->input('req_fecha');
            $req_ingrediente = $request->input('req_ingrediente');

            requerimiento::where('rec_nombre', $rec_nombre)
              ->where('req_fecha', $req_fecha)
              ->where('req_ingrediente', $req_ingrediente)
              ->update(['req_total' => $req_total]);

            return response()->json(['response' => array('message' => 'El requerimiento se ha actualizado')]);        
            
        }
    }
    /**
     * ACTUALIZA LOS REQUERIMIENTOS PARA LOS INGREDIENTES
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function reqDepUpd(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            
            $requerimiento = $request->input('requerimiento');
            $id = $request->input('id');

            dependencia::where('id', $id)
              ->update(['requerimiento' => $requerimiento]);

            return response()->json(['response' => array('message' => 'El requerimiento se ha actualizado')]);        
            
        }
    }
    /**
     * REVISA SI UNA DEPENDENCIA TIENE LA EXISTENCIA NECESARIA PARA CREAR PRODUCCION
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function checkDep(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            $id = $request->input('id');
            $existencia = dependencia::where('id',$id)->first();
            $demanda = $request->input('requerimiento');
            if($existencia->dep_produccion >= $demanda){
                return response()->json(['response' => array('message' => 'success')]);
            }                  
        }
    }
    
    /**
     * INGRESA LA PRODUCCION COMO PARÁMETRO Y LUEGO COMO INGREDIENTE.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function guardarCostos(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            //si esta receta ya tiene otro ingrediente con este mismo nombre no lo dejo guardar
            $costo = $request->input('costo');
            $rec_nombre = $request->input('rec_nombre');
            $pro_fecha = $request->input('pro_fecha');

            produccion::where('rec_nombre', $rec_nombre)
              ->where('pro_fecha', $pro_fecha)              
              ->update(['pro_costo' => $costo]);

            return response()->json(['response' => array('message' => 'El costo se ha actualizado')]);        
            
        }
    }   
    

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($nombre)
    {
        /*
        $receta = "receta prueba c";
        $disponible=0;        
        for ($i=1; $i < produccion::max('id'); $i++) { 
            $row = produccion::where('id',$i)->first();
            if($i == 103)
                continue;
            if($row->rec_nombre == $receta)
            {
                if($row->pro_costo !== null)
                {
                    if($i == 1)
                    {
                        $disponible = $row->pro_produccion;
                    }
                    else
                    {
                        $disponible = $row->pro_produccion + $disponible;
                    }

                }
                else
                {
                    $disponible = $disponible - $row->pro_produccion;
                }
                produccion::where('id',$i)
                    ->update(["pro_disponible" => $disponible]);
            }
        }
        
        */
        $existencia = produccion::where('produccion.rec_nombre',$nombre)
                ->orderBy('produccion.id','dsc')                
                ->take(1)
                ->pluck('pro_disponible');
        $producciones = produccion::where('produccion.rec_nombre',$nombre)
                ->orderBy('produccion.id','dsc')                
                ->paginate(15);
        //$producciones = cardexMP::where('car_compra_id',$id)->get();
        return view('produccion.show',compact('producciones','existencia'));
        
       
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $rec_nombre = produccion::where('id',$id)->first()->rec_nombre;
        $fecha = produccion::where('id',$id)->first()->pro_fecha;
        $requerimientos = requerimiento::where('rec_nombre',$rec_nombre)->where('req_fecha',$fecha)->get();
        $dependencias = dependencia::where('dep_padre',$rec_nombre)->get();
        $produccion = produccion::find($id);
        return view('produccion.edit',compact('requerimientos','dependencias','produccion'));        
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
        /*DEBIDO A LAS ACTUALIZACIONES TOCO HACER TODO EL TRABAJO PESADO DE LAS PRODUCCIONES EN UPDATE*/
        // HAGO CAMBIOS PARA LA DISPONIBILIDAD DEL PRODUCTO     
        $producto = produccion::where('id',$id)->first();
        $disponible = $producto->pro_disponible;
        $produccion_previa = $producto->pro_produccion;
        $disponible = $disponible-($produccion_previa-$request["pro_produccion"]);
        produccion::where('id',$id)->update(['pro_disponible' => $disponible]);

        //GUARDO LOS CAMBIOS
        $produccion = produccion::find($id);
        $produccion->fill($request->all());
        $produccion->save();
        
        //DEVUELVO LA VISTA DE PRODUCCIÓN, PARA ENTENDER IR AL METODO verProduccion
        $rec_nombre = $produccion->rec_nombre;
        $req_fecha = $produccion->pro_fecha;//$request["pro_fecha"];
        $recetas = receta::where('rec_nombre',$rec_nombre)->first();
        $produccion = produccion::where('rec_nombre',$rec_nombre)
            ->where('pro_fecha', $req_fecha)
            ->first();
        $aumentos = aumento::All();
        $salarios = salario::All();
        $miscelaneo = miscelaneo::where('id','1')->first();
        $parametros = parametro::leftJoin('requerimientos', 'requerimientos.req_ingrediente', '=', 'parametros.par_nombre')
            ->where('requerimientos.req_fecha', $req_fecha)
            ->where('requerimientos.rec_nombre', $rec_nombre)
            ->select('requerimientos.req_total', 'parametros.par_nombre', 'parametros.par_unidad', 'parametros.par_costo')
            ->get();

        /*ACTUALIZO EL INVENTARIO DE PRODUCCION*/
        $etapa = $produccion->pro_etapa;
        if($etapa == 'PA'){
            $producciona = producciona::where('rec_nombre',$rec_nombre)->first();
            producciona::where('rec_nombre',$rec_nombre)              
                ->update(['pro_produccion' => $producciona->pro_produccion-$request["previous_value"]+$request["pro_produccion"]]);
        }else if($etapa == 'PB'){
            $produccionb = produccionb::where('rec_nombre',$rec_nombre)->first();
            produccionb::where('rec_nombre',$rec_nombre)              
                ->update(['pro_produccion' => $produccionb->pro_produccion-$request["previous_value"]+$request["pro_produccion"]]);
        }else if($etapa == 'PC'){
            $produccionc = produccionc::where('rec_nombre',$rec_nombre)->first();
            produccionc::where('rec_nombre',$rec_nombre)              
                ->update(['pro_produccion' => $produccionc->pro_produccion-$request["previous_value"]+$request["pro_produccion"]]);
        }        
        /*FIN DE ACTUALIZACION DEL INVENTARIO DE PRODUCCION*/

        /*ACTUALIZO LOS REQUERIMIENTOS Y LAS DEPENDENCIAS*/
        if(isset($request['dependencia'])){
            foreach ($request['dependencia'] as $key => $dependencia) {
                dependencia::where('dep_padre',$rec_nombre) 
                    ->where('dep_hijo',$request['dep_hijo'][$key])             
                    ->update(['requerimiento' => $dependencia]);
                
                $producto = produccion::where('id', '<',$id)
                    ->where('rec_nombre',$request['dep_hijo'][$key])  
                    ->orderBy('id','dsc')
                    ->first();
                $disponible = $producto->pro_disponible;                
                $produccion_previa = $producto->pro_produccion;
                produccion::where('id',$producto->id)
                    ->update([
                        'pro_disponible' => $disponible+($produccion_previa-$dependencia),
                        'pro_produccion' => $dependencia,
                    ]);
                $etapa = produccion::where('id',$producto->id)->first()->pro_etapa;
                if($etapa == 'PA')
                {
                    producciona::where('rec_nombre',$request['dep_hijo'][$key])              
                        ->update(['pro_produccion' => $disponible+($produccion_previa-$dependencia)]);
                }
                else if($etapa == 'PB')
                {
                    produccionb::where('rec_nombre',$request['dep_hijo'][$key])              
                        ->update(['pro_produccion' => $disponible+($produccion_previa-$dependencia)]);
                }
                else if($etapa == 'PC')
                {
                    produccionc::where('rec_nombre',$request['dep_hijo'][$key])              
                        ->update(['pro_produccion' => $disponible+($produccion_previa-$dependencia)]);
                }
            }
        }
        foreach ($request['req_total'] as $key => $req_total) {
            requerimiento::where('rec_nombre',$rec_nombre) 
                ->where('req_fecha',$req_fecha)
                ->where('req_ingrediente',$request['req_ingrediente'][$key])            
                ->update(['req_total' => $req_total]);
            $param = parametro::where('par_nombre',$request['req_ingrediente'][$key])->first()->par_codigo;
            $actualizar = cardexmp::where('mp_codigo',$param)
                ->where('car_fecha',$req_fecha)
                ->whereNull('car_costo')
                ->where('car_concepto',"Producción de ".$rec_nombre)
                ->first();
            //return $actualizar;
            $valor_anterior = $actualizar->car_valor_anterior;
            
            /* MODIFICA LOS CARDEX DE LOS REQUERIMIENTOS DE LA RECETA */
            $id_buscado = $actualizar->id;
            $maximo = cardexmp::max('id');
            $rango = (int)$maximo - $id_buscado;
            $rango == 0 ? $rango = 1 : $rango;
            $cardexs = cardexmp::orderBy('id','dsc')
                ->take($rango+1)
                ->get();
            $temp_actual = 0;
            for($i = count($cardexs)-1; $i>=0; $i--)
            {
                if($cardexs[$i]->mp_codigo == $param)
                {                                        
                    if($i == count($cardexs)-1)
                    {                        
                        //caso inicial, el cardex que modificamos directamente
                        $valor_anterior = $actualizar->car_valor_anterior;
                        cardexmp::where('id',$actualizar->id)
                            ->update([
                                'car_valor_actual' => $valor_anterior - $req_total,
                            ]);
                        $temp_actual = $valor_anterior - $req_total;
                    }                    
                    else
                    {
                        //casos restantes, los demás que están encima del que modificamos
                        $step = $temp_actual - $cardexs[$i]->car_valor_anterior;
                        cardexmp::where('id',$cardexs[$i]->id)
                            ->update([
                                'car_valor_actual' => $cardexs[$i]->car_valor_actual + $step,
                                'car_valor_anterior' => $cardexs[$i]->car_valor_anterior + $step,
                            ]);
                        $temp_actual = $cardexs[$i]->car_valor_actual + $step;                  
                    }              
                }
            } 
            /* FIN DE MODIFICACIÓN DE LOS CARDEX DE LOS REQUERIMIENTOS DE LA RECETA */

            /* MODIFICACIÓN DE INVENTARIO DE MATERIAS PRIMAS*/
            $cantidad = cardexmp::where('mp_codigo',$param)
                ->orderBy('id','dsc')
                ->first()
                ->car_valor_actual;
            materiaprima::where('mp_codigo',$param)
                ->update([
                    'mp_cantidad' => $cantidad,
                ]);

            /* FIN DE MODIFICACIÓN DE INVENTARIO DE MATERIAS PRIMAS*/
        }
        /*FIN DE ACTUALIZACIÓN DE LOS REQUERIMIENTOS Y LAS DEPENDENCIAS*/

        /*CÁLCULO DE COSTOS UNITARIOS*/

        /*FIN DE CÁLCULO DE COSTOS UNITARIOS*/

        /*RETORNO VISTA COMO EN VERPRODUCCION*/
        return redirect('/verProduccion/'.$id)->with('message','Producción actualizada exitosamente');
        /*FIN DE RETORNO VISTA COMO EN VERPRODUCCION*/

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        /*
        ESTO SE PODRÍA EVITAR RELACIONANDO UNA COLUMNA pro_id EN LA TABLA REQUERIMIENTOS CON LA COLUMNA id DE LA TABLA PRODUCCION, Y VINCULANDOLA HACIENDO UPDATE CASCADE, DELETE CASCADE
        */
        //primero borro todos los requerimientos asociados a esta produccion
        $produccion = produccion::where('id',$id)->first();
        $rec_nombre = $produccion->rec_nombre;        
        $req_fecha = $produccion->pro_fecha;

        $req_to_delete = requerimiento::where('rec_nombre',$rec_nombre)->where('req_fecha',$req_fecha)->get();        
        $ids_to_delete = array();
        foreach ($req_to_delete as $req) {
            array_push($ids_to_delete,$req->id);
        }        
        //return $ids_to_delete;
        DB::table('requerimientos')->whereIn('id', $ids_to_delete)->delete(); 

        //luego borro la producción
        produccion::destroy($id);
        return redirect('/produccion')->with('message','Producción eliminada exitosamente');
    }
}
//SECCIÓN PARA FUNCIONES UTILITARIAS

//FUNCIÓN PARA VERIFICAR SI UNA PRODUCCIÓN ES MODIFICABLE
function verificarModificable($producciones,$produccion,$id_buscado)
{
    //construye cola        
    $cola = array();
    $modificable = true;
    for($i = count($producciones)-1; $i > 0 ; $i--)
    {
        if($producciones[$i]->rec_nombre == $produccion->rec_nombre)
        {          
            if($producciones[$i]->pro_costo == null)
            {
                //producción de etapa superior o venta
                if($cola[0]->id == $id_buscado)
                {
                    //una venta o prod intenta modificar el elemento buscado
                    $modificable = false;
                    break;
                }
                //restamos la producción o venta desde la primera disponibilidad
                $cantidad = $producciones[$i]->pro_produccion;
                //mientras todavia haya producto vendido 
                    
                while($cantidad != 0)
                {
                    $acarreo = 0;
                    for($j = count($cola)-1; $j >= 0; $j--)
                    {
                        if($cola[$j]->pro_disponible > $cantidad)
                        {
                            $cola[$j]->pro_disponible-$cantidad;
                            $acarreo = 0;
                            $cantidad = 0;
                        }                                
                        else
                        {
                            $acarreo = ($cola[$j]->pro_disponible-$cantidad)*(-1);
                            $cola[$j]=null;
                            $cantidad-=$acarreo;
                        }
                    }
                }  
            }
            else
            {
                //producción del elemento buscado
                array_push($cola, $producciones[$i]);                
            }
        }
    }
    return $modificable;
}
//CÁLCULO DE COSTOS UNITARIOS PARA REGISTRO Y ACTUALIZACIÓN DE PRODUCCIÓN
function calcularCostosUnitarios($dependencias,$parametros,$salarios,$produccion,$costos,$miscelaneo)
{
    $costosUnit=0;
    $prod = $produccion->pro_produccion;
    foreach($dependencias as $key => $dependencia)
    {
        $req_total = $dependencia->pro_produccion;
        $req_unitario = $req_total/$prod;               
        $costo = $costos[$key]->pro_costo;
        $costo_unitario = $costo*$req_unitario;
        $costosUnit+=$costo_unitario;            
    }
    foreach($parametros as $parametro)
    {
        $costosUnit+=$parametro->par_costo*($parametro->req_total/$prod);
    }
    $req = $produccion->pro_mano_obra;
    foreach($salarios as $salario)
    {
        $salario_integral = $salario->salario_integral;
    }
    $cos_tot_obra = $req*$salario_integral;
    $cos_unit_obra = $cos_tot_obra / $prod;
    $total_cf = ($miscelaneo->std_x_frasco/3)*$prod;
    $unit_cf = $total_cf/$prod;
    $costoDirUnit = $costosUnit+$cos_unit_obra;
    $total_unit = $costoDirUnit+$unit_cf;

    return $total_unit;
}