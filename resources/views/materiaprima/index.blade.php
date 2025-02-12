@extends('layouts.admin')

@section('content')
	<div class="materiasprimas">
	@include('alerts.success')
		<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Inventario de Materias Primas</h2>
		<?php if(Auth::user()->privilegio == 'admin'){ ?>
			<!--<a href="/materiaprima/insert" class='btn btn-primary btn-sm'>Ajustar Inventario de Materias Primas</a>-->
		<?php } ?>
		{!!link_to_route('inventario.reporte', $title = 'Generar reporte', array($fecha = $fecha_caja_actual, $inventario='Materia Prima'), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
		<table class="table">
			<thead>
				<th>Código</th>
				<th>Materia Prima</th>
				<th>Unidad</th>
				<th>Cantidad</th>
				<th>Ultima Modificación</th>
				<th>Cardex</th>
			</thead>
		@foreach($materiasprimas as $materiaprima)
			<tbody>
				<td>{{$materiaprima->mp_codigo}}</td>
				<td>{{$materiaprima->par_nombre}}</td>
				<td>{{$materiaprima->par_unidad}}</td>	
				
				<td>{{$materiaprima->mp_cantidad}}</td>
				<td>{{date("d/m/Y", strtotime($materiaprima->updated_at))}}</td>
				<td>
					<div class="btn-group">
						
						{!!link_to_route('cardexMP.show', $title = 'Ver Cardex', $parameters = $materiaprima->mp_codigo, $attributes = ['class'=>'btn btn-primary btn-xs'])!!}					
					</div>
				</td>
			</tbody>
		@endforeach
		</table>

		
			
	</div>
	{!!$materiasprimas->render()!!}
@endsection
