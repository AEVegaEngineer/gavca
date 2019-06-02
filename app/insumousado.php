<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class insumousado extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'insumo_usado';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['insing_default', 'insing_insumo', 'insing_ratio', 'rec_nombre'];
}
