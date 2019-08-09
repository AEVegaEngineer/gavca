<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class costohijo extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'costoshijos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['id_produccion', 'id_hijo'];
}
