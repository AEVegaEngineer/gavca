
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Concepto: ')!!}			
		</div>
		<div class="col-xs-12 col-md-6">		    
			{!!Form::text('cf_concepto',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el concepto, Ej: ALQUILER PLANTA MOCOTIES
'])!!}
		</div>
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-2 col-xs-12">
		    {!!Form::label('Monto mes: ')!!}		
		</div>
		<div class="col-md-4 col-xs-12">		    
			{!!Form::text('cf_montomes',null,['class'=>'form-control','placeholder'=>'Ingresa el monto mes, Ej: 18.928,00'])!!}
		</div>		
	</div>
</div>
</div>