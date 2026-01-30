<?php
session_start();

// Mostrar errores
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Cambiar datos del servidor
$conn = new mysqli('localhost', 'pablo', 'Soledad2025.', 'segur');
$conn->set_charset('utf8mb4');
