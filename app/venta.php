<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class venta extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'ventas';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['cli_codigo','ven_fecha','ven_factura','ven_condicion','rec_nombre','ven_costo','ven_cantidad','ven_entidad','ven_activo'];
}
