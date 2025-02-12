<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use PDF;
use Redirect;
use Carbon\Carbon;
use gavca\banco;
use gavca\saldocaja;
use gavca\cajabanco;
use gavca\Http\Requests;
use gavca\Http\Requests\MakeTransferRequest;
use gavca\Http\Requests\MakeInOutRequest;
use gavca\Http\Controllers\Controller;

class CajaBancoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
        $this->middleware('admin', ['only' => ['generarEntrada', 'generarSalida']]);
        $this->middleware('adminotipo1', ['only' => ['cerrarcaja', 'confirmarcierre']]);
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        //return "trigger";
        $hoy = Carbon::today()->toDateString();
        //si tengo seleccionada una caja no me muestra el formulario para
        //seleccionar cajas, salta directamente a la fecha seleccionda.
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
        $fecha = session('caja_fecha');        
        if(isset($fecha)){
            $caja = null;    
            $saldo_existe = saldocaja::where('sc_entidad',($caja==null) ? "Caja Chica" : $caja)
                ->whereDate('sc_fecha', '=' ,session('caja_fecha'))
                ->first();
            $records = cajabanco::where('cajabanco.cb_entidad',$caja)
                    ->whereDate('cb_fecha', '=',session('caja_fecha'))
                    ->orderBy('cajabanco.id','asc')
                    ->get();
            $bancos = banco::All();
            $ultima_v_c = cajabanco::whereNotNull('cb_compra_id')
                ->where('cb_entidad',$caja)
                ->where('cb_activo',1)
                ->orWhereNotNull('cb_venta_id')
                ->where('cb_entidad',$caja)
                ->where('cb_activo',1)
                ->orderBy('id','dsc')
                ->first();
            if(isset($ultima_v_c))
                $ultima_v_c = $ultima_v_c->id;
                
            //return $records." <br><br>".$ultima_v_c;
            return view('caja.caja',compact('bancos','caja','records','saldo_existe','caja_actual','ultima_v_c'));
        }
        
        return view('caja.index',compact('hoy','caja_actual','ultima_caja'));
    }    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function abrir(Request $request)
    {  
        //return "test";     
        $caja;
        if(isset($request["entidad"])){
            $caja = $request["entidad"];
            if ($request["entidad"] = "Caja Chica")
                $caja = null;
        }else{            
            $caja = null;
        }
        //para determinar si escojo un dia en el futuro
        $hoy = Carbon::today()->toDateString();
        

        $fecha_actual = new Carbon($request["caja_fecha"]);
        $diaAnterior = $fecha_actual->subDay()->toDateString();

        $last_closed = cajabanco::where('cb_activo',0)
            ->whereDate('cb_fecha','=',$diaAnterior)
            ->first();
        $flag = true;
        if($last_closed === null)
            $flag = false;

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
        //return $last_closed."<=".$request["caja_fecha"];
        //seleccionar fecha
        //si el dia anterior a esa fecha no esta cerrado -> false
        //si mi fecha seleccionada es 1 dia mayor a last_closed o menor paso.
        if($request["caja_fecha"] <= $hoy && $flag){
            session(['caja_fecha' => $request["caja_fecha"]]);   
            
            $saldo_existe = saldocaja::where('sc_entidad', ($caja==null) ? "Caja Chica" : $caja)
                ->whereDate('sc_fecha', '=' ,session('caja_fecha'))
                ->first();
            $records = cajabanco::where('cajabanco.cb_entidad',$caja)
                    ->whereDate('cb_fecha', '=',session('caja_fecha'))
                    ->orderBy('cajabanco.id','asc')
                    ->get();
            $bancos = banco::All();
            $ultima_v_c = cajabanco::whereNotNull('cb_compra_id')
                ->where('cb_entidad',$caja)
                ->where('cb_activo',1)
                ->orWhereNotNull('cb_venta_id')
                ->where('cb_entidad',$caja)
                ->where('cb_activo',1)
                ->orderBy('id','dsc')
                ->first();
            if(isset($ultima_v_c))
                $ultima_v_c = $ultima_v_c->id;            
            //return session('caja_fecha')." <br><br>".$records." <br><br>".$ultima_v_c;
            return view('caja.caja',compact('bancos','caja','records','saldo_existe','caja_actual','ultima_v_c'));
        }else{
            if($request["caja_fecha"] > $hoy){
                \Session::flash('message-error', "La fecha que has seleccionado es incorrecta, no puedes seleccionar un día en el futuro.");     
            }else if(!$flag){
                \Session::flash('message-error', "La fecha que has seleccionado es incorrecta, no puedes seleccionar una fecha si en su dia anterior no se han cerrado las cajas.");
            }    
            return view('caja.index',compact('hoy','caja_actual','ultima_caja'));
        }
        
        //return view('caja.index');
    }

    /**
     * FORMULARIO PARA AJUSTAR SALDO
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $id = cajabanco::where('cb_entidad','')->max('id');
        $record = cajabanco::where('id',$id)->first();
        $s_cajachica = 0;
        if($record !== null)
            $s_cajachica = $record->cb_saldo;  

        $id = cajabanco::where('cb_entidad','Banco De Venezuela')->max('id');    
        $record = cajabanco::where('id',$id)->first();
        $s_venezuela = 0;
        if($record !== null)
            $s_venezuela = $record->cb_saldo; 

        $id = cajabanco::where('cb_entidad','Banco Provincial')->max('id');
        $record = cajabanco::where('id',$id)->first();
        $s_provincial = 0;
        if($record !== null)
            $s_provincial = $record->cb_saldo; 

        $id = cajabanco::where('cb_entidad','Banco Banesco')->max('id');
        $record = cajabanco::where('id',$id)->first();
        $s_banesco = 0;
        if($record !== null)
            $s_banesco = $record->cb_saldo; 

        $id = cajabanco::where('cb_entidad','Banco Mercantil')->max('id');
        $record = cajabanco::where('id',$id)->first();
        $s_mercantil = 0;
        if($record !== null)
            $s_mercantil = $record->cb_saldo; 

        /*return "create, ".$s_cajachica." ".$s_venezuela." ".$s_provincial." ".$s_banesco." ".$s_mercantil;*/
        return view('caja.ajustar',compact('s_cajachica','s_venezuela','s_provincial','s_banesco','s_mercantil'));
    }

    /**
     * AJUSTANDO SALDO
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        cajabanco::create([
            'cb_entidad' => $request["entidad"],
            'cb_debe_haber' => 'DEBE',
            'cb_fecha' => session('caja_fecha'),
            'cb_saldo' => $request["valor"],
            'cb_concepto' => 'Ajuste de Caja',
        ]);
        $caja = $request["entidad"];
        $saldo_existe = saldocaja::where('sc_entidad',$caja)
            ->whereDate('sc_fecha', '=' ,session('caja_fecha'))
            ->first();
        $records = cajabanco::where('cb_entidad',$caja)
            ->whereDate('cb_fecha', '=',session('caja_fecha'))
            ->where('cb_activo',1)
            ->orderBy('id','asc')
            ->get();    

        $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
        if($caja_actual !== null)
        {
            $caja_actual = new Carbon($caja_actual->cb_fecha);
            $caja_actual = $caja_actual->toDateString();
        }

        $bancos = banco::All();    
        return view('caja.caja',compact('bancos','caja','records','saldo_existe','caja_actual'));
    }

    /**
     * VUELVE AL INDEX A GENERAR UNA NUEVA FECHA
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function volverfecha($entidad)
    {        
        session()->forget('caja_fecha');
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
        return view('caja.index',compact('hoy','entidad','caja_actual','ultima_caja'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($caja)
    {        
        //return "trigger";    
        if($caja == "Caja Chica")
            $caja = null;
        $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
        if($caja_actual !== null)
        {
            $caja_actual = new Carbon($caja_actual->cb_fecha);
            $caja_actual = $caja_actual->toDateString();
        }
        $saldo_existe = saldocaja::where('sc_entidad', ($caja==null) ? "Caja Chica" : $caja)
            ->whereDate('sc_fecha', '=' ,session('caja_fecha'))
            ->first();
        $records = cajabanco::where('cajabanco.cb_entidad',$caja)
                ->whereDate('cb_fecha', '=',session('caja_fecha'))
                ->orderBy('cajabanco.id','asc')
                ->get();
        $bancos = banco::All();
        $ultima_v_c = cajabanco::whereNotNull('cb_compra_id')
            ->where('cb_entidad',$caja)
            ->where('cb_activo',1)
            ->orWhereNotNull('cb_venta_id')
            ->where('cb_entidad',$caja)
            ->where('cb_activo',1)
            ->orderBy('id','dsc')
            ->first();
        if(isset($ultima_v_c))
            $ultima_v_c = $ultima_v_c->id;
        //return $records." <br><br>".$ultima_v_c;
        return view('caja.caja',compact('bancos','caja','records','saldo_existe','caja_actual','ultima_v_c'));
    }

    /**
     * FORMULARIO PARA CONFIRMAR CIERRE DE CAJA
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function confirmarcierre($entidad, $fecha)
    {
        return view('caja.confirm',compact('entidad','fecha'));
    }
    /**
     * CIERRE DE CAJA
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cerrarcaja($entidad, $fecha)
    {
        //return "test";       
        if($entidad == "Caja Chica")
            $entidad = null;
        //itera a través de las entidades y cierra todas las cajas
        $bancos = banco::All();
        $entidades = array(array("entidad" => ""));
        $mezcla = array_merge($entidades, $bancos->toArray());

        foreach ($mezcla as $key => $value) {
            if($key == 0)
                $entidad = null;
            else
                $entidad = $value["ban_nombre"];
        
            $saldo = 0;
            $id = cajabanco::where('cb_entidad',$entidad)
                ->whereDate('cb_fecha','=',$fecha)
                ->max('id');
            if($id !== null){
                
                $caja = cajabanco::where('id',$id)->first();
                if($caja !== null){
                    $saldo = $caja->cb_saldo;
                }   
                cajabanco::where('cb_entidad',$entidad)
                    ->whereDate('cb_fecha','=',$fecha)
                    ->update(['cb_activo' => 0]);
                //session()->forget('caja_fecha'); 
            }
            saldocaja::create([
                'sc_entidad' => ($entidad==null) ? "Caja Chica" : $entidad,
                'sc_saldo' => $saldo,
                'sc_fecha' => $fecha,
            ]);
            $ref = new Carbon($fecha);
            $diaDespues = $ref->addDay()->toDateString();
            cajabanco::create([
                'cb_entidad' => $entidad,
                'cb_debe_haber' => 'HABER',
                'cb_fecha' => $fecha,
                'cb_concepto' => 'Cierre de caja',
                'cb_activo' => 0,
                'cb_saldo' => $saldo,
            ]);
            cajabanco::create([
                'cb_entidad' => $entidad,
                'cb_debe_haber' => 'HABER',
                'cb_fecha' => $diaDespues,
                'cb_concepto' => 'Inicio de caja',
                'cb_activo' => 1,
                'cb_saldo' => $saldo,
            ]);   
        }
        //redirección     
        return redirect('/caja/Caja%20Chica');
        /* 
        $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
        if($caja_actual !== null)
        {
            $caja_actual = new Carbon($caja_actual->cb_fecha);
            $caja_actual = $caja_actual->toDateString();
        }
        $saldo_existe = "caja_cerrada";      
        
        $records = cajabanco::leftJoin('compras', 'cajabanco.cb_compra_id', '=', 'compras.id')
            ->leftJoin('ventas', 'ventas.ven_factura', '=', 'cajabanco.cb_venta_id')
            ->where('cajabanco.cb_entidad',$caja)
            ->whereDate('cb_fecha', '=',session('caja_fecha'))
            ->orderBy('cajabanco.id','asc')
            ->get();        
        return view('caja.caja',compact('bancos','caja','records','saldo_existe','caja_actual'))->with('message','Los registros de '.$entidad.' de fecha '.$fecha.' han sido cerrados. Ya no se pueden registrar operaciones en esta caja.');
        */
    }

    /**
     * VER CIERRE DE CAJA
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function vercierre($entidad, $fecha)
    {       
        //return "entidad: ".$entidad."<br> fecha: ".$fecha;
        $caja = $entidad;
        if($caja == "Caja Chica")
            $caja = null;
        $saldo_existe = "caja_cerrada";        
        $records = cajabanco::leftJoin('compras', 'cajabanco.cb_compra_id', '=', 'compras.id')
            ->leftJoin('ventas', 'ventas.ven_factura', '=', 'cajabanco.cb_venta_id')
            ->where('cajabanco.cb_entidad',$caja)
            ->whereDate('cb_fecha', '=',session('caja_fecha'))
            ->where('cb_activo',0)
            ->orderBy('cajabanco.id','asc')
            ->get();
        $bancos = banco::All();
        return view('caja.caja',compact('bancos','caja','records','saldo_existe'));
    }
    /**
     * GENERA EL REPORTE DE LA ENTIDAD SELECCIONADA EN PDF
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function reporte($entidad, $fecha)
    {
        $caja = $entidad;
        //return "entidad: ".$entidad."<br> fecha: ".$fecha;
        if($caja == "Caja Chica")
            $caja = null;
        $records = cajabanco::leftJoin('compras', 'cajabanco.cb_compra_id', '=', 'compras.id')
            ->leftJoin('ventas', 'ventas.ven_factura', '=', 'cajabanco.cb_venta_id')
            ->where('cajabanco.cb_entidad',$caja)
            ->whereDate('cb_fecha', '=',session('caja_fecha'))
            ->where('cb_activo',0)
            ->orderBy('cajabanco.id','asc')
            ->get();
        //return $records;
        $pdf = PDF::loadView('caja.caja-report', compact('caja','records'));
        $pdf->save(storage_path('reportes/CajaBanco/Reporte-'.$caja.'-'.session('caja_fecha').'.pdf'));
        return $pdf->stream('Reporte-'.$caja.'-'.session('caja_fecha').'.pdf');
        
    }
    /**
     * FORMULARIO DE TRANSFERENCIA DE SALDOS
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function transferir($entidad, $fecha)
    {
        $bancos = banco::where('ban_nombre','!=',$entidad)
            ->lists('ban_nombre', 'ban_nombre');
        if($entidad != 'Caja Chica')
            $bancos['Caja Chica'] = 'Caja Chica';
        //holy shit associative array works!
        return view('caja.transfer',compact('entidad','fecha','bancos'));
    }
    /**
     * TRANSFERIR SALDOS 
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function maketransfer(MakeTransferRequest $request)
    {
        if($request["entidad"] == "Caja Chica")
            $request["entidad"] = null;
        //return "Destino: ".$request["destino"]."<br>Saldo: ".$request["saldo"]."<br>Entidad: ".$request["entidad"]."<br>Fecha: ".$request["fecha"];  

        $id_origen = cajabanco::where('cb_entidad',$request["entidad"])
            ->whereDate('cb_fecha', '=',$request["fecha"])
            ->max('id');
        $saldo_origen = cajabanco::where('id',$id_origen)->first()->cb_saldo;

        $id_destino = cajabanco::where('cb_entidad',$request["destino"])
            ->whereDate('cb_fecha', '=',$request["fecha"])
            ->max('id');

        $saldo_destino;        
        if($id_destino === null)
            $saldo_destino = 0;
        else
            $saldo_destino  = cajabanco::where('id',$id_destino)->first()->cb_saldo;
        //Valida si hay suficiente dinero para la transferencia
        if($saldo_origen < $request["saldo"])
        {
            return Redirect::back()->with('message-error', 'No se encuentra suficiente saldo en la cuenta de orígen, no es posible hacer la transferencia por ese monto.');
        }
        $saldo_origen -= $request["saldo"];
        $saldo_destino += $request["saldo"];
        //creo el registro para el origen
        cajabanco::create([
            'cb_entidad' => $request["entidad"],
            'cb_debe_haber' => 'HABER',
            'cb_fecha' => $request["fecha"],
            'cb_monto' => $request["saldo"],
            'cb_saldo' => $saldo_origen,
            'cb_concepto' => 'Transferido hacia '.$request["destino"].', '.$request["concepto"],
        ]);
        //creo el registro para el destino
        if($request["entidad"] == null)
            $request["entidad"] = "Caja Chica";
        cajabanco::create([
            'cb_entidad' => $request["destino"],
            'cb_debe_haber' => 'DEBE',
            'cb_fecha' => $request["fecha"],
            'cb_monto' => $request["saldo"],
            'cb_saldo' => $saldo_destino,
            'cb_concepto' => 'Transferido desde '.$request["entidad"].', '.$request["concepto"],
        ]);
        if($request["entidad"] == "Caja Chica")
            $request["entidad"] = null;

        //retorno vista
        $caja = $request["entidad"];
        $saldo_existe = saldocaja::where('sc_entidad',$caja)
            ->whereDate('sc_fecha', '=' ,session('caja_fecha'))
            ->first();
        $records = cajabanco::where('cb_entidad',$caja)
            ->whereDate('cb_fecha', '=',session('caja_fecha'))
            ->where('cb_activo',1)
            ->orderBy('id','asc')
            ->get();    

        $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
        if($caja_actual !== null)
        {
            $caja_actual = new Carbon($caja_actual->cb_fecha);
            $caja_actual = $caja_actual->toDateString();
        }

        $bancos = banco::All(); 
        return view('caja.caja',compact('bancos','caja','records','saldo_existe','caja_actual'))->with('message','Saldo Transferido Correctamente.');      
    }
    /**
     * FORMULARIO DE ENTRADA DE SALDOS
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function entradaForm($entidad, $fecha)
    {
        return view('caja.in',compact('entidad','fecha'));
    }
    /**
     * FORMULARIO DE SALIDA DE SALDOS
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function salidaForm($entidad, $fecha)
    {
        return view('caja.out',compact('entidad','fecha'));
    }
    /**
     * ENTRADA DE SALDOS
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function generarEntrada(MakeInOutRequest $request)
    {
        if($request["entidad"] == "Caja Chica")
            $request["entidad"] = null;
        $id_origen = cajabanco::where('cb_entidad',$request["entidad"])
            ->whereDate('cb_fecha', '=',$request["fecha"])
            ->max('id');
        $record_previo = cajabanco::where('id',$id_origen)->first();
        $saldo_previo = 0;
        if($record_previo!==null){
            $saldo_previo = $record_previo->cb_saldo;
        }                
        //return "entidad: ".$request["entidad"]." sc_fecha:".$request["fecha"]." Saldo:".$saldo_previo;
        $nuevo_saldo = $saldo_previo + $request["monto"];
        cajabanco::create([
            'cb_entidad' => $request["entidad"],
            'cb_debe_haber' => 'DEBE',
            'cb_fecha' => $request["fecha"],
            'cb_monto' => $request["monto"],
            'cb_saldo' => $nuevo_saldo,
            'cb_concepto' => 'Entrada generada: '.$request["concepto"],
        ]);
        //retorno vista
        $caja = $request["entidad"];
        $saldo_existe = saldocaja::where('sc_entidad',$caja)
            ->whereDate('sc_fecha', '=' ,session('caja_fecha'))
            ->first();
        $records = cajabanco::where('cb_entidad',$caja)
            ->whereDate('cb_fecha', '=',session('caja_fecha'))
            ->where('cb_activo',1)
            ->orderBy('id','asc')
            ->get();    

        $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
        if($caja_actual !== null)
        {
            $caja_actual = new Carbon($caja_actual->cb_fecha);
            $caja_actual = $caja_actual->toDateString();
        }

        $bancos = banco::All(); 
        return view('caja.caja',compact('bancos','caja','records','saldo_existe','caja_actual'))->with('message','Saldo Transferido Correctamente.');



    }    
    /**
     * SALIDA DE SALDOS
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function generarSalida(MakeInOutRequest $request)
    {
        if($request["entidad"] == "Caja Chica")
            $request["entidad"] = null;
        $id_origen = cajabanco::where('cb_entidad',$request["entidad"])
            ->whereDate('cb_fecha', '=',$request["fecha"])
            ->max('id');
        $record_previo = cajabanco::where('id',$id_origen)->first();
        $saldo_previo = 0;
        if($record_previo!==null){
            $saldo_previo = $record_previo->cb_saldo;
        }        
        //return "entidad: ".$request["entidad"]." sc_fecha:".$request["fecha"]." Saldo:".$saldo_previo;
        $nuevo_saldo = $saldo_previo - $request["monto"];
        if($nuevo_saldo < 0)
        {
            return Redirect::back()->with('message-error', 'No se encuentra suficiente saldo en la cuenta de orígen, no es posible generar la salida por ese monto.');
        }
        cajabanco::create([
            'cb_entidad' => $request["entidad"],
            'cb_debe_haber' => 'HABER',
            'cb_fecha' => $request["fecha"],
            'cb_monto' => $request["monto"],
            'cb_saldo' => $nuevo_saldo,
            'cb_concepto' => 'Salida generada: '.$request["concepto"],
        ]);
        //retorno vista
        $caja = $request["entidad"];
        $saldo_existe = saldocaja::where('sc_entidad',$caja)
            ->whereDate('sc_fecha', '=' ,session('caja_fecha'))
            ->first();
        $records = cajabanco::where('cb_entidad',$caja)
            ->whereDate('cb_fecha', '=',session('caja_fecha'))
            ->where('cb_activo',1)
            ->orderBy('id','asc')
            ->get();    

        $caja_actual = cajabanco::where('cb_activo',1)->latest()->first();
        if($caja_actual !== null)
        {
            $caja_actual = new Carbon($caja_actual->cb_fecha);
            $caja_actual = $caja_actual->toDateString();
        }

        $bancos = banco::All(); 
        return view('caja.caja',compact('bancos','caja','records','saldo_existe','caja_actual'))->with('message','Saldo Transferido Correctamente.');
    }
    /**
     * Método AJAX para obtener en saldo disponible actual en una entidad
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getDisponible(Request $request){
        //retorna por post
        //return $request["entidad"];
        if($request["entidad"] == "Caja Chica")
            $request["entidad"] = null;
        if ($request->isMethod('post')){  
            $disponible = cajabanco::where('cb_entidad', $request["entidad"])
                ->orderBy('id','dsc')
                ->pluck('cb_saldo');
            return $disponible;
        }
        //retorna por get
        return response()->json(['response' => array('disponible' => 'Método Get','mensaje' => '1')]);
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
