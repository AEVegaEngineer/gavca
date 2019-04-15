@extends('layouts.admin')

@section('content')
	<div>
	@include('alerts.success')
		<h3 class="form-signin-heading margenBotLg">Ingrese el requerimiento total de los ingredientes de la producción {{$rec_nombre}} de fecha {{$fecha}}</h3>
		{!!Form::open(['route'=>'produccion.store','method'=>'POST','id'=>'formulario'])!!}
		<!--<form method="POST" action="/{{$rec_nombre}}/{{$fecha}}/update">-->			
		<div class="col-md-12">
			<div class="col-md-3">
			
			<!--<a href="#" id="req_upd" class="btn btn-primary">Actualizar Requerimientos</a>	-->
			</div>
			<div class="col-md-6">
				{!!Form::submit('Actualizar Requerimientos',['class'=>'btn btn-lg btn-success', 'id'=>'req_upd'])!!}
				<hr>
				<table class="table">
					<thead>
						<th>Nombre</th>
						<th>Requerimiento total</th>
					</thead>
					<?php
					if(!empty($dependencias)){
					?>
					@foreach($dependencias as $dependencia)
					<tbody>
						<td>{{$dependencia->dep_hijo}}</td>	
						<td>
							<input type="text" required="" name="dependencia[]" id="dep-{{$dependencia->id}}" class="form-control" value="{{$dependencia->requerimiento}}"  autocomplete="off" >
							<input type="hidden" name="dep_hijo[]" value="{{$dependencia->dep_hijo}}">
						</td>					
						<!---->
					</tbody>
					@endforeach
					<?php			
					}
					?>
					
					@foreach($requerimientos as $key => $requerimiento)
					<tbody>
						<td>{{$requerimiento->req_ingrediente}}</td>
						<?php if($requerimiento->req_ingrediente == $ingredientes[$key]->ing_ingrediente && $ingredientes[$key]->ing_default == 1){ 
							$valor = $cantidad_produccion*$ingredientes[$key]->ing_ratio;
						?>	

						<td>
							<input type="text" name="req_total[]" id="val-{{$requerimiento->req_ingrediente}}" class="form-control" value="{{$valor}}"  autocomplete="off" required="">
						</td>			
						<?php }else{ ?>		
						<td>
							<input type="text" name="req_total[]" id="val-{{$requerimiento->req_ingrediente}}" class="form-control" value=""  autocomplete="off" required="">
							<!-- {{$requerimiento->req_total}}-->
						</td>
						<?php } ?>	
						<input type="hidden" name="req_ingrediente[]" value="{{$requerimiento->req_ingrediente}}" required="">	
						<!---->
					</tbody>			
					@endforeach



				</table>
			<input type="hidden" name="_token" value="{{csrf_token()}}" id="token">

			<input type="hidden" name="pro_fecha" value="{{$fecha}}" id="pro_fecha">
			<input type="hidden" name="rec_nombre" value="{{$rec_nombre}}" id="rec_nombre">
			<input type="hidden" name="pro_produccion" value="{{$cantidad_produccion}}" id="pro_produccion">
			<input type="hidden" name="pro_mano_obra" value="{{$pro_mano_obra}}" id="pro_mano_obra">

			</div>	
		</div>
		{!!Form::close()!!}
		
	</div>
	<script src="{{ asset('/js/jquery.min.js') }}" type="text/javascript"></script>
	<script type="text/javascript">
		var rec_nombre = "<?php echo $rec_nombre; ?>";
		var req_fecha = "<?php echo $fecha; ?>";
		var pro_etapa = "<?php echo $rec_etapa; ?>";
		var cantidad_produccion = "<?php echo $cantidad_produccion; ?>";
		var pro_mano_obra = "<?php echo $pro_mano_obra; ?>";

		//var dep_hijo = "<?php //echo $dependencia->dep_hijo; ?>"; 
	</script>
	<!--<script src="{{ asset('/js/requerimiento/requpd.js?11') }}" type="text/javascript">-->
	</script>
@endsection
