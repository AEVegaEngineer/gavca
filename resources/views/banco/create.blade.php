@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese un nuevo banco</h2>
@include('alerts.request')
{!!Form::open(['route'=>'banco.store','method'=>'POST'])!!}
@include('banco.forms.bnc')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
@stop