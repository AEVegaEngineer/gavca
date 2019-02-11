
<div class="content">
<div class="form-group">
	<div class="row margenBotSm">	
		<div class="col-xs-12 col-md-2">
		    {!!Form::label('Nombre del Parámetro: ')!!}			
		</div>
		<div class="col-md-5 col-xs-12">		    
			<select name="ing_ingrediente" class="form-control" placeholder="Escoje un parámetro...">
			    @foreach($parametros as $parametro)
			     <option value="{{ $parametro->par_nombre }}">{{ $parametro->par_nombre}}</option>
			    @endforeach
			</select>
			<input type="hidden" value="{!!$rec_nombre!!}" name="rec_nombre">
		</div>		
    </div>

    <div class="row margenBotSm">
	    <div class="col-xs-12 col-md-2">
			{!!Form::label('Requerimientos Totales: ')!!}			
		</div>
	    <div class="col-md-5 col-xs-12">
	    	{!!Form::text('ing_req_total', null,['class'=>'form-control input-lg','placeholder'=>'Ingresa requerimiento. Ej: 0,0564
	'])!!}
	    </div>
    </div>
    	
    
    
</div>
</div>


