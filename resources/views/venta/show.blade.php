@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Venta con documento de factura Nro.{{$factura}}</h2>
		{!!link_to_route('venta.reporte', $title = 'Generar reporte', array($parameters = "factura",$id=$totalventa_id), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
		<table class="table">
			<thead>
				<th>Fecha de compra</th>
				<th>Código del Cliente</th>
				<th>Documento de factura</th>	
			</thead>
			<tr class="warning">
				<td>{{$ventas[0]->ven_fecha}}</td>
				<td>{{$ventas[0]->cli_codigo}}</td>
				<td>{{$factura}}</td>
			</tr>
		</table>
		<table class="table">
			<thead>
				<td>Producto</td>
				<td>Cantidad</td>
				<td>Costo Unitario</td>
				<td>Alicuota</td>
				<td>Base Imponible</td>
				<td>IVA</td>
				<td>Total Producto</td>
			</thead>
			<?php $totalIva=0; $totalBase=0; $total=0;?>
			@foreach($ventas as $venta)
			<?php $cantidad = $venta->ven_cantidad;?>
			<tr>
				<td>{{$venta->rec_nombre}}</td>
				<td>{{$cantidad}}</td>			
				<td align="right">{{ number_format ( $venta->ven_costo , $decimals = 2 , "," , "." ) }}</td>
				<td>{{$venta->ven_iva}}%</td>
				<td align="right">{{ number_format ( $base = $venta->ven_costo*$cantidad , $decimals = 2 , "," , "." ) }}</td>
				<td align="right">{{ number_format ( $iva = $base*($venta->ven_iva/100) , $decimals = 2 , "," , "." ) }}</td>
				<td align="right">{{ number_format ( $base+$iva , $decimals = 2 , "," , "." ) }}</td>
				<?php $totalIva+=$iva; $totalBase+=$base; $total+=$base+$iva;?>
			</tr>
			@endforeach
			<tr class="success">
				<td><b>TOTALES</b></td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right"><b>{{ number_format ( $totalBase , $decimals = 2 , "," , "." ) }}</b></td>
				<td align="right"><b>{{ number_format ( $totalIva , $decimals = 2 , "," , "." ) }}</b></td>				
				<td align="right"><b>{{ number_format ( $total , $decimals = 2 , "," , "." ) }}</b></td>
			</tr>
		</table>
		
		
	
@endsection