@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Compra con documento de factura Nro.{{$compra->comp_doc}}</h2>
		{!!link_to_route('compra.reporte', $title = 'Generar reporte', array($parameters = "factura",$fecha="0",$id=$compra->id), $attributes = ['class'=>'btn btn-primary','id'=>'btn_reporte'])!!}
		<table class="table">
			<thead>
				<th>Fecha de compra</th>
				<th>Código del Proveedor</th>
				<th>Documento de factura</th>	
			</thead>
			<tr class="warning">
				<td>{{date("Y/m/d", strtotime($compra->comp_fecha))}}</td>
				<td>{{$compra->comp_proveedor}}</td>
				<td>{{$compra->comp_doc}}</td>
			</tr>
		</table>
		<table class="table">
			<thead>
				<td>Producto</td>
				<td>Código</td>
				<td>Cantidad</td>
				<td>Costo Unitario</td>
				<td>Alicuota</td>
				<td>Base Imponible</td>
				<td>IVA</td>
				<td>Total Producto</td>
			</thead>
			<?php $iva=0 ?>
			@foreach($cardexs as $cardex)
			<?php $cantidad = $cardex->car_valor_actual - $cardex->car_valor_anterior;?>
			<tr>
				<td>{{$cardex->par_nombre}}</td>
				<td>{{$cardex->par_codigo}}</td>
				<td>{{$cantidad}}</td>			
				<td align="right">{{ number_format ( $cardex->car_costo , $decimals = 2 , "," , "." ) }}</td>
				<td>{{$cardex->car_alicuota}}</td>
				<td align="right">{{ number_format ( $costo = $cardex->car_costo*$cantidad , $decimals = 2 , "," , "." ) }}</td>
				<td align="right">{{ number_format ( $cardex->car_iva , $decimals = 2 , "," , "." ) }}</td>
				<td align="right">{{ number_format ( $costo+$cardex->car_iva , $decimals = 2 , "," , "." ) }}</td>
				<?php $iva+=$costo;?>
			</tr>
			@endforeach
			<tr class="success">
				<td><b>TOTALES</b></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right"><b>{{ number_format ( $iva , $decimals = 2 , "," , "." ) }}</b></td>
				<td align="right"><b>{{ number_format ( $compra->comp_monto-$iva , $decimals = 2 , "," , "." ) }}</b></td>
				<td align="right"><b>{{ number_format ( $compra->comp_monto , $decimals = 2 , "," , "." ) }}</b></td>
			</tr>
		</table>
		
		
	
@endsection