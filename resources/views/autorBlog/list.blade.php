@extends('default.layout')
@section('content')

<div class="card card-custom gutter-b">

	<div class="card-body">
		<div class="">

			<div class="col-sm-12 col-lg-4 col-md-6 col-xl-4">

				<a href="/autorPost/new" class="btn btn-lg btn-success">
					<i class="fa fa-plus"></i>Novo Autor
				</a>
			</div>
		</div>
		<br>
		<div class="" id="kt_user_profile_aside" style="margin-left: 10px; margin-right: 10px;">
			<br>
			<h4>Lista de Autores Post</h4>


			<div class="row">

				@foreach($autores as $a)
				<!-- inicio grid -->
				<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
					<!--begin::Card-->
					<div class="card card-custom gutter-b card-stretch">
						<!--begin::Body-->
						<div class="card-body pt-4">
							<!--begin::Toolbar-->
							<div class="d-flex justify-content-end">
								<div class="dropdown dropdown-inline" data-toggle="tooltip" title="" data-placement="left" >
									<a href="#" class="btn btn-clean btn-hover-light-primary btn-sm btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<i class="fa fa-ellipsis-h"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-md dropdown-menu-right">
										<!--begin::Navigation-->
										<ul class="navi navi-hover">
											<li class="navi-header font-weight-bold py-4">
												<span class="font-size-lg">Ações:</span>
												
											</li>
											<li class="navi-separator mb-3 opacity-70"></li>

											<li class="navi-item">
												<a href="/autorPost/edit/{{ $a->id }}" class="navi-link">
													<span class="navi-text">
														<span class="label label-xl label-inline label-light-primary">Editar</span>
													</span>
												</a>
											</li>
											<li class="navi-item">
												<a onclick='swal("Atenção!", "Deseja remover este registro?", "warning").then((sim) => {if(sim){ location.href="/autorPost/delete/{{ $a->id }}" }else{return false} })' href="#!" class="navi-link">
													<span class="navi-text">
														<span class="label label-xl label-inline label-light-danger">Remover</span>
													</span>
												</a>
											</li>
											
										</ul>
										<!--end::Navigation-->
									</div>
								</div>
							</div>
							<!--end::Toolbar-->
							<!--begin::User-->
							<div class="d-flex align-items-end mb-7">
								<!--begin::Pic-->
								<div class="d-flex align-items-center">
									<!--begin::Pic-->
									<div class="flex-shrink-0 mr-4 mt-lg-0 mt-3">
										<div class="symbol symbol-circle symbol-lg-75">
											@if(file_exists(public_path('ecommerce/autores/').$a->img))
											<img src="/ecommerce/autores/{{$a->img}}" alt="{{$a->img}}">
											@else
											<img src="/imgs/no_image.png" alt="image">
											@endif
										</div>
										<div class="symbol symbol-lg-75 symbol-circle symbol-primary d-none">
											<span class="font-size-h3 font-weight-boldest">JM</span>
										</div>
									</div>
									<!--end::Pic-->
									<!--begin::Title-->
									<div class="d-flex flex-column">
										<a class="text-dark font-weight-bold text-hover-primary font-size-h4 mb-0">{{$a->nome}}</a>

									</div>


									<!--end::Title-->
								</div>
								<!--end::Title-->
							</div>
							<!--end::User-->
							<!--begin::Desc-->

							<p class="text-muted font-weight-bold">Tipo: 
								<strong class="text-danger">{{ $a->tipo }}</strong>
							</p>
							
						</div>
						<!--end::Body-->
					</div>
					<!--end::Card-->
				</div>
				@endforeach
				<!-- fim grid -->
			</div>
		</div>
	</div>
</div>
@endsection	