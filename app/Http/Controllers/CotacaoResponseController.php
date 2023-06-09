<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cotacao;
use App\Models\ItemCotacao;

class CotacaoResponseController extends Controller
{	

	public function response($link){

		$cotacao = Cotacao::
		where('link', $link)
		->where('ativa', true)
		->where('resposta', false)
		->first();

		if($cotacao){
			return view('cotacao/response')
			->with('cotacao', $cotacao);
		}else{
			return redirect('http://www.google.com');
		}
	}

	public function responseSave(Request $request){
		$data = $request->js;



		$cotacao = Cotacao::
		where('id', $data['cotacao_id'])
		->first();

		$total = str_replace(".", "", $data['total']);
		$total = str_replace(",", ".", $total);

		$cotacao->valor = $total;
		$cotacao->forma_pagamento = $data['forma_pagamento'] ?? '';
		$cotacao->responsavel = $data['responsavel'] ?? '';
		$cotacao->resposta = true;
		$result = $cotacao->save();

		foreach($data['itens'] as $i){
			$item = ItemCotacao::
			where('id', $i['id'])
			->first();

			$v = str_replace(".", "", $i['valor']);
			$v = str_replace(",", ".", $v);
			$item->valor = $v;
			$item->save();
		}

		echo json_encode($result);
	}
}
