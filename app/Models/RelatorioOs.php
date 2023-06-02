<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RelatorioOs extends Model
{
    
    protected $fillable = [
        'usuario_id',
         'ordem_servico_id',
          'texto',
           'equipamento',
            'problema',
            'recebimento',
            'laudo'

    ];

    public function ordemServico(){
        
        return $this->belongsTo(OrdemServico::class, 'ordem_servico_id', );


    }

    public function usuario(){
        return $this->belongsTo(Usuario::class, 'usuario_id');
    }
    public function equipamento(){
        return $this->belongsTo(Equipamento::class, 'equipamento');
    }
}
