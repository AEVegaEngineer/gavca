@extends('layouts.admin')

@section('content')
	{!!Form::open(['route'=>'produccion.adjust','method'=>'POST'])!!}
	<div class="materiasprimas">
	@include('alerts.success')
		<h2 class="form-signin-heading margenBotLg">Ajuste de Existencia de Productos</h2>
		<h3>Selecciona un producto para editar su inventario</h3>
		<table class="table" id="existentes">
			<thead>
				<th>Producto</th>
				<th>Cantidad</th>
				<th>Operación</th>
			</thead>	
		
		</table>
		<div class="row">
			<div class="col-md-3">
				<select id="existente" class="form-control">
					<option diabled selected>Selecciona una M.P.</option>
					@foreach($producciones as $produccion)
					<option value="{{$produccion->rec_nombre}}">{{$produccion->rec_nombre}}</option>
					@endforeach
				</select>
			</div>
			<div class="col-md-3"><a href="#" id="insertar-existente" class='btn btn-primary btn-sm margenBotLg'>Listar Producto</a></div>
		</div>
		<input type="hidden" name="etapa" value="{{$etapa}}">
			
		<div class="row">
			<div class="col-md-4">
				{!!Form::submit('Registrar Ajuste',['class'=>'btn btn-lg btn-success'])!!}
			</div>			
		</div>
		

			
	</div>
	{!!Form::close()!!}
	{!!Html::script('js/jquery.min.js')!!}
	{!!Html::script('js/produccion/ajuste.js?1')!!}

@endsection
