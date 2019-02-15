@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<h2 class="form-signin-heading">Base de Datos de Ventas</h2>
		<table class="table">
			<thead>
				<th>Código del Cliente</th>
				<th>Fecha de Venta</th>
				<th>Factura de Venta</th>
				<th>Condición</th>
				<th>Precio de Venta</th>
			</thead>
			<tbody>
			@foreach($totalesventas as $key => $totalventa)
				@foreach($elementos as $key => $elemento)
				<?php if($totalventa->ven_factura == $elemento->ven_factura){?>
				<tr>
					<td>{{$elemento->cli_codigo}}</td>
					<td>{{$elemento->ven_fecha}}</td>
					<td>{{$totalventa->ven_factura}}</td>
					<td>{{$elemento->ven_condicion}}</td>
					<td align="right">{{ number_format ( $totalventa->ven_total , $decimals = 2 , "," , "." ) }}</td>
					<td>{!!link_to_route('venta.show', $title = 'Ver Factura', $parameters = $elemento->id, $attributes = ['class'=>'btn btn-success btn-xs'])!!}</td>
				</tr>
				<?php } ?>
				@endforeach
			@endforeach
			</tbody>
		</table>
	</div>
	{!!$totalesventas->render()!!}
@endsection
