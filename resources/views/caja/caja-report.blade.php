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
        <?php
            $time = strtotime($records[0]->cb_fecha);
            $date = date('Y-m-d',$time);
            if($caja == "")
                $caja = "Caja Chica";
        ?>
        Reporte de {{$caja}} de fecha {{$date}}</h3>
        <table class="table table-bordered">
            <tr>             
                <td>Concepto</td>
                <td align="right">Debe</td>              
                <td align="right">Haber</td>
                <td align="right">Saldo</td>
            </tr>
            <?php $t_sale = 0; $t_entra = 0; $t_saldo = 0; ?>
            @foreach($records as $record)
            <tr>
                <td>{{$record->cb_concepto}}</td>
                <?php 
                //sobreescribo el saldo xq me interesa el ultimo valor q se escriba
                $t_saldo = $record->cb_saldo;
                if($record->cb_debe_haber == "DEBE"){
                    $t_entra += $record->cb_monto;
                    echo '<td align="right">'.number_format ( $record->cb_monto , $decimals = 2 , "," , "." ).'</td><td></td>';
                }else if($record->cb_debe_haber == "HABER" && $record->cb_concepto == "Inicio de caja"){
                    echo '<td></td><td align="right">'.number_format ( $record->cb_monto , $decimals = 2 , "," , "." ).'</td>';
                }else{
                    $t_sale += $record->cb_monto;
                    echo '<td></td><td align="right">'.number_format ( $record->cb_monto , $decimals = 2 , "," , "." ).'</td>';
                }
                ?>

                <td align="right"><?php echo number_format ( $record->cb_saldo , $decimals = 2 , "," , "." ); ?></td>              
            </tr>
            @endforeach 
            <tr>
                <td><b>TOTAL</b></td>
                <td align="right"><b><?php echo number_format ( $t_entra , $decimals = 2 , "," , "." ); ?></b></td>
                <td align="right"><b><?php echo number_format ( $t_sale , $decimals = 2 , "," , "." ); ?></b></td>
                <td align="right"><b><?php echo number_format ( $t_saldo , $decimals = 2 , "," , "." ); ?></b></td>
            </tr>
        </table>
     <script src="js/jquery.min.js"></script> 
     <script src="js/bootstrap.min.js"></script> 
    </body>
</html>