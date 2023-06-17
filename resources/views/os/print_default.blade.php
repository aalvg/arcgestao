<html>
	<head>
		
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
		<link rel="stylesheet" href="/css/style_pdf.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<link href="https://fonts.googleapis.com/css?family=Pinyon+Script" rel="stylesheet">
	</head>
	<body onload="gerarArquivo()">

		<div class="row" id="pdf">
			<p class="arc">ARC - Sistema de Gestão ERP - ORDEM DE SERVIÇO #{{$ordem->id}}</p>
			<div class="row topo">
				<div class="col s5 logo left-align">
					<img class="logo" src="/imgs/logo.png"> 
				</div>

				<div class="col s7 center-align">
					<h5 class="OS">ORDEM DE SERVIÇO #{{$ordem->id}} </h5>
					<label>
						<strong>{{$config->nome_fantasia}} - CNPJ {{$config->cnpj}}</strong>
					</label><br>
					<span>{{$config->logradouro}}, {{$config->numero}} - {{$config->bairro}}</span><br>
					<span>Fone: {{$config->fone}} - CEP {{$config->cep}} - {{$config->municipio}} - {{$config->UF}}</span>
				</div>
			</div>
			<div class="col s12 right-align">
				<span class="responsavel">Técnico Resposável: {{$ordem->usuario->nome}}</span>
			</div>
			<div class="row identificacao-paciente">
				<div class="col s7">
					<label>Data de criação: <strong id="data-exame">{{\Carbon\Carbon::parse($ordem->created_at)->format('d/m/Y')}}</strong></label><br>
					<label>Cliente: <strong>{{$ordem->cliente->razao_social}}</strong></label><br>
					<label>Endreço: <strong>{{$ordem->cliente->rua}}, {{$ordem->cliente->numero}} - {{$ordem->cliente->bairro}}
					</strong></label><br>
					<label>Email: <strong>{{$ordem->cliente->email}}</strong></label><br>
					


				</div>
				<div class="col s3">
					<label></label><br>
					<label>Cidade: <strong>{{$ordem->cliente->cidade->nome}} - {{$ordem->cliente->cidade->uf}}</strong></label><br>
					<label>Celular: <strong>{{$ordem->cliente->celular}}</strong></label><br>
					<label>A senha da OS é: <Strong>{{$ordem->senha}}</Strong></label>
					<label></label>

				</div>
				
			</div>


			@yield('content')

			<div class="row rodape">
				<div class="col s6 center-align">
					
					<br>
					<div class="traco-assinatura"></div>
					<span class="responsavel"><strong>Assinatura responsável</strong></span><br>

				</div>

				<div class="col s6 center-align">
						
					<br>
					<div class="traco-assinatura"></div>
					<span><strong>Assinatura Cliente</strong></span>
					<br>


				</div>
			</div>

			<div class="row rodape-info center-align">
				<div class="col s12">
					<h6>___________________,____de_______________de________</h6>
					<span></span>
				</div>
				
			</div>

			
		</div>



		<!-- <button onclick="gerarArquivo()" class="btn">Gerar Pdf</button> -->

		<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="/js/html2canvas.min.js"></script>

		<script type="text/javascript" src="/js/jspdf.min.js"></script>
		<script type="text/javascript" src="/js/gerarPdf.js"></script>
	</body>
</html>