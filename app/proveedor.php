<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class proveedor extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'proveedors';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['prov_codigo','prov_nombre','prov_rif','prov_direccion','prov_contacto','prov_condiciones','prov_retencion','prov_saldo','prov_cred_o_cont'];
}
