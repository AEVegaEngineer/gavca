@extends('layouts.admin')

@section('content')
	@include('alerts.success')
	{!!Form::open(['route'=>'caja.store','method'=>'POST'])!!}
	<div class="row margenBotLg">
		<div class="col-md-12">
			
			<h3>Seleccione cual saldo quiere actualizar e ingrese su valor.</h3>
		</div>
	</div>
	<div class="row margenBotLg">
		<div class="col-md-12">
			<div class="col-md-5 col-xs-12">		    
				{!!Form::select('entidad', ['Caja Chica' => 'Caja Chica', 'Banco De Venezuela' => 'Banco De Venezuela', 'Banco Provincial' => 'Banco Provincial', 'Banco Banesco' => 'Banco Banesco', 'Banco Mercantil' => 'Banco Mercantil'], null, ['class'=>'form-control','placeholder' => 'Escoje cual saldo actualizar...'])!!}
			</div>	
			<div class="col-md-5 col-xs-12">		    
				{!!Form::text('valor', null, ['class'=>'form-control','placeholder' => 'Ingrese el saldo aquí'])!!}
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-5 col-xs-12">		
			{!!Form::submit('Actualizar',['class'=>'btn btn-lg btn-success'])!!}
			</div>
			
			<input type="hidden" name="s_cajachica" id="s_cajachica" value="{{$s_cajachica}}">	 
			<input type="hidden" name="s_venezuela" id="s_venezuela" value="{{$s_venezuela}}">
			<input type="hidden" name="s_provincial" id="s_provincial" value="{{$s_provincial}}">
			<input type="hidden" name="s_banesco" id="s_banesco" value="{{$s_banesco}}">
			<input type="hidden" name="s_mercantil" id="s_mercantil" value="{{$s_mercantil}}">	 
		</div>
	</div>
	{!!Form::close()!!}
	{!!Html::script('js/jquery.min.js')!!}
	<script type="text/javascript">
		$(document).ready(function() {
			$('select[name=entidad]').change(function(){	      
				var entidad = $(this).val();
				if(entidad == 'Caja Chica'){
					var valor = $('#s_cajachica').val();
					$('input[name=valor]').val(valor);
				}else if(entidad == 'Banco De Venezuela'){
					var valor = $('#s_venezuela').val();
					$('input[name=valor]').val(valor);
				}else if(entidad == 'Banco Provincial'){
					var valor = $('#s_provincial').val();
					$('input[name=valor]').val(valor);
				}else if(entidad == 'Banco Banesco'){
					var valor = $('#s_banesco').val();
					$('input[name=valor]').val(valor);
				}else if(entidad == 'Banco Mercantil'){
					var valor = $('#s_mercantil').val();
					$('input[name=valor]').val(valor);
				}
			});
		});
	</script>	
		
		
	
@endsection