<?php
include 'conn.php';

$id_user = (int) $_POST['id_user'];
$mode    = $_POST['mode'];

if (!in_array($mode, ['E', 'S'])) {
    die('Movimiento inválido');
}

$stmt = $conn->prepare("INSERT INTO records (id_user, mode) VALUES (?, ?)");
$stmt->bind_param('is', $id_user, $mode);
$stmt->execute();

header('Location: ' . $_SERVER['HTTP_REFERER']);
exit;
