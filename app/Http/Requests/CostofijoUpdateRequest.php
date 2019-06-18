<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class CostofijoUpdateRequest extends Request
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
            'cf_concepto' => 'required',
            'cf_montomes' => 'required',
        ];
    }

    protected function getValidatorInstance()
    {
        $data = $this->all();
        $amount1=str_replace('.','',$data['cf_montomes']); 

        $amount3=str_replace(',','.',$amount1);     

        $data['cf_montomes'] = $amount3;
        $this->getInputSource()->replace($data);

        /*modify data before send to validator*/


        return parent::getValidatorInstance();
    }
    public function messages()
    {
        return [
            'cf_concepto.required' => 'El concepto es requerido',
            'cf_montomes.required' => 'El monto es requerido',
        ];
    }
}
