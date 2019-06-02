	<!-- Datepicker Files -->
    {!!Html::style('css/bootstrap-datepicker3.css')!!}
    

<div class="content">
<div class="form-group">
	<div class="row margenBotSm">			
		<div class="col-xs-12 col-md-4">
		    {!!Form::label('Ingresa la cantidad que se ha producido: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('pro_produccion',null,['class'=>'form-control','placeholder'=>'Ej: 456','required'=>'required'])!!}
		</div>
    </div>
    <div class="row margenBotSm">
    	<div class="col-xs-12 col-md-4">
		    {!!Form::label('Fecha de la producción: ')!!}		
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('pro_fecha',$fecha,['class'=>'form-control','placeholder'=>'Click aquí para fijar fecha','required'=>'required','readonly'=>'true'])!!}	 
		</div>		
	</div>
	<div class="row margenBotSm">
    	<div class="col-xs-12 col-md-4">
		    {!!Form::label('Requerimiento total de mano de obra: ')!!}		
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::text('pro_mano_obra',null,['class'=>'form-control','placeholder'=>'Ej:2.5','required'=>'required'])!!}	 
		</div>		
	</div>
	<?php $header = 0; ?>
	
	@foreach($dependencias as $dependencia)
	<div class="row margenBotSm">
		<?php
		$header++;
		if($header != 0){
		?>
			<p>Escoja el costo para los productos usados en este proceso productivo según los costos de producción.</p>
		<?php }	?>
    	<div class="col-xs-12 col-md-4">
    		<label>Escoja el costo para el producto {{$dependencia->dep_hijo}}: </label>	
		</div>

		<div class="col-xs-12 col-md-5">	
			<select name="dep_produccion[]" class="form-control" required="required">
				<option value="" disabled selected>Escoje cuál costo tomar para los cálculos...</option>
				@foreach($producciones as $produccion)
				<?php if($dependencia->dep_hijo == $produccion->rec_nombre) { ?>		<option value="{{$produccion->id}}_{{$produccion->rec_nombre}}">Fecha {{$produccion->pro_fecha}}, Costo:{{$produccion->pro_costo}}</option>
				<?php } ?>
				@endforeach
			</select>
			
		</div>		
	</div>
	@endforeach
	<p>NOTA: Si el costo del producto no aparece en la lista desplegable para poder seleccionarlo, se debe a que no has creado producción para ese producto.</p>
	
	
    <input type="hidden" name="rec_nombre" value="{{$receta}}">
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
