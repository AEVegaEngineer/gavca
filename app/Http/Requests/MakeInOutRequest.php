<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class MakeInOutRequest extends Request
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
            'concepto' => 'required',
            'monto' => 'required|Numeric|min:1',
        ];
    }
    public function messages()
    {
        return [
            'concepto.required' => 'El concepto de la transacción es requerido',
            'monto.required' => 'El monto de la transacción es requerido',
            'monto.Numeric' => 'El monto de la transacción debe ser numérico',
            'monto.min' => 'El monto de la transacción no puede ser menor a 1',
        ];
    }
}
