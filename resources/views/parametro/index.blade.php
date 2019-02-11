@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Base de datos de parámetros</h2>
		<table class="table fixed">
			<thead>
				<tr class="cheader" style="background-color: #cccccc">
					<th>Parámetro</th>
					<th>Código</th>
					<th>Unidad</th>
					<th>Costo</th>
					<th>Observación</th>
					<th>Ultima Actualización de Costo</th>
					<th>Operaciones</th>
				</tr>
			</thead>
			<tbody>
				@foreach($parametros as $parametro)
				<tr>
					<td>{{$parametro->par_nombre}}</td>
					<td>{{$parametro->par_codigo}}</td>
					<td>{{$parametro->par_unidad}}</td>
					<td>{{ number_format ( $parametro->par_costo , $decimals = 2 , "," , "." ) }}</td>
					<td>{{$parametro->par_observacion}}</td>
					<td>
						<?php
						if($parametro->par_cost_updated !== null){
							$date = new DateTime($parametro->par_cost_updated);
							//echo $date->format('d-m-Y h:i:s a');
							echo $date->format('d-m-Y');
						}
					 	?>
					</td>
					<td>
						<div class="btn-group">
						{!!Form::open(['route'=>['parametro.show',$parametro->id],'method'=>'GET'])!!}
							{!!link_to_route('parametro.edit', $title = 'Editar', $parameters = $parametro->id, $attributes = ['class'=>'btn btn-primary btn-xs'])!!}
							{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-xs'])!!}							
						{!!Form::close()!!}
						</div>
						
					</td>
				</tr>
				@endforeach
			</tbody>
			
		</table>

		{!!$parametros->render()!!}
		
	{!!Html::script('js/jquery.min.js')!!}
	{!!Html::script('js/parametro/goheadfixed.js')!!}	

@endsection