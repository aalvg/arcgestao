@extends('layouts.app')

@section('content')

<html>
        <!-- ############################################################################################
        Esse código pertence a tela de vizualização da ordem de serviço para que o cliente possa 
        acessar sua OS e verificar o andamento da manutenção de sua máquina.
        ########################################################################################-->
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/html2canvas.min.js"></script>
    <script type="text/javascript" src="/js/gerarPdf.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <link rel="stylesheet" href="/css/visualizar_os.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/css?family=Pinyon+Script" rel="stylesheet">
</head>
<body onload="gerarArquivo()" class="corpo">

    <div class="row" id="pdf">
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

    <div class="row corpo-exame">
        <div class="col-sm-12 col-lg-12 col-md-12 col-xl-12">
            <h6>STATUS DA ORDEM DE SERVIÇO: 
                @if($ordem->estado == 'pd')
                <span class="label label-xl label-inline label-light-warning" style="color: #ff7e00; font-size: 14px">PENDENTE</span>
                @elseif($ordem->estado == 'ap')
                <span class="label label-xl label-inline label-light-success" style="color: #0000ff; font-size: 14px">APROVADO</span>
                @elseif($ordem->estado == 'rp')
                <span class="label label-xl label-inline label-light-danger" style="color: #ff0000; font-size: 14px">REPROVADO</span>
                @else
                <span class="label label-xl label-inline label-light-info" style="color: #008e46; font-size: 14px">FINALIZADO</span>
                @endif
    
            </h4>
        </div>
        <!-- ######################### PRODUTOS ############################-->
        @if(isset($produtosSalvos) && $produtosSalvos->isNotEmpty())
    <div class="col s12" style="border-bottom: 1px solid #000; padding-bottom: 10px;">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col" class="lab" style="width: 70%;">Produtos:</th>
                    <th scope="col" class="lab" style="width: 30%; text-align: right;">Total</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $produto_total = isset($produto_total) ? $produto_total : 0;
                @endphp
                @foreach($produtosSalvos as $produto)
                    @if($produto->ordem_servico_id != $ordem->id)
                        @continue
                    @endif
                    <input type="hidden" name="ordem_servico_id" value="{{$ordem->id}}">
                    <tr>
                        <td class="form-control form-control-lg" style="border: none; background: #fff;">{{$produto->unidades}}. {{$produto->nome}}</td>
                        <td style="background: #fff;"></td> <!-- SERVE PARA JOGAR O SEGUNDO TD PARA O CANTO DIREITO -->
                        <td class="form-control form-control-lg" style="border: none; background: #fff; text-align: right;">R$ {{number_format($produto->valor * $produto->unidades, 2, ',', '.')}}</td>
                    </tr>
                    @php
                        $subtotal = $produto->valor * $produto->unidades;
                        $valorTotal = $produto->valor * $produto->unidades;
                        $produto_total += $valorTotal;
                    @endphp
                @endforeach
            </tbody>
        </table>
    </div>
@else
    <div class="col s12" style="border-bottom: 1px solid #000; padding-bottom: 10px;">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col" class="lab" style="width: 70%;">Produtos:</th>
                    <th scope="col" class="lab" style="width: 30%; text-align: right;">Total</th>
                </tr>
            </thead>
            <tbody>
                <tr class="datatable-row">
                    <td colspan="2">Nenhum produto salvo</td>
                </tr>
            </tbody>
        </table>
    </div>
@endif

    </div>

<!-- ######################### FIM PRODUTOS ############################-->

<!-- ######################### VALORES PRODUTOS ############################-->
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

    <!-- ######################### SERVIÇOS ############################-->
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
                    <td class="form-control form-control-lg" style="border: none; background: #fff;">{{$s->quantidade}}. {{$s->servico->nome}}</td>
                    <td style="background: #fff;"></td> <!-- SERVE PARA JOGAR O SEGUNDO TD PARA O CANTO DIREITO -->
                    <td class="form-control form-control-lg" style="border: none; background: #fff;">R$ {{number_format($s->quantidade * $s->servico->valor, 2, ',', '.')}}</td>
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

            <div class="row">
                <div class="col s12 right-align">
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
                        <span class="lab">Valor Total produtos: {{ number_format($produtoTotal, 2, ',', '.') }}</span>
                    </div>
    
                    <div class="div3 right-align">
                        <span class="lab" style="font-size: 13px !important; color: red !important;">Valor Total da OS: {{ number_format($produtoTotal + $total, 2, ',', '.') }}</span>
                    </div>
                </div>
            </div>
    </div>
                    <!-- FIM DO CALCULO DOS PREÇOS DE SERVIÇOS E PRODUTOS -->
    
                    <!-- 1 - FORMULARIOS COM DADOS DOS EQUIPAMENTOS -->
                    <div class="col s12">
                        @foreach($ordem->relatorios as $r)
                        @endforeach
                    
                        @if(!empty($r->texto))
                        <div class="row">
                            <div class="col-md-6" style="border-bottom: 1px solid black;">
                                <p><label class="lab" for="text1">Equipamento:</label></p>
                                <span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg span-equal-height">{{$r->texto}}</span>
                            </div>
                    
                            @if(!empty($r->problema))
                            <div class="col-md-6" style="border-bottom: 1px solid black;">
                                <p><label class="lab" for="text1">Problema:</label></p>
                                <span type="text" name="text2" id="text2" class="form-control form-control-lg span-equal-height">{{$r->problema}}</span>
                            </div>
                            @endif
                        </div>
                        @endif
                    
                        @if(!empty($r->recebimento))
                        <div class="row">
                            <div class="col-md-6" style="border-bottom: 1px solid black;">
                                <p><label class="lab" for="text2">Observações de recebimento:</label></p>
                                <span type="text" name="text2" id="text2" class="form-control form-control-lg span-equal-height">{{$r->recebimento}}</span>
                            </div>
                    
                            @if(!empty($r->laudo))
                            <div class="col-md-6" style="border-bottom: 1px solid black;">
                                <p><label class="lab" for="text3">Laudo Técnico:</label></p>
                                <span type="text" name="text3" id="text2" class="form-control form-control-lg span-equal-height">{{$r->laudo}}</span>
                            </div>
                            @endif
                        </div>
                        @endif
                    
                        @if(!empty($r->rma))
                        <div class="row">
                            <div class="col-md-6" style="border-bottom: 1px solid black;">
                                <p><label class="lab" for="text3">RMA:</label></p>
                                <span type="text" name="text3" id="text2" class="form-control form-control-lg span-equal-height">{{$r->rma}}</span>
                            </div>
                        </div>
                        @endif
                    
                        <style>
                            .image-container {
                                display: flex;
                                flex-wrap: wrap;
                            }
                    
                            .image-item {
                                margin-right: 10px;
                                margin-bottom: 30px; /* Espaço embaixo das imagens */
                            }
                        </style>
                    
                        @if ($imagensSalvas->count() > 0)
                        <p><label class="lab" for="text2">Imagens da OS:</label></p>
                        <div class="col-md-6 image-container">
                            @foreach ($imagensSalvas as $imagem)
                                @if ($imagem->ordem_servico_id != $ordem->id)
                                @continue
                                @endif
                                <input type="hidden" name="ordem_servico_id" value="{{ $ordem->id }}">
                                <div class="image-item">
                                    <img src="{{ asset('storage/imagens_os/' . $imagem->nome) }}" alt="Imagem">
                    
                                    <p>{{ $imagem->obs }}</p>
                                    </div>
                            @endforeach
                        </div>
                    @endif




			@yield('content')

	</div>
	</body>
</html>

@endsection