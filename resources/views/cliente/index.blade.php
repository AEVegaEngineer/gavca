@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Base de datos de cliente</h2>
		<table class="table">
			<thead>
				<th>Nombre del cliente</th>
				<th>Código del cliente</th>
				<th>Rif</th>
				<th>Dirección</th>
				<th>Contacto</th>
				<th>Condiciones</th>
				<th>Saldo</th>
				<th width="170px">Operaciones</th>
			</thead>
			@foreach($clientes as $cliente)
			<tbody>
				<td>{{$cliente->cli_nombre}}</td>
				<td>{{$cliente->cli_codigo}}</td>
				<td>{{$cliente->cli_rif}}</td>
				<td>{{$cliente->cli_direccion}}</td>
				<td>{{$cliente->cli_contacto}}</td>
				<td>{{$cliente->cli_condiciones}}</td>
				<?php $saldo=0; ?>
				@foreach($cuentasxcobrar as $ctas)
				<?php 
					if($ctas->cta_cli_codigo == $cliente->cli_codigo)
					{
						$findme = 'Eliminaci';
						$pos = strpos($ctas->cta_concepto, $findme);
						$findme2 = 'Cobro de deuda';
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
				<td>{{ number_format ( $saldo , $decimals = 2 , "," , "." ) }}</td>

				<td>					
					{!!Form::open(['route'=>['cliente.destroy',$cliente->id],'method'=>'DELETE'])!!}
						<div class="btn-group">
						{!!link_to_route('cuentaxcobrar.show', $title = 'Ver Ctas. x Cobrar', $parameters = $cliente->cli_codigo, $attributes = ['class'=>'btn btn-default btn-xs'])!!}
						{!!link_to_route('cliente.edit', $title = 'Editar', $parameters = $cliente->id, $attributes = ['class'=>'btn btn-primary btn-xs'])!!}
						</div>
					{!!Form::close()!!}					
				</td>
			</tbody>
			@endforeach
		</table>
		{!!$clientes->render()!!}		
	
@endsection