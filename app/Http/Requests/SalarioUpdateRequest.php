<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class SalarioUpdateRequest extends Request
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
            'sal_mensual' => 'required|Numeric',
            'unidad_tributaria' => 'required|Numeric',
            'cant_cesta_ticket' => 'required|Numeric',
        ];
    }
    protected function getValidatorInstance()
    {
        $data = $this->all();
        $amount2=str_replace(',','',$data['sal_mensual']);   
        $data['sal_mensual'] = $amount2;
        $this->getInputSource()->replace($data);
        /*modify data before send to validator*/


        return parent::getValidatorInstance();
    }
    public function messages()
    {
        return [
            'sal_mensual.required' => 'El salario mensual es requerido',
            'sal_mensual.Numeric' => 'El salario mensual debe ser Numérico',
            'unidad_tributaria.required' => 'La unidad tributaria es requerida',
            'unidad_tributaria.Numeric' => 'La unidad tributaria debe ser Numérica',
            'cant_cesta_ticket.required' => 'La cantidad de unidades tributarias por cesta ticket es requerida',
            'cant_cesta_ticket.Numeric' => 'La cantidad de unidades tributarias por cesta ticket debe ser Numérica',
        ];
    }
}
