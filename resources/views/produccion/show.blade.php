@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Cardex de producto {{$producciones[0]->rec_nombre}}</h2>	
		<h3>Existencia Actual: {{number_format ( $existencia , $decimals = 2 , "," , "." )}}</h3>
		<table class="table">
			<thead>
				<td>Fecha</td>
				<td>Concepto</td>
				<td>Entra</td>
				<td>Sale</td>
				<td>Disponible</td>
				<td align="right">Costo Producción</td>
			</thead>
			<?php $totalEntra = 0; $totalSale = 0; ?>
			@foreach($producciones as $produccion)
			<?php $debe_haber = (isset($produccion->pro_costo)) ? true : false;?>
			<tr>
				<td>{{$produccion->pro_fecha}}</td>
				<td>{{$produccion->pro_concepto}}</td>
				<?php 
				
				echo ''.($debe_haber ? '<td>'.$produccion->pro_produccion.'</td><td></td>' : '<td></td><td>'.$produccion->pro_produccion.'</td>');
				?>
				<td>{{$produccion->pro_disponible}}</td>
				<td align="right">
					<?php if (isset($produccion->pro_costo)) echo number_format ( $produccion->pro_costo , $decimals = 2 , "," , "." );?>					
				</td>
			</tr>
			@endforeach				
			

		
		</table>		
		{!!$producciones->render()!!}
			
	
@endsection