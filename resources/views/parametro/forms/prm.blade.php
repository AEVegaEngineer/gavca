
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Nombre del Parámetro: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('par_nombre',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el nombre del parámetro'])!!}
		</div>
    </div>
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Unidad: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('par_unidad',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa la unidad'])!!}
		</div>
    </div>
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Costo: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">	
			{!!Form::number('par_costo', null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el costo con formato. Ej: 2000,00
','step'=>'0.01','min'=>'0.01'])!!}	  
			
		</div>
    </div>
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Observación: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('par_observacion',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa una observación (opcional)'])!!}
		</div>
    </div>
    <div class="row margenBotSm">	
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('¿Parámetro perecedero o imperecedero? ')!!}			
		</div>
		<div class="col-xs-12 col-md-8">	
			
				<?php 
					if(isset($parametro)){
						if(substr($parametro->par_codigo, 0,2) == "MP"){
							?>
							<div class="col-md-6">
								{!!Form::label('Parámetro imperecedero: ')!!}
								{!!Form::radio('par_radio', 'MI', false)!!}
							</div>	
							<div class="col-md-6">
								{!!Form::label('Parámetro perecedero: ')!!}
								{!!Form::radio('par_radio', 'MP', true,['checked' => 'checked'])!!}
							</div>	
							<?php
						}else{
							?>
							<div class="col-md-6">
								{!!Form::label('Parámetro imperecedero: ')!!}
								{!!Form::radio('par_radio', 'MI', true,['checked' => 'checked'])!!}
							</div>	
							<div class="col-md-6">
								{!!Form::label('Parámetro perecedero: ')!!}
								{!!Form::radio('par_radio', 'MP', false)!!}
							</div>	
							<?php
						}
					}else{
					?>
						<div class="col-md-6">
							{!!Form::label('Parámetro imperecedero: ')!!}
							{!!Form::radio('par_radio', 'MI', false)!!}
						</div>	
						<div class="col-md-6">
							{!!Form::label('Parámetro perecedero: ')!!}
							{!!Form::radio('par_radio', 'MP', false)!!}
						</div>
					<?php
					}
				?>
		</div>

    </div>
    
    
</div>
</div>
{!!Html::script('js/jquery.min.js')!!}
