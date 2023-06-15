<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImagensOsTable extends Migration
{
    public function up()
    {
        Schema::create('imagens_os', function (Blueprint $table) {
            $table->id();
            $table->string('nome');
            $table->date('data_registro');
            $table->unsignedBigInteger('ordem_servico_id');
            $table->text('obs')->nullable();
            $table->timestamps();

            $table->foreign('ordem_servico_id')->references('id')->on('ordem_servicos')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('imagens_os');
    }
}

