CREATE TABLE proprietario
(
    codice INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome   VARCHAR(64)        NOT NULL
);

CREATE TABLE animale
(
    codice      INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    descrizione VARCHAR(128)       NOT NULL,
    razza       VARCHAR(32)        NOT NULL
);

CREATE TABLE appartenenza
(
    proprietario INT NOT NULL REFERENCES proprietario (codice),
    animale      INT NOT NULL REFERENCES animale (codice)
);

CREATE TABLE mostra_animali
(
    codice      INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    indirizzo   VARCHAR(64)        NOT NULL,
    num_animali INT CHECK ( num_animali > 0 )
);

CREATE TABLE tempo
(
    data DATE NOT NULL PRIMARY KEY
);

CREATE TABLE partecipazione
(
    animale        INT  NOT NULL REFERENCES animale (codice),
    mostra_animali INT  NOT NULL REFERENCES mostra_animali (codice),
    tempo          DATE NOT NULL REFERENCES tempo (data),

    PRIMARY KEY (animale, mostra_animali, tempo)
);

CREATE TABLE telefono_mostra
(
    mostra_animali INT         NOT NULL REFERENCES mostra_animali (codice),
    telefono       VARCHAR(16) NOT NULL,

    PRIMARY KEY (mostra_animali, telefono)
);

CREATE TABLE telefono_proprietario
(
    proprietario INT         NOT NULL REFERENCES proprietario (codice),
    telefono     VARCHAR(16) NOT NULL,

    PRIMARY KEY (proprietario, telefono)
);