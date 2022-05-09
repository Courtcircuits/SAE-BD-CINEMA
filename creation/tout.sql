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
    
    nomProprietaire VARCHAR(50) PRIMARY KEY NOT NULL
);

CREATE TABLE Programateur(
    
    nomProgramateur VARCHAR(50) PRIMARY KEY NOT NULL
);

CREATE TABLE AE(
    idCat VARCHAR(10) PRIMARY KEY NOT NULL,
    nomCat VARCHAR(50) NOT NULL
);

CREATE TABLE Genre(
    idGenre VARCHAR(10) PRIMARY KEY NOT NULL,
    nomGenre VARCHAR(50) NOT NULL
);

CREATE TABLE TypeFilm(
    nomTypeFilm VARCHAR(10) NOT NULL,
    CONSTRAINT pk_TypeFilm PRIMARY KEY(nomTypeFilm)
);

CREATE TABLE NationaliteFilm(
    nationalite VARCHAR(10) NOT NULL,
    CONSTRAINT pk_NationaliteFilm PRIMARY KEY(nationalite)
);

CREATE TABLE PdM(
    numCinema INT NOT NULL,
    nationalite VARCHAR(10) NOT NULL,
    PdM FLOAT,
    CONSTRAINT pk_PdM PRIMARY KEY(numCinema, nationalite),
    CONSTRAINT fk_numCinema_PdM FOREIGN KEY (numCinema) REFERENCES Cinema(numCinema),
    CONSTRAINT fk_ nationalite_PdM FOREIGN KEY (nationalite) REFERENCES NationaliteFilm(nationalite)
);

CREATE TABLE Nombre(
    numCinema INT NOT NULL,
    nomTypeFilm VARCHAR(10) NOT NULL,
    nombre INT,
    CONSTRAINT pk_Nombre PRIMARY KEY(numCinema, nomTypeFilm),
    CONSTRAINT fk_numCinema_Nombre FOREIGN KEY (numCinema) REFERENCES Cinema(numCinema),
    CONSTRAINT fk_nomTypeFilm_Nombre FOREIGN (nomTypeFilm) REFERENCES TypeFilm(nomTypeFilm)
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
    nbSeances INT,
    nbSemaineActivite INT,
    multiplexe VARCHAR(3),
    latitude FLOAT,
    longitude FLOAT,
    geolocalisation VARCHAR(100),
    ancienneRegion VARCHAR(50),
    nouvelleRegion VARCHAR(50),
    numUniteUrbaine VARCHAR(10),
    idCat VARCHAR(10),
    idZoneGeo VARCHAR(10),
    idGenre VARCHAR(10),
    nomProgramateur VARCHAR(50),
    nomProprietaire INT,
    labelAE VARCHAR(30),
    trancheEntrees VARCHAR(50),
    FOREIGN KEY(numUniteUrbaine) REFERENCES UniteUrbaine(numUniteUrbaine),
    FOREIGN KEY(idCat) REFERENCES AE(idCat),
    FOREIGN KEY(idZoneGeo) REFERENCES SituationGeographique(idZoneGeo),
    FOREIGN KEY(idGenre) REFERENCES Genre(idGenre),
    FOREIGN KEY(nomProgramateur) REFERENCES Programateur(nomProgramateur),
    FOREIGN KEY(nomProprietaire) REFERENCES Proprietaires(nomProprietaire)
);

CREATE TABLE Commune(
    numCommune INT PRIMARY KEY NOT NULL ,
    nomCommune VARCHAR(50) NOT NULL,
    numDepartement VARCHAR(10) NOT NULL,
    FOREIGN KEY(numDepartement) REFERENCES Departement(numDepartement)
);

CREATE TABLE Categorie(
    
    nomCategorie VARCHAR(50) PRIMARY KEY NOT NULL,
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
    nbEntrees INT,
    FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema),
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    CONSTRAINT pk_ActiviteParAnnee PRIMARY KEY (numCinema, annee)
);


CREATE TABLE HistoriqueDep(
    numDepartement VARCHAR(10) NOT NULL,
    annee INT NOT NULL,
    nbHabitantsDepartement INT,
    nbEtablissement INT,
    nbEcrans INT,
    nbFauteuils INT,
    nbMultiplexes INT,
    nbSeances INT,
    nbEntrees INT,
    recettes FLOAT,
    tauxOccupation FLOAT,
    nbEtablissementAE INT,
    nbEcransAE INT,
    nbFauteuilsAE INT,
    nbSeancesAE INT,
    nbEntreesAE INT,
    recettesAE INT,
    tauxOccupationAE FLOAT,
    FOREIGN KEY(annee) REFERENCES Annee(annee),
    FOREIGN KEY(numDepartement) REFERENCES Departement(numDepartement),
    CONSTRAINT pk_HistoriqueDep PRIMARY KEY (annee,numDepartement)
);

CREATE TABLE HistoriqueUniteUrbaine(
    numUniteUrbaine VARCHAR(10) NOT NULL,
    annee INT NOT NULL,
    nbEtablissements INT,
    nbEcrans INT,
    nbFauteuils INT,
    nbMultiplexes INT,
    nbSeances INT,
    nbEntrees INT,
    recettes INT,
    tauxOccupation INT,
    nbEtablissementsAE INT,
    nbEcransAE INT,
    nbFauteuilsAE INT,
    nbSeancesAE INT,
    nbEntreesAE INT,
    recettesAE INT,
    tauxOccupationAE INT,
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