<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class InsumoUpdateRequest extends Request
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
            'ins_nombre' => 'required',
            'ins_unidad' => 'required',
            'ins_costo' => 'required',
        ];
    }
    public function messages()
    {
        return [
            'ins_nombre.required' => 'El nombre del insumo es requerido',
            'ins_unidad.required' => 'La unidad del insumo es requerida',
            'ins_costo.required' => 'El costo del insumo es requerido',
        ];
    }
    protected function getValidatorInstance()
    {
        //formateo las cifras
        $data = $this->all();        
        $amount2=str_replace(',','',$data['ins_costo']);    
        $data['ins_costo'] = $amount2;
        $this->getInputSource()->replace($data);

        


        return parent::getValidatorInstance();
    }
}
