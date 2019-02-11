@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Cardex de producto {{$cardexs[0]->par_nombre}}</h2>
		<h3>Existencia actual: {{$existencia}}&nbsp;&nbsp;&nbsp;&nbsp;Costo Actual: {{number_format ( $cardexs[0]->par_costo , $decimals = 2 , "," , "." )}}</h3>
		
		<table class="table">
			<thead>
				<td>Concepto</td>
				<td>Fecha</td>
				<td>Entra</td>
				<td>Sale</td>
				<!--<td>Valor</td>-->				
			</thead>
			<?php $Total=0 ?>
			@foreach($cardexs as $cardex)
			<?php $cantidad = $cardex->car_valor_actual - $cardex->car_valor_anterior;?>
			<?php $debe_haber = (isset($cardex->comp_fecha)) ? true : false;?>
			<tr>
				<?php 
				echo ''.($debe_haber ? '<td>Compra</td>' : '<td>'.$cardex->car_concepto.'</td>');
				?>
				<td>
					<?php echo $fecha = (isset($cardex->comp_fecha)) ? $cardex->comp_fecha : $cardex->car_fecha;?>					
				</td>
				<?php 
				$findme = 'Ajuste -';
				$pos = strpos($cardex->car_concepto, $findme);
				if($pos === true){ 
					if($cardex->car_valor_anterior < $cardex->car_valor_actual)
						echo '<td>'.$cantidad.'</td><td></td>';
					else
						echo '<td></td><td>'.$cantidad*(-1).'</td>';
				}
				else
				{
					echo ''.($debe_haber ? '<td>'.$cantidad.'</td><td></td>' : '<td></td><td>'.$cantidad*(-1).'</td>');
				}
				?>
				<!--<td><?php//{{ number_format ( $costo = $cardex->car_costo*$cantidad , $decimals = 2 , "," , "." ) }}?></td>-->
				<?php ($debe_haber ? $Total+=$costo : $Total-=$costo); ?>	
			</tr>
			@endforeach	
			<!--		
			<tr>
				<td></td>
				<td><b>TOTAL: </b></td>
				<td></td>
				<td></td>
				<td><b><?php //{{number_format ( $Total , $decimals = 2 , "," , "."  )}}?></b></td>
				<td></td>
			</tr>
		-->
		</table>
		
		
	
@endsection