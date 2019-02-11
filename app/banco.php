<?php

namespace gavca;

use Illuminate\Database\Eloquent\Model;

class banco extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'bancos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['ban_nombre'];
}