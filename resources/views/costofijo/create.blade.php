@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese los datos del nuevo costo fijo</h2>
@include('alerts.request')
{!!Form::open(['route'=>'costofijo.store','method'=>'POST'])!!}
@include('costofijo.forms.cf')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
	
@stop