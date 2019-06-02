<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class insumorequerido extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'insumo_requerido';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['ins_req_fecha', 'rec_nombre', 'ins_req_insumo', 'ins_req_total'];
}
