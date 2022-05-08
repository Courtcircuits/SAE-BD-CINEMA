CREATE TABLE Commune(
    numCommune INT PRIMARY KEY NOT NULL,
    nomCommune VARCAHR(50) NOT NULL,
    numDepartement VARCHAR(10) NOT NULL,
    FOREIGN KEY(numDepartement) REFERENCES Departement(numDepartement)
)

