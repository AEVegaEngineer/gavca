<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateIngredientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ingredientes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('rec_nombre');
            $table->string('ing_ingrediente'); 
            $table->timestamps();
            
            
        });
        Schema::table('ingredientes', function (Blueprint $table) {
            $table->foreign('rec_nombre')->references('rec_nombre')->on('recetas');
            $table->foreign('ing_ingrediente')->references('par_ingrediente')->on('parametros');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('ingredientes');
    }
}
