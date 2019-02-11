@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading">Base de datos de producciones</h2>		
		<table class="table">
			<thead>
				<th>Receta usada</th>
				<th>Fecha de producción</th>
				<th>Cantidad de producción</th>
				<th>Etapa de la producción</th>
				<th>Costo</th>
				<th>Operaciones</th>
			</thead>
			<tbody>
			@foreach($producciones as $produccion)
			<?php 
				if($produccion->pro_costo!=null){
			?>
			<tr>
				<td>{{$produccion->rec_nombre}}</td>
				<td>{{$produccion->pro_fecha}}</td>
				<td>{{$produccion->pro_produccion}}</td>
				<td>{{$produccion->pro_etapa}}</td>
				<td>{{$produccion->pro_costo}}</td>
				<td>					
					{!!Form::open(['route'=>['produccion.destroy',$produccion->id],'method'=>'DELETE'])!!}
						<div class="btn-group">
						<?php 
						if($produccion->pro_costo!=null){
						?>
						<a href="/verProduccion/{{$produccion->rec_nombre}}/{{$produccion->pro_fecha}}" class="btn btn-primary btn-sm">Ver Producción</a>
						<?php //{!!Form::submit('Eliminar',['class'=>'btn btn-danger btn-sm'])!!}?>
						<?php } ?>
						</div>
					{!!Form::close()!!}
				</td>
			</tr>
			<?php } ?>
			@endforeach
			</tbody>
		</table>

		
			
	</div>
	{!!$producciones->render()!!}
@endsection
