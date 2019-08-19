<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use gavca\Http\Requests;
use gavca\Http\Requests\ProveedorCreateRequest;
use gavca\Http\Requests\ProveedorUpdateRequest;
use gavca\ctaxpagar;
use gavca\proveedor;
use gavca\Http\Controllers\Controller;

class ProveedorController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
    }
    /* Método ajax para chequear si el proveedor existe desde compras */
    public function getProveedor(Request $request){
        //retorna por post
        if ($request->isMethod('post')){  
            $proveedor = proveedor::where('prov_codigo', $request["proveedor"])
            ->orWhere('prov_nombre', $request["proveedor"])
            ->first();
            return $proveedor; 
        }
        //retorna por get
        return response()->json(['response' => array('proveedor' => 'This is get method','mensaje' => '1')]);
    }
    /* Método ajax para hacer la busqueda de los proveedores por auto completacion */
    public function searchProveedor(Request $request){
        //retorna por post
        if ($request->isMethod('post')){  
            $proveedor = proveedor::where('prov_codigo', 'LIKE', '%'.$request["proveedor"].'%')
                ->orWhere('prov_nombre', 'LIKE', '%'.$request["proveedor"].'%')
                ->get();
            return $proveedor;
        }
    }
    /* Método ajax para guardar el proveedor desde compras */
    public function storeProveedor(ProveedorCreateRequest $request){
        if ($request->isMethod('post')){  
            proveedor::create([
                'prov_codigo' => $request['prov_codigo'],
                'prov_nombre' => $request['prov_nombre'],                
                'prov_rif' => $request['prov_rif'],
                'prov_direccion' => $request['prov_direccion'],
                'prov_contacto' => $request['prov_contacto'],
                'prov_condiciones' => $request['prov_condiciones'],
                'prov_retencion' => $request['prov_retencion'],
                'prov_cred_o_cont' => $request['prov_cred_o_cont'],
                ]);  
            //return $request['activation_date'];
            return response()->json(['response' => array('mensaje' => 'El proveedor ha sido registrado exitosamente.')]);
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $proveedores = proveedor::paginate(15);
        $cuentasxpagar = ctaxpagar::All();
        return view('proveedor.index',compact('proveedores','cuentasxpagar'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
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
        
        $codigo = crearCodigo();
        return view('proveedor.create',compact('codigo'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProveedorCreateRequest $request)
    {
        proveedor::create([
            'prov_codigo' => $request['prov_codigo'],
            'prov_nombre' => $request['prov_nombre'],                
            'prov_rif' => $request['prov_rif'],
            'prov_direccion' => $request['prov_direccion'],
            'prov_contacto' => $request['prov_contacto'],
            'prov_condiciones' => $request['prov_condiciones'],
            'prov_retencion' => $request['prov_retencion'],
            'prov_cred_o_cont' => $request['prov_cred_o_cont'],
        ]);  
        $proveedores = proveedor::paginate(15);
        return redirect('/proveedor')->with('message','Proveedor registrado exitosamente');
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
        $proveedor = proveedor::find($id);
        return view('proveedor.edit',['proveedor'=>$proveedor]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ProveedorUpdateRequest $request, $id)
    {
        $proveedor = proveedor::find($id);
        $proveedor->fill($request->all());
        $proveedor->save();

        return redirect('/proveedor')->with('message','El proveedor se ha actualizado exitosamente.');        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        proveedor::destroy($id);
        return redirect('/proveedor')->with('message','Proveedor eliminado exitosamente');
    }
}
