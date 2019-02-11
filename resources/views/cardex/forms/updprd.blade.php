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
