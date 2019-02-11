<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class dependencia extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'dependencias';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['dep_padre', 'dep_hijo', 'dep_produccion','requerimiento'];
}
