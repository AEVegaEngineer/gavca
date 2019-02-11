<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class ctaxcobrar extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'cuentasxcobrar';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['cta_cli_codigo', 'cta_monto', 'cta_concepto','cta_venta_id','cta_pagada','cta_entidad','cta_fecha'];
}
