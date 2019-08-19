<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class ClienteUpdateRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {      
        $id = $this->input('id');
        return [
            'cli_nombre' => 'required|max:255|unique:clientes,cli_nombre,'.$id,
            'cli_codigo' => 'required|unique:clientes,cli_codigo,'.$id,
            /*'cli_nombre' => 'required|unique:clientes,cli_nombre,'.$id,*/
            'cli_rif' => 'required|regex:/[jJ](-)?([0-9]){8}-([0-9])/|unique:clientes,cli_rif,'.$id,  
            'cli_direccion' => 'required|max:255',
            'cli_contacto' => 'required|max:255',
            'cli_condiciones' => 'required|max:255',
        ];
    }
    public function messages()
    {
        return [
            'cli_nombre.required' => 'El nombre del cliente es requerido',
            'cli_codigo.required' => 'El nombre del código es requerido',
            'cli_codigo.unique' => 'El código del cliente ya se encuentra registrado',
            'cli_rif.required' => 'El RIF es requerido',
            'cli_rif.unique' => 'El RIF ya se encuentra registrado',
            'cli_rif.regex' => 'El formato del RIF es erróneo, EJ. J-00000000-0',
            'cli_direccion.required' => 'La dirección es requerida',
            'cli_contacto.required' => 'El contácto es requerido',
            'cli_condiciones.required' => 'La condición del cliente es requerida',
            'cli_nombre.max' => 'El nombre del cliente tiene como máximo 255 caracteres',
            'cli_direccion.max' => 'La dirección del cliente tiene como máximo 255 caracteres',
            'cli_contacto.max' => 'El contacto del cliente tiene como máximo 255 caracteres',
            'cli_condiciones.max' => 'Las condiciones del cliente tienen como máximo 255 caracteres',
        ];
    }
}
