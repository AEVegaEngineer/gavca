<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class BancoCreateRequest extends Request
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
            'ban_nombre' => 'required|unique:bancos'
        ];
    }
}
