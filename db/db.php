<?php
function getPDO()
{
    $dsn = "mysql:host=localhost;dbname=verifica-9-3;charset=utf8mb4";

    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ];

    return new PDO($dsn, "root", "", $options);
}

function getAllAnimali()
{
    $pdo = getPDO();

    $stmt = $pdo->prepare("SELECT * FROM animale");
    $stmt->execute();

    return $stmt->fetchAll();
}

function getAllProprietari()
{
    $pdo = getPDO();

    $stmt = $pdo->prepare("SELECT * FROM proprietario");
    $stmt->execute();

    return $stmt->fetchAll();
}

function getAnimaliForProprietario($codice)
{
    $pdo = getPDO();

    $stmt = $pdo->prepare("SELECT animale.* FROM animale
                                    INNER JOIN appartenenza ON appartenenza.animale = animale.codice
                                    INNER JOIN proprietario ON proprietario.codice = appartenenza.proprietario
                                    WHERE proprietario.codice=?");
    $stmt->execute([$codice]);

    return $stmt->fetchAll();
}

function eliminaAppartenenza($proprietario, $animale)
{
    $pdo = getPDO();

    $stmt = $pdo->prepare("DELETE FROM appartenenza WHERE appartenenza.proprietario=? AND appartenenza.animale=?");
    $stmt->execute([$proprietario, $animale]);
}

function eliminaAnimale($codice)
{
    $pdo = getPDO();

    $stmt = $pdo->prepare("DELETE FROM animale WHERE codice=?");
    $stmt->execute([$codice]);
}