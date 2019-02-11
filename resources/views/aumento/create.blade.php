@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese los datos del aumento</h2>
@include('alerts.request')
{!!Form::open(['route'=>'aumento.store','method'=>'POST'])!!}
@include('aumento.forms.rec')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
@stop