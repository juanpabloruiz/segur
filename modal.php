    <div class="modal fade" id="id<?= $row['id'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel"><?= $row['name'] ?></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <form method="post" action="record.php" class="d-inline">
                        <input type="hidden" name="id_user" value="<?= $row['id'] ?>">
                        <input type="hidden" name="mode" value="E">
                        <button class="btn btn-success">Entrada</button>
                    </form>

                    <form method="post" action="record.php" class="d-inline">
                        <input type="hidden" name="id_user" value="<?= $row['id'] ?>">
                        <input type="hidden" name="mode" value="S">
                        <button class="btn btn-danger">Salida</button>
                    </form>
                </div>

            </div>
        </div>
    </div>