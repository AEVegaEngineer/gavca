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

class CompraController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('todos');
    }
    public function montoUpd(Request $request)
    {
        //retorna por post
        if ($request->isMethod('post')){  
            //Reviso si el código ya esta utilizado, si lo esta se generará otro.
            compra::where('id', $request['id'])->update(array('comp_monto' => $request['comp_monto']));

            
            /*ACTUALIZANDO EL MONTO EN CAJA*/
            if($request['banco']== ""){
                $transaccion = cajabanco::where('cb_entidad', 'Caja Chica')->max('id')-1;
            }
            else{
                $transaccion = cajabanco::where('cb_entidad', $request['banco'])->max('id')-1;
            }
            $saldo = cajabanco::where('id',$transaccion)->first();
            if($saldo === null)
                $saldo = 0;
            else
                $saldo = $saldo->cb_saldo;

            /*INICIO DE MODIFICACIÓN DE MONTO DE CUENTAS*/
            $target = ctaxpagar::where('cta_compra_id', $request['id'])->first();
            if($target === null){
                
                cajabanco::where('cb_compra_id', $request['id'])->update(array(
                    'cb_monto' => $request['comp_monto'],
                    'cb_saldo' => $saldo-$request['comp_monto']
                ));

            }else{
                //aparte de actualizar el monto dentro de ctaxpagar tengo q actualizar el saldo del proveedor
                ctaxpagar::where('cta_compra_id', $request['id'])->update(array('cta_monto' => $request['comp_monto']));
                $prov = ctaxpagar::where('cta_compra_id', $request['id'])->first()->cta_prov_codigo;
                $saldo = proveedor::where('prov_codigo', $prov)->first()->prov_saldo;
                $n_saldo = $saldo + $request['comp_monto'];
                proveedor::where('prov_codigo', $prov)->update(array('prov_saldo' => $n_saldo));
            }
            /*FIN DE MODIFICACIÓN DE MONTO DE CUENTAS*/
            return response()->json(['response' => array(
                'message' => 'actualizado',
                /*'id' => $request['id'],*/
                /*'comp_monto' => $request['comp_monto']*/
                'banco'=>$request['banco'],
                'cajabanco_id' => $transaccion,
                'saldo_previo' => $saldo,
                'saldo_posterior' => $saldo-$request['comp_monto'],
            )]);
        }
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
            //itero para buscar el numero
            for ($i=0; $i < 99999; $i++) { 
                $pattern = $request['perecedero'];
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
            return response()->json(['response' => array('code' => $code)]);            
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
        DB::table('compras')->where('comp_monto', '=', null)->delete();
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
            
        }
        //Función para crear código y pasarlo al formulario de compra
        //para crear un nuevo proveedor
        function crearCodigo(){
            $numero = 0;
            $n = 0;
            //itero para buscar el numero
            for ($i=0; $i < 99999; $i++) { 
                $patron = "P";
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
                    $patron = $patron."0";
                }            
                //concateno el patron con el numero
                $code = $patron.$i;  
                //si no hay ningun numero como este registrado sal del loop y registre
                $proveedor = proveedor::where('prov_codigo', '=', $code)->first();
                if ($proveedor === null) {
                    break;
                }                
            }
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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CompraCreateRequest $request)
    {
        //Elimino compras hechas a medias        
        DB::table('compras')->where('comp_monto', '=', null)->delete();
        DB::table('cajabanco')
            ->where('cb_concepto', '!=', 'Inicio de caja')
            ->where('cb_concepto', '!=', 'Cierre de caja')
            ->where('cb_monto', '=', null)
            ->delete();
        //necesito borrar los inputs erroneos, por si el usuario hecha para atras y quiere sobreescribir
        $compra_existe = compra::where('comp_doc',$request['comp_doc'])
            ->where('comp_proveedor',$request['comp_proveedor'])
            ->first();
        if($compra_existe === null)
        {
            compra::create([
                'comp_fecha' => $request['comp_fecha'],
                'comp_doc' => $request['comp_doc'],
                'comp_proveedor' => $request['comp_proveedor'],
                'comp_cred_cont' => $request['comp_cred_cont'],
            ]);
            /*
            SECCIÓN CRÉDITO O CONTADO
            SI ES A CRÉDITO VA A CUENTA DEL PROVEEDOR COMO CUENTA POR PAGAR, SI ES A CONTADO PREGUNTA COMO SE PAGO, SI CONTRA BANCO O CAJA CHICA  */
            $compra_id = DB::table('compras')->max('id'); 
            $entidad=0;           
            if($request['comp_cred_cont'] == 'credito'){
                ctaxpagar::create([
                    'cta_prov_codigo' => $request['comp_proveedor'],
                    'cta_concepto' => 'Compra a crédito bajo factura: '.$request['comp_doc'].' de fecha '.$request['comp_fecha'],
                    'cta_compra_id' => $compra_id,
                ]);
                compra::where('id',$compra_id)->update(['comp_entidad' => "Compra a Crédito"]);           
            }else{                       
                if($request['banco_o_caja'] == 'caja'){
                    $entidad = 'Caja Chica'; 
                }else if($request['banco_o_caja'] == 'banco'){
                    $entidad = $request['banco'];                          
                }
                compra::where('id',$compra_id)->update(['comp_entidad' => $entidad]);
                $dia_actual = new Carbon($request['comp_fecha']);
                $existencia = cajabanco::where('cb_entidad',$entidad)
                    ->whereDate('cb_fecha','=',$dia_actual->toDateString())
                    ->latest()
                    ->first();
                //$existencia = cajabanco::where('id',$existencia_id)->first();         
                
                if($existencia===null){                   
                    //return $dia_actual->subDay()->toDateString();
                    
                    //saldo de cualquier dia anterior a este que tenga un saldo
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
                    cajabanco::create([
                        'cb_entidad' => $entidad,
                        'cb_debe_haber' => 'HABER',
                        'cb_fecha' => $request['comp_fecha'],
                        'cb_concepto' => 'Inicio de caja',
                        'cb_saldo' => $saldo,
                    ]);
                }else{
                    cajabanco::create([
                        'cb_entidad' => $entidad,
                        'cb_debe_haber' => 'HABER',
                        'cb_compra_id' => $compra_id,
                        'cb_fecha' => $request['comp_fecha'],
                        'cb_concepto' => 'Compra',
                    ]);

                    $cerrada = $existencia->cb_activo;
                    if($cerrada == 0){
                        //Esta caja esta cerrada

                        //Borro los registos anteriores
                        DB::table('compras')->where('comp_monto', '=', null)->delete();
                        DB::table('cajabanco')->where('cb_entidad',$entidad)
                            ->orderBy('created_at','dsc')
                            ->take(2)->delete();

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
                
            }
            /*FIN DE SECCIÓN CRÉDITO O CONTADO*/               
            
            $compra = compra::where('comp_fecha',$request['comp_fecha'])->where('comp_doc',$request['comp_doc'])->first();
            $parametros = DB::table('parametros')
                ->orderBy('par_nombre', 'asc')->get();
            //$parametros = parametro::All();
            return view('compra.materiaprima',compact('compra','parametros','entidad')); 
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
        $caja = cajabanco::where('cb_entidad',$compra->comp_entidad)
            ->whereDate('cb_fecha', '=' , $fecha->toDateString())
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
            $cta_concepto = 'Eliminación de compra a crédito bajo factura: '.$compra->comp_doc.' de fecha '.$fecha->toDateString();
            $cb_debe_haber = 'DEBE';
            $cb_concepto = 'Reembolso por eliminación de compra bajo factura: '.$compra->comp_doc.' de fecha '.date('Y-m-d', strtotime($compra->comp_fecha));
            $cb_saldo = $saldo+$compra->comp_monto;
            $statusChangeTo = 0;            
            $link = '/caja';
            $message = 'Compra y movimientos de inventario revertidos correctamente, fondos devueltos a la respectiva caja.';
            
        }else{
            //SI LA COMPRA HA SIDO ELIMINADA Y QUIERO REACTIVARLA
            $cta_concepto = 'Reactivación de compra a crédito bajo factura: '.$compra->comp_doc.' de fecha '.date('Y-m-d', strtotime($compra->comp_fecha));
            $cb_debe_haber = 'HABER';
            $cb_concepto = 'Reactivación de compra bajo factura: '.$compra->comp_doc.' de fecha '.date('Y-m-d', strtotime($compra->comp_fecha));
            $cb_saldo = $saldo-$compra->comp_monto;
            $statusChangeTo = 1;            
            $link = '/compra';
            $message = 'Compra reactivada correctamente, costos en la caja respectiva actualizada';           
        }
        if($cred_cont == 'credito')
        {
            //comp_cred_cont "credito" y comp_proveedor tiene el codigo del proveedor al que se le debe restar o sumar el costo de la compra
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
                'cb_fecha' => date('Y-m-d', strtotime($compra->comp_fecha)),
                'cb_concepto' => $cb_concepto,
                'cb_monto' => $compra->comp_monto,
                'cb_saldo' => $cb_saldo,
            ]);
        }
        compra::where('id',$id)
            ->update(['comp_activo' => $statusChangeTo]);
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
        return redirect($link)->with('message',$message);  
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
}
