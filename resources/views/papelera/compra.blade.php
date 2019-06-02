@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Papelera de Reciclaje de Compras</h2>
		<table class="table">
			<thead>
				<th>Fecha de Compra</th>
				<th>Código del Proveedor</th>
				<th>Documento de factura</th>	
				<th>Monto</th>
				<th>Operaciones</th>
			</thead>
			@foreach($compras as $compra)
			<tbody>
				<td>{{date("Y/m/d", strtotime($compra->comp_fecha))}}</td>
				<td>{{$compra->comp_proveedor}}</td>
				<td>{{$compra->comp_doc}}</td>			
				<td>{{ number_format ( $compra->comp_monto , $decimals = 2 , "," , "." ) }}</td>

				<td>
					
					{!!Form::open(['route'=>['compra.destroy',$compra->id],'method'=>'DELETE'])!!}
						<div class="btn-group">
						{!!link_to_route('compra.show', $title = 'Ver Factura', $parameters = $compra->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}
						{!!link_to_route('compra.trash', $title = 'Reactivar', $parameters = $compra->id, $attributes = ['class'=>'btn btn-warning btn-sm'])!!}
						{!!link_to_route('compra.destroy', $title = 'Eliminar', $parameters = $compra->id, $attributes = ['class'=>'btn btn-danger btn-sm'])!!}
						</div>
					{!!Form::close()!!}
					
				</td>
			</tbody>
			@endforeach
		</table>
		{!!$compras->render()!!}
		
		
	
@endsection