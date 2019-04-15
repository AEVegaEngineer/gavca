<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class parametro extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'parametros';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['par_nombre', 'par_unidad', 'par_costo', 'par_observacion', 'par_codigo', 'par_default', 'par_ratio', 'par_cost_updated'];
}
