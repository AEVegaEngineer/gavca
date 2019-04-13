@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Cardex de producto {{$cardexs[0]->par_nombre}}</h2>
		<h3>Existencia actual: {{$existencia}} {{$cardexs[0]->par_unidad}}&nbsp;&nbsp;&nbsp;&nbsp;Costo Actual: {{number_format ( $cardexs[0]->par_costo , $decimals = 2 , "," , "." )}}</h3>
		
		<table class="table">
			<thead>
				<td>Concepto</td>
				<td>Fecha</td>
				<td>Entra</td>
				<td>Sale</td>
				<!--<td>Valor</td>-->				
			</thead>
			<?php $debe=0;$haber=0; ?>

			@foreach($cardexs as $cardex)
			<?php 
				$cantidad = $cardex->car_valor_actual - $cardex->car_valor_anterior;	  
				$debe_haber = (isset($cardex->comp_fecha)) ? true : false;
				$costo = $cardexs[0]->par_costo; 
			?>
			<tr>
				<?php 
				echo ''.($debe_haber ? '<td>Compra</td>' : '<td>'.$cardex->car_concepto.'</td>');
				?>
				<td>
					<?php 
					$fecha_compra=date_create($cardex->comp_fecha);
					echo $fecha = (isset($cardex->comp_fecha)) ? date_format($fecha_compra,"Y-m-d") : $cardex->car_fecha;
					?>					
				</td>
				<?php 
				$findme = 'Ajuste -';
				$pos = strpos($cardex->car_concepto, $findme);
				if($pos === true){ 
					if($cardex->car_valor_anterior < $cardex->car_valor_actual)
					{
						echo '<td>'.$cantidad.'</td><td></td>';
						$debe+=$cantidad;
					}
					else
					{
						echo '<td></td><td>'.$cantidad*(-1).'</td>';
						$haber+=$cantidad;
					}
				}
				else
				{
					echo ''.($debe_haber ? '<td>'.$cantidad.'</td><td></td>' : '<td></td><td>'.$cantidad*(-1).'</td>');
				}
				?>	
			</tr>
			
			@endforeach	
			<tr>
				<td>Total</td>
				<td>-</td>
				<td>{{$debe}}</td>
				<td>{{$haber}}</td>
			</tr>
		</table>
		
		
	
@endsection