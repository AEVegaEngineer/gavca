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
        <h3  style="display: inline-block; vertical-align: middle; margin-left: 5px;">
        Reporte de Compras para la factura Nro.{{$compra->comp_doc}}</h3>
        <table class="table">
            <tr>
                <td>Fecha de compra</td>
                <td>Código del Proveedor</td>
                <td>Documento de factura</td>   
            </tr>
            <tr class="warning">
                <td>{{date("Y/m/d", strtotime($compra->comp_fecha))}}</td>
                <td>{{$compra->comp_proveedor}}</td>
                <td>{{$compra->comp_doc}}</td>
            </tr>
        </table>
        <table class="table">
            <tr>
                <td>Producto</td>
                <td>Código</td>
                <td>Cantidad</td>
                <td>Costo Unitario</td>
                <td>Alicuota</td>
                <td>Base Imponible</td>
                <td>IVA</td>
                <td>Total Producto</td>
            </tr>
            <?php $iva=0 ?>
            @foreach($cardexs as $cardex)
            <?php $cantidad = $cardex->car_valor_actual - $cardex->car_valor_anterior;?>
            <tr>
                <td>{{$cardex->par_nombre}}</td>
                <td>{{$cardex->par_codigo}}</td>
                <td>{{$cantidad}}</td>          
                <td align="right">{{ number_format ( $cardex->car_costo , $decimals = 2 , "," , "." ) }}</td>
                <td>{{$cardex->car_alicuota}}</td>
                <td align="right">{{ number_format ( $costo = $cardex->car_costo*$cantidad , $decimals = 2 , "," , "." ) }}</td>
                <td align="right">{{ number_format ( $cardex->car_iva , $decimals = 2 , "," , "." ) }}</td>
                <td align="right">{{ number_format ( $costo+$cardex->car_iva , $decimals = 2 , "," , "." ) }}</td>
                <?php $iva+=$costo;?>
            </tr>
            @endforeach
            <tr class="success">
                <td><b>TOTALES</b></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td align="right"><b>{{ number_format ( $iva , $decimals = 2 , "," , "." ) }}</b></td>
                <td align="right"><b>{{ number_format ( $compra->comp_monto-$iva , $decimals = 2 , "," , "." ) }}</b></td>
                <td align="right"><b>{{ number_format ( $compra->comp_monto , $decimals = 2 , "," , "." ) }}</b></td>
            </tr>
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>