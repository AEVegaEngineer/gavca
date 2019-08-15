<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;
use gavca\Http\Requests\VentaCreateRequest;
use gavca\Http\Requests;
use gavca\Http\Controllers\Controller;
use gavca\produccion;
use gavca\cliente;
use gavca\venta;
use gavca\banco;
use gavca\produccionc;
use gavca\totalventa;
use gavca\ctaxcobrar;
use gavca\cajabanco;

use PDF;

class VentaController extends Controller
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
        $totalesventas = totalventa::orderBy('id', 'dsc')->paginate(15);
        $elementos = venta::All();
        $elementos = $elementos->unique('ven_factura');   
        return view('venta.index',compact('totalesventas','elementos'));
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
            $bancos = banco::lists('ban_nombre', 'ban_nombre');
            $clientes = cliente::lists('cli_nombre', 'cli_codigo'); 
            $factura = venta::latest()->first();
            $factura = ($factura !== null) ? (int)$factura->ven_factura+1 : 1000;

            return view('venta.create',compact('bancos','clientes','fecha','factura'));
        }else{
            \Session::flash('message-error', 'Antes de registrar operaciones de compra, venta o producción debes seleccionar una fecha en caja, bajo la cual se registrarán las operaciones.');
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
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function facturar(VentaCreateRequest $request)
    {
        $cli_codigo = $request["cli_codigo"];
        $ven_fecha = $request["ven_fecha"];
        $ven_factura = $request["ven_factura"];
        $ven_condicion = $request["ven_condicion"];  
        $banco_o_caja = $request["banco_o_caja"]; 
        $banco = $request["banco"];   

        /*Si la venta se hace contra una caja que esta cerrada redirecciono y muestro error */
        if($ven_condicion == "contado"){
            $entidad;
            if($banco_o_caja == "caja"){
                $entidad = null;
            }else{
                $entidad = $banco;
            }
            $dia_actual = new Carbon($ven_fecha);
            $existencia = cajabanco::where('cb_entidad',$entidad)
                ->whereDate('cb_fecha','=',$dia_actual->toDateString())
                ->first(); 
            if($existencia!==null){
                $cerrada = $existencia->cb_activo;
                if($cerrada == 0){
                    //Redirecciono a create con error
                    $fecha = session('caja_fecha');        
                    if(isset($fecha)){
                        \Session::flash('message-error', 'Esta caja ya se encuentra cerrada y no permite nuevos registros, por favor, selecciona otra caja o selecciona otra fecha en caja.');
                        $bancos = banco::lists('ban_nombre', 'ban_nombre');
                        $clientes = cliente::lists('cli_nombre', 'cli_codigo'); 
                        return view('venta.create',compact('bancos','clientes','fecha'));
                    }else{
                        \Session::flash('message-error', 'Antes de registrar operaciones de compra, venta o producción debes seleccionar una fecha en caja, bajo la cual se registrarán las operaciones.');
                        $hoy = Carbon::today()->toDateString();
                        return view('caja.index',compact('hoy'));
                    } 
                }
            }
        }

        $costos = array();
        $produccionc = produccionc::leftJoin('recetas', 'recetas.rec_nombre', '=', 'produccionc.rec_nombre')->get();
        foreach ($produccionc as $key => $produccion) {
            $id = produccion::where('rec_nombre',$produccion->rec_nombre)->max('id');
            $costo = produccion::where('id',$id)->first()->pro_costo;
            array_push($costos, $costo);
        }

        return view('venta.facturando',compact('cli_codigo','ven_fecha','ven_factura','ven_condicion','produccionc','costos','banco_o_caja','banco'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /*        
        MOSTRAR UNA VISTA  
        */
        /*FILTRADO INICIAL REVISA SI NO HAY SUFICIENTE PRODUCCION PARA VENDER*/
        $flag = true;
        foreach ($request["rec_nombre"] as $key => $nombre) { 
            if($request['ven_cantidad'][$key] != null){
                if($request["pro_produccion"][$key] < $request['ven_cantidad'][$key]){
                    $flag = false;                    
                }
            }
        }
        /*GUARDADO FINAL*/
        if($flag == true){
            //Si hay existencias para vender
            $banco_o_caja = $request['banco_o_caja'];
            $banco = $request['banco'];
            $entidad;
            if($banco_o_caja == 'caja'){
                $entidad = 'Caja Chica';
            }else if($banco_o_caja == 'banco'){
                $entidad = $banco;
            }
            /*creo el registro en el totalventa*/
            $iva = (int)str_replace("%","",$request['iva']);
            totalventa::create([               
                'ven_factura' => $request['ven_factura'],
                'ven_total' => $request['totMasIva'],
                'ven_iva' => $iva,
            ]);
            /*creo el registro en ventas para cada producto vendido*/
            foreach ($request["rec_nombre"] as $key => $nombre) {            
                if($request['ven_cantidad'][$key] != null 
                    && $request['ven_cantidad'][$key] != "0" 
                    && $request['ven_cantidad'][$key] != "")
                {
                    venta::create([
                        'cli_codigo' => $request['cli_codigo'],
                        'ven_fecha' => $request['ven_fecha'],                
                        'ven_factura' => $request['ven_factura'],
                        'ven_condicion' => $request['ven_condicion'],
                        'rec_nombre' => $request["rec_nombre"][$key],
                        'ven_costo' => $request['ven_costo'][$key],
                        'ven_cantidad' => $request['ven_cantidad'][$key],
                        'ven_entidad' => $entidad,
                    ]); 
                    //cardex
                    $existencia = produccion::where('produccion.rec_nombre',$request["rec_nombre"][$key])
                        ->orderBy('produccion.id','dsc')                
                        ->take(1)
                        ->pluck('pro_disponible');
                    produccion::create([
                        'pro_fecha' => $request['ven_fecha'],
                        'rec_nombre' => $request["rec_nombre"][$key],
                        'pro_etapa' => 'PC',
                        'pro_produccion' => $request['ven_cantidad'][$key],
                        'pro_disponible' => $existencia - $request['ven_cantidad'][$key],

                        'pro_mano_obra' => 0,
                        'pro_concepto' => 'Venta bajo factura: '.$request['ven_factura'].' de fecha '.$request['ven_fecha'],
                    ]);
                
                    /*Resto la cantidad comprada de la existencia de producciones*/
                    $existencia = produccionc::where('rec_nombre',$request["rec_nombre"][$key])->first()->pro_produccion;
                    $nueva_existencia = $existencia - $request['ven_cantidad'][$key];
                    produccionc::where('rec_nombre',$request["rec_nombre"][$key])
                        ->update(['pro_produccion' => $nueva_existencia]);
                }
            }
            
            $venta_id = totalventa::max('id');
            /*creo el registro en caja*/
            if($request['ven_condicion'] == "credito"){
                //guarda el costo total de la venta en el saldo de cuentas x cobrar del cliente
                $cliente = cliente::where('cli_codigo',$request['cli_codigo'])
                    ->first();
                $saldo_actual;
                if($cliente!==null){
                    $saldo_actual = $cliente->cli_saldo;
                }else{
                    $saldo_actual = 0;
                }
                $nuevo_saldo = $saldo_actual+$request['totMasIva'];
                cliente::where('cli_codigo',$request['cli_codigo'])
                    ->update(['cli_saldo' => $nuevo_saldo]);                    
                ctaxcobrar::create([
                    'cta_cli_codigo'=>$request['cli_codigo'],
                    'cta_monto'=>$request['totMasIva'],
                    'cta_concepto'=>'Venta de factura '.$request['ven_factura'].' de fecha '.$request['ven_fecha'],
                    'cta_venta_id'=>$venta_id,                 
                ]);                
            }else if($request['ven_condicion'] == "contado"){
                $banco_o_caja = $request['banco_o_caja'];
                $banco = $request['banco'];
                $entidad;
                if($banco_o_caja == 'caja'){
                    $entidad = null;
                }else if($banco_o_caja == 'banco'){
                    $entidad = $banco;
                }
                $saldo = cajabanco::where('cb_entidad', $entidad)
                    ->whereDate('cb_fecha','=',$request['ven_fecha'])
                    ->latest()->first();           
                                   
                if($saldo === null)
                    $saldo = 0;
                else
                    $saldo = $saldo->cb_saldo;
                
                cajabanco::create([
                    'cb_entidad' => $entidad,
                    'cb_debe_haber' => 'DEBE',
                    'cb_fecha' => $request['ven_fecha'],
                    'cb_monto' => $request['totMasIva'],
                    'cb_saldo' => $saldo+$request['totMasIva'],
                    'cb_venta_id' => $venta_id,
                    'cb_concepto' => 'Venta',
                ]);                
            }           
            
            $totalesventas = totalventa::orderBy('id', 'dsc')->paginate(15);
            $elementos = venta::All();
            $elementos = $elementos->unique('ven_factura'); 
            $request->session()->flash('message', 'La venta se ha guardado exitosamente.');   
            return view('venta.index',compact('totalesventas','elementos'));

        }else{
            //Si NO hay existencias para vender
            $costos = array();
            $produccionc = produccionc::leftJoin('recetas', 'recetas.rec_nombre', '=', 'produccionc.rec_nombre')->get();
            foreach ($produccionc as $key => $produccion) {
                $id = produccion::where('rec_nombre',$produccion->rec_nombre)->max('id');
                $costo = produccion::where('id',$id)->first()->pro_costo;
                array_push($costos, $costo);
            }
            $cli_codigo = $request['cli_codigo'];
            $ven_fecha = $request['ven_fecha'];                
            $ven_factura = $request['ven_factura'];
            $ven_condicion = $request['ven_condicion'];
            $request->session()->flash('message', 'No se puede realizar esta compra porque no existen suficientes productos de los cuales usted ha especificado.'); 
            return view('venta.facturando',compact('cli_codigo','ven_fecha','ven_factura','ven_condicion','produccionc','costos'));
        }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  totalesventa->$id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $factura = totalventa::where('id',$id)->pluck('ven_factura');
        $ventas = totalventa::leftJoin('ventas', 'ventas.ven_factura', '=', 'totalesventas.ven_factura')
            ->where('totalesventas.ven_factura',$factura)
            ->get();  
        $totalventa_id = $id;       
        return view('venta.show',compact('ventas','factura','totalventa_id'));
        
    }
    /**
     * GENERA EL REPORTE DE LAS VENTAS DEL ÚLTIMO MES
     *
     * @param  string  $factura_o_mensual
     * @param  string/int  $atributo
     * @return \Illuminate\Http\Response
     */
    public function reporte($factura_o_mensual, $atributo)
    {
        
        if($factura_o_mensual == "mensual")
        {
            //reporte mensual          
            //formatea fechas
            if(isset($atributo) && $atributo != 0)
            {
                $anio = $atributo['0'].$atributo['1'].$atributo['2'].$atributo['3'];
                $mes = $atributo['5'].$atributo['6'];
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
                $totalesventas = totalventa::orderBy('id', 'dsc')
                    ->get();

                $elementos = venta::orderBy('id', 'dsc')
                    ->where('ven_activo',1)
                    ->whereYear('ven_fecha','=',$fecha_format->year) 
                    ->whereMonth('ven_fecha','=',$fecha_format->month)           
                    ->get();
                $elementos = $elementos->unique('ven_factura');
                
                $pdf = PDF::loadView('venta.reporte-mensual', compact('totalesventas','elementos','mes_long','fecha_format')); 
                $pdf->save(storage_path('reportes/Ventas/Reporte-Ventas-Mensual-'.$anio.'-'.$mes_long.'.pdf'));
                return $pdf->stream('Reporte-Ventas-Mensual-'.$anio.'-'.$mes_long.'.pdf');
                /*
                $records = \DB::select('ip')
                      ->selectRaw('count(`ip`) as `occurences`')
                      ->from('users')
                      ->groupBy('ip')
                      ->having('occurences', '>', 1)
                      ->get()
                */
                
            }else{
                return redirect('/venta')->with('message','Se debe seleccionar una fecha para generar el reporte.');
            }
        }
        else
        {
            //reporte por factura
            $factura = totalventa::where('id',$atributo)->pluck('ven_factura');
            $ventas = totalventa::leftJoin('ventas', 'ventas.ven_factura', '=', 'totalesventas.ven_factura')
                ->where('totalesventas.ven_factura',$factura)
                ->get();                      
            $pdf = PDF::loadView('venta.reporte-factura', compact('ventas','factura')); 
            $pdf->save(storage_path('reportes/Ventas/Reporte-Venta-Factura-'.$factura.'.pdf'));
            return $pdf->stream('Reporte-Venta-Factura-'.$factura.'.pdf');
        }       
        
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
    public function revertir($id)
    {
        $factura = totalventa::where('id',$id)->first()->ven_factura;
        $ventas = venta::where('ven_factura',$factura)->get();
        //calculo el monto de la venta
        $monto_venta = cajabanco::where('cb_venta_id',$id)->first()->cb_monto;
        
        //obtengo la razon de la venta y la entidad aqui ya que la necesitare para ambos casos
        $cred_cont = $ventas[0]->ven_condicion;
        $entidad = $ventas[0]->ven_entidad;        

        $caja_actual = cajabanco::where('cb_activo',1)->latest()->first()->cb_fecha;
        
        $fecha = new Carbon($ventas[0]->ven_fecha);
        $caja = cajabanco::where('cb_entidad',$entidad)
            ->whereDate('cb_fecha', '=' , $caja_actual)
            ->whereNotNull('cb_saldo')
            ->latest()
            ->first();
        $saldo = 0;
        if($caja !== null)
        {
            $saldo = $caja->cb_saldo;
        }
        if($ventas[0]->ven_activo == 1)
        {
            //SI LA VENTA ESTA ACTIVA Y QUIERO ELIMINARLA
            $cta_concepto = 'Eliminación de venta a '.$cred_cont.' bajo factura: '.$ventas[0]->ven_factura.' de fecha '.$fecha->toDateString();
            $cb_debe_haber = 'HABER';
            $cb_concepto = 'Reembolso por eliminación de venta bajo factura: '.$ventas[0]->ven_factura.' de fecha '.date('Y-m-d', strtotime($ventas[0]->ven_fecha));
            $link = '/caja';
            $message = 'Venta y movimientos de inventario revertidos correctamente, fondos restaurados a la respectiva caja.';
            if($cred_cont == 'credito')
            {
                //comp_cred_cont "credito" y cli_codigo tiene el codigo del cliente al que se le debe restar el costo de la venta
                ctaxcobrar::create([
                    'cta_cli_codigo' => $ventas[0]->cli_codigo,
                    'cta_concepto' => $cta_concepto,
                    'cta_venta_id' => $ventas[0]->ven_factura,
                    'cta_monto' => $monto_venta,
                ]);
            }else{
                //Cuando se realizan compras a contado        
                cajabanco::create([
                    'cb_entidad' => $ventas[0]->ven_entidad,
                    'cb_debe_haber' => $cb_debe_haber,
                    'cb_fecha' => $caja_actual,
                    'cb_concepto' => $cb_concepto,
                    'cb_monto' => $monto_venta,
                    'cb_saldo' => $saldo-$monto_venta,
                ]);
            }
            venta::where('id',$id)
                ->update(['ven_activo' => 0]);
            cajabanco::where('cb_venta_id',$id)
                ->update(['cb_activo' => 0]);
            // ESTABLECE CADA UNO DE LOS ELEMENTOS VENDIDOS EN ESA FACTURA DE LA VENTA COMO INACTIVO Y RESTABLECE LA DEBIDA PRODUCCIÓN
            foreach ($ventas as $venta) {
                //inventario
                $producto = produccionc::where('rec_nombre',$venta->rec_nombre)->first();
                $cantidad = 0;
                if($producto !== null)            
                    $cantidad = $producto->pro_produccion; 
                        
                    $nueva_cantidad = $cantidad+$venta->ven_cantidad;                
                    produccionc::where('rec_nombre',$venta->rec_nombre)
                        ->update(['pro_produccion' => $nueva_cantidad]);
                    //cardex
                    $existencia = produccion::where('produccion.rec_nombre',$venta->rec_nombre)
                        ->orderBy('produccion.id','dsc')                
                        ->take(1)
                        ->pluck('pro_disponible');
                    produccion::create([
                        'pro_fecha' => $caja_actual,
                        'rec_nombre' => $venta->rec_nombre,
                        'pro_etapa' => 'PC',
                        'pro_costo' => 0,
                        'pro_produccion' => $venta->ven_cantidad,
                        'pro_disponible' => $existencia+$venta->ven_cantidad,
                        'pro_mano_obra' => 0,
                        'pro_concepto' => 'Eliminación de venta bajo factura: '.$venta->ven_factura.' de fecha '.date('Y-m-d', strtotime($venta->ven_fecha)),
                    ]);
                }
                return redirect($link."/".$entidad)->with('message',$message);      
              
        }else{
            //CASO: SI LA VENTA HA SIDO ELIMINADA Y QUIERO REACTIVARLA
            return "ha ocurrido un error, la venta no esta activa.";         
        } 


    }
}
