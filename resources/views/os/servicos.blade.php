@extends('default.layout')
@section('content')

@php
    $variavel1 = 'Valor 1';
    $variavel2 = 10;
@endphp


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('css/servicos.css') }}">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

function updateValue(select) {
    var valorUnitario = select.options[select.selectedIndex].getAttribute('data-valor');
    var estoque = select.options[select.selectedIndex].getAttribute('data-estoque');
    var quantidade = document.getElementById('quantidade').value;
    
    var valorTotal = quantidade * valorUnitario;
    
    document.getElementById('valor').value = valorUnitario.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
    document.getElementById('estoque').value = estoque;
    document.getElementById('valor_total').value = valorTotal || valorUnitario;
}


function calculateTotal(input) {
    var quantidade = parseInt(input.value);
    var valorUnitario = parseFloat(document.getElementById('valor').value);

    if (isNaN(valorUnitario) || isNaN(quantidade)) {
        document.getElementById('valor_total').value = '';
    } else {
        var valorTotal = valorUnitario * quantidade;
        document.getElementById('valor_total').value = valorTotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
    }
}


$(document).ready(function() {
    $('.box-produtoslist').select2({
        language: {
            noResults: function() {
                return "Nenhum resultado encontrado";
            }
        }
    });
});


</script>


<div class="card card-custom gutter-b">

	<div class="card-body">
		<div class="col-sm-12 col-lg-12 col-md-12 col-xl-12">
			<h4>Status:
				@if(isset($ordem) && is_object($ordem) && property_exists($ordem, 'id'))
					@if($ordem->estado == 'pd')
						<span class="label label-xl label-inline label-light-warning">PENDENTE</span>
					@elseif($ordem->estado == 'ap')
						<span class="label label-xl label-inline label-light-success">APROVADO</span>
					@elseif($ordem->estado == 'rp')
						<span class="label label-xl label-inline label-light-danger">REPROVADO</span>
					@else
						<span class="label label-xl label-inline label-light-info">FINALIZADO</span>
					@endif
				@else
					<span class="label label-xl label-inline label-light-danger">ERRO</span>
				@endif
			</h4>
		</div>
		
		

		<div class="col-sm-12 col-lg-12 col-md-12 col-xl-12">
			<a href="/ordemServico/alterarEstado/{{$ordem->id}}" class="btn btn-primary orange">
				<i class="la la-refresh"></i>
				Alterar estado
			</a>

			<a target="_blank" href="/ordemServico/imprimir/{{$ordem->id}}" class="btn btn-info">
				<i class="la la-print"></i> Imprimir
			</a>  
		</div>

		<div class="col-sm-12 col-lg-12 col-md-12 col-xl-12">

			<h5>NFSe: 
				@if($ordem->NfNumero)
				<strong>{{$ordem->NfNumero}}</strong>
				@else
				<strong> -- </strong>
				@endif
			</h5>
			<h5>Usuario responsável: <strong class="text-success">{{$ordem->usuario->nome}}</strong></h5>
		</div>
	</div>

	<div class="row" id="content" style="display: block">
		<div class="content d-flex flex-column flex-column-fluid" id="kt_content">

			<div class="container">
				<div class="card card-custom gutter-b example example-compact">
					<div class="col-lg-12">
						<!--begin::Portlet-->

						<form method="post" action="/ordemServico/addServico">
							@csrf

							<div class="row">
								<input type="hidden" id="_token" value="{{ csrf_token() }}">
								<input type="hidden" name="ordem_servico_id" name="" value="{{$ordem->id}}">


								<div class="col-xl-12">

									<div class="form-group validated col-sm-12 col-lg-12">
										<h4>Serviços da OS</h4>

										<div class="kt-section kt-section--first">
											<div class="kt-section__body">

												<div class="row align-items-center">
													<div class="form-group validated col-sm-6 col-lg-6">
														<label class="col-form-label" id="lbl_cpf_cnpj">Serviço</label>
														<div class="">
															<select class="form-control select2 servico" id="kt_select2_1" name="servico">
																@foreach($servicos as $s)
																<option value="{{$s->id}}">{{$s->id}} - {{$s->nome}}</option>
																@endforeach
															</select>
														</div>
													</div>

													<div class="form-group validated col-sm-4 col-lg-3">
														<label class="col-form-label" id="">Quantidade</label>
														<div class="">
															<input type="text" id="quantidade" name="quantidade" class="form-control @if($errors->has('quantidade')) is-invalid @endif" value="">
															@if($errors->has('quantidade'))
															<div class="invalid-feedback">
																{{ $errors->first('quantidade') }}
															</div>
															@endif
														</div>
													</div>

													<div class="col-sm-3 col-lg-2">
														<button style="margin-top: 10px;" type="submit" class="btn btn-success">Adicionar</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-xl-12">
									<div class="row">
										<div class="col-xl-12">
											<div class="container">
												<label>Registros: <strong class="text-success">{{sizeof($ordem->servicos)}}</strong></label>
												<div id="kt_datatable" class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded">

													<table class="datatable-table" style="max-width: 100%; overflow: scroll">
														<thead class="datatable-head">
															<tr class="datatable-row" style="left: 0px;">
																<th data-field="OrderID" class="datatable-cell datatable-cell-sort"><span style="width: 300px;">Serviço</span></th>
																<th data-field="OrderID" class="datatable-cell datatable-cell-sort"><span style="width: 200px;">Quantidade</span></th>
																<th data-field="Country" class="datatable-cell datatable-cell-sort"><span style="width: 200px;">Status</span></th>
																<th data-field="ShipDate" class="datatable-cell datatable-cell-sort"><span style="width: 200px;">Total</span></th>

																<th data-field="CompanyName" class="datatable-cell datatable-cell-sort"><span style="width: 120px;">Ações</span></th>
															</tr>
														</thead>

														<tbody class="datatable-body">

															<?php $servico_total = 0; ?>
															@foreach($ordem->servicos as $s)
															<tr class="datatable-row" style="left: 0px;">

																<td class="datatable-cell"><span class="codigo" style="width: 300px;">{{$s->servico->nome}}</span></td>
																<td class="datatable-cell"><span class="codigo" style="width: 200px;">{{$s->quantidade}}</span></td>
																<td class="datatable-cell"><span class="codigo" style="width: 200px;">
																	@if($s->status == true)
																	<span class="label label-xl label-inline label-light-success">FINALIZADO
																	</span>
																	@else
																	<span class="label label-xl label-inline label-light-warning">PENDENTE
																	</span>
																	@endif
																</span></td>
																<?php 
																$servico_total += $s->servico->valor * $s->quantidade;
																?>

																<td class="datatable-cell"><span class="codigo" style="width: 200px;">{{number_format(($servico_total), 2, ',', '.')}}</span></td>

																<td class="datatable-cell"><span class="codigo" style="width: 120px;">
																	@if(!$s->status)

																	<a onclick='swal("Atenção!", "Deseja remover este registro?", "warning").then((sim) => {if(sim){ location.href="/ordemServico/deleteServico/{{ $s->id }}" }else{return false} })' href="#!" class="btn btn-danger">
																		<span class="la la-trash"></span>
																	</a>

																	<a class="btn btn-success" href="/ordemServico/alterarStatusServico/{{ $s->id }}">
																		<span class="la la-check"></span>
																	</a>
																	@endif


																</span></td>

															</tr>
															@endforeach

														</tbody>
													</table>
												</div>
											</div>

										</div>
									</div>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<hr>
	<div class="row" id="content" style="display: block">
		<div class="content d-flex flex-column flex-column-fluid" id="kt_content">

			<div class="container">
				<div class="card card-custom gutter-b example example-compact">
					<div class="col-lg-12">
						<!--begin::Portlet-->

						<form method="post" action="/ordemServico/saveFuncionario">
							@csrf

							<div class="row">
								<input type="hidden" id="_token" value="{{ csrf_token() }}">
								<input type="hidden" name="ordem_servico_id" name="" value="{{$ordem->id}}">


								<div class="col-xl-12">

									<div class="form-group validated col-sm-12 col-lg-12">
										<h4>Funcionários da OS</h4>

										<div class="kt-section kt-section--first">
											<div class="kt-section__body">

												<div class="row align-items-center">
													<div class="form-group validated col-sm-4 col-lg-4">
														<label class="col-form-label" id="lbl_cpf_cnpj">Funcionário</label>
														<div class="">
															<select class="form-control select2 servico" id="kt_select2_2" name="funcionario">
																@foreach($funcionarios as $f)
																<option value="{{$f->id}}">{{$f->id}} - {{$f->nome}}</option>
																@endforeach
															</select>
														</div>
													</div>

													<div class="form-group validated col-sm-5 col-lg-5">
														<label class="col-form-label" id="">Função</label>
														<div class="">
															<input type="text" id="quantidade" name="funcao" class="form-control @if($errors->has('funcao')) is-invalid @endif" value="">
															@if($errors->has('funcao'))
															<div class="invalid-feedback">
																{{ $errors->first('funcao') }}
															</div>
															@endif
														</div>
													</div>

													<div class="col-sm-3 col-lg-2">
														<button style="margin-top: 10px;" type="submit" class="btn btn-success">Adicionar</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-xl-12">
									<div class="row">
										<div class="col-xl-12">
											<div class="container">
												<label>Registros: <strong class="text-success">{{sizeof($ordem->funcionarios)}}</strong></label>
												<div id="kt_datatable" class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded">

													<table class="datatable-table" style="max-width: 100%; overflow: scroll">
														<thead class="datatable-head">
															<tr class="datatable-row" style="left: 0px;">
																<th data-field="OrderID" class="datatable-cell datatable-cell-sort"><span style="width: 300px;">Nome</span></th>
																<th data-field="OrderID" class="datatable-cell datatable-cell-sort"><span style="width: 200px;">Função</span></th>
																<th data-field="Country" class="datatable-cell datatable-cell-sort"><span style="width: 200px;">Telefone</span></th>

																<th data-field="CompanyName" class="datatable-cell datatable-cell-sort"><span style="width: 120px;">Ações</span></th>
															</tr>
														</thead>

														<tbody class="datatable-body">

															@foreach($ordem->funcionarios as $f)
															<tr class="datatable-row" style="left: 0px;">

																<td class="datatable-cell"><span class="codigo" style="width: 300px;">{{$f->funcionario->nome}}</span></td>
																<td class="datatable-cell"><span class="codigo" style="width: 200px;">{{$f->funcao}}</span></td>


																<td class="datatable-cell"><span class="codigo" style="width: 200px;">{{$f->funcionario->telefone}} / {{$f->funcionario->celular}}</span></td>

																<td class="datatable-cell"><span class="codigo" style="width: 120px;">
																	<a onclick='swal("Atenção!", "Deseja remover este registro?", "warning").then((sim) => {if(sim){ location.href="/ordemServico/deleteFuncionario/{{ $f->id }}" }else{return false} })' href="#!" class="btn btn-danger">
																		<span class="la la-trash"></span>
																	</a>

																</span></td>

															</tr>
															@endforeach

														</tbody>
													</table>
												</div>
											</div>

										</div>
									</div>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<hr>
	<div class="row" id="content" style="display: block">
		<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
			<div class="container">
				<div class="card card-custom gutter-b example example-compact">
					<div class="col-lg-12">
						<div class="row">
							@foreach($ordem->relatorios as $r)
								
							<div class="col-xl-12 p-4">
								<div class="form-group validated col-sm-12 col-lg-12">
									<h4>Relatórios da OS</h4>
								</div>
								<div class="col-sm-12 col-lg-12 col-md-12 col-xl-12">
									<a href="/ordemServico/addRelatorio/{{$ordem->id}}" class="btn btn-success">
										<i class="la la-plus"></i>
										Adicionar Relatório
									</a>
									<td class="datatable-cell"><span class="codigo" style="width: 150px;">
										<a onclick='swal("Atenção!", "Deseja remover este registro?", "warning").then((sim) => {if(sim){ location.href="/ordemServico/deleteRelatorio/{{ $r->id }}" }else{return false} })' href="#!" class="btn btn-danger">
											<span class="la la-trash"></span>
										</a>
										<a class="btn btn-primary" href="/ordemServico/editRelatorio/{{ $r->id }}">
											<span class="la la-edit"></span>					
										</a>
										@endforeach
									</span></td>
								</div>
							</div>
							<!-- 1 - FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
							<div class="row" style="width: 100%;">
								@foreach($ordem->relatorios as $r)
								@endforeach
								<div class="col-md-6" >
									<label for="text1">Observações:</label>
									<span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->texto}}</span>
								</div>
								<div class="col-md-6">
									<label for="text2">Equipamento:</label>
									<span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->equipamento}}</span>
								</div>
							</div>
							<!-- 1 - FIM DOS FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
							<!-- 2 - FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
							<div class="row" style="width: 100%;">
								@foreach($ordem->relatorios as $r)
								@endforeach
								<div class="col-md-6" >
									<label for="text1">Problema:</label>
									<span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->problema}}</span>
								</div>
								<div class="col-md-6">
									<label for="text2">Observações de recebimento:</label>
									<span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->recebimento}}</span>
								</div>
							</div>
							<!-- 2 - FIM DOS FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
							<!-- 3 - FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
							<div class="row" style="width: 100%;">
								@foreach($ordem->relatorios as $r)
								@endforeach
								<div class="col-md-6" >
									<label for="text1">Laudo Técnico:</label>
									<span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->laudo}}</span>
								</div>
								<div class="col-md-6" >
									<label for="text1">RMA:</label>
									<span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->rma}}</span>
								</div>
							</div>
							<!-- 3 - FIM DOS FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->

							<div class="col-xl-12">
								<div class="row">
									<div class="col-xl-12">
										<div class="container">
											<label>Registros: <strong class="text-success">{{sizeof($ordem->relatorios)}}</strong></label>
											<div id="kt_datatable" class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded">

												<table class="datatable-table" style="max-width: 100%; overflow: scroll">


												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modal-desconto" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<form method="post" action="/ordemServico/setaDesconto">
				@csrf
				<div class="modal-header">
					<h5 class="modal-title">DESCONTO</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						x
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" value="{{$ordem->id}}" name="id">
					<div class="row">
						<div class="form-group validated col-sm-12 col-lg-12 col-12">
							<label class="col-form-label" id="">Valor</label>
							<input type="text" placeholder="Valor" name="valor" class="form-control" value="{{$ordem->desconto}}">
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button style="width: 100%" type="submit" class="btn btn-success font-weight-bold">OK</button>
				</div>
			</form>
		</div>
	</div>
</div>







<!-- #############################################################################################################-->
<!-- #############################################################################################################-->
<!-- ###################################Lista de produtos ########################################################-->
<!-- #############################################################################################################-->
<!-- #############################################################################################################-->
<hr>
<div class="row">
    <div class="form-group validated col-sm-12 col-lg-12">
        <h4 style="padding-left: 20px">Produtos da OS</h4>
    </div>

    <div class="form-group validated col-sm-12 col-lg-12">
        <div class="kt-section kt-section--first">
            <div class="kt-section__body">
                <table class="datatable-table" style="max-width: 100%; overflow: scroll">
                    <thead class="datatable-head">
                        <tr class="datatable-row" style="left: 0px;">
                            <th>Produtos</th>
							<th>Estoque</th>
                            <th>Unit.</th>
                            <th>V. Unit.</th>
                            <th>V. Total</th>
                        </tr>
                    </thead>
                    <tbody class="datatable-body">
                        <tr class="datatable-row">
							
                            
                                <div class="d-flex justify-content-start align-items-center">
									<form class="formulario" action="{{ route('save.product') }}" method="POST">
										@csrf
										<div class="d-flex">
											<td>
												<select class="box-produtoslist" id="kt-select2_1" name="produtos_selecionados[]" tabindex="-1" aria-hidden="true" onchange="updateValue(this)">
													@foreach ($produtos as $produto)
														<option value="{{ $produto->id }}" data-valor="{{ $produto->valor_venda }}" data-estoque="{{ $produto->estoque->quantidade }}">{{ $produto->nome }}</option>
													@endforeach
												</select>
											</td>
											<td>
												<input class="form-control-estoque ml-2" type="text" id="estoque" value="{{ $produtos->first()->estoque->quantidade }}" readonly>
											</td>
											<td>
												<input class="form-control-quantidade ml-2" type="number" id="quantidade" name="unidades[]" value="1" min="1" onchange="calculateTotal(this)">
											</td>
											<td>
												<input class="form-control-valor ml-2" type="text" id="valor" name="valor" value="{{ $produtos->first()->valor_venda }}" readonly>
											</td>
											<td>
												<input class="form-control-valor ml-2" type="text" id="valor_total" name="valor_total" value="{{ $produtos->first()->valor_venda }}" readonly>
											</td>
											<td>
												<button type="submit" class="btn btn-success">Adicionar</button>
											</td>
										</div>
									</form>
									
                                </div>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<div class="container">
	<div id="kt_datatable" class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded">
		<table class="datatable-table" style="max-width: 100%; overflow: scroll; padding:30px;" >
			<thead class="datatable-head">
				<tr class="datatable-row" style="left: 0px;">
					<th data-field="OrderID" class="datatable-cell datatable-cell-sort" style="width: 300px;">Produto:</th>
					<th data-field="OrderID" class="datatable-cell datatable-cell-sort" style="width: 200px;">Unit.</th>
					<th data-field="OrderID" class="datatable-cell datatable-cell-sort" style="width: 200px;">V. Unit.:</th>
					<th data-field="OrderID" class="datatable-cell datatable-cell-sort" style="width: 200px;">V. Total:</th>
		
				</tr>
			</thead>
			<tbody class="datatable-body">
				@if(isset($produtosSalvos) && $produtosSalvos->isNotEmpty())
					@php
						$produto_total = isset($produto_total) ? $produto_total : 0;
					@endphp
			
					@foreach($produtosSalvos as $produto)
						@php
							$subtotal = $produto->valor * $produto->produto_id;
							$valorTotal = $produto->valor * $produto->unidades;
							$produto_total += $valorTotal;
						@endphp
						<tr class="datatable-row">
							<td class="datatable-cell"><span class="codigo" style="width: 350px;">{{ $produto->nome }}</span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 230px;">{{ $produto->unidades }}</span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 200px;">{{ number_format($produto->valor, 2, ',', '.') }}</span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 200px;">{{ number_format($valorTotal, 2, ',', '.') }}</span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 200px;"></span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 200px;">
								<form action="{{ route('remove.product') }}" method="POST">
									@csrf
									<input type="hidden" name="produto_id" value="{{ $produto->id }}">
									<button type="submit" class="btn btn-danger">Remover</button>
								</form>
							</span></td>
							</tr>
					@endforeach
				@else
					<tr class="datatable-row">
						<td colspan="4">Nenhum produto salvo</td>
					</tr>
				@endif
				<tr>
					<hr><th style="font-weight: bold;">Total</th>
					<hr><th style="font-weight: bold;">=</th>
					@php
						   $produto_total = isset($produto_total) ? $produto_total : 0;
					@endphp
	
					<td style="font-weight: bold;">R$ {{ number_format($produto_total, 2, ',', '.') }}</td>
					<td></td> <!-- Coluna vazia para manter a formatação da tabela -->
				</tr>
			</tbody>
		</table>

	</div>

</div>

<!-- #############################################################################################################-->
<!-- #############################################################################################################-->
<!-- #########################          SERVIÇOS          ########################################################-->
<!-- #############################################################################################################-->
<!-- #############################################################################################################-->

<!-- #############################################################################################################-->
<!-- #############################################################################################################-->
<!-- #########################          SERVIÇOS          ########################################################-->
<!-- #############################################################################################################-->
<!-- #############################################################################################################-->

<!-- #############################################################################################################-->
<!-- #############################################################################################################-->
<!-- #########################          SERVIÇOS          ########################################################-->
<!-- #############################################################################################################-->
<!-- #############################################################################################################-->
<hr>
<div class="row">
    <div class="form-group validated col-sm-12 col-lg-12">
        <h4 style="padding-left: 20px">Serviços da OS</h4>
    </div>

    <div class="form-group validated col-sm-12 col-lg-12">
        <div class="kt-section kt-section--first">
            <div class="kt-section__body">
                <table class="datatable-table" style="max-width: 100%; overflow: scroll">
                    <thead class="datatable-head">
                        <tr class="datatable-row" style="left: 0px;">
                            <th>Serviço</th>
                            <th>Qntd</th>
                            <th>V. Unit.</th>
                            <th>V. Total</th>
                        </tr>
                    </thead>
                    <tbody class="datatable-body">
                        <tr class="datatable-row">
                            <td>
                                <form class="formulario" action="{{ route('save.product') }}" method="POST">
                                    @csrf
                                    <div class="d-flex">
										<select class="form-control select2 servico" id="kt_select2_1" name="servico">
											@foreach ($servicos as $s)
												<option value="{{$s->id}}" data-valor="{{$s->valor}}">{{$s->id}} - {{$s->nome}}</option>
											@endforeach
										</select>
                                    </div>
                            </td>
                            <td>
								<input type="text" id="quantidade" name="quantidade" class="form-control quantidade @if($errors->has('quantidade')) is-invalid @endif" value="">
								@if($errors->has('quantidade'))
									<div class="invalid-feedback">
										{{ $errors->first('quantidade') }}
									</div>
								@endif
                            </td>
							<td>
								@if ($servicos->isNotEmpty())
									<input class="form-control-valor ml-2" type="text" id="valor" name="valor" value="{{ $servicos->first()->valor }}" readonly>
								@else
									<!-- Tratar o caso em que a coleção está vazia -->
								@endif
							</td>
							
                            <td>
                                <input class="form-control-valor ml-2" type="text" id="valor_total" name="valor_total" value="" readonly>
                            </td>
                            <td>
                                <button style="margin-top: 10px;" type="submit" class="btn btn-success">Adicionar</button>
                            </td>
                            </form>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div id="kt_datatable" class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded">
        <table class="datatable-table" style="max-width: 100%; overflow: scroll; padding:30px;">
            <thead class="datatable-head">
                <tr class="datatable-row" style="left: 0px;">
                    <th data-field="OrderID" class="datatable-cell datatable-cell-sort" style="width: 200px;">Serviço:</th>
                    <th data-field="OrderID" class="datatable-cell datatable-cell-sort" style="width: 10px;">Qntd.</th>
                    <th data-field="OrderID" class="datatable-cell datatable-cell-sort" style="width: 10x;">V. Unit.:</th>
                    <th data-field="OrderID" class="datatable-cell datatable-cell-sort" style="width: 10px;">V. Total:</th>
                </tr>
			</thead>
			<tbody class="datatable-body">
				<?php $servico_total = 0; ?>
				@foreach($ordem->servicos as $s)
						<tr class="datatable-row">
							<td class="datatable-cell"><span class="codigo" style="width: 200px;">{{$s->servico->nome}}</span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 10px;">{{$s->quantidade}}</span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 10px;">{{number_format(($servico_total), 2, ',', '.')}}</span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 10px;"></span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 10px;"></span></td>
							<td class="datatable-cell"><span class="codigo" style="width: 10px;">
								<a onclick='swal("Atenção!", "Deseja remover este registro?", "warning").then((sim) => {if(sim){ location.href="/ordemServico/deleteServico/{{ $s->id }}" }else{return false} })' href="#!" class="btn btn-danger">
									<span class="la la-trash"></span>
								</a>
							</span></td>
						</tr>
					@endforeach
					<tr>
						<th style="font-weight: bold;">Total</th>
						<th style="font-weight: bold;">=</th>
						<td style="font-weight: bold;">
							@php
								$servico_total = 0;
								foreach ($ordem->servicos as $s) {
									if ($s->servico) {
										$servico_total += $s->servico->valor * $s->quantidade;
									}
								}
							@endphp
							R$ {{ number_format($servico_total, 2, ',', '.') }}
						</td>
						<td></td> <!-- Coluna vazia para manter a formatação da tabela -->
					</tr>
					
			</tbody>
		</table>

	</div>

</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#kt_select2_1').change(function() {
            var selectedOption = $('#kt_select2_1').find(':selected');
            var valorUnitario = selectedOption.data('valor');
            var quantidade = $('#quantidade').val();
            var valorTotal = parseFloat(valorUnitario) * parseInt(quantidade);

            $('#valor').val(valorUnitario);
            $('#valor_total').val(valorTotal.toFixed(2));
        });

        $('#quantidade').keyup(function() {
            var selectedOption = $('.servico-option:selected');
            var valorUnitario = selectedOption.data('valor');
            var quantidade = $(this).val();
            var valorTotal = parseFloat(valorUnitario) * parseInt(quantidade);

            $('#valor_total').val(valorTotal.toFixed(2));
        });
    });
</script>
@endsection