<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class CompraCreateRequest extends Request
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
        return [
            'comp_fecha' => 'required',
            'comp_doc' => 'required|unique:compras',
            'comp_proveedor' => 'required',
        ];
    }
    public function messages()
    {
        return [
            'comp_fecha.required' => 'La fecha de compra es requerida',
            'comp_doc.unique' => 'La factura de compras ya esta registrada',
            'comp_proveedor.required' => 'El proveedor es requerido',
        ];
    }
}
