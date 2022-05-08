CREATE TABLE Public(
    annee INT PRIMARY KEY NOT NULL,
    nomRegion VARCHAR(50) PRIMARY KEY NOT NULL,
    idCategorie INT PRIMARY KEY NOT NULL,
    pourcentage FLOAT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(nomRegion) REFERENCES Region(nomRegion),
    FOREIGN KEY(idCategorie) REFERENCES Categorie(idCategorie)
)