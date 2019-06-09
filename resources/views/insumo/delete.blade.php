@extends('layouts.admin')

@section('content')
@include('alerts.request')

<?php if($colision == 1){ ?>

<h3 class="form-signin-heading margenBotLg">El Insumo {!!$insumo->ins_nombre!!} está siendo utilizado.</h3>
<div class="row">
	<div class="form-group">
		<p>El Insumo {{$insumo->ins_nombre}} está siendo utilizado por otro proceso productivo y no puede ser eliminado.</p>

		{!!link_to_route('insumo.index', $title = 'Volver', $parameters = $insumo->id, $attributes = ['class'=>'btn btn-primary'])!!}
	</div>
</div>

<?php }else{ ?>

<h3 class="form-signin-heading margenBotLg">¿Está seguro que desea eliminar el Insumo {!!$insumo->ins_nombre!!}?</h3>
<div class="row">
	<div class="form-group">
		{!!Form::open(['route'=>['insumo.destroy',$insumo->id],'method'=>'DELETE'])!!}
			<div class="col-md-12 col-xs-12">		
				<div class="btn-group">	
					<p>Este Insumo no esta siendo utilizado en ningún proceso productivo y puede ser eliminado.</p>				
					{!!Form::submit('Eliminar',['class'=>'btn btn-danger'])!!}
					{!!link_to_route('insumo.index', $title = 'Volver', $parameters = $insumo->id, $attributes = ['class'=>'btn btn-primary'])!!}
				</div>
			</div>
		{!!Form::close()!!}
	</div>
</div>

<?php } ?>

@stop