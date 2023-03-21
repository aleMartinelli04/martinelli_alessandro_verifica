<!DOCTYPE html>
<?php
require '../db/db.php';
$animali = getAllAnimali();
?>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Verifica 9 Marzo</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link href="../style.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="d-flex min-vh-100 align-items-center">
    <div class="container-fluid text-center">
        <div class="w-75 m-auto">
            <table class="table">
                <thead>
                <th>Codice</th>
                <th>Descrizione</th>
                <th>Razza</th>
                <th>Azioni</th>
                </thead>
                <tbody>
                <?php foreach ($animali as $animale): ?>
                    <tr>
                        <td><?= $animale['codice'] ?></td>
                        <td><?= $animale['descrizione'] ?></td>
                        <td><?= $animale['razza'] ?></td>
                        <td>
                            <a href="elimina-animale.php?codice=<?= $animale['codice'] ?>">
                                Elimina Animale
                            </a>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        <a href="../" class="btn btn-dark">Indietro</a>
    </div>
</div>
</body>
</html>
