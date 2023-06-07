<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutosOsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produtos_os', function (Blueprint $table) {
            $table->id();
            $table->foreignId('produto_id');
            $table->integer('quantidade');
            // Outros campos que você deseja adicionar à tabela
            $table->timestamps();

            $table->foreign('produto_id')->references('id')->on('produtos')->onDelete('cascade');
            // Outras relações e restrições de chave estrangeira
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('produtos_os');
    }
}
