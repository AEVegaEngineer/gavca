@extends('layouts.admin')

@section('content')
@include('alerts.request')

<?php if($colision == 1){ ?>

<h3 class="form-signin-heading margenBotLg">El parámetro {!!$parametro->par_nombre!!} está siendo utilizado.</h3>
<div class="row">
	<div class="form-group">
		<p>El parámetro {{$parametro->par_nombre}} está siendo utilizado por otra receta y no puede ser eliminado.</p>

		{!!link_to_route('parametro.index', $title = 'Volver', $parameters = $parametro->id, $attributes = ['class'=>'btn btn-primary'])!!}
	</div>
</div>

<?php }else{ ?>

<h3 class="form-signin-heading margenBotLg">¿Está seguro que desea eliminar el parámetro {!!$parametro->par_nombre!!}?</h3>
<div class="row">
	<div class="form-group">
		{!!Form::open(['route'=>['parametro.destroy',$parametro->id],'method'=>'DELETE'])!!}
			<div class="col-md-12 col-xs-12">		
				<div class="btn-group">	
					<p>Este parámetro no esta siendo utilizado en ninguna receta y puede ser eliminado.</p>				
					{!!Form::submit('Eliminar',['class'=>'btn btn-danger'])!!}
					{!!link_to_route('parametro.index', $title = 'Volver', $parameters = $parametro->id, $attributes = ['class'=>'btn btn-primary'])!!}
				</div>
			</div>
		{!!Form::close()!!}
	</div>
</div>

<?php } ?>

@stop