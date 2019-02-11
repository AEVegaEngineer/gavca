<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class materiaprima extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'materiasprimas';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['mp_codigo', 'mp_cantidad'];
}
