<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class OrdemServico extends Model
{

    protected $fillable = [
        'descricao', 'cliente_id', 'usuario_id', 'senha'
    ];

    public function servicos(){
        return $this->hasMany('App\Models\ServicoOs', 'ordem_servico_id', 'id');
    }

    public function relatorios(){
        return $this->hasMany('App\Models\RelatorioOs', 'ordem_servico_id', 'id');
    }

    public function funcionarios(){
        return $this->hasMany('App\Models\FuncionarioOs', 'ordem_servico_id', 'id');
    }

    public function cliente(){
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }


    public function orcamento()
{
    return $this->belongsTo(Orcamento::class, 'orcamento_id');
}

    public function usuario(){
        return $this->belongsTo(Usuario::class, 'usuario_id');
    }

    public function senha(){
        return $this->belongsTo(Usuario::class, 'senha');
    }

    public static function filtroData($dataInicial, $dataFinal, $estado){
        $c = OrdemServico::
        whereBetween('data_vencimento', [$dataInicial, 
            $dataFinal])
        ->where('estado', $estado);

        return $c->get();
    }
    public static function filtroDataFornecedor($cliente, $dataInicial, $dataFinal, $estado){
        $c = OrdemServico::
        join('clientes', 'clientes.id' , '=', 'ordem_servicos.cliente_id')
        ->where('razao_social.nome', 'LIKE', "%$cliente%")
        ->whereBetween('data_vencimento', [$dataInicial, 
            $dataFinal])
        ->where('estado', $estado);
        return $c->get();
    }

    public static function filtroCliente($cliente, $estado){
        $c = OrdemServico::
        join('clientes', 'clientes.id' , '=', 'ordem_servicos.cliente_id')
        ->where('razao_social', 'LIKE', "%$cliente%")
        ->where('estado', $estado);
        
        return $c->get();
    }
    
}
