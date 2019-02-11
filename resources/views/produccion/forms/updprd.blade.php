	<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
    
    
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">			
		<div class="col-xs-12 col-md-4">
		    {!!Form::label('Ingresa la cantidad que se ha producido: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('pro_produccion',null,['class'=>'form-control','placeholder'=>'Ej: 456'])!!}
		</div>
    </div>
    <div class="row margenBotSm">
    	<div class="col-xs-12 col-md-4">
		    {!!Form::label('Fecha de la producción: ')!!}		
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('pro_fecha',null,['class'=>'form-control datepicker','placeholder'=>'Click aquí para fijar fecha'])!!}	 
		</div>		
	</div>
	<div class="row margenBotSm">
    	<div class="col-xs-12 col-md-4">
		    {!!Form::label('Requerimiento total de mano de obra: ')!!}		
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('pro_mano_obra',null,['class'=>'form-control','placeholder'=>'Ej:2.5'])!!}	 
		</div>		
	</div>
	<div class="row">
		<div class="col-xs-12 col-md-8">
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
						<input type="text" name="dependencia[]" id="dep-{{$dependencia->id}}" class="form-control" value="{{$dependencia->requerimiento}}"  autocomplete="off" >
						<input type="hidden" name="dep_hijo[]" value="{{$dependencia->dep_hijo}}">
					</td>					
					<!---->
				</tbody>
				@endforeach
				<?php			
				}
				?>
				
				@foreach($requerimientos as $requerimiento)
				<tbody>
					<td>{{$requerimiento->req_ingrediente}}</td>
					<?php if($requerimiento->req_default == 1){ 
						$valor = $cantidad_produccion*$requerimiento->req_ratio/120;

					?>	

					<td>
						<input type="text" name="req_total[]" id="val-{{$requerimiento->req_ingrediente}}" class="form-control" value="{{$requerimiento->req_total}}"  autocomplete="off" >
					</td>			
					<?php }else{ ?>		
					<td>
						<input type="text" name="req_total[]" id="val-{{$requerimiento->req_ingrediente}}" class="form-control" value="{{$requerimiento->req_total}}"  autocomplete="off" >
						<!-- {{$requerimiento->req_total}}-->
					</td>
					<?php } ?>	
					<input type="hidden" name="req_ingrediente[]" value="{{$requerimiento->req_ingrediente}}">	
					<!---->
				</tbody>			
				@endforeach
			</table>
		</div>
	</div>
	
	<?php if(isset($produccion)){ ?>
	<input type="hidden" name="previous_value" id="previous_value" value="{{$produccion->pro_produccion}}">
	<?php } ?>
</div>
</div>
<!-- Jquery -->
    {!!Html::script('js/jquery.min.js')!!}
	<!-- Datepicker Files -->    
    {!!Html::script('js/bootstrap-datepicker.js')!!}
    <!-- Languaje -->
    {!!Html::script('locales/bootstrap-datepicker.es.min.js')!!}

<script type="text/javascript">
	$('.datepicker').datepicker({
	    format: "yyyy-mm-dd",
	    language: "es",
	    autoclose: true
	});
</script>
