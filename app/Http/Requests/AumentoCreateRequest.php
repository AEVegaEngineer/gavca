<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class AumentoCreateRequest extends Request
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
            'aum_descripcion' => 'required',
            'aum_aumento' => 'required|numeric',
        ];
    }
    protected function getValidatorInstance()
    {
        $data = $this->all();
        $amount2=str_replace('%','',$data['aum_aumento']);    
        $data['aum_aumento'] = $amount2;
        $this->getInputSource()->replace($data);

        /*modify data before send to validator*/


        return parent::getValidatorInstance();
    }
    public function messages()
    {
        $id = $this->input('id');
        return [
            'aum_descripcion.required' => 'La descripción es requerida',
            'aum_aumento.required' => 'El monto es requerido',
            'aum_aumento.numeric' => 'El monto debe ser numérico',
        ];
    }
}
