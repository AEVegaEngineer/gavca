@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotLg">Por favor, ingrese datos de producción para la receta</h2>
@include('alerts.request')
{!!Form::open(['route'=>'produccion.store','method'=>'POST'])!!}
@include('produccion.forms.prd')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
	
@stop