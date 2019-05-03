@extends('layouts.admin')

@section('content')
	<div>
	@include('alerts.success')
		<h3 class="form-signin-heading margenBotLg">Ingrese el requerimiento total de los ingredientes de la producción {{$rec_nombre}} de fecha {{$fecha}}</h3>
		{!!Form::open(['route'=>'produccion.store','method'=>'POST','id'=>'formulario'])!!}
		<div class="col-md-12">
			<div class="col-md-3">
			
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
							<input type="number" min="1" step=".01" required="" name="dependencia[]" id="dep-{{$dependencia->id}}" class="form-control" value="{{$dependencia->requerimiento}}"  autocomplete="off" >
							<input type="hidden" name="dep_hijo[]" value="{{$dependencia->dep_hijo}}">
						</td>
					</tbody>
					@endforeach
					<?php			
					}
					?>
					
					@foreach($ingredientes as $key => $ingrediente)
					<tbody>
						<td>{{$ingrediente->ing_ingrediente}}</td>
						<?php 
						if($ingrediente->ing_default == 1)
						{ 
							$valor = $cantidad_produccion*$ingrediente->ing_ratio;
						}else{ 		
							$valor = "";
						} 
						?>
						
						<td>
							<input type="number" min="1" step=".01" name="req_total[]" class="form-control" value="{{$valor}}"  autocomplete="off" required="">
						</td>	
						<input type="hidden" name="req_ingrediente[]" value="{{$ingrediente->ing_ingrediente}}" required="">
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
@endsection
