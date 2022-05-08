CREATE TABLE Categorie(
    idCategorie INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomCategorie VARCHAR(50),
    nomTypeCategorie VARCHAR(50),
    FOREIGN KEY(nomTypeCategorie) REFERENCES TypeCategorie(nomTypeCategorie)
)