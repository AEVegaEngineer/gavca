@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotLg">Por favor, ingrese un nuevo cliente</h2>
@include('alerts.request')
{!!Form::open(['route'=>'cliente.store','method'=>'POST'])!!}
@include('cliente.forms.cli')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
@stop