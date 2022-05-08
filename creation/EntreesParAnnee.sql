CREATE TABLE EntreesParAnnee(
    numCinema INT PRIMARY KEY NOT NULL,
    annee INT PRIMARY KEY NOT NULL,
    idTypeFilm VARCHAR(10) PRIMARY KEY NOT NULL,
    PdM FLOAT,
    FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema),
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(idTypeFilm) REFERENCES TypeFilm(idTypeFilm)
)