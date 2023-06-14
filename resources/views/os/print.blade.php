@extends('os.print_default')
@section('content')

<div class="row corpo-exame">
	<!-- #########################          PRODUTOS         ############################-->
	@if(isset($produtosSalvos) && $produtosSalvos->isNotEmpty())
    <div class="col s12" style="border-bottom: 1px solid #000; padding-bottom: 10px;">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col" class="lab" style="width: 100%;">Produtos:</th>
                    <th scope="col" class="lab" style="width: 100%;">Total</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $produto_total = isset($produto_total) ? $produto_total : 0;
                @endphp
                @foreach($produtosSalvos as $produto)
                    @php
                        $subtotal = $produto->valor * $produto->unidades;
                        $valorTotal = $produto->valor * $produto->unidades;
                        $produto_total += $valorTotal;
                    @endphp
                    <tr>
                        <td class="form-control form-control-lg">{{$produto->unidades}}. {{$produto->nome}}</td>
                        <td class="form-control form-control-lg">R$ {{number_format($produto->valor * $produto->unidades, 2, ',', '.')}}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endif
<!-- #########################          FIM PRODUTOS          ############################-->
<!-- #########################          VALORES PRODUTOS          ############################-->
	<div class="col s12">
		@php
		$produtoTotal = 0;
		@endphp
		
		@foreach($produtosSalvos as $produto)
			<div class="col s12 right-align">
				@php
				$produtoTotal += $produto->valor * $produto->unidades;
				@endphp
			</div>
		@endforeach

<!-- #########################          SERVIÇOS          ############################-->
		<div class="col s12" style="border-bottom: 1px solid #000; padding-bottom: 10px;">
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
						<td class="form-control form-control-lg" >R$ {{number_format($s->quantidade * $s->servico->valor, 2, ',', '.')}}</td>
					</tr>
				</tbody>
					@endforeach
			</table>
		</div>
		
		<div class="col s12">
			<!-- 1 - FAZ TODO O CALCULO DOS PREÇOS DE SERVIÇOS E PRODUTOS -->
			@php
			$total = 0;
			$produtoTotal = 0;
			@endphp
			
			@foreach($ordem->servicos as $s)
				<div class="col s12 right-align">
					@php
					$total += $s->servico->valor * $s->quantidade;
					@endphp
				</div>
			@endforeach
			
			@foreach($produtosSalvos as $produto)
				<div class="col s12 right-align">
					@php
					$produtoTotal += $produto->valor * $produto->unidades;
					@endphp
				</div>
			@endforeach
			<style>
				.div1, .div2, .div3 {
					display: block;
					width: 100%;
					margin-bottom: 20px;
					/* Outros estilos */
				}
			</style>
			<div class="div1 right-align" style="padding-top: 20px">
				<span class="lab">Valor Total serviços: {{ number_format($total, 2, ',', '.') }}</span>
			</div>
			<div class="div2 right-align" style="margin-bottom: 30px !important">
				<span class="lab" >Valor Total produtos: {{ number_format($produtoTotal, 2, ',', '.') }}</span>
			</div>

			<div class="div3 right-align">
				<span class="lab"  style="font-size: 13px !important; color: red !important;">Valor Total da OS: {{ number_format($produtoTotal + $total, 2, ',', '.') }}</span>
			</div>
			<!-- FIM DO CALCULO DOS PREÇOS DE SERVIÇOS E PRODUTOS -->
			

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
								<div class="col-md-6" >
									<p><label class="lab" for="text3">RMA:</label></p>
									<span type="text" name="text3" id="text2" class="form-control form-control-lg">{{$r->rma}}</span>
								</div>
							</div>
							<!-- 1 - FIM DOS FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
	</div>
</div>
@endsection
