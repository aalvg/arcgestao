<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\UsuarioAcesso;

class Empresa extends Model
{
	protected $fillable = [
		'nome', 'rua', 'numero', 'bairro', 'cidade', 'telefone', 'email', 'status', 'cnpj', 
		'permissao', 'tipo_representante', 'perfil_id'
	];

	public static function getId(){
		$value = session('user_logged');
		return $value['empresa'];
	}

	public function status(){
		$usuario = $this->usuarios[0];
		$value = session('user_logged');

		if($usuario->login == getenv("USERMASTER")){
			return -1;
		}

		if($this->status == 0){
			return 0;
		} 
		else if(!$this->planoEmpresa){
			return 0;
		}else{
			return 1;
		}
	}

	public function ultimoLogin($empresaId){
		$acesso = UsuarioAcesso::
		where('status', 1)
		->where('empresa_id', $empresaId)
		->orderBy('id', 'desc')
		->first();

		return $acesso;
	}

	public function configNota(){
		return $this->hasOne('App\Models\ConfigNota', 'empresa_id', 'id');
	}

	public function certificado(){
		return $this->hasOne('App\Models\Certificado', 'empresa_id', 'id');
	}

	public function usuarioFirst(){
		return $this->hasOne('App\Models\Usuario', 'empresa_id', 'id');
	}

	public function usuarios(){
		return $this->hasMany('App\Models\Usuario', 'empresa_id', 'id');
	}

	public function clientes(){
		return $this->hasMany('App\Models\Cliente', 'empresa_id', 'id');
	}

	public function fornecedores(){
		return $this->hasMany('App\Models\Fornecedor', 'empresa_id', 'id');
	}

	public function produtos(){
		return $this->hasMany('App\Models\Produto', 'empresa_id', 'id');
	}

	public function veiculos(){
		return $this->hasMany('App\Models\Veiculo', 'empresa_id', 'id');
	}

	public function vendas(){
		return $this->hasMany('App\Models\Venda', 'empresa_id', 'id');
	}

	public function vendasCaixa(){
		return $this->hasMany('App\Models\VendaCaixa', 'empresa_id', 'id');
	}

	public function contrato(){
		return $this->hasOne('App\Models\EmpresaContrato', 'empresa_id', 'id');
	}

	public function representante(){
		return $this->hasOne('App\Models\RepresentanteEmpresa', 'empresa_id', 'id');
	}

	public function cte(){
		return $this->hasMany('App\Models\Cte', 'empresa_id', 'id');
	}

	public function mdfe(){
		return $this->hasMany('App\Models\Mdfe', 'empresa_id', 'id');
	}

	public function nfes(){
		$vendas = $this->vendas;
		$cont = 0;
		foreach($vendas as $v){
			if($v->NfNumero > 0) $cont++;
		}
		return $cont;
	}

	public function nfces(){
		$vendas = $this->vendasCaixa;
		$cont = 0;
		foreach($vendas as $v){
			if($v->NFcNumero > 0) $cont++;
		}
		return $cont;
	}

	public function ctes(){
		$ct = $this->cte;
		$cont = 0;
		foreach($ct as $c){
			if($c->cte_numero > 0) $cont++;
		}
		return $cont;
	}

	public function mdfes(){
		$md = $this->mdfe;
		$cont = 0;
		foreach($md as $m){
			if($m->mdfe_numero > 0) $cont++;
		}
		return $cont;
	}

	public function planoEmpresa(){
		return $this->hasOne('App\Models\PlanoEmpresa', 'empresa_id', 'id');
	}
}
