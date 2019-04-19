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
        Reporte de Cardex de materia prima {{$cardexs[0]->par_nombre}} para el mes de {{$mes_long}} del año {{$fecha_formateada->year}}</h3>
        <h3>Existencia actual: {{$existencia}} {{$cardexs[0]->par_unidad}}</h3>
        
        <table class="table">
            <tr>
                <td>Fecha</td>
                <td>Concepto</td>               
                <td>Entra</td>
                <td>Sale</td>
                <td>Disponible</td> 
                <td align="right">Costo de Compra</td>          
            </tr>
            <?php $debe=0;$haber=0;$disponible=0; ?>

            @foreach($cardexs as $cardex)
            <?php 
                $cantidad = $cardex->car_valor_actual - $cardex->car_valor_anterior;      
                $debe_haber = (isset($cardex->comp_fecha)) ? true : false;
                $costo = $cardexs[0]->car_costo; 

            ?>
            <tr>
                <td>
                    <?php 
                    $fecha_compra=date_create($cardex->comp_fecha);
                    echo $fecha = (isset($cardex->comp_fecha)) ? date_format($fecha_compra,"Y-m-d") : $cardex->car_fecha;
                    ?>                  
                </td>
                <?php 
                echo ''.($debe_haber ? '<td>Compra de factura: '.$cardex->comp_doc.'</td>' : '<td>'.$cardex->car_concepto.'</td>');
                ?>
                
                <?php 
                $findme = 'Ajuste -';
                $pos = strpos($cardex->car_concepto, $findme);
                if($pos === true){ 
                    if($cardex->car_valor_anterior < $cardex->car_valor_actual)
                    {
                        echo '<td>'.$cantidad.'</td><td></td>';
                        $debe+=$cantidad;
                    }
                    else
                    {
                        echo '<td></td><td>'.$cantidad*(-1).'</td>';
                        $haber+=$cantidad;
                    }
                }
                else
                {
                    echo ''.($debe_haber ? '<td>'.$cantidad.'</td><td></td>' : '<td></td><td>'.$cantidad*(-1).'</td>');
                }
                ?>  
                <td>{{(int)$cardex->car_valor_actual}}</td>
                <td align="right">
                    <?php echo ''.($debe_haber ? number_format ( $cardex->car_costo , $decimals = 2 , "," , "." ) : ''); ?>                 
                </td>
            </tr>
            
            @endforeach 
            
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>