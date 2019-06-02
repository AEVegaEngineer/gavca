@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese un nuevo parámetro</h2>
@include('alerts.request')
{!!Form::open(['route'=>'parametro.store','method'=>'POST'])!!}
@include('parametro.forms.prm')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
@stop