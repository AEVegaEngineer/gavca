<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class cajachica extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'cajachica';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['cc_monto', 'cc_debe_haber','cc_compra_id','cc_fecha'];
}
