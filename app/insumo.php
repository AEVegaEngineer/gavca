<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class insumo extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'insumos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['ins_nombre', 'ins_unidad', 'ins_costo', 'ins_observacion', 'ins_cost_updated'];
}
