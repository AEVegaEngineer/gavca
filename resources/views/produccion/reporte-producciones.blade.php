<!-- pdf.blade.php -->

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <script type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/estilosPersonalizados.css">
    </head>
    <body>
        <img src="img/gavcalogo.png" alt="logo de la empresa" style="display: inline-block;">
        <h3  style="display: inline-block; vertical-align: middle; margin-left: 5px; width: 500px">
        Reporte de Producción para el mes de {{$mes_long}} del año {{$fecha_formateada->year}}</h3>
        <table class="table">
            <tr>
                <td>Receta usada</td>
                <td>Fecha de producción</td>
                <td>Cantidad de producción</td>
                <td>Etapa de la producción</td>
                <td>Costo Unitario</td>
            </tr>
            <tbody>
            @foreach($producciones as $produccion)
            <?php 
                if($produccion->pro_costo!=null){
            ?>
            <tr>
                <td>{{$produccion->rec_nombre}}</td>
                <td>{{$produccion->pro_fecha}}</td>
                <td>{{$produccion->pro_produccion}}</td>
                <td>{{$produccion->pro_etapa}}</td>
                <td>{{number_format ( $produccion->pro_costo , $decimals = 2 , "," , "." )}}</td>                
            </tr>
            <?php } ?>
            @endforeach
            </tbody>
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>