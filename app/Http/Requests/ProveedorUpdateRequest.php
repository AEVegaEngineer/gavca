<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class ProveedorUpdateRequest extends Request
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
            'prov_nombre' => 'required|max:255|unique:proveedores,prov_nombre,'.$id,
            'prov_codigo' => 'required|unique:proveedores,prov_codigo,'.$id,
            /*'prov_nombre' => 'required|unique:proveedores,prov_nombre,'.$id,*/
            'prov_rif' => 'required|regex:/[jJ](-)?([0-9]){8}-([0-9])/|unique:proveedores,prov_rif,'.$id,  
            'prov_direccion' => 'required|max:255',
            'prov_contacto' => 'max:255',
            'prov_observaciones' => 'max:255',
        ];
    }
    public function messages()
    {
        return [
            'prov_nombre.required' => 'El nombre del proveedor es requerido',
            'cli_codigo.required' => 'El nombre del código es requerido',
            'cli_codigo.unique' => 'El código del proveedor ya se encuentra registrado',
            'prov_rif.required' => 'El RIF es requerido',
            'prov_rif.unique' => 'El RIF ya se encuentra registrado',
            'prov_rif.regex' => 'El formato del RIF es erróneo, EJ. J-00000000-0',
            'prov_direccion.required' => 'La dirección es requerida',
            'cli_contacto.required' => 'El contácto es requerido',
            'cli_condiciones.required' => 'La condición del proveedor es requerida',
            'prov_nombre.max' => 'El nombre del proveedor tiene como máximo 255 caracteres',
            'prov_direccion.max' => 'La dirección del proveedor tiene como máximo 255 caracteres',
            'prov_contacto.max' => 'El contacto del proveedor tiene como máximo 255 caracteres',
            'prov_observaciones.max' => 'Las observaciones del proveedor tienen como máximo 255 caracteres',
        ];
    }
}
