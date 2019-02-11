<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class cardexMP extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'cardexmp';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['mp_codigo','comp_doc','car_costo','car_valor_anterior','car_valor_actual','car_compra_id','car_concepto','car_fecha','car_alicuota','car_iva'];
}
