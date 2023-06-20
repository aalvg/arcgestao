<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\ItemCompra;
use App\Models\Produto;

class Estoque extends Model
{
	protected $fillable = [
        'produto_id', 'quantidade', 'valor_compra', 'validade'
    ];

    public function produto(){
        return $this->belongsTo(Produto::class, 'produto_id');
    }

    /**
     * Summary of valorCompra
     * @return string
     */
    public function valorCompra()
    {
        if (is_numeric($this->valor_compra) && is_numeric($this->produto->conversao_unitaria)) {
            return $this->valor_compra / $this->produto->conversao_unitaria;
        } else {
            return 0; // ou um valor padrão adequado
        }
    }
    
    

    public function value_purchase($productId = null){

    	$item = ItemPurchase::
    	where('produto_id', $productId)
    	->orderBy('id', 'desc')
    	->first();
    	return $item != null ? $item->value : 0;
    }

    public static function ultimoValorCompra($productId){
        $estoque = Estoque::
        where('produto_id', $productId)
        ->orderBy('id', 'desc')
        ->first();

        return $estoque;
    }

    public static function mediaCompra($productId){
        $avg = ItemCompra::
        where('produto_id', $productId)
        ->avg('valor_unitario');

        return $avg;
    }

    public function valorCompraUnitário(){
        $produto = Produto::find($this->produto_id);

        $valorMedio = $this->valor_compra/$produto->conversao_unitaria;
        return $valorMedio * $this->quantidade;
    }

}
