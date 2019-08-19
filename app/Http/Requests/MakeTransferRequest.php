<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class MakeTransferRequest extends Request
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
            'destino' => 'required',
            'concepto' => 'required',
            'saldo' => 'required|Numeric|min:1',
        ];
    }
    public function messages()
    {
        return [
            'destino.required' => 'La entidad de destino de la transferencia es requerida',
            'concepto.required' => 'El concepto de la transferencia es requerido',
            'saldo.required' => 'El monto de la transferencia es requerido',
            'saldo.Numeric' => 'El monto de la transferencia debe ser numérico',
            'saldo.min' => 'El monto de la transferencia no puede ser menor a 1',
        ];
    }
}
