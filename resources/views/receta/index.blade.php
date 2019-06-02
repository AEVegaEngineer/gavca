@extends('layouts.admin')
@section('content')
	<div class="recetas">
		@include('alerts.success')
		<h2 class="form-signin-heading">Procesos Productivos</h2>

		<table class="table">
			<thead>
				<th>Nombre de proceso</th>
				<th>Ingredientes</th>
				<th>Proceso</th>
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
						echo "Prod. Semiprocesado";
					else if($receta->rec_proc == 'PB') 
						echo "Prod. Terminado";
					else if($receta->rec_proc == 'PC') 
						echo "Presentación";
					?>
				</td>
				<td>
					<?php if(Auth::user()->privilegio == 'admin' || Auth::user()->privilegio == 'tipo1')
					{
					if($receta->rec_activo == "si"){?>
						<a href="/produccion/{{$receta->rec_nombre}}/create" class="btn btn-warning btn-sm">Ejecutar Receta</a>						<?php }	?>
					<?php }	?>	
					<?php if(Auth::user()->privilegio == 'admin')
					{ ?>
						{!!link_to_route('receta.edit', $title = 'Editar', $parameters = $receta->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}					
					
						{!!link_to_route('receta.trash', $title = 'Mover a Papelera', $parameters = $receta->id, $attributes = ['class'=>'btn btn-danger btn-sm'])!!}
					<?php }?>
				</td>
			</tbody>
		@endforeach
		</table>

		
			
	</div>
	{!!$recetas->render()!!}
@endsection
