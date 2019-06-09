<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class SalarioCreateRequest extends Request
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
            'salario'=>'required'
        ];
    }
    protected function getValidatorInstance()
    {
        $data = $this->all();
        $amount2=str_replace('.','',$request->input('salario'));  
        $amount2=str_replace(',','.',$amount2);   
        $data['salario'] = $amount2;
        $this->getInputSource()->replace($data);
        /*modify data before send to validator*/


        return parent::getValidatorInstance();
    }
}
