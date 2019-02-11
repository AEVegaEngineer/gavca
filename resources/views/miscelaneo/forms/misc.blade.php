
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">
		<h3>Truchas</h3>
	</div>
	<div class="row">
		<div class="col-md-4">
			{!!Form::label('Cantidad de truchas: ')!!}			
		</div>
		<div class="col-md-4">
			{!!Form::label('Costo Unit. de trucha: ')!!}			
		</div>
		<div class="col-md-4">
			{!!Form::label('Kg. de trucha: ')!!}			
		</div>
	</div>
    <div class="row margenBotSm">
    	<div class="col-md-4">
    		{!!Form::text('tru_cant',null,['class'=>'form-control','placeholder'=>'Cantidad de truchas, Ej:100'])!!}
    	</div>
    	<div class="col-md-4">
    		{!!Form::text('tru_cost_unit',null,['class'=>'form-control','placeholder'=>'Costo Unit. de trucha, Ej: 46.44'])!!}
    	</div>
    	<div class="col-md-4">
    		{!!Form::text('tru_kilo',null,['class'=>'form-control','placeholder'=>'Truchas en kilogramos, Ej: 21,12'])!!}
    	</div>
    	
    </div>
    <hr>
    <div class="row margenBotSm">
		<h3>Gas</h3>
	</div>
	<div class="row margenBotSm">
		<div class="col-md-4">
			{!!Form::label('Porcentaje útil de la bombona llena: ')!!}
		</div>
		<div class="col-md-4">
			{!!Form::label('Costo de la bombona: ')!!}
		</div>
	</div>
    <div class="row">
    	<div class="col-md-4">
			{!!Form::text('gas_porc_util',null,['class'=>'form-control','placeholder'=>'Porcentaje útil, Ej:65'])!!}
		</div>
		<div class="col-md-4">
			{!!Form::text('gas_cost_bomb',null,['class'=>'form-control','placeholder'=>'Costo de la bombona, Ej: 6000'])!!}
		</div>
    </div>
</div>
</div>