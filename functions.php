<?php

function tiempo_transcurrido($fecha)
{
    if (!$fecha) {
        return 'Sin fecha';
    }

    $timestamp = strtotime($fecha);
    $diferencia = time() - $timestamp;

    if ($diferencia < 60) return "Hace $diferencia segundos";

    $diferencia = floor($diferencia / 60);
    if ($diferencia < 60) return "Hace $diferencia minutos";

    $diferencia = floor($diferencia / 60);
    if ($diferencia < 24) return "Hace $diferencia horas";

    $diferencia = floor($diferencia / 24);
    if ($diferencia < 30) return "Hace $diferencia días";

    $diferencia = floor($diferencia / 30);
    if ($diferencia < 12) return "Hace $diferencia meses";

    return "Hace " . floor($diferencia / 12) . " años";
}

function abreviarApellido($apellido, $max = 14) {
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

