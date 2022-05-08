CREATE TABLE HistoriqueUniteUrbaine(
    annee INT PRIMARY KEY NOT NULL,
    numUniteUrbaine VARCHAR(10) PRIMARY KEY NOT NULL,
    nbEcransAE INT,
    nbFauteuilsAE INT ,
    nbSeancesAE INT,
    nbEntreesAE INT,
    recettesAE INT,
    recette INT,
    FOREIGN KEY (annee) REFERENCES Annee(annee),
    FOREIGN KEY (numUniteUrbaine) REFERENCES UniteUrbaine(numUniteUrbaine)
)