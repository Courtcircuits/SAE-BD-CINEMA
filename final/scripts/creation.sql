CREATE TABLE Annee(
    annee INT NOT NULL,
    CONSTRAINT pk_annee PRIMARY KEY (annee)
);

CREATE TABLE Commune(
    numCommune VARCHAR(10) NOT NULL,
    nomCommune VARCHAR(20) NOT NULL,
    CONSTRAINT pk_Commune PRIMARY KEY(numCommune)
);

CREATE TABLE Departement(
    numDepartement VARCHAR(3) NOT NULL,
    nomDepartement VARCHAR(20) NOT NULL,
    CONSTRAINT pk_Departement PRIMARY KEY(numDepartement)
);

CREATE TABLE UniteUrbaine(
    numUniteUrbaine VARCHAR(8) NOT NULL,
    nomUniteUrbaine VARCHAR(20) NOT NULL,
    CONSTRAINT pk_UniteUrbaine PRIMARY KEY(numUniteUrbaine)
);

CREATE TABLE SituationGeographique(
    idZoneGeo INT NOT NULL,
    nomZoneGeo VARCHAR(50) NOT NULL,
    CONSTRAINT pk_SituationGeographique PRIMARY KEY(idZoneGeo)
);

CREATE TABLE Proprietaire(
    nomProprietaire VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Proprietaire PRIMARY KEY(nomProprietaire)
);

CREATE TABLE Programateur(
    nomProgramateur VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Programateur PRIMARY KEY(nomProgramateur)
);

CREATE TABLE AE(
    idCat INT NOT NULL,
    categorieAE VARCHAR(5) NOT NULL,
    CONSTRAINT pk_AE PRIMARY KEY(idCat)
);

CREATE TABLE Genre(
    nomGenre VARCHAR(10) NOT NULL,
    CONSTRAINT pk_Genre PRIMARY KEY(nomGenre)
);

CREATE TABLE TypeFilm(
    nomTypeFilm VARCHAR(15) NOT NULL,
    CONSTRAINT pk_TypeFilm PRIMARY KEY(nomTypeFilm)
);

CREATE TABLE NationaliteFilm(
    nationalite VARCHAR(10) NOT NULL,
    CONSTRAINT pk_NationaliteFilm PRIMARY KEY(nationalite)
);

CREATE TABLE Cinema(
    numCinema INT NOT NULL,
    nomCinema VARCHAR(50) NOT NULL,
    adresseCinema VARCHAR(50) NOT NULL,
    nbEcrans INT,
    nbFauteuils INT,
    multiplexe VARCHAR(4),
    latitude FLOAT,
    longitude FLOAT,
    geolocalisation VARCHAR(50),
    ancienneRegion VARCHAR(30),
    nouvelleRegion VARCHAR(30),
    numUniteUrbaine VARCHAR(8),
    idCat INT,
    idZoneGeo INT,
    nomGenre VARCHAR(10),
    nomProgramateur VARCHAR(50),
    nomProprietaire VARCHAR(50),
    ZoneCommune VARCHAR(3),
    labelAE VARCHAR(10),
    trancheEntrees VARCHAR(100),
    CONSTRAINT pk_Cinema PRIMARY KEY (numCinema),
    CONSTRAINT fk_numUniteUrbaine_Cinema FOREIGN KEY (numUniteUrbaine) REFERENCES UniteUrbaine(numUniteUrbaine),
    CONSTRAINT fk_idCat_Cinema FOREIGN KEY(idCat) REFERENCES AE(idCat),
    CONSTRAINT fk_idZoneGeo_Cinema FOREIGN KEY(idZoneGeo) REFERENCES SituationGeographique(idZoneGeo),
    CONSTRAINT fk_nomGenre_Cinema FOREIGN KEY(nomGenre) REFERENCES Genre(nomGenre),
    CONSTRAINT fk_nomProgramateur_Cinema FOREIGN KEY(nomProgramateur) REFERENCES Programateur(nomProgramateur),
    CONSTRAINT fk_nomProprietaire_Cinema FOREIGN KEY(nomProprietaire) REFERENCES Proprietaire(nomProprietaire)
);

CREATE TABLE PdM(
    numCinema INT NOT NULL,
    nationalite VARCHAR(10) NOT NULL,
    PdM FLOAT NOT NULL,
    CONSTRAINT pk_PdM PRIMARY KEY(numCinema, nationalite),
    CONSTRAINT fk_numCinema_PdM FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema),
    CONSTRAINT fk_nationalite_PdM FOREIGN KEY(nationalite) REFERENCES NationaliteFilm(nationalite)
);

CREATE TABLE Nombre(
    nomTypeFilm VARCHAR(15) NOT NULL,
    numCinema INT NOT NULL,
    nombre INT NOT NULL,
    CONSTRAINT pk_Nombre PRIMARY KEY(nomTypeFilm, numCinema),
    CONSTRAINT fk_nomTypeFilm_Nombre FOREIGN KEY(nomTypeFilm) REFERENCES TypeFilm(nomTypeFilm),
    CONSTRAINT fk_numCinema_Nombre FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema)
);

CREATE TABLE Jour(
    jour VARCHAR(9) NOT NULL,
    CONSTRAINT pk_Jours PRIMARY KEY(jour)
);

CREATE TABLE Semaine(
    semaine VARCHAR(15) NOT NULL,
    CONSTRAINT pk_Semaine PRIMARY KEY(semaine)
);

CREATE TABLE Mois(
    mois VARCHAR(15) NOT NULL,
    CONSTRAINT pk_Mois PRIMARY KEY(mois)
);

CREATE TABLE Region(
    nomRegion VARCHAR(20) NOT NULL,
    CONSTRAINT pk_Region PRIMARY KEY(nomRegion)
);

CREATE TABLE TypeCategorie(
    nomTypeCategorie VARCHAR(30) NOT NULL,
    CONSTRAINT pk_nomTypeCategorie PRIMARY KEY(nomTypeCategorie)
);





CREATE TABLE Categorie(
    nomCategorie VARCHAR(20) NOT NULL,
    nomTypeCategorie VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Categorie PRIMARY KEY(nomCategorie)
);


CREATE TABLE ActiviteParAnnee(
    numCinema INT NOT NULL,
    annee INT NOT NULL,
    nbEntrees INT,
    CONSTRAINT pk_ActiviteParAnnee PRIMARY KEY(numCinema,annee),
    CONSTRAINT fk_numCinema_ActiviteParAnnee FOREIGN KEY(numCinema) REFERENCES Cinema(numCinema),
    CONSTRAINT fk_annee_ActiviteParAnnee FOREIGN KEY(annee) REFERENCES Annee(annee)
);

CREATE TABLE HistoriqueCommune(
    numCommune VARCHAR(10) NOT NULL,
    annee INT NOT NULL,
    nbEtablissement INT,
    nbEcrans INT,
    nbFauteuils INT,
    nbMultiplexes INT,
    nbCinemasArtEssai INT,
    nbSeances INT,
    nbEntrees INT,
    recettes FLOAT,
    populations INT,
    CONSTRAINT pk_HistoriqueCommune PRIMARY KEY(numCommune,annee),
    CONSTRAINT fk_numCommune_HC FOREIGN KEY(numCommune) REFERENCES Commune(numCommune),
    CONSTRAINT fk_annee_HC FOREIGN KEY(annee) REFERENCES Annee(annee)
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
    nbEtablissementsAE INT,
    nbEcransAE INT,
    nbFauteuilsAE INT,
    nbSeancesAE INT,
    nbEntreesAE INT,
    recettesAE INT, 
    tauxOccupationAE FLOAT,
    CONSTRAINT pk_HistoriqueDep PRIMARY KEY(numDepartement,annee),
    CONSTRAINT fk_numCommune_HistoriqueDep FOREIGN KEY(numDepartement) REFERENCES Departement(numDepartement),
    CONSTRAINT fk_annee_HistoriqueDep FOREIGN KEY(annee) REFERENCES Annee(annee)
);

CREATE TABLE HistoriqueUniteUrbaine(
    numUniteUrbaine VARCHAR(8) NOT NULL,
    annee INT NOT NULL,
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
    CONSTRAINT pk_HistoriqueUU PRIMARY KEY(numUniteUrbaine,annee),
    CONSTRAINT fk_numCommune_HistoriqueUU FOREIGN KEY(numUniteUrbaine) REFERENCES UniteUrbaine(numUniteUrbaine),
    CONSTRAINT fk_annee_HistoriqueUU FOREIGN KEY(annee) REFERENCES Annee(annee)
);

CREATE TABLE FrequentationParJour(
    annee INT NOT NULL,
    jour VARCHAR(9) NOT NULL,
    pourcentageEntrees FLOAT,
    pourcentageSeances FLOAT,
    CONSTRAINT pk_FrequentationParJour PRIMARY KEY(annee, jour),
    CONSTRAINT fk_annee_FreqJour FOREIGN KEY(annee) REFERENCES Annee(annee),
    CONSTRAINT fk_jour_FreqJour FOREIGN KEY(jour) REFERENCES Jour(jour)
);

CREATE TABLE FrequentationParSemaine(
    annee INT NOT NULL,
    semaine VARCHAR(15) NOT NULL,
    nbEntrees INT,
    recettes FLOAT,
    nbSeances INT,
    CONSTRAINT pk_FreqSem PRIMARY KEY(annee, semaine),
    CONSTRAINT fk_annee_FreqSem FOREIGN KEY(annee) REFERENCES Annee(annee),
    CONSTRAINT fk_jour_FreqSem FOREIGN KEY(semaine) REFERENCES Semaine(semaine)
);

CREATE TABLE FrequentationParMois(
    annee INT NOT NULL,
    mois VARCHAR(15) NOT NULL,
    nbEntrees INT,
    recettes FLOAT,
    nbSeances INT,
    CONSTRAINT pk_FreqMois PRIMARY KEY(annee, mois),
    CONSTRAINT fk_annee_FreqMois FOREIGN KEY(annee) REFERENCES Annee(annee),
    CONSTRAINT fk_jour_FreqMois FOREIGN KEY(mois) REFERENCES Mois(mois)
);

CREATE TABLE Publics(
    annee INT NOT NULL,
    nomRegion VARCHAR(20) NOT NULL,
    nomCategorie VARCHAR(20) NOT NULL,
    pourcentage FLOAT,
    CONSTRAINT pk_Public PRIMARY KEY(annee, nomRegion, nomCategorie),
    CONSTRAINT fk_annee_Public FOREIGN KEY (annee) REFERENCES Annee(annee),
    CONSTRAINT fk_nomRegion_Public FOREIGN KEY (nomRegion) REFERENCES Region(nomRegion),
    CONSTRAINT fk_nomCat_Public FOREIGN KEY (nomCategorie) REFERENCES Categorie(nomCategorie)
);
