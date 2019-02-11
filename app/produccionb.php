<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class produccionb extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'produccionb';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['rec_nombre','pro_produccion'];
}
