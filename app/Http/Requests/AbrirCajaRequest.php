<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class AbrirCajaRequest extends Request
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
            'caja_fecha'=>'required'
        ];
    }
    protected function getValidatorInstance()
    {
        $data = $this->all();
        $date_format=date_create($request->input('caja_fecha');  
        $data['caja_fecha'] = $date_format;
        $this->getInputSource()->replace($data);
        /*modify data before send to validator*/
        return parent::getValidatorInstance();
    }
}
