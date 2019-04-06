@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading">Historial de producciones</h2>		
		<table class="table">
			<thead>
				<th>Receta usada</th>
				<th>Fecha de producción</th>
				<th>Cantidad de producción</th>
				<th>Etapa de la producción</th>
				<th>Costo Unitario</th>
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
				<td>{{number_format ( $produccion->pro_costo , $decimals = 2 , "," , "." )}}</td>
				<td>					
					<div class="btn-group">
						<?php 
						if($produccion->pro_costo!=null){
						?>
						<a href="/verProduccion/{{$produccion->id}}" class="btn btn-primary btn-sm">Ver Producción</a>	
						<?php } ?>
					</div>
				</td>
			</tr>
			<?php } ?>
			@endforeach
			</tbody>
		</table>			
	</div>
	{!!$producciones->render()!!}
@endsection
