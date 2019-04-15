<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class produccion extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'produccion';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['pro_fecha', 'rec_nombre', 'pro_produccion', 'pro_disponible', 'pro_mano_obra', 'pro_etapa', 'pro_lote', 'pro_concepto', 'pro_costo'];
}
