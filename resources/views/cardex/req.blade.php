@extends('layouts.admin')

@section('content')
	<div>
	@include('alerts.success')
		<h3 class="form-signin-heading margenBotLg">Ingrese el requerimiento total de los ingredientes de la producción {{$rec_nombre}} de fecha {{$fecha}}</h3>
		<form method="PUT" action="/{{$rec_nombre}}/{{$fecha}}/update">			
		
		<div class="col-md-3">
		<a href="#" id="req_upd" class="btn btn-primary">Actualizar Requerimientos</a>	
		</div>
		<div class="col-md-6">
		<table class="table">
			<thead>
				<th>Nombre</th>
				<th>Requerimiento total</th>
			</thead>
			@foreach($requerimientos as $requerimiento)
			<tbody>
				<td>{{$requerimiento->req_ingrediente}}</td>	
				<td>
					<input type="text" name="req_total[]" id="val-{{$requerimiento->req_ingrediente}}" class="form-control" value="{{$requerimiento->req_total}}">
				</td>					
				<!---->
			</tbody>
			@endforeach



		</table>
		<input type="hidden" name="_token" value="{{csrf_token()}}" id="token">
		</div>
		<div class="col-md-3"></div>	
		
		</form>	
		
	</div>
	<script src="{{ asset('/js/jquery.min.js') }}" type="text/javascript"></script>
	<script type="text/javascript">
		var rec_nombre = "<?php echo $rec_nombre; ?>";
		var req_fecha = "<?php echo $fecha; ?>";
	</script>

	<script src="{{ asset('/js/requerimiento/requpd.js?2') }}" type="text/javascript"></script>
@endsection
