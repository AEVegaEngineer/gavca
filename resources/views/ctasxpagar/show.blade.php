@extends('layouts.admin')

@section('content')
	@include('alerts.success')

		{!!link_to_route('proveedor.index', $title = 'Volver a Proveedores', null, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}

		<h2 class="form-signin-heading margenBotLg">Cuentas por pagar del proveedor código: {{$prov}}</h2>
		
		<table class="table">
			<thead>
				<td>Concepto</td>
				<td align="center">Monto</td>	
				<td>Status</td>				
				<td>Compra</td>
			</thead>
			<?php $total=0 ?>
			@foreach($ctasxpagar as $ctas)
				<?php 
				$findme = 'Eliminaci';
				$pos = strpos($ctas->cta_concepto, $findme);
				$findme2 = 'Pago de deuda';
				$pos2 = strpos($ctas->cta_concepto, $findme2);
				if($pos2 !== false || $ctas->cta_pagada == 1 || $pos !== false){ 
				?>
					<tr class="success">
				<?php }else{ ?>
					<tr class="danger">
				<?php }?>			
					<td>{{$ctas->cta_concepto}}</td>
					<td align="right">{{number_format ( $ctas->cta_monto , $decimals = 2 , "," , "." )}}</td>
					<td>
						<?php if($ctas->cta_pagada == 1) echo "Cuenta Pagada";?>
					</td>						
					<td>
						<?php if(isset($ctas->cta_compra_id)){ ?>
							{!!link_to_route('compra.show', $title = 'Ver Factura', $parameters = $ctas->cta_compra_id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
						<?php } else if($pos2 !== false){?>
							{!!link_to_route('cuentaxpagar.view', $title = 'Ver Pago', $parameters = $ctas->id, $attributes = ['class'=>'btn btn-warning btn-sm'])!!}
						<?php } ?>

					</td>
					<?php 
					if($pos2 !== false || $pos !== false)
					{
						$total-=$ctas->cta_monto;
					}else{
						$total+=$ctas->cta_monto;
					}
					?>
				</tr>
			@endforeach
			<tr>
				<td><b>TOTAL DEUDA PENDIENTE </b></td>
				<td align="right"><b>{{ number_format ( $total , $decimals = 2 , "," , "." ) }}</b></td>
				<td></td>				
			</tr>			
		</table>

		{!!link_to_route('cuentaxpagar.edit', $title = 'Abonar a cuentas por pagar', $parameters = $prov, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
		
		
	
@endsection