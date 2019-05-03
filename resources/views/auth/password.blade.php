


@extends('layouts.front')

@section('content')

<div class="content">
    <div class="col-md-12" style="background-color:#000; color:#FFF; text-align:center;"><h3><a href="/" style="text-decoration: none;">Sistema Administrativo Gavca</a></h3></div>
    <div class="col-md-4 col-xs-12"></div>
    <div class="col-md-4 col-xs-12 margenBotSm">
        @include('alerts.errors')   
        @include('alerts.request')
        <h1 class="margenBotSm">Restablecimiento de Contraseña</h1>
        <p>Ingresa aquí tu correo electrónico vinculado con tu cuenta en el Sistema Administrativo GAVCA, te será enviado un correo de restablecimento de contraseña, al hacer click en el mismo podrás establecer una nueva contraseña.</p>
        <div class="body">
             <form method="POST" action="/password/email" id="formulario">
                {!! csrf_field() !!}

                @if (count($errors) > 0)
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                @endif

                <div>
                    Email
                    <input type="email" class="form-control input-lg margenBotSm" name="email" value="{{ old('email') }}" placeholder="Ingresa tu correo electrónico">
                </div>

                <div>
                    <button type="submit" class="btn btn-primary margenBotSm">
                        Enviar Vínculo para Restablecer Contraseña
                    </button>
                </div>
                @if (isset($status))
                    <p id="exito" class="alert alert-success">El correo ha sido enviado, por favor revisa tu bandeja de entrada.</p>
                @endif
                
            </form> 
            <hr>
            <a href="/" style="text-align: right;">Volver al Login</a>                   
        </div>
    </div>
    <div class="col-md-4 col-xs-12"></div>
</div>
{!!Html::script('js/jquery.min.js')!!}

