<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;
use gavca\produccion;

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
        $fecha = $this->input('pro_fecha');

        return [
            'pro_produccion' => 'required|integer',
            'pro_fecha' => 'required',
            'rec_nombre' => 'required', 
            'pro_mano_obra' => 'required',                     
        ];
    }
}
