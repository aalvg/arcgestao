@extends('default.layout')
@section('content')


<div class="content d-flex flex-column flex-column-fluid" id="kt_content">

	<div class="container">
		<div class="card card-custom gutter-b example example-compact">
			<div class="col-lg-12">
				<!--begin::Portlet-->

				<form method="post" action="{{{ isset($relatorio) ? '/ordemServico/updateRelatorio': '/ordemServico/addRelatorio' }}}">
					<input type="hidden" name="ordemId" value="{{$ordem->id}}">
					<input type="hidden" name="id" value="{{isset($relatorio) ? $relatorio->id : 0}}">
					<div class="card card-custom gutter-b example example-compact">
						<div class="card-header">

							<h3 class="card-title">{{{ isset($relatorio) ? "Editar": "Cadastrar" }}} Relatório</h3>
						</div>

					</div>
					@csrf

					<div class="row">
						<div class="col-xl-2"></div>
						<div class="col-xl-8">
							<div class="kt-section kt-section--first">
								<div class="kt-section__body">

									<div class="row">
										<div class="col-sm-12 col-lg-12">

											@if(!isset($relatorio))
											<h6 class="text-success">*Adicione um texto para este relatório {{$ordem->id}}</h6>
											@else
											<h6 class="text-danger">*Edite o texto para este relatório {{$ordem->id}}</h6>
											@endif

										</div>
									</div>
									<div class="row">
										<div class="form-group validated col-sm-12 col-lg-12">
											<label class="col-form-label">Equipamento</label>
											<div class="">
												<textarea class="form-control" name="texto" rows="3">{{{ isset($relatorio) ? $relatorio->texto : old('texto') }}}</textarea>
												@if($errors->has('texto'))
												<div class="invalid-feedback">
													{{ $errors->first('texto') }}
												</div>
												@endif
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group validated col-sm-12 col-lg-12">
											<label class="col-form-label">Problema</label>
											<div class="">
												<textarea class="form-control" name="problema" rows="3">{{{ isset($relatorio) ? $relatorio->Problema : old('problema') }}}</textarea>
												@if($errors->has('problema'))
												<div class="invalid-feedback">
													{{ $errors->first('problema') }}
												</div>
												@endif
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group validated col-sm-12 col-lg-12">
											<label class="col-form-label">Observações de recebimento</label>
											<div class="">
												<textarea class="form-control" name="recebimento" rows="1">{{{ isset($relatorio) ? $relatorio->recebimento : old('recebimento') }}}</textarea>
												@if($errors->has('recebimento'))
												<div class="invalid-feedback">
													{{ $errors->first('recebimento') }}
												</div>
												@endif
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group validated col-sm-12 col-lg-12">
											<label class="col-form-label">Laudo Técnico</label>
											<div class="">
												<textarea class="form-control" name="laudo" rows="3">{{{ isset($relatorio) ? $relatorio->laudo : old('laudo') }}}</textarea>
												@if($errors->has('laudo'))
												<div class="invalid-feedback">
													{{ $errors->first('laudo') }}
												</div>
												@endif
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group validated col-sm-12 col-lg-12">
											<label class="col-form-label">RMA</label>
											<div class="">
												<textarea class="form-control" name="rma" rows="3">{{{ isset($relatorio) ? $relatorio->rma : old('rma') }}}</textarea>
												@if($errors->has('rma'))
												<div class="invalid-feedback">
													{{ $errors->first('rma') }}
												</div>
												@endif
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer">

						<div class="row">
							<div class="col-xl-2">

							</div>
							<div class="col-lg-3 col-sm-6 col-md-4">
								<a style="width: 100%" class="btn btn-danger" href="/ordemServico/servicosordem/{{$ordem->id}}">
									<i class="la la-close"></i>
									<span class="">Cancelar</span>
								</a>
							</div>
							<div class="col-lg-3 col-sm-6 col-md-4">
								<button style="width: 100%" id="salvar-cotacao" type="submit" class="btn btn-success">
									<i class="la la-check"></i>
									<span class="">Salvar</span>
								</button>
							</div>

						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>
@endsection