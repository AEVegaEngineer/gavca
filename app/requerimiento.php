<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class requerimiento extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'requerimientos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['req_fecha', 'rec_nombre', 'req_ingrediente', 'req_total','req_costo'];
}
