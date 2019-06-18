<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class ProduccionCreateRequest extends Request
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
        //$fecha = $this->input('pro_fecha');

        return [
            'pro_produccion' => 'required|Integer|min:1',
            'pro_fecha' => 'required',
            'rec_nombre' => 'required', 
            'pro_mano_obra' => 'required|Numeric|min:1',               
        ];
    }
    public function messages()
    {
        return [
            'pro_produccion.required' => 'La cantidad que se ha producido es requerida',
            'pro_produccion.Integer' => 'La cantidad producida debe ser un entero',
            'pro_produccion.min:1' => 'La cantidad producida debe ser un número entero positivo',
            'pro_fecha.required' => 'La fecha de producción es requerida',
            'rec_nombre.required' => 'El proceso productivo es requerido',
            'pro_mano_obra.required' => 'El requerimiento de mano de obra es requerido',
            'pro_mano_obra.Numeric' => 'El requerimiento de mano de obra debe ser un número',
            'pro_mano_obra.min:1' => 'El requerimiento de mano de obra debe ser un número positivo',
        ];
    }
}
