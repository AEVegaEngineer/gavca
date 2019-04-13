@extends('layouts.admin')

@section('content')
<h2 class="form-signin-heading margenBotSm">Por favor, ingrese una nueva compra</h2>
@include('alerts.success')
@include('alerts.request')
@include('alerts.errors')
{!!Form::open(['route'=>'compra.pass','method'=>'POST'])!!}
@include('compra.forms.comp')
{!!Form::submit('Registrar',['class'=>'btn btn-lg btn-success','disabled'=>'true','id'=>'btn-submit'])!!}
{!!Form::close()!!}
@stop