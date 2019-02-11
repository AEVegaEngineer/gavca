
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Descripción del aumento: ')!!}			
		</div>
		<div class="col-xs-12 col-md-7">		    
			{!!Form::text('aum_descripcion',null,['class'=>'form-control','placeholder'=>'Ingresa una descrición del aumento, ej: Diciembre 2016 Gaceta N° 41.256'])!!}
		</div>
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-2 col-xs-12">
		    {!!Form::label('Ingresa el porcentaje del aumento')!!}		
		</div>
		<div class="col-md-4 col-xs-12">		    
			{!!Form::text('aum_aumento',null,['class'=>'form-control','placeholder'=>'Ingresa el porcentaje del aumento, ej: 10%'])!!}
		</div>	 		
    </div>
</div>
</div>