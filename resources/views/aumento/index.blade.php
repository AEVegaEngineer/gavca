@extends('layouts.admin')
@section('content')
	<div class="recetas">
		@include('alerts.success')
		<h2 class="form-signin-heading">Base de datos de recetas</h2>

		<table class="table">
			<thead>
				<th>Nombre de receta</th>
				<th>Ingredientes</th>
				<th>Receta Activa</th>
				<th>Operaciones</th>
			</thead>
		@foreach($recetas as $receta)
			<tbody>
				<td>{{$receta->rec_nombre}}</td>
				<td>
					{!!link_to_route('ingrediente.edit', $title = 'Ver Ingredientes', $parameters = $receta->rec_nombre, $attributes = ['class'=>'btn btn-default btn-sm'])!!}
				</td>
				<td>{{$receta->rec_activo}}</td>
				<td>
					{!!link_to_route('receta.edit', $title = 'Editar', $parameters = $receta->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
				</td>
			</tbody>
		@endforeach
		</table>

		
			
	</div>
	{!!$recetas->render()!!}
@endsection

@section('scripts')
	{!!Html::script('js/script3.js')!!}
@endsection