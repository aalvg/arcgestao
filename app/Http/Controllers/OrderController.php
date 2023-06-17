<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\OrdemServico;
use App\Models\ServicoOs;
use App\Models\EstadoOs;
use App\Models\FuncionarioOs;
use App\Models\Funcionario;
use App\Models\RelatorioOs;
use App\Models\Servico;
use App\Models\Cliente;
use App\Models\ConfigNota;
use App\Models\Produto;
use App\Models\Mensagem;
use App\Models\ProdutoServ;
use App\Models\ImagemOs;
use Intervention\Image\Facades\Image;


use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

use App\Helpers\StockMove;
use \Carbon\Carbon;


class OrderController extends Controller
{	
	public function __construct(){
        $this->middleware(function ($request, $next) {
            $value = session('user_logged');
            if(!$value){
                return redirect("/login");
            }
            return $next($request);
        });
    }

    public function index(){
        $orders = OrdemServico::
        orderBy('id', 'desc')
        ->paginate(20);
        return view('os/list')
        ->with('orders', $orders)
        ->with('print', true)
        ->with('links', true)
        ->with('title', 'Orders de Serviço');
    }

    public function new(){
        $clientes = Cliente::orderBy('razao_social')->get();
                // Gerar uma senha numérica aleatória de 6 dígitos

                // Atribuir a senha à ordem de serviço
        return view('os/register')
        ->with('client', true)
        ->with('clientes', $clientes)
        ->with('estados', EstadoOs::values())
        ->with('title', 'Nova Ordem de Serviço');
    }

    public function delete($id){
        $ordem = OrdemServico::find($id);
        if($ordem->delete()){
            session()->flash("mensagem_sucesso", "Ordem de serviço removida!");
        }else{
            session()->flash("mensagem_erro", "Erro ao remover!");
        }


        return redirect("/ordemServico");

    }

    public function save(Request $request){
       

        $order = new OrdemServico;
        $request->merge([ 'valor' =>str_replace(",", ".", $request->input('valor'))]);
        $senha = $request->input('senha');
        $cliente = $request->input('cliente');
        $cliente = explode("-", $cliente);
        $cliente = $cliente[0];

        $senha = mt_rand(100000, 999999); // Gera uma senha numérica aleatória de 6 dígitos
        $request->session()->put('senha', $senha);
        $result = $order->create([
            
            'equipamento' => $request->input('equipamento'),
            'problema' => $request->input('problema'),
            'recebimento' => $request->input('recebimento'),
            'laudo' => $request->input('laudo'),
            'rma' => $request->input('rma'),
            'usuario_id' => get_id_user(),
            'cliente_id' => $cliente,
            'senha' => $senha,
            
        ]);


        if($result){
            session()->flash("mensagem_sucesso", "OS gerada!");
        }else{
            session()->flash('mensagem_erro', 'Erro ao gerar OS!');
        }

        
        session(['senha' => $senha]);

        return redirect("/ordemServico/servicosordem/$result->id");
    }


    public function servicosordem($ordemId){
        $ordem = OrdemServico::
        where('id', $ordemId)
        ->first();

        $servicos = Servico::all();
        $produtosSalvos = ProdutoServ::all();
        $imagens = ImagemOs::where('ordem_servico_id', $ordem)->get();
        $imagensSalvas = ImagemOs::all();
        $funcionarios = Funcionario::all();
        $produtos = Produto::all();
        $temServicos = count(Servico::all()) > 0;
        $senha = session('senha');

        $temFuncionarios = count(Funcionario::all()) > 0;
        
         // echo json_encode($ordem->servicos);
        return view('os/servicos')
        ->with('produtos', $produtos)
        ->with('ordem', $ordem)
        ->with('produtosSalvos', $produtosSalvos)
        ->with('senha', $senha)
        ->with('relatorioJs', true)
        ->with('funcionario', true)
        ->with('servicos', $servicos)
        ->with('imagens', $imagens)
        ->with('imagensSalvas', $imagensSalvas)
        ->with('funcionarios', $funcionarios)
        ->with('temServicos', $temServicos)
        ->with('temFuncionarios', $temFuncionarios)
        ->with('title', 'Novo serviço para OS')
        ->with('servicoJs', true);
    }

    public function salvar(Request $request)
    {
        $this->validate($request, [
            'conteudo' => 'required',
        ]);

        $mensagem = Mensagem::create([
            'conteudo' => $request->input('conteudo'),
        ]);

        if ($mensagem) {
            session()->flash("mensagem_sucesso", "Mensagem foi salva!");
        } else {
            session()->flash("mensagem_erro", "Erro ao salvar mensagem!");
        }

        return redirect()->back();
    }

    




    //#############################################################################################
    //#############################################################################################
    //########################CÓDIGOS DOS PRODUTOS NA ORDEM DE SERVIÇO#############################
    //#############################################################################################
    //#############################################################################################

    public function showForm()
    {
        $produtos = Produto::all();
    
        return view('form', compact('produtos'));
    }

    public function getProdutoData()
    {
        $produtos = Produto::all();
    
        // Faça algo com os dados dos produtos
        // Exemplo: retornar os produtos
        return $produtos;
    }
    
    public function salvarProduto(Request $request)
    {
        $this->validate($request, [
            'ordem_servico_id' => 'required|exists:ordem_servicos,id',
        ]);
    
        $selectedProductIds = $request->input('produtos_selecionados');
        $unidades = $request->input('unidades');
    
        // Verifique se há produtos selecionados
        if (empty($selectedProductIds)) {
            return redirect()->back()->with('error', 'Nenhum produto selecionado.');
        }
    
        // Salve os produtos selecionados na tabela produto_servs
        foreach ($selectedProductIds as $index => $productId) {
            $produtoServ = new ProdutoServ();
            $produtoServ->ordem_servico_id = $request->input('ordem_servico_id');
            $produtoServ->produto_id = $productId;
            $produtoServ->unidades = $unidades[$index];
    
            $produto = Produto::find($productId);
            $produtoServ->nome = $produto->nome;
            $produtoServ->valor = $produto->valor_venda;
            $result = $produtoServ->save();
        }
    
        if ($result) {
            // O produto foi salvo com sucesso
            session()->flash('mensagem_sucesso', 'Produto adicionado!');
        } else {
            // Ocorreu um erro ao salvar o produto
            session()->flash('mensagem_erro', 'Erro ao adicionar o produto!');
        }
    
        // Limpe a lista de produtos selecionados na sessão
        session()->forget('selected_products');
    
        return redirect()->back()->with('success', 'Produto adicionado com sucesso!');

    }
    
    
// app/Http/Controllers/ProdutoController.php
public function obterEstoque($produtoId)
{
    $produto = Produto::find($produtoId);
    if ($produto) {
        $estoque = $produto->estoque->quantidade;
        
        // ... lógica de atualização do estoque ...
        
        // Retorna o estoque atualizado
        return response()->json(['estoque' => $estoque]);
    } else {
        return response()->json(['error' => 'Produto não encontrado'], 404);
    }
}

public function showServicos($ordemServicoId)
{
    // Restante do seu código...

    return $this->getProdutosSalvos($ordemServicoId);
}

public function getProdutosSalvos($ordemServicoId)
{
    $produtosSalvos = ProdutoServ::where('ordem_servico_id', $ordemServicoId)->get();
    $produto_total = 0;

    if ($produtosSalvos->isEmpty()) {
        // Caso a lista de produtos esteja vazia
        $produto_total = 0;
    } else {
        // Código para calcular o valor total dos produtos
        foreach ($produtosSalvos as $produto) {
            $subtotal = $produto->valor * $produto->unidades;
            $produto_total += $subtotal;
        }
    }
    session()->put('produto_total', $produto_total);
    session()->put('servico_total', 0); // Defina o valor inicial para o serviço como 0 ou calcule-o aqui se necessário

    return view('os.servicos', compact('produtosSalvos', 'produto_total', 'ordemServicoId'));

}



    public function removeProduct(Request $request)
    {
        $produtoId = $request->produto_id;
    
        // Encontre o produto a ser removido
        $produtoServ = ProdutoServ::find($produtoId);
    
        if (!$produtoServ) {
            return redirect()->back()->with('error', 'Produto não encontrado.');
        }
    
        // Remova o produto do banco de dados
        $produtoServ->delete();
    
        return redirect()->back()->with('success', 'Produto removido com sucesso!');
    }
    
    //#############################################################################################
    //########################CÓDIGOS DOS PRODUTOS NA ORDEM DE SERVIÇO#############################
    //#############################################################################################


    public function addServico(Request $request)
    {
        // Valide os dados recebidos do formulário
        $this->validate($request, [
            'quantidade' => 'required|numeric',
            'ordem_servico_id' => 'required|exists:ordem_servicos,id',
            'servico' => 'required|exists:servicos,id',
        ]);
    
        // Crie uma nova instância de ServicoOs e atribua os valores dos campos
        $servicoOs = new ServicoOs();
        $servicoOs->quantidade = $request->input('quantidade');
        $servicoOs->ordem_servico_id = $request->input('ordem_servico_id');
        $servicoOs->servico_id = $request->input('servico');
    
        // Salve o novo registro no banco de dados
        $result = $servicoOs->save();
    
        if ($result) {
            // O serviço foi salvo com sucesso
            session()->flash('mensagem_sucesso', 'Serviço adicionado!');
        } else {
            // Ocorreu um erro ao salvar o serviço
            session()->flash('mensagem_erro', 'Erro ao adicionar o serviço!');
        }
    
        // Redirecione de volta para a página de detalhes da ordem de serviço
        return redirect("/ordemServico/servicosordem/{$request->ordem_servico_id}");
    }
    
    

    public function deleteServico($id){
        $obj = ServicoOs
        ::where('id', $id)
        ->first();
        $id = $obj->ordemServico->id;

        $ordem = OrdemServico::
        where('id', $id)
        ->first();

        $servico = Servico::
        where('id', $obj->servico->id)
        ->first();

        $ordem->valor -= $obj->quantidade * $servico->valor;
        $ordem->save();

        $delete = $obj->delete();
        if($delete){
            session()->flash('mensagem_sucesso', 'Serviço removido!');
        }else{
            session()->flash('mensagem_erro', 'Erro!');
        }

        return redirect("/ordemServico/servicosordem/$id");
    }

    public function addRelatorio($id){
        $ordem = OrdemServico::
        where('id', $id)
        ->first();

        return view('os/addRelatorio')
        ->with('ordem', $ordem)
        ->with('title', 'Novo Relatório');
    }

    public function editRelatorio($id){
        $relatorio = RelatorioOs::
        where('id', $id)
        ->first();

        $ordem = $relatorio->ordemServico;
        return view('os/addRelatorio')
        ->with('ordem', $ordem)
        ->with('relatorio', $relatorio)
        ->with('title', 'Editar Relatório');
    }

    public function alterarEstado($id){
        $ordem = OrdemServico::
        where('id', $id)
        ->first();

        return view('os/alterarEstado')
        ->with('ordem', $ordem)
        ->with('title', 'Alterar Estado de OS');
    }

    public function alterarEstadoPost(Request $request){
        $ordem = OrdemServico::
        where('id', $request->id)
        ->first();

        $ordem->estado = $request->novo_estado;
        $result = $ordem->save();

        if($result){
            session()->flash('mensagem_sucesso', 'Estado Alterado!');
        }else{
            session()->flash('mensagem_erro', 'Erro!');
        }

        return redirect("/ordemServico/servicosordem/$request->id");
    }

    public function filtro(Request $request){

        $dataInicial = $request->data_inicial;
        $dataFinal = $request->data_final;
        $cliente = $request->cliente;
        $estado = $request->estado;
        $orders = null;

        if(isset($cliente) && isset($dataInicial) && isset($dataFinal)){
            $orders = OrdemServico::filtroDataFornecedor(
            $cliente, 
            $this->parseDate($dataInicial),
            $this->parseDate($dataFinal, true),
            $estado,
            );
        }else if(isset($cliente) && isset($dataFinal)){
            $orders = OrdemServico::filtroData(
                $this->parseDate($dataInicial),
                $this->parseDate($dataFinal, true),
                $estado
            );
        }else if(isset($cliente)){
            $orders = OrdemServico::filtroCliente(
                $cliente,
                $estado
            );
        }else{
            $orders = OrdemServico::orderBy('id', 'desc')->get();
        }

        return view('os/list')
        ->with('orders', $orders)
        ->with('servicoOs')
        ->with('title', 'Orders de Serviço');
    }

    public function saveRelatorio(Request $request){
        

        $relatorioOs = new RelatorioOs();

        $result = $relatorioOs->create([
            'usuario_id' => get_id_user(),
            'ordem_servico_id' => $request->input('ordemId'),
            'texto' => $request->texto,
            'equipamento' => $request->equipamento,
            'problema' => $request->problema,
            'recebimento' => $request->recebimento,
            'laudo' => $request->laudo,
            'rma' => $request->rma,

        ]);

        if($result){
            session()->flash("mensagem_sucesso", "Relatorio adicionado!");
        }else{
            session()->flash('mensagem_erro', 'Erro ao adicionar!');
        }

        return redirect("/ordemServico/servicosordem/$request->ordemId");
    }

    public function updateRelatorio(Request $request){
        

        $id = $request->input('id');
        $resp = RelatorioOs::
        where('id', $id)
        ->first(); 

        $resp->texto = $request->input('texto');
        $resp->equipamento = $request->input('equipamento');
        $resp->problema = $request->input('problema');
        $resp->recebimento = $request->input('recebimento');
        $resp->laudo = $request->input('laudo');
        $resp->rma = $request->input('rma');
        $result = $resp->save();
        if($result){
            session()->flash("mensagem_sucesso", "Relatorio editado!");
        }else{
            session()->flash('mensagem_erro', 'Erro ao editar!');
        }

        return redirect("/ordemServico/servicosordem/$request->ordemId");
    }

    public function deleteRelatorio($id){
        $obj = RelatorioOs::
        where('id', $id)
        ->first();

        $id = $obj->ordemServico->id;
        $delete = $obj->delete();
        if($delete){
            session()->flash('mensagem_sucesso', 'Relatório removido!');
        }else{
            session()->flash('mensagem_erro', 'Erro!');
        }

        return redirect("/ordemServico/servicosordem/$id");
    }



    private function _validateServicoOs(Request $request){
        $rules = [
            'servico' => 'required',
            'quantidade' => 'required',
        ];

        $messages = [
            'servico.required' => 'O campo serviço é obrigatório.',
            'quantidade.required' => 'O campo quantidade é obrigatório.',
        ];

        $this->validate($request, $rules, $messages);
    }

    private function _validateFuncionario(Request $request){
        $rules = [
            'funcionario' => 'required',
            'funcao' => 'required',
        ];

        $messages = [
            'funcionario.required' => 'O campo funcionario é obrigatório.',
            'funcao.required' => 'O campo função é obrigatório.'
        ];

        $this->validate($request, $rules, $messages);
    }

 

    public function cashFlow(){

        $dateStart = $this->validDate(Date('Y-m-d'));
        $dateLast = $this->validDate(Date('Y-m-d'), true);
        $orders = Order::
        whereBetween('date_register', [$dateStart, $dateLast])
        ->get();

        return view('os/flow')
        ->with('orders', $orders)
        ->with('print', true)
        ->with('title', 'Orders de Serviço');
    }

    public function find(Request $request){
        $id = $request->id;
        $order = ordemServico::find($id);
        return $order;
        $services = [];
        $products = [];

        foreach($order->budget->services as $o){
            $temp = [
                'quantity' => $o->quantity,
                'value' => $o->value,
                'name' => $o->service->description   
            ];
            array_push($services, $temp);
        }

        foreach($order->budget->products as $o){
            $temp = [
                'quantity' => $o->quantity,
                'value' => $o->value,
                'name' => $o->product->name   
            ];
            array_push($products, $temp);
        }

        $resp = [
            'id' => $order->id,
            'warranty' => $order->warranty,
            'client' => $order->budget->client->name,
            'services' => $services,
            'payment_form' => $order->payment_form,
            'products' => $products,
            'note' => $order->note,
        ];
        echo json_encode($resp);
    }

    public function cashFlowFilter(Request $request){
        $dateStart = $this->validDate($request->input('date_start'));
        $dateLast = $this->validDate($request->input('date_last'), true);
        $orders = Order::
        whereBetween('date_register', [$dateStart, $dateLast])
        ->get();

        return view('os/flow')
        ->with('orders', $orders)
        ->with('print', true)
        ->with('title', 'Orders de Serviço');
    }

    private function validDate($date, $plusDay = false){
        $date = str_replace('/', '-', $date);
        if($plusDay)
            $date = date("Y-m-d", strtotime("$date +1 day"));
        return Carbon::parse( $date . ' 00:00:00')->format('Y-m-d H:i:s');
    }

    public function print($id){
        $order = Order
        ::where('id', $id)
        ->first();

        return view('os/print')
        ->with('order', $order)
        //->with('print', true)
        ->with('title', 'Orders de Serviço');
    }

    public function imprimir($id)
    {
        $ordem = OrdemServico::find($id);
        $config = ConfigNota::first();
        $produtosSalvos = ProdutoServ::all();
        $imagensSalvas = ImagemOs::all();
    
        if ($config == null) {
            return redirect('/configNF');
        }
    
        $content = view('os.print')
            ->with('ordem', $ordem)
            ->with('config', $config)
            ->with('produtosSalvos', $produtosSalvos)
            ->with('imagensSalvas', $imagensSalvas)
            ->with('title', 'Imprimindo OS')
            ->render();
    
        return response($content)
            ->header('Content-Type', 'text/html')
            ->header('Cache-Control', 'no-store, no-cache, must-revalidate, max-age=0')
            ->header('Pragma', 'no-cache')
            ->header('X-Content-Type-Options', 'nosniff')
            ->header('X-XSS-Protection', '1; mode=block')
            ->header('Content-Disposition', 'inline; filename="imprimir_os.html"')
            ->header('X-Powered-By', 'Host Arena');
    }
    


// funcinarios

    public function saveFuncionario(Request $request){
        $this->_validateFuncionario($request);

        $funcionarioOs = new FuncionarioOs();

        $funcionario = $request->input('funcionario');
        $funcionario = explode("-", $funcionario);
        $funcionario = $funcionario[0];

        $ordem = OrdemServico::
        where('id', $request->input('ordem_servico_id'))
        ->first();

        $funcionarioObj = Funcionario::find($funcionario);

        $result = $funcionarioOs->create([
            'funcao' => $request->input('funcao'),
            'ordem_servico_id' => $request->input('ordem_servico_id'),
            'funcionario_id' => $funcionarioObj->id,
            'usuario_id' => get_id_user(),
        ]);

        if($result){
            session()->flash("mensagem_sucesso", "Funcionario adicionado!");
        }else{
            session()->flash('mensagem_erro', 'Erro ao adicionar!');
        }

        return redirect("/ordemServico/servicosordem/$request->ordem_servico_id");
    }



    public function deleteFuncionario($id){
        $obj = FuncionarioOs
        ::where('id', $id)
        ->first();

        $id = $obj->ordemServico->id;

        $ordem = OrdemServico::
        where('id', $id)
        ->first();

        $delete = $obj->delete();
        if($delete){
            session()->flash('mensagem_sucesso', 'Registro removido!');
        }else{
            session()->flash('mensagem_erro', 'Erro!');
        }

        return redirect("/ordemServico/servicosordem/$id");
    }



    public function setaDesconto(Request $request){
        $id = $request->id;
        $valor = $request->valor;
        $ordem = OrdemServico::find($id);

        $ordem->desconto = $valor;
        $ordem->save();
        session()->flash('mensagem_sucesso', 'Desconto adicionado!');
        return redirect()->back();
    }


    public function uploadImagem(Request $request, $ordemServicoId)
    {
        $request->validate([
            'imagem' => 'required|image|max:2048',
            'obs' => 'nullable|string|max:255',
        ]);
    
        // Salvar a imagem na pasta de uploads
        $imagemPath = $request->file('imagem')->storeAs('imagens_os', $request->file('imagem')->getClientOriginalName(), 'public');

    
        // Criar uma nova instância do modelo ImagemOs
        $imagem = new ImagemOs();
        $imagem->nome = $request->file('imagem')->getClientOriginalName();
        $imagem->data_registro = now();
        $imagem->ordem_servico_id = $ordemServicoId; // Definir o ID da ordem de serviço corretamente
        $imagem->obs = $request->input('obs');
        $imagem->save();
    
        return redirect()->back()->with('success', 'Imagem enviada com sucesso.');
    }
    
    public function getImagensSalvas($ordemServicoId)
    {
        $imagensSalvas = ImagemOs::where('ordem_servico_id', $ordemServicoId)->get();
        
        return view('os.servicos', compact('imagensSalvas', 'ordemServicoId'));
    }

    public function visualizarServicos($id, $senha)
    {
        $ordem = OrdemServico::where('id', $id)->where('senha', $senha)->first();
    
        if ($ordem) {
            $servico = ServicoOs::find($id);
            $imagensSalvas = ImagemOs::where('ordem_servico_id', $id)->get();
            $produtosSalvos = ProdutoServ::all();
    
            return view('os.visualizar_servicos')
                ->with('servico', $servico)
                ->with('imagensSalvas', $imagensSalvas)
                ->with('produtosSalvos', $produtosSalvos)
                ->with('ordem', $ordem)
                ->with('title', 'Imprimindo OS');
        } else {
            return redirect()->back()->with('error', 'A senha fornecida é inválida para esta ordem de serviço.');
        }
    }
    
    

    public function processarVisualizacao(Request $request)
    {
        $ordemServicoId = $request->input('ordem_servico_id');
        $senha = $request->input('senha');
    
        $ordem = OrdemServico::where('id', $ordemServicoId)->where('senha', $senha)->first();
    
        if ($ordem) {
            return redirect()->route('ordemServico.visualizarServicos', ['id' => $ordemServicoId, 'senha' => $senha]);
        } else {
            return redirect()->back()->with('error', 'A ordem de serviço ou senha fornecida é inválida.');
        }
    }

    public function acessarOs()
    {
        $ordem = OrdemServico::all();
        $ordem->save();
        
        return redirect("/ordemServico/acessar-os")
        ->with('ordem', $ordem);
    }
    
    
    
    


    

//fim funcionarios
}