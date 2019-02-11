@extends('layouts.admin')

@section('content')
	<div class="inventarios">
	@include('alerts.success')
		<h2 class="form-signin-heading">Inventario de Productos en {{$proc}}</h2>
		<?php if(Auth::user()->privilegio == 'admin'){ ?>
			<?php 
				if($proc == 'Proceso A'){
					$p = 'PA';
				}else if($proc == 'Proceso B'){
					$p = 'PB';
				}else if($proc == 'Proceso C (Terminados)'){
					$p = 'PC';
				}
			?>
			<a href="/produccion/{{$p}}/insert" class='btn btn-primary btn-sm'>Ajustar Inventario de Productos de {{$proc}}</a>
		<?php } ?>
		<table class="table">
			<thead>
				<?php if($proc == "Proceso C (Terminados)"){ ?>
				<th>Producto Terminado</th>
				<?php }else{?>
				<th>Producto Intermedio {{$proc}}</th>
				<?php }?>
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
				<td>{{date("Y/m/d", strtotime($inventario->updated_at))}}</td>
				<td>{!!link_to_route('produccion.show', $title = 'Ver Cardex', $parameters = $inventario->rec_nombre, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}</td>
			</tbody>
		@endforeach
		</table>

		
			
	</div>
	{!!$inventarios->render()!!}
@endsection
