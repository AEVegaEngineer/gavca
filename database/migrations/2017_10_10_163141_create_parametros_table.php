<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateParametrosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('parametros', function (Blueprint $table) {
            $table->increments('id');
            $table->string('par_nombre');
            $table->string('par_unidad'); 
            $table->decimal('par_costo', 25, 4);
            $table->string('par_observacion');
            $table->string('par_ingrediente')->unique();
            $table->timestamps();
            
            
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('parametros');
    }
}
