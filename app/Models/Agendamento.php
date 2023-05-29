<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Agendamento extends Model
{
    protected $fillable = [
        'funcionario_id', 'cliente_id', 'data', 'inicio', 'termino', 'observacao', 'total',
        'desconto', 'acrescimo', 'status', 'valor_comissao'
    ];

    public function itens(){
        return $this->hasMany('App\Models\ItemAgendamento', 'agendamento_id', 'id');
    }

    public function cliente(){
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    public function funcionario(){
        return $this->belongsTo(Funcionario::class, 'funcionario_id');
    }

}
