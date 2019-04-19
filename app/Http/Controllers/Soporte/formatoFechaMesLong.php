<?php
function getMesLong($fecha){
    $mes = $fecha['5'].$fecha['6'];
    $mes_long = "";
    switch ($mes) {
        case '01':
            $mes_long = "Enero";
            break;
        case '02':
            $mes_long = "Febrero";
            break;
        case '03':
            $mes_long = "Marzo";
            break;
        case '04':
            $mes_long = "Abril";
            break;
        case '05':
            $mes_long = "Mayo";
            break;
        case '06':
            $mes_long = "Junio";
            break;
        case '07':
            $mes_long = "Julio";
            break;
        case '08':
            $mes_long = "Agosto";
            break;
        case '09':
            $mes_long = "Septiembre";
            break;
        case '10':
            $mes_long = "Octubre";
            break;
        case '11':
            $mes_long = "Noviembre";
            break;
        case '12':
            $mes_long = "Diciembre";
            break;
        default:
            break;    
    }
    return $mes_long;
}
?>