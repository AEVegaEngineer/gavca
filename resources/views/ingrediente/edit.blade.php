@extends('layouts.admin')

@section('content')
	<div class="users">
	@include('alerts.success')
		<a href="/receta" class="btn btn-primary btn-large">Volver a Procesos Productivos</a>
		<h2 class="form-signin-heading margenBotSm">Proceso Productivo {!!$rec_nombre!!}</h2>
		
		<div class="col-md-6">
			<table class="table table-bordered" id="content">			
				<thead>
					<th>Materia prima</th>				
					<th>Operación</th>
				</thead>	
				@foreach($dependencias as $dependencia)
				<tr>
					<td>{{$dependencia->dep_hijo}}</td>				
					<td>					
						{!!Form::open(['route'=>['dependencia.destroy',$dependencia->id],'method'=>'DELETE'])!!}
							<div class="btn-group">
							{!!Form::submit('Quitar',['class'=>'btn btn-danger btn-xs'])!!}
							</div>
						{!!Form::close()!!}					
					</td>
				</tr>
				@endforeach			
				@foreach($parametros as $parametro)
				<tr>
					<td>{{$parametro->par_nombre}}</td>				
					<td>					
						{!!Form::open(['route'=>['ingrediente.destroy',$parametro->id],'method'=>'DELETE'])!!}
							<div class="btn-group">
							{!!Form::submit('Quitar',['class'=>'btn btn-danger btn-xs'])!!}
							</div>
						{!!Form::close()!!}					
					</td>
				</tr>
				@endforeach
			</table>
			<table class="table table-bordered" id="content">			
				<thead>
					<th>Insumos</th>				
					<th>Operación</th>
				</thead>							
				@foreach($insumosusados as $insumousado)
				<tr>
					<td>{{$insumousado->insing_insumo}}</td>				
					<td>					
						{!!Form::open(['route'=>['insumousado.destroy',$insumousado->id],'method'=>'DELETE'])!!}
							<div class="btn-group">
							{!!Form::submit('Quitar',['class'=>'btn btn-danger btn-xs'])!!}
							</div>
						{!!Form::close()!!}					
					</td>
				</tr>
				@endforeach
			</table>	
		</div>
		<div class="col-md-6">
			<!--SECCION PARA LA SELECCION DE PRODUCTO A O B-->
			<?php if($receta->rec_proc == "PB"){?>
				<label>Debes agregar al menos un producto semiprocesado de la lista desplegable a este proceso productivo.</label>
				<select name="product" id="product" class="form-control margenBotSm" placeholder="Escoje un producto...">
					<option value="" disabled selected>Selecciona un producto semiprocesado...</option>
				    @foreach($productosa as $productoa)
				    	<option value="{{ $productoa->rec_nombre }}">{{ $productoa->rec_nombre}}</option>
				    @endforeach
				</select>			
			<?php }else if($receta->rec_proc == "PC"){?>
				<label>Debes agregar al menos un producto terminado de la lista desplegable a este proceso productivo.</label>
				<select name="product" id="product" class="form-control margenBotSm" placeholder="Escoje un producto...">
					<option value="" disabled selected>Selecciona un producto terminado...</option>
				    @foreach($productosb as $productob)
				    	<option value="{{ $productob->rec_nombre }}">{{ $productob->rec_nombre}}</option>
				    @endforeach
				</select>				
			<?php } if($receta->rec_proc != "PA"){ ?>				
				<a href="#" class="btn btn-primary btn-sm" id="addProduct">Agregar producto a proceso productivo</a>
			<?php }?>				
			<!--FIN DE SECCION PARA SELECCION DE PRODUCTO-->

			<!--SECCIÓN PARA SELECCIÓN DE PARÁMETROS-->
			<hr>
			<p>Para agregar parámetros al proceso productivo seleccionalos de la lista desplegable y haz click en agregar parámetro</p>			
			<select name="ing_ingrediente" id="ing_ingrediente" class="form-control" placeholder="Escoje un parámetro...">
				<option value="" disabled selected>Selecciona un parámetro...</option>
			    @foreach($parametros_all as $parametro)			    	
			    	<option value="{{ $parametro->par_nombre }}">{{ $parametro->par_nombre}}</option>
			    @endforeach
			</select>			
			<input type="hidden" name="_token" value="{{csrf_token()}}" id="token">
			<input type="hidden" name="rec_nombre" value="{{$rec_nombre}}" id="rec_nombre">
			<div class="row margenBotSm">	
		    	<div class="col-xs-12 col-md-12">
				    {!!Form::label('¿Este parámetro tomará su valor según la cantidad de producción? ')!!}			
				</div>
				<div class="col-xs-12 col-md-12">
					<!--<input type="checkbox" name="par_default" checked="checked">-->
					{!!Form::hidden('par_default',0)!!}
					<input type="checkbox" name="par_default" id="par_default" class="form-control">
				</div>
			</div>
			<div class="row escondido">
				<div class="col-xs-12 col-md-12">
				    {!!Form::label('Escribe la relación entre parámetro y producción, Ej: Escribe "12" si la relación es 12 a 1')!!}			
				</div>
				<div class="col-xs-12 col-md-4">
					{!!Form::text('ing_ratio',1,['class'=>'form-control','placeholder'=>'Ej: 12','id'=>'ing_ratio','step'=>'0.0001','min'=>'0.0001'])!!}
				</div>
			</div>
			<a href="#" class="btn btn-primary btn-sm" id="add">Agregar parámetro al proceso productivo</a>
			<!--FIN DE SECCIÓN PARA SELECCIÓN DE PARÁMETROS-->

			<!--SECCIÓN PARA SELECCIÓN DE INSUMOS-->
			<hr>
			<p>Para agregar insumos al proceso productivo seleccionalos de la lista desplegable y haz click en Agregar Insumo a Proceso Productivo</p>
			
			<select name="insing_insumo" id="insing_insumo" class="form-control" placeholder="Escoje un insumo...">
				<option value="" disabled selected>Selecciona un insumo...</option>
			    @foreach($insumos as $insumo)
			    	<option value="{{ $insumo->ins_nombre }}">{{ $insumo->ins_nombre}}</option>
			    @endforeach
			</select>		
			<div class="row margenBotSm">	
		    	<div class="col-xs-12 col-md-12">
				    {!!Form::label('¿Este insumo tomará su valor según la cantidad de producción? ')!!}			
				</div>
				<div class="col-xs-12 col-md-12">
					{!!Form::hidden('insing_default',0)!!}
					<input type="checkbox" name="insing_default" id="insing_default" class="form-control">
				</div>
			</div>
			<div class="row escondido-2">
				<div class="col-xs-12 col-md-12">
				    {!!Form::label('Escribe la relación entre insumo y producción, Ej: Escribe "12" si la relación es 12 a 1')!!}			
				</div>
				<div class="col-xs-12 col-md-4">
					{!!Form::text('insing_ratio',1,['class'=>'form-control','placeholder'=>'Ej: 12','id'=>'insing_ratio','step'=>'0.0001','min'=>'0.0001'])!!}					
				</div>
			</div>
			<a href="#" class="btn btn-primary btn-sm" id="addInsumo">Agregar Insumo a Proceso Productivo</a>
			<!--FIN DE SECCIÓN PARA SELECCIÓN DE INSUMOS-->
		</div>
			
	</div>
	
	<script src="{{ asset('/js/jquery.min.js') }}" type="text/javascript"></script>
	<script type="text/javascript">
		var rec_nombre = "<?php echo $rec_nombre; ?>";
	</script>
	{!!Html::script('js/ingrediente/Ingrediente.js?17')!!}
	{!!Html::script('js/ingrediente/paramFormFadeIn.js?2')!!}
	{!!Html::script('js/ingrediente/insumoFormFadeIn.js?2')!!}
@endsection