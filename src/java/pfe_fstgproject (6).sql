-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 29 Mai 2017 à 03:10
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `pfe_fstgproject`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `ID` bigint(20) NOT NULL,
  `CONTENU` varchar(255) DEFAULT NULL,
  `DATECREATION` date DEFAULT NULL,
  `DATEDEBUT` date DEFAULT NULL,
  `DATEEXPIRATION` date DEFAULT NULL,
  `FILE` longblob,
  `PRIORITY` int(11) DEFAULT NULL,
  `TITRE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `AUTEUR_CIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ARTICLE_AUTEUR_CIN` (`AUTEUR_CIN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE IF NOT EXISTS `departement` (
  `ID` bigint(20) NOT NULL,
  `INTITULE` varchar(255) DEFAULT NULL,
  `CHEFDEPARTEMENT_CIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DEPARTEMENT_CHEFDEPARTEMENT_CIN` (`CHEFDEPARTEMENT_CIN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`ID`, `INTITULE`, `CHEFDEPARTEMENT_CIN`) VALUES
(1, 'math', 'cinBenrbib'),
(2, 'informatique', NULL),
(3, 'chimie', NULL),
(4, 'biologie', NULL),
(5, 'physique', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE IF NOT EXISTS `enseignant` (
  `CIN` varchar(255) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `TEL` varchar(255) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL,
  `FILIERE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CIN`),
  KEY `FK_ENSEIGNANT_FILIERE_ID` (`FILIERE_ID`),
  KEY `FK_ENSEIGNANT_DEPARTEMENT_ID` (`DEPARTEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `enseignant`
--

INSERT INTO `enseignant` (`CIN`, `EMAIL`, `NOM`, `PRENOM`, `TEL`, `DEPARTEMENT_ID`, `FILIERE_ID`) VALUES
('cinBenrbib', 'bantbib@gmail.com', 'bentbib', 'ben', '218545154515', 1, NULL),
('cinAbdali', 'abdali@gmail.com', 'abdali', 'abdelmonim', NULL, 2, NULL),
('cinHasri', 'hasri@gmail.com', 'hasri', 'hasriii', NULL, 5, NULL),
('cinSaadon', 'ismail@gmail.com', 'saadoun', 'ismail', NULL, 3, NULL),
('sefyaniCne', 'sefyani@gmail.com', 'Sefyani', 'Fouad', '062541365', 5, 6);

-- --------------------------------------------------------

--
-- Structure de la table `equiperecherche`
--

CREATE TABLE IF NOT EXISTS `equiperecherche` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  `CHEFEQUIPE_CIN` varchar(255) DEFAULT NULL,
  `LABORATOIRE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EQUIPERECHERCHE_LABORATOIRE_ID` (`LABORATOIRE_ID`),
  KEY `FK_EQUIPERECHERCHE_CHEFEQUIPE_CIN` (`CHEFEQUIPE_CIN`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `equiperecherche`
--

INSERT INTO `equiperecherche` (`ID`, `NOM`, `CHEFEQUIPE_CIN`, `LABORATOIRE_ID`) VALUES
(1, 'equipe1/1', 'cinBenrbib', 1),
(2, 'equipe2/1', 'cinAbdali', 1),
(3, 'equipe3/1', 'cinHasri', 1),
(4, 'equipe2/2', 'cinBenrbib', 2),
(5, 'equipe1/2', '156', 5),
(10, '\nPharmacologie et Bioactivité des substances naturelles', '123', 5),
(11, 'Valorisation des végétaux d’intérêt agro-économique et anticancéreux', '88754', 5),
(12, 'Chimie bioorganique & chimiométrie', '123', 6),
(13, ' Synthèse et complexation de molécules d’intérêt biologique, étude et application', '156', 6);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `CNE` bigint(20) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `GENDER` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `EQUIPERECHERCHE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CNE`),
  KEY `FK_ETUDIANT_EQUIPERECHERCHE_ID` (`EQUIPERECHERCHE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`CNE`, `EMAIL`, `GENDER`, `NOM`, `PRENOM`, `EQUIPERECHERCHE_ID`) VALUES
(123, 'fati@gmail.com', '', 'fatima', 'ait cheikh', 10),
(145, 'larbi@gmail.com', '', 'larbi', 'chibani', 10),
(156, 'hasna@gmail.com', '', 'hasna', 'sebti', 11),
(6552, 'kacha@gmail.com', '', 'btisam', 'kacha', 11),
(88754, 'hafid@gmail.com', '', 'hafida', 'anagri', 11),
(25541, 'mohmed@gmail.com', NULL, 'mohamed', 'ait cheikh', 12),
(988745, 'khalid@gmail.com', '', 'sebti', 'khalid', 12);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE IF NOT EXISTS `filiere` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ABREVIATION` varchar(255) DEFAULT NULL,
  `LIBELLE` varchar(255) DEFAULT NULL,
  `OBJECTIF` varchar(255) DEFAULT NULL,
  `TYPEFILIERE` int(11) DEFAULT NULL,
  `TYPEFORMATION` int(11) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL,
  `RESPONSABLEFILIERE_CIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FILIERE_RESPONSABLEFILIERE_CIN` (`RESPONSABLEFILIERE_CIN`),
  KEY `FK_FILIERE_DEPARTEMENT_ID` (`DEPARTEMENT_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `filiere`
--

INSERT INTO `filiere` (`ID`, `ABREVIATION`, `LIBELLE`, `OBJECTIF`, `TYPEFILIERE`, `TYPEFORMATION`, `DEPARTEMENT_ID`, `RESPONSABLEFILIERE_CIN`) VALUES
(6, 'MIP', 'math informatique physique ', NULL, 1, 1, 1, 'cinBenrbib'),
(7, 'MIPC', 'math info physique chimie', '', 1, 1, 1, 'sefyaniCne'),
(8, 'bcg', 'biologie chimie geologie', '', 1, 1, 1, 'cinSaadon'),
(9, 'MIASI', 'MIASI', NULL, 2, 1, 1, 'cinBenrbib'),
(10, 'SIR', 'systeme d''info repartis', '', 2, 1, 1, 'cinAbdali'),
(11, 'PM', 'physique ds materiaux', '', 2, 1, 1, 'cinSaadon'),
(12, 'IRISI', 'IRISI', '', 3, 1, 1, 'cinAbdali'),
(13, 'Genie des materiaux', 'GM', '', 3, 1, 1, 'cinHasri'),
(14, 'SIR', 'Systemes d''informatique repartis', '', 2, 2, 2, 'cinAbdali');

-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

CREATE TABLE IF NOT EXISTS `laboratoire` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `DIRECTEUR_CIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_LABORATOIRE_DIRECTEUR_CIN` (`DIRECTEUR_CIN`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `laboratoire`
--

INSERT INTO `laboratoire` (`ID`, `DESCRIPTION`, `NOM`, `DIRECTEUR_CIN`) VALUES
(1, '', 'Modélisation et Calcul Scientifique', 'cinBenrbib'),
(2, '', 'Signaux, Systèmes et Composants', 'cinAbdali'),
(3, '', 'Laboratoire Energies Renouvelables et Systèmes Intélligents', 'cinHasri'),
(4, '', 'Biotechnologie Microbienne', 'cinSaadon'),
(6, 'Le laboratoire de Chimie Organique Appliquée (LCOA) de la Faculté des Sciences et Techniques de Fès – Université Sidi Mohamed Ben Abdellah compte 19 enseignants-chercheurs permanents travaillant sur des thématiques clés, à savoir les molécules bioactives ', 'Chimie Organique Appliquée', 'cinSaadon');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DATEENVOI` datetime DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LU` tinyint(1) DEFAULT '0',
  `NOM` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `SUJET` varchar(255) DEFAULT NULL,
  `TEXTMESSAGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`ID`, `DATEENVOI`, `EMAIL`, `LU`, `NOM`, `PRENOM`, `SUJET`, `TEXTMESSAGE`) VALUES
(40, NULL, 'fatima@gmail.com', 1, 'uuuuuuuuuuuu', 'iiiiiiiiiiiii', NULL, 'jnkun joooiii iiiiiiiiiiiiiii'),
(41, '2017-05-28 09:42:31', 'fatima@gmail.com', 1, 'uuuuuuuuuuuu', 'iiiiiiiiiiiii', NULL, 'jnkun joooiii iiiiiiiiiiiiiii');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  `FILIERE_ID` bigint(20) DEFAULT NULL,
  `SEMESTRE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MODULE_SEMESTRE_ID` (`SEMESTRE_ID`),
  KEY `FK_MODULE_FILIERE_ID` (`FILIERE_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `module`
--

INSERT INTO `module` (`ID`, `NOM`, `FILIERE_ID`, `SEMESTRE_ID`) VALUES
(1, 'ALGEBR1', 6, 1),
(2, 'ANALYSE 1', 6, 1),
(3, 'electricite', 7, 1),
(4, 'termodynamique', 7, 5),
(5, 'tec 1', 7, 5),
(6, 'mecanique du point', 7, 6),
(10, 'analyse2', 6, 2),
(11, 'algebre2', 6, 2),
(12, 'Systemes de gestion des bases des données', 10, 9),
(13, 'POO : JAVA', 10, 9),
(14, 'Réseau', 10, 9),
(15, 'Systèmes d''exploitations', 10, 9),
(16, 'Programmation web', 10, 9),
(17, 'UML', 10, 9),
(18, 'JEE', 10, 10),
(19, 'BDR', 10, 10),
(20, 'IHM', 10, 10),
(21, 'Analyse 1', 7, 5),
(22, 'algebre 1', 7, 5),
(23, 'atomestique', 7, 6),
(24, 'electricité', 7, 6),
(25, 'électronique', 7, 6),
(26, 'TEC 2', 7, 6);

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

CREATE TABLE IF NOT EXISTS `ouvrage` (
  `NUMERO` varchar(255) NOT NULL,
  `AUTEUR` varchar(255) DEFAULT NULL,
  `EDITION` varchar(255) DEFAULT NULL,
  `RUBRIQUE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `FK_OUVRAGE_RUBRIQUE_ID` (`RUBRIQUE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE IF NOT EXISTS `rubrique` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `FILIERE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SEMESTRE_FILIERE_ID` (`FILIERE_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `semestre`
--

INSERT INTO `semestre` (`ID`, `NUMERO`, `FILIERE_ID`) VALUES
(1, 1, 6),
(2, 2, 6),
(3, 3, 6),
(4, 4, 6),
(5, 1, 7),
(6, 2, 7),
(7, 3, 7),
(8, 4, 7),
(9, 5, 10),
(10, 6, 10);

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '0');

-- --------------------------------------------------------

--
-- Structure de la table `themerecherche`
--

CREATE TABLE IF NOT EXISTS `themerecherche` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  `EQUIPERECHERCHE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_THEMERECHERCHE_EQUIPERECHERCHE_ID` (`EQUIPERECHERCHE_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `themerecherche`
--

INSERT INTO `themerecherche` (`ID`, `NOM`, `EQUIPERECHERCHE_ID`) VALUES
(1, ' L''Allergie aux produits alimentaires', 5),
(2, 'Etude de l''effet de plantes sur la régulation de la glycémie et étude de l''incidence de l''obésité infantile', 5),
(13, 'Activité anticancéreuse', 11),
(14, 'Effet des champignons mycorhiziens et du stress hydrique sur la synthèse des huiles', 11),
(15, 'Etude de la maturité phénolique et cellulaire chez les olives de la Picholine marocaine.', 11),
(16, 'Synthèse et étude de molécules d’intérêt biologique à base d''hétérocycles (triazole, isoxazole, isoxazoline,…) sucres et aminoacides', 12),
(17, 'Analyse, étude et valorisation de substances naturelles', 12),
(6, 'Plantes aromatiques et médicinales', 13),
(7, 'Evaluation électrochimique des molécules hétérocycliques', 13);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
