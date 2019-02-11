@extends('layouts.admin')

@section('content')
	{!!Form::open(['route'=>'materiaprima.store','method'=>'POST'])!!}
	<div class="materiasprimas">
	@include('alerts.success')
		<h2 class="form-signin-heading margenBotLg">Ajuste de Existencia de Materias Primas</h2>
		<h3>Selecciona un producto para editar su inventario</h3>
		<table class="table" id="existentes">
			<thead>
				<th>Materia Prima</th>
				<th>Cantidad</th>
				<th>Operación</th>
			</thead>	
		
		</table>
		<div class="row">
			<div class="col-md-3">
				<select id="existente" class="form-control">
					<option diabled selected>Selecciona una M.P.</option>
					@foreach($existentes as $existente)
					<option value="{{$existente->par_nombre}}">{{$existente->par_nombre}}</option>
					@endforeach
				</select>
			</div>
			<div class="col-md-3"><a href="#" id="insertar-existente" class='btn btn-primary btn-sm margenBotLg'>Listar Producto</a></div>
		</div>
		
		
		<div class="row">
			<div class="col-md-12">			
				<h3>Inserta productos directamente en base de datos creandolos desde cero e introduciendo sus cantidades</h3>
			</div>		
		</div>
		
		<table class="table" id="nuevos">
			<thead>
				<th>Materia Prima</th>
				<th>Unidad</th>
				<th>Costo</th>
				<th>Cantidad</th>
				<th>Perecedero</th>
				<th>Operación</th>
			</thead>	
		
		</table>
		<div class="row">
			<div class="col-md-4">
				<a href="#" id="insertar-nuevo" class='btn btn-primary btn-sm margenBotLg'>Insertar Nueva Materia Prima</a>
			</div>			
		</div>	
		
		<div class="row">
			<div class="col-md-4">
				{!!Form::submit('Registrar Ajuste',['class'=>'btn btn-lg btn-success'])!!}
			</div>			
		</div>
		

			
	</div>
	{!!Form::close()!!}
	{!!Html::script('js/jquery.min.js')!!}
	{!!Html::script('js/materiaprima/ajuste.js?8')!!}

@endsection
