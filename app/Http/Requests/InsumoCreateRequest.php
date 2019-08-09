<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class InsumoCreateRequest extends Request
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
            'ins_nombre' => 'required|unique:insumos',
            'ins_unidad' => 'required',
            'ins_costo' => 'required',                         
        ];
    }
    public function messages()
    {
        return [
            'ins_nombre.required' => 'El nombre del insumo es requerido',
            'ins_nombre.unique' => 'El nombre del insumo ya se encuentra registrado',
            'ins_unidad.required' => 'La unidad del insumo es requerida',
            'ins_costo.required' => 'El costo del insumo es requerido',
        ];
    }
    protected function getValidatorInstance()
    {
        //formateo las cifras
        $data = $this->all();
        $amount2=str_replace(',','',$data['ins_costo']);    
        $data['par_costo'] = $amount2;    
        return parent::getValidatorInstance();
    }
}
