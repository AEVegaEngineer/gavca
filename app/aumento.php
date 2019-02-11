<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class aumento extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'aumentos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['aum_aumento','aum_descripcion'];
}
