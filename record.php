<?php
include 'conn.php';

$id_user = (int) $_POST['id_user'];
$mode    = $_POST['mode'];

if (!in_array($mode, ['E', 'S'])) {
    die('Movimiento inválido');
}

// 1 = presente, 0 = ausente
$state = ($mode === 'E') ? 1 : 0;

/* INSERT en records */
$stmt = $conn->prepare(
    "INSERT INTO records (id_user, mode) VALUES (?, ?)"
);
$stmt->bind_param('is', $id_user, $mode);
$stmt->execute();

/* UPDATE en users */
$stmt = $conn->prepare(
    "UPDATE users SET state = ? WHERE id = ?"
);
$stmt->bind_param('ii', $state, $id_user);
$stmt->execute();

header('Location: ' . $_SERVER['HTTP_REFERER']);
exit;
