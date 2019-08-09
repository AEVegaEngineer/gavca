@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Factura de cobro a cliente.</h2>
		<table class="table">
			<thead>
				<th>Fecha de cobro</th>
				<th>Código del Cliente</th>
				<th>Concepto</th>
				<th>Cobrado a entidad</th>
				<th>Monto de pago</th>
			</thead>
			<tr class="warning">
				<td>{{date("Y/m/d", strtotime($ctasxcobrar->cta_fecha))}}</td>
				<td>{{$ctasxcobrar->cta_cli_codigo}}</td>
				<td>{{$ctasxcobrar->cta_concepto}}</td>
				<td>{{$ctasxcobrar->cta_entidad}}</td>
				<td>{{number_format ( $ctasxcobrar->cta_monto , $decimals = 2 , "," , "." )}}</td>
			</tr>
		</table>
@endsection