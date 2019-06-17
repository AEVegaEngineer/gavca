@extends('layouts.admin')

@section('content')
	@include('alerts.success')
	<div class="row margenBotLg">
		<div class="col-md-12">
			
			<h3>Por favor, confirme que desea cerrar cuentas de fecha {{$fecha}}.</h3>
			<p>Si cierra el día de operación no podrá modificarlo luego.</p>
		</div>
	</div>
	<div class="row margenBotLg">
		<div class="col-md-12">
			<div class="col-md-3 col-xs-12">
				{!!link_to_route('caja.cerrarcaja', $title = 'Cerrar Día', $parameters = ['entidad'=>$entidad,'fecha'=>$fecha], $attributes = ['class'=>'btn btn-success'])!!}
			</div>
		</div>
	</div>
		
		
		
	
@endsection