<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class cajabanco extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'cajabanco';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['cb_entidad', 'cb_monto', 'cb_debe_haber','cb_compra_id','cb_venta_id','cb_fecha','cb_saldo','cb_concepto','cb_activo'];
}
