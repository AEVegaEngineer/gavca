
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Nombre del Insumo: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('ins_nombre',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el nombre del Insumo'])!!}
		</div>
    </div>
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Unidad: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('ins_unidad',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa la unidad'])!!}
		</div>
    </div>
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Costo: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::number('ins_costo', null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el costo con formato. Ej: 2,000.00
','step'=>'0.0001','min'=>'0.0001'])!!}	  
			
		</div>
    </div>
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Observación: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('ins_observacion',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa una observación (opcional)'])!!}
		</div>
    </div>  
    
    
</div>
</div>
{!!Html::script('js/jquery.min.js')!!}
