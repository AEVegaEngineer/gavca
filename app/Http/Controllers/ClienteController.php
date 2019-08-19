<?php

namespace gavca\Http\Controllers;

use Illuminate\Http\Request;

use gavca\Http\Requests\ClienteCreateRequest;
use gavca\Http\Requests\ClienteUpdateRequest;
use gavca\Http\Requests;

use gavca\cliente;
use gavca\ctaxcobrar;
use gavca\Http\Controllers\Controller;

class ClienteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('adminotipo1', ['except' => ['index']]);    
        
    }       
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $clientes = cliente::paginate(15);
        $cuentasxcobrar = ctaxcobrar::All();
        return view('cliente.index',compact('clientes','cuentasxcobrar'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //Función para crear código y pasarlo al formulario
        //para crear un nuevo cliente           
        function crearCodigo(){
            $numero = 0;
            $n = 0;
            //itero para buscar el numero            
            $ultimoCliente = cliente::orderBy('id','dsc')->take(1)->pluck('cli_codigo');
            $ultimoCliente = str_replace("C","",$ultimoCliente);
            $ultimoCliente = (int)$ultimoCliente+1;
            $patron = "C";
            //cuento digitos
            $n = 0; 
            $floor = $ultimoCliente;           
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
            $code = $patron.$ultimoCliente; 

            return $code;
        }
        
        $codigo = crearCodigo();   
        return view('cliente.create',compact('codigo'));
    }    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ClienteCreateRequest $request)
    {
        cliente::create([
            'cli_codigo' => $request['cli_codigo'],
            'cli_nombre' => $request['cli_nombre'],                
            'cli_rif' => $request['cli_rif'],
            'cli_direccion' => $request['cli_direccion'],
            'cli_contacto' => $request['cli_contacto'],
            'cli_condiciones' => $request['cli_condiciones'],
        ]);  
        $clientes = cliente::paginate(15);
        $request->session()->flash('message', 'El cliente se ha guardado exitosamente.');
        $cuentasxcobrar = ctaxcobrar::All();
        return view('cliente.index',compact('clientes','cuentasxcobrar'));
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
        $cliente = cliente::find($id);
        return view('cliente.edit',['cliente'=>$cliente]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ClienteUpdateRequest $request, $id)
    {
        $cliente = cliente::find($id);
        $cliente->fill($request->all());
        $cliente->save();

        return redirect('/cliente')->with('message','El cliente se ha actualizado exitosamente.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        cliente::destroy($id);
        return redirect('/cliente')->with('message','El cliente se ha eliminado exitosamente.');
    }
}
