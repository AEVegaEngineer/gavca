<?php

namespace gavca\Http\Requests;

use gavca\Http\Requests\Request;

class RecetaCreateRequest extends Request
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
            'rec_nombre' => 'required|unique:recetas',
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
            'rec_proc.required' => 'La etapa del proceso productivo es requerida',
            'rec_unidad.required' => 'La unidad del proceso productivo es requerida',
        ];
    }
    
}
