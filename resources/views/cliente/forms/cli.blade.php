
<div class="content">
<div class="form-group">
	<div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Código del cliente: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('cli_codigo', null,['class'=>'form-control','placeholder'=>'Ingresa el Código del cliente', 'required'=>'required','readonly'=>'readonly'])!!}    		
    	</div>
    </div>
	<div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Nombre del cliente: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('cli_nombre', null,['class'=>'form-control','placeholder'=>'Ingresa el nombre del cliente', 'required'=>'required'])!!}    		
    	</div>
    </div>
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Rif del cliente: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('cli_rif', null,['class'=>'form-control','placeholder'=>'Ingresa el rif del cliente', 'required'=>'required'])!!}
    	</div>
    </div>
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Dirección del cliente: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('cli_direccion', null,['class'=>'form-control','placeholder'=>'Ingresa la dirección del cliente', 'required'=>'required'])!!}
    	</div>
    </div>
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Contácto del cliente: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('cli_contacto', null,['class'=>'form-control','placeholder'=>'Ingresa el contácto del cliente', 'required'=>'required'])!!}
    	</div>
    </div>
    <div class='row margenBotSm'>
    	<div class='col-xs-12 col-md-4'>
    		{!!Form::label('Condiciones del cliente: ')!!}
    	</div>
    	<div class='col-xs-12 col-md-5'>
    		{!!Form::text('cli_condiciones', null,['class'=>'form-control','placeholder'=>'Ingresa las condiciones del cliente'])!!}
    	</div>
    </div>
    
</div>
</div>