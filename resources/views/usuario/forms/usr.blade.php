
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Nombre de usuario: ')!!}			
		</div>
		<div class="col-xs-12 col-md-5">		    
			{!!Form::text('name',null,['class'=>'form-control input-lg','placeholder'=>'Ingresa el nombre del usuario'])!!}
		</div>
    </div>
    <div class="row margenBotSm">
    	<div class="col-md-2 col-xs-12">
		    {!!Form::label('Correo: ')!!}		
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::email('email',null,['class'=>'form-control','placeholder'=>'Ingresa el correo del usuario'])!!}
		</div>		
	</div>
    <div class="row margenBotSm">   
    	<div class="col-md-2 col-xs-12">
		    {!!Form::label('Contraseña: ')!!}
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::password('password',['class'=>'form-control','placeholder'=>'Ingresa la contraseña del usuario'])!!}
		</div>	 		
    </div>
    <?php if(Auth::user()->privilegio == 'admin'){ ?>
    <div class="row margenBotSm">   
    	<div class="col-md-2 col-xs-12">
		    {!!Form::label('Privilegio: ')!!}
		</div>
		<div class="col-md-5 col-xs-12">		    
			{!!Form::select('privilegio', ['admin' => 'Administrador', 'tipo1' => 'Tipo 1', 'tipo2' => 'Tipo 2'], null, ['class'=>'form-control'])!!}
		</div>	 		
    </div>
    <?php } ?>
</div>
</div>