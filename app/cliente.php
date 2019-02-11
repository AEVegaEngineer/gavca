<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class cliente extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'clientes';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['cli_codigo','cli_nombre','cli_rif','cli_direccion','cli_contacto','cli_condiciones','cli_saldo'];
}
