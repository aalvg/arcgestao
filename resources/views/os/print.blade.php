@extends('os.print_default')
@section('content')

<div class="row corpo-exame">
	<div class="col s12">
		<table class="table table-striped" >
			<thead>
				<tr>
					<th scope="col" class="lab" style="width: 100%;">Serviços:</th>
					<th scope="col" class="lab" style="width: 100%;" >Total</th>
				</tr>
			</thead>
				<tbody>
					@php $total = 0; @endphp
					@foreach($ordem->servicos as $s)
					<tr>
					  <td class="form-control form-control-lg" >{{$s->quantidade}}. {{$s->servico->nome}}</td>
					  <td class="form-control form-control-lg" >R$ {{number_format($s->servico->valor * $s->quantidade, 2)}}</td>
					</tr>
				</tbody>
				@endforeach
		</table>
	</div>
	
	<div class="col s12">
		@php $total = 0; @endphp
		@foreach($ordem->servicos as $s)
		<div class="col s12 right-align">
				@php $total += $s->servico->valor * $s->quantidade; @endphp
		</div>
		@endforeach

		@if($ordem->desconto > 0)
		<div class="col s12 left-align">
			<h6>Desconto: {{number_format($ordem->desconto, 2, ',', '.')}}</h6>
		</div>
		@endif
		<div class="col s12 right-align">

			<span class="lab">Valor Total da OS: {{number_format($total - $ordem->desconto, 2, ',', '.')}}</span>
		</div>

							<!-- 1 - FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
							<div class="row" style="width: 100%;">
								@foreach($ordem->relatorios as $r)
								@endforeach
								<div class="col-md-6" >
									<p><label class="lab" for="text1">Observações:</label></p>
									<span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->texto}}</span>
								</div>
								<div class="col-md-6">
									<p><label class="lab" for="text2">Equipamento:</label></p>
									<span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->equipamento}}</span>
								</div>
							
								<div class="col-md-6" >
									<p><label class="lab" for="text1">Problema:</label></p>
									<span type="text" name="text2" id="text2" class="form-control form-control-lg">{{$r->problema}}</span>
								</div>
								<div class="col-md-6">
									<p><label class="lab" for="text2">Observações de recebimento:</label></p>
									<span type="text" name="text2" id="text2" class="form-control form-control-lg">{{$r->recebimento}}</span>
								</div>
								<div class="col-md-6" >
									<p><label class="lab" for="text3">Laudo Técnico:</label></p>
									<span type="text" name="text3" id="text2" class="form-control form-control-lg">{{$r->laudo}}</span>
								</div>
							</div>
							<!-- 1 - FIM DOS FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
	</div>
</div>
@endsection
