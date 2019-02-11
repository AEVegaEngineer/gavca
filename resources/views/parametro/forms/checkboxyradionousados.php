<div class="row margenBotSm">	
    	<div class="col-xs-12 col-md-3">
		    {!!Form::label('¿Este parámetro tomará su valor según la cantidad de producción? ')!!}			
		</div>
		<div class="col-xs-12 col-md-6">
			<!--<input type="checkbox" name="par_default" checked="checked">-->
			{!!Form::hidden('par_default',0)!!}
			{!!Form::checkbox('par_default')!!}
		</div>
	</div>
	<div class="row escondido">
		<div class="col-xs-12 col-md-3">
		    {!!Form::label('Si tuvieses una producción de 120 unidades, ¿Cuántos elementos de estos usarías? ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">
			{!!Form::text('par_ratio', null,['class'=>'form-control input-lg','placeholder'=>' Ej: Para caja de 12 Unid. usarás 10 
'])!!}
		</div>
	</div>
	{!!Html::script('js/parametro/paramFormFadeIn.js?2')!!}