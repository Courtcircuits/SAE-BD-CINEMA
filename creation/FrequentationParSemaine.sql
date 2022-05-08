CREATE TABLE FrequentationParSemaine(
    annee INT PRIMARY KEY NOT NULL,
    semaine VARCHAR(30) PRIMARY KEY NOT NULL,
    nbEntrees INT,
    recettes FLOAT,
    nbSeances INT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(semaine) REFERENCES Semaine(semaine)
)