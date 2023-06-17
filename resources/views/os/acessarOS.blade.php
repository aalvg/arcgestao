@extends('default.layout')
@section('content')

<div>
    @foreach ($ordem as $o)
        <form method="POST" action="{{ route('ordemServico.visualizarServicos', ['id' => $o->id, 'senha' => $o->senha]) }}">
            @csrf

            <div class="form-group">
                <label for="ordem_servico_id">ID da Ordem de Serviço:</label>
                <input type="text" name="ordem_servico_id" id="ordem_servico_id" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" name="senha" id="senha" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Acessar</button>
        </form>
    @endforeach
</div>








@endsection
