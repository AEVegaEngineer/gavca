<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class saldocaja extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'saldocaja';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['sc_fecha','sc_saldo','sc_entidad'];
}
