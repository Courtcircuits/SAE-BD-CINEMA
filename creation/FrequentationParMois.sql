CREATE TABLE FrequentationParMois(
    annee INT PRIMARY KEY NOT NULL,
    mois VARCHAR(30) PRIMARY KEY NOT NULL,
    nbEntrees INT,
    recettes FLOAT,
    nbSeances INT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(mois) REFERENCES Mois(mois)
)