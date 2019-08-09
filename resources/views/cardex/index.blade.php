@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Cardex de {{$who}}</h2>		
		<table class="table">
			<thead>
				<th>Receta usada</th>
				<th>Fecha de producción</th>
				<th>Cantidad de producción</th>
				<th>Etapa de la producción</th>
			</thead>
			@foreach($producciones as $produccion)
			<tbody>
				<td>{{$produccion->rec_nombre}}</td>
				<td>{{$produccion->pro_fecha}}</td>
				<td>{{$produccion->pro_produccion}}</td>
				<td>{{$produccion->pro_etapa}}</td>
				
			</tbody>
			@endforeach
		</table>

		
			
	</div>
	{!!$producciones->render()!!}
@endsection
