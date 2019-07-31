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
    public function messages()
    {
        return [
            'rec_nombre.required' => 'El nombre del proceso productivo es requerido',
            'rec_nombre.unique:recetas' => 'El nombre del proceso productivo ya se encuentra registrado',
            'rec_activo.required' => 'El status del proceso productivo es requerido',
            'rec_proc.required' => 'La etapa del proceso productivo es requerida',
            'rec_unidad.required' => 'La unidad del proceso productivo es requerida',
        ];
    }
}
