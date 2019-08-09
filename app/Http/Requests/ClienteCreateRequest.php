<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class ClienteCreateRequest extends Request
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
            'cli_nombre' => 'required',
            'cli_codigo' => 'required|unique:clientes,cli_codigo,'.$id,
            /*'cli_nombre' => 'required|unique:clientes,cli_nombre,'.$id,*/
            'cli_rif' => 'required',
            'cli_direccion' => 'required',
            'cli_contacto' => 'required',
            'cli_condiciones' => 'required',
        ];
    }
    public function messages()
    {
        return [
            'cli_nombre.required' => 'El nombre del cliente es requerido',
            'cli_codigo.required' => 'El nombre del código es requerido',
            'cli_codigo.unique' => 'El código del cliente debe ser único',
            'cli_rif.required' => 'El RIF es requerido',
            'cli_direccion.required' => 'La dirección es requerida',
            'cli_contacto.required' => 'El contácto es requerido',
            'cli_condiciones.required' => 'La condición del cliente es requerida',
        ];
    }
}
