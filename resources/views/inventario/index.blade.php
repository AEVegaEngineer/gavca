@extends('layouts.admin')

@section('content')
	<div class="inventarios">
	@include('alerts.success')
		<?php 
			if($proc == 'Proceso A'){
				$proc = 'Productos Semiprocesados';
				$pro = 'Proceso A';
				$p = 'PA';
			}else if($proc == 'Proceso B'){
				$proc = 'Productos Terminados';
				$pro = 'Proceso B';
				$p = 'PB';
			}else if($proc == 'Proceso C (Terminados)'){
				$proc = 'Presentaciones';
				$pro = 'Proceso C (Terminados)';
				$p = 'PC';
			}
		?>
		<h2 class="form-signin-heading">Inventario de {{$proc}}</h2>
		<?php if(Auth::user()->privilegio == 'admin'){ ?>
			
			<!--<a href="/produccion/{{$p}}/insert" class='btn btn-primary btn-sm'>Ajustar Inventario de Productos de {{$proc}}</a>-->
		<?php } ?>
		{!!link_to_route('inventario.reporte', $title = 'Generar reporte', array($fecha = $fecha_caja_actual, $inventario=$pro), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
		<table class="table">
			<thead>				
				<th>{{$proc}}</th>
				<th>Unidad</th>
				<th>Cantidad</th>
				<th>Ultima Modificación</th>
				<th>Cardex</th>
			</thead>
		@foreach($inventarios as $inventario)
			<tbody>				
				<td>{{$inventario->rec_nombre}}</td>
				<td>{{$inventario->rec_unidad}}</td>		
				<td>{{$inventario->pro_produccion}}</td>
				<td>{{date("d/m/Y", strtotime($inventario->updated_at))}}</td>
				<td>{!!link_to_route('produccion.show', $title = 'Ver Cardex', $parameters = $inventario->rec_nombre, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}</td>
			</tbody>
		@endforeach
		</table>

		
			
	</div>
	{!!$inventarios->render()!!}
@endsection
