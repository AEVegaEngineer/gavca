<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class ParametroUpdateRequest extends Request
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
            'par_nombre' => 'required',
            'par_unidad' => 'required',
            'par_costo' => 'required',
        ];
    }
    protected function getValidatorInstance()
    {
        //formateo las cifras
        $data = $this->all();        
        $amount2=str_replace(',','',$data['par_costo']);    
        $data['par_costo'] = $amount2;
        $this->getInputSource()->replace($data);

        


        return parent::getValidatorInstance();
    }
}
