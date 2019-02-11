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

class VentaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $totalesventas = totalventa::paginate(15);
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
             
            return view('venta.create',compact('bancos','clientes','fecha'));
        }else{
            \Session::flash('message-error', 'Antes de registrar operaciones de compra, venta o producción debes seleccionar una fecha en caja, bajo la cual se registrarán las operaciones.');
            $hoy = Carbon::today()->toDateString();
            return view('caja.index',compact('hoy'));
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
                $entidad = 'Caja Chica';
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
            foreach ($request["rec_nombre"] as $key => $nombre) {            
                if($request['ven_cantidad'][$key] != null){
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
                }
                /*Resto la cantidad comprada de la existencia de producciones*/
                $existencia = produccionc::where('rec_nombre',$request["rec_nombre"][$key])->first()->pro_produccion;
                $nueva_existencia = $existencia - $request['ven_cantidad'][$key];
                produccionc::where('rec_nombre',$request["rec_nombre"][$key])
                    ->update(['pro_produccion' => $nueva_existencia]);
            }
            /*creo el registro en el totalventa*/
            $iva = (int)str_replace("%","",$request['iva']);
            totalventa::create([               
                'ven_factura' => $request['ven_factura'],
                'ven_total' => $request['totMasIva'],
                'ven_iva' => $iva,
            ]); 
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
                    $entidad = 'Caja Chica';
                }else if($banco_o_caja == 'banco'){
                    $entidad = $banco;
                }
                $transaccion = cajabanco::where('cb_entidad', $entidad)
                    ->whereDate('cb_fecha','=',$request['ven_fecha'])
                    ->max('id');             
                    
                $saldo = cajabanco::where('id',$transaccion)->first();                

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
                    'cb_venta_id' => $request['ven_factura'],
                    'cb_concepto' => 'Venta',
                ]);                
            }
            
            $totalesventas = totalventa::paginate(15);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($factura)
    {
        //$ventas = venta::where('ven_factura',$factura)->get();
        $ventas = venta::leftJoin('totalesventas', 'totalesventas.ven_factura', '=', 'ventas.ven_factura')
        ->where('totalesventas.ven_factura',$factura)
        ->get();
        return view('venta.show',compact('ventas','factura'));
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
    public function revertir($factura)
    {
        $venta = venta::where('ven_factura',$factura)->first();
        //calculo el monto de la venta
        $elementos = venta::where('ven_factura',$factura)->get();
        $monto_venta = cajabanco::where('cb_venta_id',$factura)->first()->cb_monto;
        
        //obtengo la razon de la venta y la entidad aqui ya que la necesitare para ambos casos
        $cred_cont = $venta->ven_condicion;
        $entidad = $venta->ven_entidad;        

        $fecha = new Carbon($venta->ven_fecha);
        $caja = cajabanco::where('cb_entidad',$entidad)
            ->whereDate('cb_fecha', '=' , $fecha->toDateString())
            ->whereNotNull('cb_saldo')
            ->latest()
            ->first();
        $saldo = 0;
        if($caja !== null)
        {
            $saldo = $caja->cb_saldo;
        }
        if($venta->ven_activo == 1)
        {
            //SI LA VENTA ESTA ACTIVA Y QUIERO ELIMINARLA
            $cta_concepto = 'Eliminación de venta a crédito bajo factura: '.$venta->ven_factura.' de fecha '.$fecha->toDateString();
            $cb_debe_haber = 'HABER';
            $cb_concepto = 'Reembolso por eliminación de venta bajo factura: '.$venta->ven_factura.' de fecha '.date('Y-m-d', strtotime($venta->ven_fecha));
            $cb_saldo = $saldo-$monto_venta;
            $statusChangeTo = 0;
            $link = '/caja';
            $message = 'Venta y movimientos de inventario revertidos correctamente, fondos restaurados a la respectiva caja.';
            if($cred_cont == 'credito')
            {
                //comp_cred_cont "credito" y cli_codigo tiene el codigo del cliente al que se le debe restar el costo de la venta
                ctaxcobrar::create([
                    'cta_cli_codigo' => $venta->cli_codigo,
                    'cta_concepto' => $cta_concepto,
                    'cta_venta_id' => $venta->ven_factura,
                    'cta_monto' => $monto_venta,
                ]);
            }else{
                //Cuando se realizan compras a contado        
                cajabanco::create([
                    'cb_entidad' => $venta->ven_entidad,
                    'cb_debe_haber' => $cb_debe_haber,
                    'cb_fecha' => date('Y-m-d', strtotime($venta->ven_fecha)),
                    'cb_concepto' => $cb_concepto,
                    'cb_monto' => $monto_venta,
                    'cb_saldo' => $cb_saldo,
                ]);
            }
            venta::where('ven_factura',$factura)
                ->update(['ven_activo' => $statusChangeTo]);
            //agrego de nuevo la cantidad de producto que se tomó del inventario para vender y agrego tambien a cardex de producto
            foreach ($elementos as $key => $value) {
                //inventario
                $producto = produccionc::where('rec_nombre',$value->rec_nombre)->first();
                $cantidad;
                if($producto !== null)            
                    $cantidad = $producto->pro_produccion;            
                else
                    $cantidad = 0;
                $nueva_cantidad = $cantidad+$value->ven_cantidad;
                produccionc::where('rec_nombre',$value->rec_nombre)
                    ->update(['pro_produccion',$nueva_cantidad]);
                //cardex
                produccion::create([
                    'pro_fecha' => date('Y-m-d', strtotime($venta->ven_fecha)),
                    'rec_nombre' => $value->rec_nombre,
                    'pro_etapa' => 'PC',
                    'pro_costo' => 0,
                    'pro_produccion' => $value->ven_cantidad,
                    'pro_mano_obra' => 0,
                    'pro_concepto' => 'Eliminación de venta bajo factura: '.$venta->ven_factura.' de fecha '.date('Y-m-d', strtotime($venta->ven_fecha)),
                ]);
            }
            return redirect($link)->with('message',$message);  
        }else{
            //CASO: SI LA VENTA HA SIDO ELIMINADA Y QUIERO REACTIVARLA
            return "ha ocurrido un error, la venta no esta activa.";         
        }      
    }
}