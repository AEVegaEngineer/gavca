<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class ctaxpagar extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'cuentasxpagar';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['cta_prov_codigo', 'cta_monto', 'cta_concepto','cta_compra_id','cta_pagada','cta_entidad','cta_fecha'];
}
