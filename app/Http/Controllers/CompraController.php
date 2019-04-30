<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use gavca\proveedor;
use gavca\ctaxpagar;
use gavca\saldocaja;
use gavca\cajabanco;
use gavca\cardexmp;
use gavca\compra;
use gavca\banco;
use gavca\parametro;
use gavca\materiaprima;
use Carbon\Carbon;
use gavca\Http\Requests;
use gavca\Http\Requests\CompraCreateRequest;
use gavca\Http\Controllers\Controller;

use PDF;

class CompraController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }
    
    public function checkCode(Request $request)
    {
        /*
        GENERACIÓN DEL CÓDIGO CONSECUTIVO PARA EL REGISTRO DE PARAMETROS EN EL MODULO COMPRAS
        */
        //retorna por post
        if ($request->isMethod('post')){ 
            $numero = 0;
            $n = 0;
            
            $ultimoParametro = parametro::orderBy('id','dsc')->take(1)->pluck('par_codigo');
            $ultimoParametro = str_replace("MI","",$ultimoParametro);
            $ultimoParametro = str_replace("MP","",$ultimoParametro);

            $ultimoParametro = (int)$ultimoParametro+1;
            //itero para buscar el numero
            $pattern = $request['perecedero'];
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
                $pattern = $pattern."0";
            }            
            //concateno el patron con el numero
            $code = $pattern.$ultimoParametro;  
                  
            return $code;          
        } 
    }
    //CREACION DEL PARAMETRO NECESARIO PARA CREAR MATERIA PRIMA
    public function createParam(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            
            parametro::create([
            'par_codigo' => $request['par_codigo'],
            'par_nombre' => $request['par_nombre'],
            'par_unidad' => $request['par_unidad'],
            'par_costo' => $request['par_costo'],
            'par_observacion' => $request['par_observacion'],            
            ]);
            
            //muestra confirmación en formato json en el navegador
            return response()->json(['response' => array(
                'par_nombre' => $request['par_nombre'],
                'par_unidad' => $request['par_unidad'],
                'par_costo' => $request['par_costo'],
                'par_observacion' => $request['par_observacion'],
                'par_codigo' => $request['par_codigo'],
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
        $compras = compra::orderBy('id', 'dsc')->where('comp_activo',1)->paginate(15);
        return view('compra.index',compact('compras'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //filtro si la fecha que esta set es un dia cerrado, si lo es devuelva seleccionar fecha y muestre mensaje de error
        $fecha = session('caja_fecha');  
        if(isset($fecha)){
            $records = cajabanco::whereDate('cb_fecha','=',$fecha)->get();
            //se da por supuesto que la caja esta cerrada
            $flag = false;
            foreach ($records as $record) {
                if($record->cb_activo == 1)
                {
                    //si encuentra al menos 1 record activo, la caja esta activa
                    $flag = true;
                    break;
                }
            }
            if($records !== null && $flag == false)
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
            
        }
        //Función para crear código y pasarlo al formulario de compra
        //para crear un nuevo proveedor
        function crearCodigo(){
            $numero = 0;
            $n = 0;
            //itero para buscar el numero            
            $ultimoProveedor = proveedor::orderBy('id','dsc')->take(1)->pluck('prov_codigo');
            $ultimoProveedor = str_replace("P","",$ultimoProveedor);
            $ultimoProveedor = (int)$ultimoProveedor+1;
            $patron = "P";
            //cuento digitos
            $n = 0; 
            $floor = $ultimoProveedor;           
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
            $code = $patron.$ultimoProveedor; 

            return $code;
        }   

        //No pude pasarlo como variable porque si el request genera
        //error no me enviará la variable $codigo al formulario
        //$codigo = crearCodigo();
        session(['codigo' => crearCodigo()]);    
        $fecha = session('caja_fecha');        
        if(isset($fecha)){
            $bancos = banco::lists('ban_nombre', 'ban_nombre');
            return view('compra.create',compact('bancos','fecha'));
        }else{
            \Session::flash('message-error', 'Antes de registrar operaciones de compra, venta o producción debes seleccionar una fecha en caja, bajo la cual se registrarán las operaciones.');
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
            $hoy = Carbon::today()->toDateString();
            return view('caja.index',compact('hoy','caja_actual','ultima_caja'));
        }        
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function pass(CompraCreateRequest $request)
    {
        filtrarCajaCerradaONoSeleccionada();
        $comp_fecha = $request['comp_fecha'];
        $proveedor = $request['comp_proveedor'];
        $comp_doc = $request['comp_doc'];
        $comp_cred_cont = $request['comp_cred_cont'];
        $banco_o_caja = $request['banco_o_caja'];
        $banco = $request['banco'];        
        $parametros = DB::table('parametros')
            ->orderBy('par_nombre', 'asc')->get(); 
        $entidad;   
        if($comp_cred_cont == "credito")
        {
            $entidad = "Compra a Crédito"; 
        }
        else
        {
            if($banco_o_caja == "caja")    
                $entidad = "Caja Chica";        
            else            
                $entidad = $banco;            
        }
        
        return view('compra.materiaprima',compact('comp_fecha','proveedor','comp_doc','comp_cred_cont','banco_o_caja','banco','parametros','entidad')); 
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //return $request["codigo"];
        //DETECTA SI YA FUE REGISTRADA UNA COMPRA CON LA MISMA FACTURA PARA EL MISMO PROVEEDOR
        $compra_existe = compra::where('comp_doc',$request['comp_doc'])
            ->where('comp_proveedor',$request['comp_proveedor'])
            ->first();
        if($compra_existe === null)
        {            
            /*
            SECCIÓN CRÉDITO O CONTADO
            SI ES A CRÉDITO VA A CUENTA DEL PROVEEDOR COMO CUENTA POR PAGAR, SI ES A CONTADO PREGUNTA COMO SE PAGO, SI CONTRA BANCO O CAJA CHICA  
            */        
            
            $id;
            $comp_doc = $request["comp_doc"];  
            $entidad = $request["entidad"];  
            
            if($request['comp_cred_cont'] == 'credito'){
                compra::create([
                    'comp_fecha' => $request['comp_fecha'],
                    'comp_doc' => $request['comp_doc'],
                    'comp_proveedor' => $request['comp_proveedor'],
                    'comp_cred_cont' => $request['comp_cred_cont'],
                    'comp_monto' => $request['comp_monto'],
                    'comp_entidad' => $request['comp_entidad'],
                ]);
                $id = compra::max('id');
                ctaxpagar::create([
                    'cta_prov_codigo' => $request['comp_proveedor'],
                    'cta_monto' => $request['comp_monto'],
                    'cta_concepto' => 'Compra a crédito bajo factura: '.$request['comp_doc'].' de fecha '.$request['comp_fecha'],
                    'cta_compra_id' => $id,
                ]);  
                $prov = ctaxpagar::where('cta_compra_id', $id)->first()->cta_prov_codigo;
                $saldo = proveedor::where('prov_codigo', $prov)->first()->prov_saldo;
                $n_saldo = $saldo + $request['comp_monto'];
                proveedor::where('prov_codigo', $prov)->update(array('prov_saldo' => $n_saldo));         
            }else{   
                
                $dia_actual = new Carbon($request['comp_fecha']);
                $existencia = cajabanco::where('cb_entidad',$entidad)
                    ->whereDate('cb_fecha','=',$dia_actual->toDateString())
                    ->latest()
                    ->first();
                $montoMasSaldo;
                $concepto;
                $saldo = saldocaja::where('sc_entidad','Caja Chica')
                    ->whereDate('sc_fecha', '<=' , $dia_actual->subDay()->toDateString())
                    ->whereNotNull('sc_saldo')
                    ->latest()
                    ->first();
                if($saldo === null){
                    $saldo = 0;
                }else{
                    $saldo = $saldo->sc_saldo;
                }
                if($existencia===null){                  
                    
                    $montoMasSaldo = $saldo;
                    $concepto = 'Inicio de caja';                    
                }else{
                    $montoMasSaldo = $saldo-$request['comp_monto'];
                    $concepto = 'Compra';
                    $cerrada = $existencia->cb_activo;
                    if($cerrada == 0){
                        //Esta caja esta cerrada
                        //Redirecciono a create con error
                        $fecha = session('caja_fecha');        
                        if(isset($fecha)){
                            \Session::flash('message-error', 'Esta caja ya se encuentra cerrada y no permite nuevos registros, por favor, selecciona otra caja o selecciona otra fecha en caja.');
                            $bancos = banco::lists('ban_nombre', 'ban_nombre');
                            return view('compra.create',compact('bancos','fecha'));
                        }else{
                            \Session::flash('message-error', 'Antes de registrar operaciones de compra, venta o producción debes seleccionar una fecha en caja, bajo la cual se registrarán las operaciones.');
                            $hoy = Carbon::today()->toDateString();
                            return view('caja.index',compact('hoy'));
                        } 

                    }
                }
                compra::create([
                    'comp_fecha' => $request['comp_fecha'],
                    'comp_doc' => $request['comp_doc'],
                    'comp_proveedor' => $request['comp_proveedor'],
                    'comp_cred_cont' => $request['comp_cred_cont'],
                    'comp_monto' => $request['comp_monto'],
                    'comp_entidad' => $entidad,
                ]);
                $id = compra::max('id');
                $saldo = cajabanco::where('cb_entidad',$entidad)                
                    ->orderBy('id','dsc')
                    ->take(1)
                    ->pluck('cb_saldo');
                if($saldo === null){
                    $saldo = 0;
                }
                $montoMasSaldo = $saldo-$request['comp_monto'];
                cajabanco::create([
                    'cb_entidad' => $entidad,
                    'cb_debe_haber' => 'HABER',
                    'cb_compra_id' => $id,
                    'cb_fecha' => $request['comp_fecha'],
                    'cb_concepto' => $concepto,
                    'cb_monto' => $request['comp_monto'],
                    'cb_saldo' => $montoMasSaldo,
                ]);
                
            }
            /*FIN DE SECCIÓN CRÉDITO O CONTADO*/              
             
        }else{
            $fecha = session('caja_fecha');        
            if(isset($fecha)){
                \Session::flash('message-error', 'Ya has creado esta factura con este mismo proveedor.');
                $bancos = banco::lists('ban_nombre', 'ban_nombre');
                return view('compra.create',compact('bancos','fecha'));
            }else{
                return 'error, debes establecer una fecha en caja';
            }           
        }     
        /*FIN DE MODIFICACIÓN DE MONTO DE CUENTAS*/
        foreach ($request["qty"] as $key => $qty) {
            //declaración de variables varias
            $mp_codigo = $request["codigo"][$key];  
            $qty = $request["qty"][$key]; 
            $cost = $request["cost"][$key];  
            $alicuota = $request["alicuota"][$key];  
            $ivamonto = $request["ivamonto"][$key]; 

            //RECORRO LOS UPDATES QUE ESTEN SET Y ACTUALIZO SEGUN EL VALOR DEL UPDATE (EL CODIGO DE PARAMETRO)

            if ( isset($request["update"])){
                foreach ($request["update"] as $key => $value) {
                    if ($mp_codigo == $value) {
                        parametro::where('par_codigo',$value)
                            ->update([
                                'par_costo'=>$cost,
                                'par_cost_updated'=>$request['comp_fecha'],
                            ]);
                    }                    
                }                
            }
            //FIN DE ACTUALIZACIÓN DE PARÁMETROS

            //CREO LOS ARTÍCULOS COMPRADOS DENTRO DE CARDEXMP       
            $mp = materiaprima::where('mp_codigo', $mp_codigo)->latest()->first();
            if($mp === NULL){
                $valor_anterior = 0;
                //CREO LA EXISTENCIA DE MATERIA PRIMA 
                materiaprima::create([
                    'mp_codigo' => $mp_codigo,
                    'mp_cantidad' => $qty,           
                ]);
            }else{
                $valor_anterior = $mp->mp_cantidad;
                //actualiza la existencia                
                $existente = $mp->mp_cantidad;
                materiaprima::where('id', $mp->id)->update(array(
                    'mp_cantidad' => $existente+$qty
                ));
            }            
            $valor_actual = $valor_anterior + $request["qty"][$key];
            cardexMP::create([
                'mp_codigo' => $mp_codigo,
                'comp_doc' => $request['comp_doc'],
                'car_costo' => $cost,
                'car_valor_anterior' => $valor_anterior,
                'car_valor_actual' => $valor_actual,  
                'car_alicuota' => $alicuota,  
                'car_iva' => $ivamonto,
                'car_compra_id' => $id,         
            ]);
            //FIN DE CREACION DE LOS ARTÍCULOS COMPRADOS DENTRO DE CARDEXMP

                      
            
            //FIN DE CREACION DE EXISTENCIA DE MATERIA PRIMA
        }
        return redirect('/compra')->with('message','Compra registrada exitosamente');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $cardexs = cardexmp::leftJoin('parametros', 'parametros.par_codigo', '=', 'cardexmp.mp_codigo')
                ->leftJoin('compras', 'compras.id', '=', 'cardexmp.car_compra_id')
                ->where('compras.id',$id)
                ->orderBy('cardexmp.id','dsc')                
                ->get();
        $compra = compra::where('id',$id)->first();
        //return $cardexs;
        return view('compra.show',compact('cardexs','compra'));
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
     * Si la receta esta activa la envia a la papelera, si esta en la papelera la hace activa.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function trash($id)
    {

        $compra = compra::where('id',$id)->first();        
        //obtengo la razon de la compra y la entidad aqui ya que la necesitare para ambos casos
        $cred_cont = $compra->comp_cred_cont;
        $entidad = $compra->comp_entidad;        

        $fecha = new Carbon($compra->comp_fecha);

        $caja_actual = cajabanco::where('cb_activo',1)->latest()->first()->cb_fecha;

        $caja = cajabanco::where('cb_entidad',$compra->comp_entidad)
            ->whereDate('cb_fecha', '=' , $caja_actual)
            ->whereNotNull('cb_saldo')
            ->latest()
            ->first();
        $saldo = 0;
        if($caja !== null)
        {
            $saldo = $caja->cb_saldo;
        }
        if($compra->comp_activo == 1)
        {
            //SI LA COMPRA ESTA ACTIVA Y QUIERO ELIMINARLA
            $cta_concepto = 'Eliminación de compra a '.$cred_cont.' bajo factura: '.$compra->comp_doc.' de fecha '.$fecha->toDateString();
            $cb_debe_haber = 'DEBE';
            $cb_concepto = 'Reembolso por eliminación de compra bajo factura: '.$compra->comp_doc.' de fecha '.date('Y-m-d', strtotime($compra->comp_fecha));
            $cb_saldo = $saldo+$compra->comp_monto;
            $statusChangeTo = 0;
            $link = '/caja';
            $message = 'Compra y movimientos de inventario revertidos correctamente, fondos devueltos a la respectiva caja.';
            
        }else{
            //SI LA COMPRA HA SIDO ELIMINADA Y QUIERO REACTIVARLA
            $cta_concepto = 'Reactivación de compra a '.$cred_cont.' bajo factura: '.$compra->comp_doc.' de fecha '.date('Y-m-d', strtotime($compra->comp_fecha));
            $cb_debe_haber = 'HABER';
            $cb_concepto = 'Reactivación de compra bajo factura: '.$compra->comp_doc.' de fecha '.date('Y-m-d', strtotime($compra->comp_fecha));
            $cb_saldo = $saldo-$compra->comp_monto;
            $statusChangeTo = 1;            
            $link = '/compra';
            $message = 'Compra reactivada correctamente, costos en la caja respectiva actualizada';           
        }
        if($cred_cont == 'credito')
        {
            ctaxpagar::create([
                'cta_prov_codigo' => $compra->comp_proveedor,
                'cta_concepto' => $cta_concepto,
                'cta_compra_id' => $id,
                'cta_monto' => $compra->comp_monto,
            ]);
        }else{
            //Cuando se realizan compras a contado        
            cajabanco::create([
                'cb_entidad' => $compra->comp_entidad,
                'cb_debe_haber' => $cb_debe_haber,
                'cb_fecha' => $caja_actual,
                'cb_concepto' => $cb_concepto,
                'cb_monto' => $compra->comp_monto,
                'cb_saldo' => $cb_saldo,
            ]);
        }
        compra::where('id',$id)
            ->update(['comp_activo' => $statusChangeTo]);
        cajabanco::where('cb_compra_id',$id)
            ->update(['cb_activo' => $statusChangeTo]);
        //resto la cantidad de materia prima que se compro del inventario            
        $elementos = cardexmp::where('car_compra_id',$id)->get();
        foreach ($elementos as $key => $elemento) {
            $cantidad = $elemento->car_valor_actual - $elemento->car_valor_anterior;
            $existencia = materiaprima::where('mp_codigo',$elemento->mp_codigo)->first()->mp_cantidad;
            if($compra->comp_activo == 1)                    
                materiaprima::where('mp_codigo',$elemento->mp_codigo)->update(['mp_cantidad' => $existencia-$cantidad]);
            else
                materiaprima::where('mp_codigo',$elemento->mp_codigo)->update(['mp_cantidad' => $existencia+$cantidad]);
        }
        return redirect($link == '/caja' ? $link.'/'.$entidad : $link)->with('message',$message);  
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function view_trash()
    {
        $compras = DB::table('compras')
            ->where('comp_activo',0)
            ->paginate(15);
        return view('papelera.compra',compact('compras'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return "en construccion?";
        compra::destroy($id);
        return redirect('/compra')->with('message','Compra eliminada exitosamente');
    }
    /**
     * GENERA EL REPORTE DE LAS COMPRAS DEL MES O DE LA FACTURA
     *
     * @param  string  $factura_o_mensual
     * @param  string  $fecha
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function reporte($factura_o_mensual, $fecha = null, $id = null)
    {
        //formatea fechas
        if(isset($fecha) && $fecha != 0)
        {
            $anio = $fecha['0'].$fecha['1'].$fecha['2'].$fecha['3'];
            $mes = $fecha['5'].$fecha['6'];
            $mes_long = "";
            $fecha_format = Carbon::create($anio, $mes, $day = 01);
            switch ($mes) {
                case '01':
                    $mes_long = "Enero";
                    break;
                case '02':
                    $mes_long = "Febrero";
                    break;
                case '03':
                    $mes_long = "Marzo";
                    break;
                case '04':
                    $mes_long = "Abril";
                    break;
                case '05':
                    $mes_long = "Mayo";
                    break;
                case '06':
                    $mes_long = "Junio";
                    break;
                case '07':
                    $mes_long = "Julio";
                    break;
                case '08':
                    $mes_long = "Agosto";
                    break;
                case '09':
                    $mes_long = "Septiembre";
                    break;
                case '10':
                    $mes_long = "Octubre";
                    break;
                case '11':
                    $mes_long = "Noviembre";
                    break;
                case '12':
                    $mes_long = "Diciembre";
                    break;
                default:
                    break;
            }
        }
        if($factura_o_mensual == "mensual")
        {
            //reporte mensual          
            $compras = compra::orderBy('id', 'dsc')
                ->where('comp_activo',1)
                ->whereYear('comp_fecha','=',$fecha_format->year) 
                ->whereMonth('comp_fecha','=',$fecha_format->month)                 
                ->get(); 
            $pdf = PDF::loadView('compra.reporte-mensual', compact('compras','fecha_format','mes_long')); 
            $pdf->save(storage_path('reportes/Compras/Reporte-Compras-Mensual-'.$anio.'-'.$mes_long.'.pdf'));
            return $pdf->stream('Reporte-Compras-Mensual-'.$anio.'-'.$mes_long.'.pdf');       
        }
        else
        {
            //reporte por factura
            $cardexs = cardexmp::leftJoin('parametros', 'parametros.par_codigo', '=', 'cardexmp.mp_codigo')
                ->leftJoin('compras', 'compras.id', '=', 'cardexmp.car_compra_id')
                ->where('compras.id',$id)
                ->orderBy('cardexmp.id','dsc')                
                ->get();
            $compra = compra::where('id',$id)->first();
            $pdf = PDF::loadView('compra.reporte-factura', compact('compra','cardexs'));
            $pdf->save(storage_path('reportes/Compras/Reporte-Compra-Factura-'.$compra->comp_doc.'.pdf')); 
            return $pdf->stream('Reporte-Compra-Factura-'.$compra->comp_doc.'.pdf');
        }
        
    }
}
/**
* Chequea si la caja esta cerrada o no esta seleccionada
* 
* @return redirect a seleccionar caja si falla las pruebas
*/
function filtrarCajaCerradaONoSeleccionada()
{
    $fecha = session('caja_fecha');  
    if(isset($fecha)){
        $records = cajabanco::whereDate('cb_fecha','=',$fecha)->get();
        //se da por supuesto que la caja esta cerrada
        $flag = false;
        foreach ($records as $record) {
            if($record->cb_activo == 1)
            {
                //si encuentra al menos 1 record activo, la caja esta activa
                $flag = true;
                break;
            }
        }
        if($records !== null && $flag == false)
        {
            $message = 'Esta caja ya se encuentra cerrada y no permite nuevos registros, por favor, selecciona otra fecha en caja.';
            return redirect("/caja")->with('error',$message);            
        }  
    }
    else
    {
        $message = 'Esta caja ya se encuentra cerrada y no permite nuevos registros, por favor, selecciona otra fecha en caja.';
        return redirect("/caja")->with('error',$message);   
    }
}