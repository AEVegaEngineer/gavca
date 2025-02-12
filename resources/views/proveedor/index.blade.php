@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading" style="display: inline-block; margin-right: 50px;">Lista de Proveedores</h2>
		<table class="table">
			<thead>
				<th>Nombre del Proveedor</th>
				<th>Código del Proveedor</th>
				<th width="12%">Rif</th>
				<th>Dirección</th>
				<th>Contacto</th>
				<th>Observaciones</th>
				<th>Saldo</th>
				<!--<th>Credito o contado</th>-->
				<th width="18%">Operaciones</th>
			</thead>
			@foreach($proveedores as $proveedor)
			<tbody>
				<td>{{$proveedor->prov_nombre}}</td>
				<td>{{$proveedor->prov_codigo}}</td>
				<td>{{$proveedor->prov_rif}}</td>
				<td>{{$proveedor->prov_direccion}}</td>
				<td>{{$proveedor->prov_contacto}}</td>
				<?php $observaciones = ($proveedor->prov_condiciones == "") ? "Ninguna": $proveedor->prov_condiciones?>
				<td>{{$observaciones}}</td>
				<?php $saldo=0; ?>
				@foreach($cuentasxpagar as $ctas)
				<?php 
					if($ctas->cta_prov_codigo == $proveedor->prov_codigo)
					{
						$findme = 'Eliminaci';
						$pos = strpos($ctas->cta_concepto, $findme);
						$findme2 = 'Pago de deuda';
						$pos2 = strpos($ctas->cta_concepto, $findme2);
						if($pos2 !== false || $pos !== false)
						{
							$saldo-=$ctas->cta_monto;
						}else{
							$saldo+=$ctas->cta_monto;
						}
					} 
				?>					
				@endforeach
				<td align="right">{{ number_format ( $saldo , $decimals = 2 , "," , "." ) }}</td>
				<!--<td>{{$proveedor->prov_cred_o_cont}}</td>-->

				<td>
					
					{!!Form::open(['route'=>['proveedor.destroy',$proveedor->id],'method'=>'DELETE'])!!}
						<div class="btn-group">
						{!!link_to_route('cuentaxpagar.show', $title = 'Ver Ctas. x Pagar', $parameters = $proveedor->prov_codigo, $attributes = ['class'=>'btn btn-default btn-xs'])!!}
						<?php if(Auth::user()->privilegio == 'admin' || Auth::user()->privilegio == 'tipo1'){ ?>
						{!!link_to_route('proveedor.edit', $title = 'Editar', $parameters = $proveedor->id, $attributes = ['class'=>'btn btn-primary btn-xs'])!!}			
						<?php } ?>	
						</div>
					{!!Form::close()!!}
					
				</td>
			</tbody>
			@endforeach
		</table>
		{!!$proveedores->render()!!}
		
		
	
@endsection