CREATE TABLE ActiviteParAnnee(
    numCinema INT PRIMARY KEY NOT NULL,
    annee INT PRIMARY KEY NOT NULL,
    nbSemaineActivite INT,
    nbSeance INT,
    nbEntrees INT,
    FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema),
    FOREIGN KEY(annee) REFERENCES Annee(annee)
)