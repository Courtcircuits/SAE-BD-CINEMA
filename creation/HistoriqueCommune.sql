CREATE TABLE HistoriqueCommune(
    numCommune INT PRIMARY KEY NOT NULL,
    annee INT PRIMARY KEY NOT NULL,
    populations INT,
    nbEtablissement INT,
    nbEcrans INT,
    nbFauteuils INT,
    nbMultiplexes INT,
    nbCinemasArtEssai INT,
    nbSeances INT,
    nbEntrees INT,
    recettes INT,
    FOREIGN KEY (numCommune) REFERENCES Commune(numCommune),
    FOREIGN KEY (annee) REFERENCES Annee(annee)
)