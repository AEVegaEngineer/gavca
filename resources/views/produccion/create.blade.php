@extends('layouts.admin')
@section('content')
@include('alerts.errors')
<h2 class="form-signin-heading margenBotLg">Por favor, ingrese datos de producción para la receta {{$receta}}</h2>
@include('alerts.request')
@include('alerts.errors')
{!!Form::open(['route'=>'produccion.pass','method'=>'POST'])!!}
@include('produccion.forms.prd')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
	
@stop