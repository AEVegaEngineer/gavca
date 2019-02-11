<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class RecetaUpdateRequest extends Request
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
            'rec_nombre' => 'required|unique:recetas,id,'.$id,
            /*'rec_nombre' => 'required',*/
            'rec_activo' => 'required',
            'rec_proc' => 'required',
            'rec_unidad' => 'required',
        ];
    }
}
