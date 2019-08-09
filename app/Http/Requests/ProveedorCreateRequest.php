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
            'prov_rif' => [
                'required',
                'unique:proveedors',
                'regex:/^(?=.*[a-z|A-Z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/',
            ],            
            'prov_direccion' => 'required',
        ];
    }
    //nro de telefono
    ///([0-9]){3}\w+-+([0-9]){7}
    public function messages()
    {
        return [
            'prov_codigo.required' => 'El código del proveedor es requerido',
            'prov_codigo.unique' => 'El código del proveedor ya esta siendo utilizado',
            'prov_nombre.required' => 'El nombre del proveedor es requerido',
            'prov_nombre.unique' => 'El nombre del proveedor ya esta siendo utilizado',
            'prov_rif.required' => 'El RIF es requerido',
            'prov_rif.regex' => 'El RIF debe tener un formato apropiado: J-00000000-0',
            'prov_rif.unique' => 'El RIF es ya esta siendo utilizado',
            'prov_direccion.required' => 'La dirección del proveedor es requerida',
        ];
    }
}
