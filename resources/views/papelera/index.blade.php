@extends('layouts.admin')
@section('content')
	<div class="recetas">
		@include('alerts.success')
		<h2 class="form-signin-heading">Papelera de Reciclaje de Recetas</h2>

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
					{!!link_to_route('receta.edit', $title = 'Editar', $parameters = $receta->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
					{!!link_to_route('receta.trash', $title = 'Volver a activar', $parameters = $receta->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
					{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-sm'])!!}
					
				</td>
			</tbody>
		@endforeach
		</table>	
		{!!Form::open(['route'=>['receta.destroy',$receta->id],'method'=>'DELETE'])!!}
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">

		    <!-- Modal content-->
		    <div class="modal-content">
		      	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		        	<h4 class="modal-title">Eliminar usuario</h4>
		      	</div>
		      	<div class="modal-body">
		      		<div class="row margenBotSm">
		      			<div class="col-md-5">
			      			<p>¿Está seguro que desea eliminar este usuario?</p>
			      		</div>
			      		
		      		</div>	        	
		      	</div>
		      	<div class="modal-footer">
		      		<div class="btn-group">
		      			{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-lg'])!!}
		        		<button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Cerrar</button>
		      		</div>	      	
		      	</div>
		    </div>

		  </div>
		</div>	
		{!!Form::close()!!}
			
	</div>
	{!!$recetas->render()!!}
@endsection
