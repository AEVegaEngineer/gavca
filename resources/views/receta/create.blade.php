@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese los datos del Proceso Productivo</h2>
@include('alerts.request')
{!!Form::open(['route'=>'receta.store','method'=>'POST'])!!}
@include('receta.forms.rec')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success'])!!}
{!!Form::close()!!}
@stop