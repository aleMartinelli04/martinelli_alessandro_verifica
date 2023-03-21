<!DOCTYPE html>
<?php
$codice = filter_input(INPUT_GET, 'codice', FILTER_VALIDATE_INT);
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
            <?php if (!$codice): ?>
                <p>Qualcosa è andato storto 😩</p>
            <?php else:
                require '../db/db.php';
                $animali = getAnimaliForProprietario($codice); ?>
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
                                <a href="elimina-appartenenza.php?
                                                    animale=<?= $animale['codice'] ?>&
                                                    proprietario=<?= $codice ?>">
                                    Elimina Appartenenza
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
        </div>
        <a href="tabella-proprietari.php" class="btn btn-dark">Indietro</a>
    </div>
</div>
</body>
</html>
