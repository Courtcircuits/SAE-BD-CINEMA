CREATE TABLE HistoriqueDep(
    annee INT PRIMARY KEY NOT NULL,
    numDepartement VARCHAR(10) PRIMARY KEY NOT NULL,
    nbEcransAE INT,
    nbFauteuilsAE INT,
    nbSeancesAE INT,
    nbEntreesAE INT,
    recettesAE INT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(numDepartement) REFERENCES Departement(numDepartement)
)