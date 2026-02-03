<?php

function plural($n, $singular, $plural)
{
    return $n == 1 ? $singular : $plural;
}

function tiempo_transcurrido($fecha)
{
    if (!$fecha) return 'Sin fecha';

    $timestamp   = strtotime($fecha);
    $diferencia  = time() - $timestamp;

    if ($diferencia < 60)
        return "Hace $diferencia " . plural($diferencia, 'segundo', 'segundos');

    $diferencia = floor($diferencia / 60);
    if ($diferencia < 60)
        return "Hace $diferencia " . plural($diferencia, 'minuto', 'minutos');

    $diferencia = floor($diferencia / 60);
    if ($diferencia < 24)
        return "Hace $diferencia " . plural($diferencia, 'hora', 'horas');

    $diferencia = floor($diferencia / 24);
    if ($diferencia < 30)
        return "Hace $diferencia " . plural($diferencia, 'día', 'días');

    $diferencia = floor($diferencia / 30);
    if ($diferencia < 12)
        return "Hace $diferencia " . plural($diferencia, 'mes', 'meses');

    $años = floor($diferencia / 12);
    return "Hace $años " . plural($años, 'año', 'años');
}


function abreviarApellido($apellido, $max = 14)
{
    $apellido = trim($apellido);

    if (mb_strlen($apellido) <= $max) {
        return $apellido;
    }

    $partes = preg_split('/\s+/', $apellido);

    $resultado = $partes[0];

    for ($i = 1; $i < count($partes); $i++) {
        $resultado .= ' ' . mb_substr($partes[$i], 0, 1) . '.';
    }

    return $resultado;
}
