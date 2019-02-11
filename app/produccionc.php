<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class produccionc extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'produccionc';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['rec_nombre','pro_produccion'];
}
