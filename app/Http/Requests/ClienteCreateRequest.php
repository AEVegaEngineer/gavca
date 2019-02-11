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
            'cli_nombre' => 'uniqueClienteNombre:{$request->cli_codigo}',
            'cli_codigo' => 'required|unique:clientes,cli_codigo,'.$id,
            /*'cli_nombre' => 'required|unique:clientes,cli_nombre,'.$id,*/
            'cli_rif' => 'required',
            'cli_direccion' => 'required',
            'cli_contacto' => 'required',
            'cli_condiciones' => 'required',
        ];
    }
}
