@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotMd">Actualización de datos para Salarios</h2>
@include('alerts.request')
@include('alerts.success')
<div class="row">
	<div class="form-group">
		
		@include('salario.forms.recupd')
		
	</div>
</div>
@stop