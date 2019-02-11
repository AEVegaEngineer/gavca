@extends('layouts.admin')
@section('content')
	<div class="recetas">
		@include('alerts.success')
		<h2 class="form-signin-heading">Base de datos de recetas</h2>

		<table class="table">
			<thead>
				<th>Nombre de receta</th>
				<th>Ingredientes</th>
				<th>Proceso</th>
				<th>Receta Activa</th>
				<th>Operaciones</th>
			</thead>
		@foreach($recetas as $receta)
			<tbody>
				<td>{{$receta->rec_nombre}}</td>
				<td>
					{!!link_to_route('ingrediente.edit', $title = 'Ver Ingredientes', $parameters = $receta->rec_nombre, $attributes = ['class'=>'btn btn-default btn-sm'])!!}
				</td>
				<td>
					<?php 
					if($receta->rec_proc == 'PA') 
						echo "Proceso A";
					else if($receta->rec_proc == 'PB') 
						echo "Proceso B";
					else if($receta->rec_proc == 'PC') 
						echo "Proceso C";
					?>
				</td>
				<td>{{$receta->rec_activo}}</td>
				<td>
					<?php if($receta->rec_activo == "si"){?>
					<a href="/produccion/{{$receta->rec_nombre}}/create" class="btn btn-warning btn-sm">Ejecutar Receta</a>			
					<?php }?>		

					<?php if(Auth::user()->privilegio == 'admin'){ ?>
					{!!link_to_route('receta.edit', $title = 'Editar', $parameters = $receta->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
					<?php }?>
					
					{!!link_to_route('receta.trash', $title = 'Mover a Papelera', $parameters = $receta->id, $attributes = ['class'=>'btn btn-danger btn-sm'])!!}
				</td>
			</tbody>
		@endforeach
		</table>

		
			
	</div>
	{!!$recetas->render()!!}
@endsection
