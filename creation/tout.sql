CREATE TABLE Annee(
    annee INT PRIMARY KEY NOT NULL
);

CREATE TABLE Departement(
    numDepartement VARCHAR(10) PRIMARY KEY NOT NULL, --le num est un varchar car 2A/2B n'est pas un entier : corse
    nomDepartement VARCHAR(50) NOT NULL
);

CREATE TABLE UniteUrbaine(
    numUniteUrbaine VARCHAR(10) PRIMARY KEY NOT NULL,
    nomUniteUrbaine VARCHAR(50) NOT NULL
);

CREATE TABLE SituationGeographique(
    idZoneGeo VARCHAR(10) PRIMARY KEY NOT NULL,
    nomZoneGeo VARCHAR(50) NOT NULL
);

CREATE TABLE Proprietaires(
    idProprietaire INT PRIMARY KEY NOT NULL,
    nomProprietaire VARCHAR(50) NOT NULL
);

CREATE TABLE Programateur(
    idProgramateur INT PRIMARY KEY NOT NULL,
    nomProgramateur VARCHAR(50) NOT NULL
);

CREATE TABLE AE(
    idCat VARCHAR(10) PRIMARY KEY NOT NULL,
    nomCat VARCHAR(50) NOT NULL
);

CREATE TABLE Genre(
    idGenre VARCHAR(10) PRIMARY KEY NOT NULL,
    nomGenre VARCHAR(50) NOT NULL
);

CREATE TABLE ZoneCommune(
    idZoneCommune VARCHAR(10) PRIMARY KEY NOT NULL,
    nomZoneCommune VARCHAR(50) NOT NULL
);

CREATE TABLE TypeFilm(
    idTypeFilm VARCHAR(10) PRIMARY KEY NOT NULL,
    nomTypeFilm VARCHAR(50) NOT NULL,
    nationalite VARCHAR(50) NOT NULL
);

CREATE TABLE Jour(
    jour VARCHAR(30) PRIMARY KEY NOT NULL
);

CREATE TABLE Semaine(
    semaine INT PRIMARY KEY NOT NULL
);

CREATE TABLE Mois(
    mois VARCHAR(30) PRIMARY KEY NOT NULL
);

CREATE TABLE Region(
    nomRegion VARCHAR(50) PRIMARY KEY NOT NULL
);

CREATE TABLE TypeCategorie(
    nomTypeCategorie VARCHAR(50) PRIMARY KEY NOT NULL
);

CREATE TABLE Cinema(
    numCinema INT PRIMARY KEY NOT NULL ,
    nomCinema VARCHAR(50),
    adresseCinema VARCHAR(100),
    nbEcrans INT,
    nbFauteuils INT,
    multiplexe INT,
    latitude FLOAT,
    longitude FLOAT,
    geolocalisation VARCHAR(100),
    ancienneRegion VARCHAR(50),
    nouvelleRegion VARCHAR(50),
    numUniteUrbaine VARCHAR(10),
    idCat VARCHAR(10),
    idZoneGeo VARCHAR(10),
    idGenre VARCHAR(10),
    idProgramateur INT,
    idProprietaire INT,
    FOREIGN KEY(numUniteUrbaine) REFERENCES UniteUrbaine(numUniteUrbaine),
    FOREIGN KEY(idCat) REFERENCES AE(idCat),
    FOREIGN KEY(idZoneGeo) REFERENCES SituationGeographique(idZoneGeo),
    FOREIGN KEY(idGenre) REFERENCES Genre(idGenre),
    FOREIGN KEY(idProgramateur) REFERENCES Programateur(idProgramateur),
    FOREIGN KEY(idProprietaire) REFERENCES Proprietaires(idProprietaire)
);

CREATE TABLE Commune(
    numCommune INT PRIMARY KEY NOT NULL ,
    nomCommune VARCHAR(50) NOT NULL,
    numDepartement VARCHAR(10) NOT NULL,
    FOREIGN KEY(numDepartement) REFERENCES Departement(numDepartement)
);

CREATE TABLE Categorie(
    idCategorie INT PRIMARY KEY NOT NULL ,
    nomCategorie VARCHAR(50),
    nomTypeCategorie VARCHAR(50),
    FOREIGN KEY(nomTypeCategorie) REFERENCES TypeCategorie(nomTypeCategorie)
);

CREATE TABLE HistoriqueCommune(
    numCommune INT NOT NULL,
    annee INT NOT NULL,
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
    FOREIGN KEY (annee) REFERENCES Annee(annee),
    CONSTRAINT pk_HistoriqueCommune PRIMARY KEY (numCommune,annee) 
);

CREATE TABLE ActiviteParAnnee(
    numCinema INT NOT NULL,
    annee INT NOT NULL,
    nbSemaineActivite INT,
    nbSeance INT,
    nbEntrees INT,
    FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema),
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    CONSTRAINT pk_ActiviteParAnnee PRIMARY KEY (numCinema, annee)
);

CREATE TABLE Tension(
    numCinema INT NOT NULL,
    idZoneCommune VARCHAR(10) NOT NULL,
    FOREIGN KEY (numCinema) REFERENCES Cinema(numCinema),
    FOREIGN KEY (idZoneCommune) REFERENCES ZoneCommune(idZoneCommune),
    CONSTRAINT pk_Tension PRIMARY KEY (numCinema, idZoneCommune)
);

CREATE TABLE Diffuser(
    numCinema INT NOT NULL,
    annee INT NOT NULL,
    idTypeFilm VARCHAR(10) NOT NULL,
    nbFilmProgramme INT,
    FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema),
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(idTypeFilm) REFERENCES TypeFilm(idTypeFilm),
    CONSTRAINT pk_Diffuser PRIMARY KEY (numCinema, annee, idTypeFilm)
);

CREATE TABLE EntreesParAnnee(
    numCinema INT NOT NULL,
    annee INT NOT NULL,
    idTypeFilm VARCHAR(10) NOT NULL,
    PdM FLOAT,
    FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema),
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(idTypeFilm) REFERENCES TypeFilm(idTypeFilm),
    CONSTRAINT pk_EntreesParAnnee PRIMARY KEY (numCinema, annee, idTypeFilm)
);

CREATE TABLE HistoriqueDep(
    annee INT NOT NULL,
    numDepartement VARCHAR(10) NOT NULL,
    nbEcransAE INT,
    nbFauteuilsAE INT,
    nbSeancesAE INT,
    nbEntreesAE INT,
    recettesAE INT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(numDepartement) REFERENCES Departement(numDepartement),
    CONSTRAINT pk_HistoriqueDep PRIMARY KEY (annee,numDepartement)
);

CREATE TABLE HistoriqueUniteUrbaine(
    annee INT NOT NULL,
    numUniteUrbaine VARCHAR(10) NOT NULL,
    nbEcransAE INT,
    nbFauteuilsAE INT ,
    nbSeancesAE INT,
    nbEntreesAE INT,
    recettesAE INT,
    recette INT,
    FOREIGN KEY (annee) REFERENCES Annee(annee),
    FOREIGN KEY (numUniteUrbaine) REFERENCES UniteUrbaine(numUniteUrbaine),
    CONSTRAINT pk_HistoriqueUniteUrbaine PRIMARY KEY (annee,numUniteUrbaine)
);


CREATE TABLE FrequentationParJour(
    annee INT NOT NULL,
    jour VARCHAR(30) NOT NULL,
    pourcentageEntrees FLOAT,
    pourcentageRecettes FLOAT,
    pourcentageSeances FLOAT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(jour) REFERENCES Jour(jour),
    CONSTRAINT pk_FrequentationParJour PRIMARY KEY (annee,jour)
);

CREATE TABLE FrequentationParSemaine(
    annee INT NOT NULL,
    semaine INT NOT NULL,
    nbEntrees INT,
    recettes FLOAT,
    nbSeances INT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(semaine) REFERENCES Semaine(semaine),
    CONSTRAINT pk_FrequentationParSemaine PRIMARY KEY (annee, semaine)
);

CREATE TABLE FrequentationParMois(
    annee INT NOT NULL,
    mois VARCHAR(30) NOT NULL,
    nbEntrees INT,
    recettes FLOAT,
    nbSeances INT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(mois) REFERENCES Mois(mois),
    CONSTRAINT pk_FrequentationParMois PRIMARY KEY (annee, mois)
);

CREATE TABLE Publics(
    annee INT NOT NULL,
    nomRegion VARCHAR(50) NOT NULL,
    idCategorie INT NOT NULL,
    pourcentage FLOAT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(nomRegion) REFERENCES Region(nomRegion),
    FOREIGN KEY(idCategorie) REFERENCES Categorie(idCategorie),
    CONSTRAINT pk_Publics PRIMARY KEY (annee, nomRegion, idCategorie)
);