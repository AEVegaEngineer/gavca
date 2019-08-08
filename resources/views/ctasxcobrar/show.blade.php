@extends('layouts.admin')

@section('content')
	@include('alerts.success')

		{!!link_to_route('cliente.index', $title = 'Volver a Clientes', null, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}

		<h2 class="form-signin-heading margenBotLg">Cuentas por cobrar del cliente código: {{$cliente}}</h2>
		
		<table class="table">
			<thead>
				<td>Concepto</td>
				<td>Monto</td>
				<td>Status</td>				
				<td>Venta</td>
			</thead>
			<?php $total=0 ?>
			@foreach($ctasxcobrar as $ctas)

			<?php 
			$findme2 = 'Cobro de deuda';
			$pos2 = strpos($ctas->cta_concepto, $findme2);
			?>
			<?php if($pos2 !== false || $ctas->cta_pagada == 1){ ?>
			<tr class="success">
			<?php }else{ ?>
			<tr class="danger">
			<?php }?>
				<td>{{$ctas->cta_concepto}}</td>
				<td>{{number_format ( $ctas->cta_monto , $decimals = 2 , "," , "." )}}</td>	
				<td>
					<?php if($ctas->cta_pagada == 1) echo "Cuenta Pagada";?>
				</td>					
				<td>
					<?php if(isset($ctas->cta_venta_id)){ ?>
						{!!link_to_route('venta.show', $title = 'Ver Factura', $parameters = $ctas->cta_venta_id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
					<?php } else if($pos2 !== false){?>
						{!!link_to_route('cuentaxcobrar.view', $title = 'Ver Pago', $parameters = $ctas->id, $attributes = ['class'=>'btn btn-warning btn-sm'])!!}
					<?php } ?>
				</td>
				<?php 
				if($pos2 !== false){
					$total-=$ctas->cta_monto;
				}else{
					$total+=$ctas->cta_monto;
				}?>
			</tr>
			@endforeach
			<tr>
				<td><b>TOTAL DEUDA PENDIENTE </b></td>
				<td><b>{{ number_format ( $total , $decimals = 2 , "," , "." ) }}</b></td>
				<td></td>				
			</tr>			
		</table>
		<?php if(Auth::user()->privilegio == 'admin' || Auth::user()->privilegio == 'tipo1'){ ?>
		{!!link_to_route('cuentaxcobrar.edit', $title = 'Cobrar deuda', $parameters = $cliente, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
		<?php } ?>
		
		
	
@endsection