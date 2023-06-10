<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mensagem extends Model
{
    protected $table = 'mensagens'; // Nome da tabela no banco de dados

    protected $fillable = ['conteudo']; // Colunas preenchíveis em massa

    // Defina quais colunas são datas (opcional)
    protected $dates = [
        'created_at',
        'updated_at',
    ];
}
