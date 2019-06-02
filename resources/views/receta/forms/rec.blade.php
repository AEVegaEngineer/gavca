
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Nombre de Proceso Productivo: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('rec_nombre',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el nombre del proceso productivo'])!!}
		</div>
    </div>
    <input type="hidden" name="rec_activo" value="si">    
    <div class="row margenBotSm">
    	<div class="col-md-3 col-xs-12">
		    {!!Form::label('¿Que proceso se llevará a cabo? ')!!}		
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::select('rec_proc', ['PA' => 'Producto Semiprocesado', 'PB' => 'Producto Terminado', 'PC' => 'Presentación'], null, ['class'=>'form-control','placeholder' => 'Escoje el proceso...'])!!}
		</div>	 		
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-3 col-xs-12">
		    {!!Form::label('Unidad del proceso')!!}		
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::text('rec_unidad', null, ['class'=>'form-control','placeholder' => 'Unidad, Ej. KILOS'])!!}
		</div>	 		
    </div>
    
</div>
</div>