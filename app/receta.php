<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class receta extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'recetas';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['rec_nombre','rec_activo','rec_proc','rec_unidad'];
}
