@extends('default.layout')
@section('content')

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<div class="card card-custom gutter-b">

	<div class="card-body">
		<div class="col-sm-12 col-lg-12 col-md-12 col-xl-12">
			<h4>Status: 
				@if($ordem->estado == 'pd')
				<span class="label label-xl label-inline label-light-warning">PENDENTE</span>
				@elseif($ordem->estado == 'ap')
				<span class="label label-xl label-inline label-light-success">APROVADO</span>
				@elseif($ordem->estado == 'rp')
				<span class="label label-xl label-inline label-light-danger">REPROVADO</span>
				@else
				<span class="label label-xl label-inline label-light-info">FINALIZADO</span>
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

			<a type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">

				Adicionar Produtos
<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
	 					 <div class="modal-content">
							<div class="modal-header">
							  <h5 class="modal-title" id="exampleModalLabel">Adicionar Produtos a OS</h5>
							  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
							</div>
							<div class="modal-body">
		  						<iframe src="/ordemServico/detalhar/{{$ordem->id}}" frameborder="0" style="width: 100%; height: 500px;"></iframe>
							</div>
	 					 </div>
					</div>
 				 </div>
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
			<h5>Total <strong class="text-success">R$ {{number_format($ordem->valor_venda, 2, ',', '.')}}</strong></h5>


			<h5>Desconto: R$ <strong class="text-danger">{{number_format($ordem->desconto, 2, ',', '.')}}</strong>

				<a data-toggle="modal" href="#!" data-target="#modal-desconto" class="navi-link">
					<i class="la la-edit text-danger"></i>

				</a>
				
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

															<?php $total = 0; ?>
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
																$total += $s->servico->valor * $s->quantidade;
																?>

																<td class="datatable-cell"><span class="codigo" style="width: 200px;">{{number_format(($total), 2, ',', '.')}}</span></td>

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
								@endforeach
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





<!-- Lista de produtos -->
<form action="{{ route('select.product') }}" method="POST">
    @csrf
    <select name="produto_id">
        @foreach ($produtos as $produto)
            <option value="{{ $produto->id }}">{{ $produto->nome }}</option>
        @endforeach
    </select>
    <button type="submit">Adicionar</button>
</form>

<!-- Seção para exibir os produtos selecionados -->
@if(session('selected_products') && is_array(session('selected_products')))
    <h2>Produtos Selecionados:</h2>
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>Valor</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            @foreach(session('selected_products') as $produtoId)
                @php
                    $produto = App\Models\Produto::find($produtoId);
                @endphp
                @if($produto)
                    <tr>
                        <td>{{ $produto->nome }}</td>
                        <td>{{ $produto->valor_venda }}</td>
                        <td>
                            <form action="{{ route('remove.product') }}" method="POST">
                                @csrf
                                <input type="hidden" name="produto_id" value="{{ $produtoId }}">
                                <button type="submit">Remover</button>
                            </form>
                        </td>
                    </tr>
                @endif
            @endforeach
        </tbody>
    </table>
    <form action="{{ route('save.products') }}" method="POST">
        @csrf
        <input type="hidden" name="produtos_selecionados" value="{{ json_encode(session('selected_products')) }}">
        <button type="submit">Salvar</button>
    </form>
@endif




<!-- Exibição dos produtos salvos no banco de dados -->
@if(isset($produtosSalvos) && $produtosSalvos->isNotEmpty())
    <h2>Produtos Salvos:</h2>
    <ul>
        @foreach($produtosSalvos as $produto)
            <li>{{ $produto->nome }} - Valor: {{ $produto->valor }}</li>
        @endforeach
    </ul>
@endif




























@endsection