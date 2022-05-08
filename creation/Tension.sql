CREATE TABLE Tension(
    numCinema INT PRIMARY KEY NOT NULL,
    idZoneCommune VARCHAR(10) PRIMARY KEY NOT NULL,
    FOREIGN KEY (numCinema) REFERENCES Cinema(numCinema),
    FOREIGN KEY (idZoneCommune) REFERENCES ZoneCommune(idZoneCommune)
)