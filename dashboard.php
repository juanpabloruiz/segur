<?php
include 'conn.php';
include 'functions.php';


?>


<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Segur</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/estilo.css">
    <link rel="stylesheet" href="/fontawesome/css/all.min.css">
</head>


<body data-bs-theme="dark">

    <nav class="navbar bg-dark navbar-expand-lg border-bottom" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Segur</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <?php
                $query = $conn->query("SELECT * FROM roles ORDER BY rol");
                while ($row = $query->fetch_assoc()):
                ?>
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item">
                            <?php $url = basename($_SERVER['REQUEST_URI']); ?>
                            <?php $link = 'dashboard.php?id=' . $row['id']; ?>
                            <a class="nav-link <?= $url === $link ? 'active bg-primary text-white' : '' ?>" href="<?= $link ?>"><?= $row['rol'] ?></a>
                        </li>
                    </ul>
                <?php endwhile ?>
            </div>
        </div>
    </nav>


    <main class="container-fluid my-3">
        <div class="d-flex flex-column flex-lg-row">

            <!-- IZQUIERDA: CARDS -->
            <section>
                <div class="container my-3">
                    <div class="row row-cols-1 row-cols-md-6 g-3">

                        <?php
                        $id = $_GET['id'];
                        $stmt = $conn->prepare("SELECT * FROM users WHERE id_rol = ? ORDER BY last_name ASC");
                        $stmt->bind_param('i', $id);
                        $stmt->execute();
                        $res = $stmt->get_result();
                        while ($row = $res->fetch_assoc()):
                        ?>
                            <div class="col">

                                <div class="card border-4 h-100 <?= $row['state'] == 1 ? 'border-success bg-success-subtle' : 'border-secondary bg-seconday-subtle' ?>">

                                    <a data-bs-toggle="modal" data-bs-target="#id<?= $row['id'] ?>">
                                        <picture>
                                            <source srcset="/files/<?= $row['file'] ?>" type="image/webp">
                                            <img
                                                src="/files/<?= $row['file'] ?>"
                                                class="card-img-top"
                                                style="<?= $row['state'] == 0 ? 'filter: grayscale(100%); opacity: .75;' : '' ?>"
                                                alt="<?= htmlspecialchars($row['last_name']) ?>">
                                        </picture>

                                        <div class="card-header">
                                            <h5 class="card-title text-uppercase fw-bold"><?= abreviarApellido($row['last_name']) ?></h5>
                                            <?= $row['first_name'] ?>
                                        </div>
                                        <div class="card-body">


                                            <p class="card-text">


                                                <?= (int)$row['office'] === 0 ? '<i class="fa-solid fa-lock fa-lg"></i>' : '<i class="fa-solid fa-lock-open fa-lg"></i>' ?>


                                                <?php
                                                $id = $row['id'];
                                                $stmt_rec = $conn->prepare("SELECT * FROM records WHERE id_user = ? AND DATE(added) = CURDATE() ORDER BY added ASC");
                                                $stmt_rec->bind_param('i', $id);
                                                $stmt_rec->execute();
                                                $res_rec = $stmt_rec->get_result();
                                                while ($row_rec = $res_rec->fetch_assoc()) {
                                                    if ($row_rec['mode'] === 'E') {
                                                        echo '<span class="text-success m-1 fw-bold">E</span>';
                                                    } else {
                                                        echo '<span class="text-danger m-1 fw-bold">S</span>';
                                                    }
                                                }
                                                ?>
                                            </p>
                                        </div>
                                        <?php
                                        $stmt_last = $conn->prepare("SELECT mode, added FROM records WHERE id_user = ? AND DATE(added) = CURDATE() ORDER BY added DESC LIMIT 1");
                                        $stmt_last->bind_param('i', $row['id']);
                                        $stmt_last->execute();
                                        $last = $stmt_last->get_result()->fetch_assoc();
                                        ?>
                                        <div class="card-footer">
                                            <small class="text-body-secondary">
                                                <?= $last
                                                    ? tiempo_transcurrido($last['added'])
                                                    : 'Sin movimientos hoy'
                                                ?>
                                            </small>
                                        </div>



                                    </a>
                                </div>



                            </div>
                            <?php include 'modal.php' ?>
                        <?php endwhile ?>

                    </div>
            </section>

            <!-- DERECHA: SIDEBAR (lo que sobra) -->
    <aside class="flex-grow-1">
      <div class="h-100 p-3 bg-light">
        Sidebar
      </div>
    </aside>

        </div>

    </main>





    <script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>