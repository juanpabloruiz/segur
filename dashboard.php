<?php include 'conn.php'; ?>

<nav>
    <?php
    $query = $conn->query("SELECT * FROM roles");
    while ($row = $query->fetch_assoc()):
    ?>
    <ul>
        <li><a href="page.php?id=<?= $row['id'] ?>"><?= $row['rol'] ?></a></li>
    </ul>
    <?php endwhile ?>
</nav>