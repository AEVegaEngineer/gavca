@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Lista de Insumos</h2>
		<table class="table fixed">
			<thead>
				<tr class="cheader" style="background-color: #cccccc">
					<th>Nombre</th>
					<th>Unidad</th>
					<th>Costo</th>
					<th>Observación</th>
					<th>Ultima Actualización de Costo</th>
					<th>Operaciones</th>
				</tr>
			</thead>
			<tbody>
				@foreach($insumos as $insumo)
				<tr>
					<td>{{$insumo->ins_nombre}}</td>
					<td>{{$insumo->ins_unidad}}</td>
					<td align="right">{{ number_format ( $insumo->ins_costo , $decimals = 2 , "," , "." ) }}</td>
					<td>{{$insumo->ins_observacion}}</td>
					<td>
						<?php
						if($insumo->ins_cost_updated !== null){
							$date = new DateTime($insumo->ins_cost_updated);
							//echo $date->format('d-m-Y h:i:s a');
							echo $date->format('d-m-Y');
						}
					 	?>
					</td>
					<td>
						<div class="btn-group">
						{!!Form::open(['route'=>['insumo.show',$insumo->id],'method'=>'GET'])!!}
							{!!link_to_route('insumo.edit', $title = 'Editar', $parameters = $insumo->id, $attributes = ['class'=>'btn btn-primary btn-xs'])!!}
							{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-xs'])!!}							
						{!!Form::close()!!}
						</div>						
					</td>
				</tr>
				@endforeach
			</tbody>
			
		</table>

		{!!$insumos->render()!!}
		
	{!!Html::script('js/jquery.min.js')!!}
	{!!Html::script('js/parametro/goheadfixed.js')!!}	

@endsection