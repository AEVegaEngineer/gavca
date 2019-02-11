<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class totalventa extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'totalesventas';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['ven_factura','ven_total','ven_iva'];
}
