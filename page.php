<?php
include 'conn.php';
$id = $_GET['id'];
$stmt = $conn->prepare("SELECT * FROM users WHERE id_rol = ?");
$stmt->bind_param('i', $id);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()):
?>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#id<?= $row['id'] ?>">
    <div class="card">    
<img src="/files/<?= $row['file'] ?>" alt="">
<div class="card-body">
            <?= $row['name'] ?>
            
            <?php
            $id = $row['id'];
            $stmt_rec = $conn->prepare("SELECT * FROM records WHERE id_user = ?");
            $stmt_rec->bind_param('i', $id);
            $stmt_rec->execute();
            $res_rec = $stmt_rec->get_result();
            while ($row_rec = $res_rec->fetch_assoc()):
            ?>
            <?= $row_rec['mode'] ?>
            <?php endwhile ?>
            </div>
        </div>
        

    </a>

<?php include 'modal.php' ?>

<?php endwhile ?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>