<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class CtaXCobrarCreateRequest extends Request
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
            'concepto' => 'required|max:255',
            'banco_o_caja' => 'required',
            'fecha' => 'required',
            'abono' => 'required|Numeric|min:1',
        ];
    }
    public function messages()
    {
        return [
            'concepto.required' => 'El concepto es requerido',
            'concepto.max' => 'Concepto puede tener un máximo de 255 caracteres',
            'fecha.required' => 'La fecha es requerida',
            'abono.required' => 'El abono es requerido',
            'abono.Numeric' => 'El abono debe ser un valor numérico',
            'abono.min' => 'El abono no puede ser un número negativo',
        ];
    }
}
