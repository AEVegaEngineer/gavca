
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Nombre de receta: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('rec_nombre',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el nombre de la receta'])!!}
		</div>
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-2 col-xs-12">
		    {!!Form::label('¿Activar receta?')!!}		
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::select('rec_activo', ['si' => 'Sí', 'no' => 'No'], null, ['placeholder' => 'Escoje si la receta estará activa...'])!!}
		</div>	 		
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-2 col-xs-12">
		    {!!Form::label('Cantidad de producción')!!}		
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::number('rec_produccion',null,['class'=>'form-control','placeholder'=>'Ingresa la cantidad de producción'])!!}
		</div> 		
    </div>
</div>
</div>