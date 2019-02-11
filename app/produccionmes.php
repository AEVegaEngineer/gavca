<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class produccionmes extends Model
{
     /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'produccionmes';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['produccion'];
}
