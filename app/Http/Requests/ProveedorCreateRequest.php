<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class ProveedorCreateRequest extends Request
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
            'prov_codigo' => 'required|unique:proveedors',
            'prov_nombre' => 'required|unique:proveedors',
            'prov_rif' => 'required',
            'prov_direccion' => 'required',
        ];
    }
}
