CREATE TABLE FrequentationParJour(
    annee INT PRIMARY KEY NOT NULL,
    jour VARCHAR(30) PRIMARY KEY NOT NULL,
    pourcentageEntrees FLOAT,
    pourcentageRecettes FLOAT,
    pourcentageSeances FLOAT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(jour) REFERENCES Jour(jour)
)