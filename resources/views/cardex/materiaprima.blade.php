@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading">Cardex de {{$who}}</h2>		
		<table class="table">
			<thead>
				<th>Documento de compra</th>
				<th>Materia Prima</th>
				<th>Código de Materia Prima</th>
				<th>Valor Anterior</th>
				<th>Valor Actual</th>
				<th>Fecha de Actualización</th>
				<!--<th>Operaciones</th>-->
			</thead>
			@foreach($materiasprimas as $materiaprima)
			<tr>
				<td>{{$materiaprima->comp_doc}}</td>
				<td>{{$materiaprima->par_nombre}}</td>
				<td>{{$materiaprima->mp_codigo}}</td>
				<td>{{$materiaprima->car_valor_anterior}}</td>
				<td>{{$materiaprima->car_valor_actual}}</td>
				<td>{{$materiaprima->updated_at}}</td>
				<!--
				<td>										
					<a href="/vermateriasprimas/{{$materiaprima->comp_doc}}" class="btn btn-primary btn-sm">Ver Compra</a>				
				</td>			
				-->
			</tr>
			@endforeach
		</table>

		
			
	</div>
	{!!$materiasprimas->render()!!}
@endsection
