<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProdutoOS extends Model
{
    protected $table = 'produtos_os'; // Substitua 'nome_da_tabela' pelo nome real da sua tabela

    protected $fillable = ['id', 'produto_id', 'nome', 'quantidade', 'ordem_servico_id'];
   
    // Defina os atributos e os relacionamentos do modelo aqui

    public function produto()
    {
        return $this->belongsTo(Produto::class, 'produto_id');
    }
}
