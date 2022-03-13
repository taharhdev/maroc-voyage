
/* CREATION DES TABLEAUX DANS LA BASE DE DONNEES */

CREATE TABLE Client(
id_client INT PRIMARY KEY,
region TEXT NOT NULL,
nom TEXT NOT NULL);

CREATE TABLE Station(
id_station INT PRIMARY KEY,
nom_station TEXT NOT NULL,
region TEXT NOT NULL,
capacite INT NOT NULL,
tarif NUMERIC(8,0) NOT NULL,
CHECK (tarif >= 0),
CHECK (capacite >= 0));

CREATE TABLE Sejour(
id_sejour INT PRIMARY KEY,
debut DATE NOT NULL,
nbplaces INT NOT NULL,
id_cli_sej INT NOT NULL REFERENCES Client(id_client),
id_sta_sej INT NOT NULL REFERENCES Station(id_station),
CHECK (nbplaces >= 0),
CONSTRAINT cli_sej_date UNIQUE (debut,id_cli_sej));

CREATE TABLE Activite(
libelle TEXT PRIMARY KEY);

CREATE TABLE Proposition(
id_sta_pro INT NOT NULL REFERENCES Station(id_station),
lib_act_pro TEXT NOT NULL REFERENCES Activite(libelle),
prix NUMERIC(8,0) NOT NULL,
CHECK (prix >= 0),
PRIMARY KEY (id_sta_pro,lib_act_pro));

/* REMPLISSAGR DES TABLEAUX DANS LA BASE DE DONNEES */

INSERT INTO Activite VALUES ('Vol en montgolfière'),('Excursion en bateau'),('Parc Croco'),
('Dune Buggy-s'),('Dos de chameau'),('Circuit en quad');
SELECT libelle from Activite;

INSERT INTO client VALUES (1,'Tantan','HAMER'),(2,'Ouarzazate','BENAISSA'),(3,'Casablanca','NDIAYE'),
(4,'Marrakech','MARZOUKI'),(5,'Agadir','AZIZ'),(6,'Agadir','BAHAMOU');
SELECT * from CLIENT;

INSERT INTO Station VALUES (1,'Ouled Ziane','Casablanca',30,150),(2,'Kamra','Agadir',35,300),(3,'Bab Doukkala','Marrakech',40,230),
(4,'CTM','Ouarzazate',30,280),(5,'Louizia','TanTan',35,360),(6,'Brouj','Settat',45,170);
SELECT * from Station;

INSERT INTO Sejour VALUES (1,'2020-07-01',5,3,2),(2,'2020-07-03',3,1,6),(3,'2020-07-05',2,2,4),
(4,'2020-07-11',1,5,5),(5,'2020-07-09',2,6,3),(6,'2020-07-07',1,4,1);
SELECT * from Sejour;

INSERT INTO proposition VALUES (6,'Circuit en quad',592),(5,'Dos de chameau',267),(1,'Dune Buggy-s',369),
(4,'Parc Croco',170),(2,'Excursion en bateau',474),(3,'Vol en montgolfière',1949);
SELECT * from proposition;
