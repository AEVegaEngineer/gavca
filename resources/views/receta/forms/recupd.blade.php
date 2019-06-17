
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Nombre de Proceso Productivo: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('rec_nombre',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el nombre del Proceso Productivo','required'=>'required'])!!}
		</div>
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-3 col-xs-12">
		    {!!Form::label('¿Activar Proceso Productivo?')!!}		
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::select('rec_activo', ['si' => 'Sí', 'no' => 'No'], null, ['class'=>'form-control','placeholder' => 'Escoje si el Proceso Productivo estará activo...','required'=>'required'])!!}
		</div>	 		
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-3 col-xs-12">
		    {!!Form::label('¿Que proceso llevará a cabo? ')!!}		
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::select('rec_proc', ['PA' => 'Producto Semiprocesado', 'PB' => 'Producto Terminado', 'PC' => 'Presentación'], null, ['class'=>'form-control','required'=>'required'])!!}
		</div>	 		
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-3 col-xs-12">
		    {!!Form::label('Unidad del Proceso Productivo')!!}		
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::text('rec_unidad', null, ['class'=>'form-control','placeholder' => 'Unidad, Ej. KILOS','required'=>'required'])!!}
		</div>	 		
    </div>
</div>
</div>