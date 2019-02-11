<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class costofijo extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'costofijos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['cf_concepto', 'cf_montomes'];
}
