<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class miscelaneo extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'miscelaneos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['tru_cant', 'tru_cost_unit', 'tru_kilo','gas_porc_util','gas_cost_bomb'];
}
