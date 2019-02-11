<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class compra extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'compras';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['comp_doc','comp_proveedor','comp_fecha','comp_monto','comp_cred_cont','comp_activo','comp_entidad'];
}
