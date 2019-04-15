<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class ingrediente extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'ingredientes';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['rec_nombre', 'ing_ingrediente', 'ing_ratio', 'ing_default'];
}
