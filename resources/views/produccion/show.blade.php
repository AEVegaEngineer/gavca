@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Cardex de producto </h2>	
		
		<table class="table">
			<thead>
				<td>Fecha</td>
				<td>Producto</td>
				<td>Entra</td>
				<td>Sale</td>
				<!--<td>Valor</td>-->
				<td>Concepto</td>
			</thead>
			<?php $totalEntra = 0; $totalSale = 0; ?>
			@foreach($producciones as $produccion)
			<?php $debe_haber = (isset($produccion->pro_costo)) ? true : false;?>
			<tr>
				<td>{{$produccion->pro_fecha}}</td>
				<td>{{$produccion->rec_nombre}}</td>
				<?php 
				$debe_haber ? $totalEntra += $produccion->pro_produccion : $totalSale += $produccion->pro_produccion;
				echo ''.($debe_haber ? '<td>'.$produccion->pro_produccion.'</td><td></td>' : '<td></td><td>'.$produccion->pro_produccion.'</td>');
				?>
				<td>{{$produccion->pro_concepto}}</td>
			</tr>
			@endforeach	
					
			<tr>
				<td></td>
				<td><b>TOTAL: </b></td>
				<td><b>{{number_format ( $totalEntra , $decimals = 2 , "," , "." )}}</b></td>
				<td><b>{{number_format ( $totalSale , $decimals = 2 , "," , "." )}}</b></td>
				<td></td>
			</tr>

		
		</table>		
		
		<h3>Existencia Actual: {{number_format ( $totalEntra-$totalSale , $decimals = 2 , "," , "." )}}</h3>	
	
@endsection