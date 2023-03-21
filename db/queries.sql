-- Scrivere la query necessaria per ricevere dal DB le informazioni su tutti gli animali
SELECT *
FROM animale;

-- Scrivere la query necessaria per ricevere dal DB le informazioni necessarie degli animali appartenenti a Giacomo
SELECT *
FROM animale
         INNER JOIN appartenenza
                    ON animale.codice = appartenenza.animale
         INNER JOIN proprietario
                    ON proprietario.codice = appartenenza.proprietario
WHERE proprietario.nome = 'Giacomo';

-- Scrivere la query necessaria che restituisca quali cani Labrador hanno partecipato alla gara del 23/02/2018
SELECT *
FROM animale
         INNER JOIN partecipazione
                    ON animale.codice = partecipazione.animale
WHERE partecipazione.tempo = '2018-02-23'
  AND animale.descrizione = 'Cane'
  AND animale.razza = 'Labrador'

