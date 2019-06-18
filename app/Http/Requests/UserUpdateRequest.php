<?php

namespace gavca\Http\Requests;

use gavca\User;
use gavca\Http\Requests\Request;

class UserUpdateRequest extends Request
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
        $id = $this->input('id');
        return [            
            'name' => 'required',
            //'email' => 'required',
            'email' => 'required|unique:users,email,'.$id,
            //Donde email es el campo a omitir del request e $id es la id del usuario a actualizar.
            //'privilegio' => 'required',
            //los usuarios que son tipo 1 y tipo 2 no pueden editar sus privilegios
        ];
    }
    public function messages()
    {
        return [
            'name.required' => 'El nombre es requerido',
        ];
    }
}
