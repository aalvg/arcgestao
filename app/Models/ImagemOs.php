<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImagemOs extends Model
{
    use HasFactory;
    protected $table = 'imagens_os';
    protected $fillable = ['nome', 'data_registro', 'ordem_servico_id', 'obs'];

    public function ordemServico()
    {
        return $this->belongsTo(OrdemServico::class);
    }
}
