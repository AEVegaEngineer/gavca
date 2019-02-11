<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class salario extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'salarios';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['sal_mensual','unidad_tributaria','cant_cesta_ticket'];
}