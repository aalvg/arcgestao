@extends('layouts.app')

@section('content')
  
    
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
    <div>
        
        <strong>Imagens</strong>{{ $imagensSalvas}}
    </div>
    @if(isset($produtosSalvos) && $produtosSalvos->isNotEmpty())
        @foreach($produtosSalvos as $produto)
         <hr>
    
        <div>
             
            <strong>Produtos da OS:</strong> {{$produto->unidades}}. {{$produto->nome}} R$ {{number_format($produto->valor * $produto->unidades, 2, ',', '.')}}
        </div>

    <!-- Adicione mais campos aqui, conforme necessário -->
    
            <hr>
        @endforeach
        @foreach($ordem->servicos as $s)
            <strong>Serviços da OS</strong>{{$s->quantidade}}. {{$s->servico->nome}} R$ {{number_format($s->quantidade * $s->servico->valor, 2, ',', '.')}}
        @endforeach
    @endif


    <div class="row" style="width: 100%;">
        @foreach($ordem->relatorios as $r)
        @endforeach

        @if(!empty($r->texto))
            <div class="col-md-6" style="border-bottom: 1px solid black;">
            
                <p><label class="lab" for="text1">Equipamento:</label></p>
                <span type="text" style="height: 200px" name="text2" id="text2" class="form-control form-control-lg">{{$r->texto}}</span>
        @endif
            </div>

        @if(!empty($r->problema))
            <div class="col-md-6" style="border-bottom: 1px solid black;">
                <p><label class="lab" for="text1">Problema:</label></p>
                <span type="text" name="text2" id="text2" class="form-control form-control-lg">{{$r->problema}}</span>
        @endif
            </div>
        @if(!empty($r->recebimento))
            <div class="col-md-6" style="border-bottom: 1px solid black;">
                <p><label class="lab" for="text2">Observações de recebimento:</label></p>
                <span type="text" name="text2" id="text2" class="form-control form-control-lg">{{$r->recebimento}}</span>
        @endif
            </div>

        @if(!empty($r->laudo))
            <div class="col-md-6" style="border-bottom: 1px solid black;">
                <p><label class="lab" for="text3">Laudo Técnico:</label></p>
                <span type="text" name="text3" id="text2" class="form-control form-control-lg">{{$r->laudo}}</span>
        @endif
            </div>
    
        @if(!empty($r->rma))
            <div class="col-md-6" style="border-bottom: 1px solid black;">
                <p><label class="lab" for="text3">RMA:</label></p>
                <span type="text" name="text3" id="text2" class="form-control form-control-lg">{{$r->rma}}</span>
        @endif
            </div>
    </div>

@endsection
