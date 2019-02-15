@extends('layouts.admin')

@section('content')
	@include('alerts.success')
		<h2 class="form-signin-heading">Base de datos de Compras</h2>
		<table class="table">
			<thead>
				<th>Fecha de Compra</th>
				<th>Código del Proveedor</th>
				<th>Tipo</th>
				<th>Documento de factura</th>	
				<th>Monto</th>
				<th>Operaciones</th>
			</thead>
			@foreach($compras as $compra)
			<tbody>
				<td>{{date("Y/m/d", strtotime($compra->comp_fecha))}}</td>
				<td>{{$compra->comp_proveedor}}</td>
				<td>{{$compra->comp_cred_cont}}</td>
				<td>{{$compra->comp_doc}}</td>			
				<td align="right">{{ number_format ( $compra->comp_monto , $decimals = 2 , "," , "." ) }}</td>

				<td>
					
					{!!Form::open(['route'=>['compra.destroy',$compra->id],'method'=>'DELETE'])!!}
						<div class="btn-group">
						{!!link_to_route('compra.show', $title = 'Ver Factura', $parameters = $compra->id, $attributes = ['class'=>'btn btn-primary btn-sm'])!!}					
						</div>
					{!!Form::close()!!}
					
				</td>
			</tbody>
			@endforeach
		</table>
		{!!$compras->render()!!}
		
		
	
@endsection