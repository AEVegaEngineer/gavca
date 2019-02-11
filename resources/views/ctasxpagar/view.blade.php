@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Factura de pago a proveedor.</h2>
		<table class="table">
			<thead>
				<th>Fecha de pago</th>
				<th>Código del Proveedor</th>
				<th>Concepto</th>
				<th>Monto de pago</th>
			</thead>
			<tr class="warning">
				<td>{{date("Y/m/d", strtotime($ctasxpagar->cta_fecha))}}</td>
				<td>{{$ctasxpagar->cta_prov_codigo}}</td>
				<td>{{$ctasxpagar->cta_concepto}}</td>
				<td>{{number_format ( $ctasxpagar->cta_monto , $decimals = 2 , "," , "." )}}</td>
			</tr>
		</table>
@endsection