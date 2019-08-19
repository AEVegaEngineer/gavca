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
        Reporte de Cardex de producto {{isset($producciones[0]->rec_nombre)?$producciones[0]->rec_nombre:""}} para el mes de {{$mes_long}} del año {{$fecha_formateada->year}}</h3>
        <h3>Existencia Actual: {{number_format ( $existencia , $decimals = 2 , "," , "." )}}</h3>
        <table class="table">
            <tr>
                <td>Fecha</td>
                <td>Concepto</td>
                <td>Entra</td>
                <td>Sale</td>
                <td>Disponible</td>
                <td align="right">Costo Producción</td>
            </tr>
            <?php $totalEntra = 0; $totalSale = 0; ?>
            @foreach($producciones as $produccion)
            <?php $debe_haber = (isset($produccion->pro_costo)) ? true : false;?>
            <tr>
                <td>{{$produccion->pro_fecha}}</td>
                <td>{{$produccion->pro_concepto}}</td>
                <?php 
                
                echo ''.($debe_haber ? '<td>'.$produccion->pro_produccion.'</td><td></td>' : '<td></td><td>'.$produccion->pro_produccion.'</td>');
                ?>
                <td>{{$produccion->pro_disponible}}</td>
                <td align="right">
                    <?php if (isset($produccion->pro_costo)) echo number_format ( $produccion->pro_costo , $decimals = 2 , "," , "." );?>                   
                </td>
            </tr>
            @endforeach             
            

        
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>