<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nube Gavca</title>

    {!!Html::style('css/bootstrap.min.css')!!}
    {!!Html::style('css/font-awesome.min.css')!!}
    {!!Html::style('css/estilosPersonalizados.css')!!}

</head>

<body>

    <div id="wrapper">

        <div id="page-wrapper">
            @yield('content')
        </div>

    </div>
    

    {!!Html::script('js/jquery.min.js')!!}
    
    {!!Html::script('js/bootstrap.min.js')!!}

    @section('scripts')
    @show    
</body>

</html>
