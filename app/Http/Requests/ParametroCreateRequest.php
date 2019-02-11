<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class ParametroCreateRequest extends Request
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
            'par_nombre' => 'required|unique:parametros',
            'par_unidad' => 'required',
            'par_costo' => 'required',  
            'par_radio' => 'required',
            'par_default' => 'required',                         
        ];
    }
    protected function getValidatorInstance()
    {
        //formateo las cifras
        $data = $this->all();
        $amount2=str_replace(',','',$data['par_costo']);    
        $data['par_costo'] = $amount2;

        //capturo el valor del bool del checkbox y lo cambio por int(1)
        if(isset($data['par_default'])){
            $valor = $data['par_default'];
            if($valor == true){
                $valor = 1;
            }else{
                $valor = 0;
            }
            $data['par_default'] = $valor;
        }else{
            $data['par_default'] = 0;
        }

        $this->getInputSource()->replace($data);

        /*modify data before send to validator*/


        return parent::getValidatorInstance();
    }
}
