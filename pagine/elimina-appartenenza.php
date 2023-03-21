<?php
$animale = filter_input(INPUT_GET, 'animale', FILTER_VALIDATE_INT);
$proprietario = filter_input(INPUT_GET, 'proprietario', FILTER_VALIDATE_INT);

if (!$animale || !$proprietario): ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Verifica 9 Marzo</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">

        <link href="../style.css" type="text/css" rel="stylesheet">
    </head>
    <body>
    <div class="d-flex min-vh-100 align-items-center">
        <div class="container-fluid text-center">
            <div class="w-75 m-auto">
                <p>Qualcosa è andato storto 😩</p>
            </div>
        </div>
    </div>
    </body>
    </html>

<?php else:
    require '../db/db.php';

    eliminaAppartenenza($proprietario, $animale);

    header('Location: animali-utente.php?codice=' . $proprietario);
    ?>
<?php endif; ?>
