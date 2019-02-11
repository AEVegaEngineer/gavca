<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class CompraCreateRequest extends Request
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
            'comp_fecha' => 'required',
            'comp_doc' => 'required',
            'comp_proveedor' => 'required',
        ];
    }
}
