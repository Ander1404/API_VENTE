-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 16 mai 2025 à 15:25
-- Version du serveur : 8.4.2
-- Version de PHP : 8.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_gestion_stock`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdateApprovisionnement` (IN `p_id` INT, IN `p_fournisseur_id` INT)   BEGIN
    DECLARE countall INT;
    /* Vérifier si l'enregistrement existe déjà*/
    SELECT COUNT(*) INTO countall FROM approvisionnement WHERE id_approvisionnement = p_id;
    /* Si l'enregistrement existe, effectuer une mise à jour*/
    IF countall > 0 THEN
    UPDATE approvisionnement SET fournisseur_id = p_fournisseur_id WHERE id_approvisionnement = p_id;
    ELSE
        /* Sinon, effectuer une insertion*/
        INSERT INTO approvisionnement (id_approvisionnement, fournisseur_id, date_approvisionnement)
        VALUES (p_id, p_fournisseur_id, CURRENT_DATE());
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdateCategorieProduit` (IN `p_id` INT, IN `p_designation` VARCHAR(50))   BEGIN
    DECLARE countall INT;
    /* Vérifier si l'enregistrement existe déjà*/
    SELECT COUNT(*) INTO countall FROM categorieproduit WHERE id_categorie = p_id;
    /* Si l'enregistrement existe, effectuer une mise à jour*/
    IF countall > 0 THEN
    UPDATE categorieproduit SET designation = p_designation WHERE id_categorie = p_id;
    ELSE
        /* Sinon, effectuer une insertion*/
        INSERT INTO categorieproduit (id_categorie, designation)
        VALUES (p_id, p_designation);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdateClient` (IN `p_id` INT, IN `p_noms` VARCHAR(100), IN `p_telephone` VARCHAR(20), IN `p_adresse` VARCHAR(100), IN `p_mail` VARCHAR(100))   BEGIN
    DECLARE countall INT;
    /* Vérifier si l'enregistrement existe déjà*/
    SELECT COUNT(*) INTO countall FROM tclient WHERE id_client = p_id;
    /* Si l'enregistrement existe, effectuer une mise à jour*/
    IF countall > 0 THEN
    UPDATE tclient SET noms = p_noms,telephone=p_telephone,adresse=p_adresse,mail=p_mail WHERE id_client = p_id;
    ELSE
        /* Sinon, effectuer une insertion*/
        INSERT INTO tclient (id_client, noms, telephone,adresse,mail)
        VALUES (p_id, p_noms,p_telephone,p_adresse,p_mail);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdateDetailApprovisionnement` (IN `p_id` INT, IN `p_approvisionnement_id` INT, IN `p_produit_id` INT, IN `p_quantite` INT, IN `p_prixu` DECIMAL(10,2))   BEGIN
    DECLARE countall INT;
    /* Vérifier si l'enregistrement existe déjà*/
    SELECT COUNT(*) INTO countall FROM detail_approvisionnement WHERE id_detailApprovisionnement = p_id;
    /* Si l'enregistrement existe, effectuer une mise à jour*/
    IF countall > 0 THEN
    UPDATE detail_approvisionnement SET approvisionnement_id = p_approvisionnement_id,produit_id=p_produit_id,quantite=p_quantite,prixu=p_prixu WHERE id_detailApprovisionnement = p_id;
    ELSE
        /* Sinon, effectuer une insertion*/
        INSERT INTO detail_approvisionnement (id_detailApprovisionnement, approvisionnement_id, produit_id,quantite,prixu)
        VALUES (p_id, p_approvisionnement_id,p_produit_id,p_quantite,p_prixu);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdateDetailVente` (IN `p_id` INT, IN `p_vente_id` INT, IN `p_produit_id` INT, IN `p_quantite` INT, IN `p_prixu` DECIMAL(10,2))   BEGIN
    DECLARE countall INT;
    /* Vérifier si l'enregistrement existe déjà*/
    SELECT COUNT(*) INTO countall FROM detail_vente WHERE id_detailVente = p_id;
    /* Si l'enregistrement existe, effectuer une mise à jour*/
    IF countall > 0 THEN
    UPDATE detail_vente SET vente_id = p_vente_id,produit_id=p_produit_id,quantite=p_quantite,prixu=p_prixu WHERE id_detailVente = p_id;
    ELSE
        /* Sinon, effectuer une insertion*/
        INSERT INTO detail_vente (id_detailVente, vente_id, produit_id,quantite,prixu)
        VALUES (p_id, p_vente_id,p_produit_id,p_quantite,p_prixu);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdateFournisseur` (IN `p_id` INT, IN `p_noms` VARCHAR(100), IN `p_telephone` VARCHAR(20), IN `p_adresse` VARCHAR(100), IN `p_mail` VARCHAR(100))   BEGIN
    DECLARE countall INT;
    -- Vérifier si l'enregistrement existe déjà
    SELECT COUNT(*) INTO countall FROM tfournisseur WHERE id_fournisseur = p_id;
    -- Si l'enregistrement existe, effectuer une mise à jour
    IF countall > 0 THEN
    UPDATE tfournisseur SET noms = p_noms,telephone=p_telephone,adresse=p_adresse,mail=p_mail WHERE id_fournisseur = p_id;
    ELSE
        /* Sinon, effectuer une insertion*/
        INSERT INTO tfournisseur (id_fournisseur, noms, telephone,adresse,mail)
        VALUES (p_id, p_noms,p_telephone,p_adresse,p_mail);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdateProduit` (IN `p_id` INT, IN `p_categorie_id` INT, IN `p_designation` VARCHAR(50), IN `p_quantite` INT, IN `p_prixu` DECIMAL(10,2), IN `image` TEXT)   BEGIN
    DECLARE countall INT;
    /* Vérifier si l'enregistrement existe déjà*/
    SELECT COUNT(*) INTO countall FROM produit WHERE id_produit = p_id;
    /* Si l'enregistrement existe, effectuer une mise à jour*/
    IF countall > 0 THEN
    UPDATE produit SET categorie_id = p_categorie_id,designation=p_designation,quantite=p_quantite,prixu=p_prixu WHERE id_produit = p_id;
    ELSE
        /* Sinon, effectuer une insertion*/
INSERT INTO produit (id_produit, categorie_id, designation,quantite,prixu,image)
       VALUES (p_id, p_categorie_id,p_designation,p_quantite,p_prixu,image); 
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdateVente` (IN `p_id` INT, IN `p_client_id` INT)   BEGIN
    DECLARE countall INT;
    /* Vérifier si l'enregistrement existe déjà*/
    SELECT COUNT(*) INTO countall FROM vente WHERE id_vente = p_id;
    /* Si l'enregistrement existe, effectuer une mise à jour*/
    IF countall > 0 THEN
    UPDATE vente SET client_id = p_client_id WHERE id_vente = p_id;
    ELSE
        /* Sinon, effectuer une insertion*/
        INSERT INTO vente (id_vente, client_id, date_vente)
        VALUES (p_id, p_client_id, CURRENT_DATE());
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_transaction_stock` (IN `p_produit_id` INT, IN `p_quantite` INT, IN `p_prixu` DECIMAL(10,2), IN `p_type_operation` ENUM('ENTREE','SORTIE'))   BEGIN
    DECLARE stock_actuel INT;
    declare prix_actuel decimal(10,2);
    declare PT_entree decimal(10,2);
    DECLARE Prix_total decimal(10,2);
    declare SFentree int;
    	declare SFPrix decimal(10,2);
    	declare CUMP decimal(10,2);
        DECLARE prix_tmp decimal(10,2);
    
    -- Récupérer la quantité en stock actuelle du produit
    
    set PT_entree = p_quantite*p_prixu;
    -- dec
    -- stock actuel
    SELECT quantite INTO stock_actuel FROM produit
    WHERE id_produit = p_produit_id;    
     -- prix actuel
    SELECT prixu into prix_actuel from produit where id_produit = p_produit_id;  
    -- prix total actuel  
    SELECT (prixu* quantite) into Prix_total  FROM `produit` WHERE id_produit=p_produit_id;
        
    -- Vérifier le type d'opération et mettre à jour la quantité en stock
    IF p_type_operation = 'ENTREE' THEN
    	set SFentree =stock_actuel+p_quantite;
    	set SFPrix =Prix_total+PT_entree;
    	set CUMP =SFPrix/SFentree;
     	SET stock_actuel = stock_actuel + p_quantite;         
       	set prix_actuel=CUMP;
        set prix_tmp=p_prixu;
        UPDATE produit	SET quantite = stock_actuel, prixu=CUMP	WHERE id_produit = p_produit_id;    
    ELSEIF p_type_operation = 'SORTIE' THEN
        SET stock_actuel = stock_actuel - p_quantite;
        set prix_tmp=prix_actuel;        
        UPDATE produit	SET quantite = stock_actuel WHERE id_produit = p_produit_id;    
    END IF;
    -- Insérer un enregistrement dans la table des transactions de stock
    INSERT INTO mouvementstock (produit_id, quantite,prixu ,type_operation,dateoperation)
    VALUES (p_produit_id, p_quantite,prix_tmp,p_type_operation,CURRENT_DATE());
    
    -- Afficher un message de confirmation
    SELECT CONCAT('Quantité en stock mise à jour : ', stock_actuel) AS message;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `approvisionnement`
--

CREATE TABLE `approvisionnement` (
  `id_approvisionnement` int NOT NULL,
  `fournisseur_id` int DEFAULT NULL,
  `date_approvisionnement` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `approvisionnement`
--

INSERT INTO `approvisionnement` (`id_approvisionnement`, `fournisseur_id`, `date_approvisionnement`) VALUES
(1, 2, '2024-02-02'),
(2, 1, '2024-02-03'),
(3, 1, '2024-02-07');

-- --------------------------------------------------------

--
-- Structure de la table `categorieproduit`
--

CREATE TABLE `categorieproduit` (
  `id_categorie` int NOT NULL,
  `designation` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorieproduit`
--

INSERT INTO `categorieproduit` (`id_categorie`, `designation`) VALUES
(1, 'papiers'),
(2, 'stylo'),
(3, 'colle');

-- --------------------------------------------------------

--
-- Structure de la table `detail_approvisionnement`
--

CREATE TABLE `detail_approvisionnement` (
  `id_detailApprovisionnement` int NOT NULL,
  `approvisionnement_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int DEFAULT NULL,
  `prixu` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `detail_approvisionnement`
--

INSERT INTO `detail_approvisionnement` (`id_detailApprovisionnement`, `approvisionnement_id`, `produit_id`, `quantite`, `prixu`) VALUES
(1, 1, 1, 10, 6.00),
(2, 1, 2, 2, 10.00);

-- --------------------------------------------------------

--
-- Structure de la table `detail_vente`
--

CREATE TABLE `detail_vente` (
  `id_detailVente` int NOT NULL,
  `vente_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int DEFAULT NULL,
  `prixu` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `detail_vente`
--

INSERT INTO `detail_vente` (`id_detailVente`, `vente_id`, `produit_id`, `quantite`, `prixu`) VALUES
(1, 1, 1, 4, 7.00),
(2, 1, 2, 1, 7.00);

-- --------------------------------------------------------

--
-- Structure de la table `mouvementstock`
--

CREATE TABLE `mouvementstock` (
  `id_mouvement` int NOT NULL,
  `produit_id` int DEFAULT NULL,
  `type_operation` enum('ENTREE','SORTIE') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  `prixu` decimal(10,2) DEFAULT NULL,
  `dateoperation` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `mouvementstock`
--

INSERT INTO `mouvementstock` (`id_mouvement`, `produit_id`, `type_operation`, `quantite`, `prixu`, `dateoperation`) VALUES
(1, 1, 'ENTREE', 10, 6.00, '2024-02-03 00:00:00'),
(2, 1, 'SORTIE', 4, 6.00, '2024-02-03 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int NOT NULL,
  `categorie_id` int DEFAULT NULL,
  `designation` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  `prixu` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `categorie_id`, `designation`, `quantite`, `prixu`, `image`) VALUES
(1, 1, 'duplicateur', 6, 6.00, '/images'),
(2, 2, 'obama', 0, 2.00, 'image/'),
(3, 1, 'bristole', 1, 0.00, 'image/'),
(4, 1, '\"MANGUES\"', 0, 0.00, 'images/.');

-- --------------------------------------------------------

--
-- Structure de la table `tclient`
--

CREATE TABLE `tclient` (
  `id_client` int NOT NULL,
  `noms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tclient`
--

INSERT INTO `tclient` (`id_client`, `noms`, `telephone`, `adresse`, `mail`) VALUES
(1, 'masika makasi laurence', '+243824903869', 'ville de goma', 'laurencemasika@gmail.com'),
(2, 'dorcas', '098754', 'ville de goma', 'dorcasmbonyi@gmail.com'),
(3, 'dorcas', '098754', 'ville de goma', 'dorcasmbonyi@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `tfournisseur`
--

CREATE TABLE `tfournisseur` (
  `id_fournisseur` int NOT NULL,
  `noms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tfournisseur`
--

INSERT INTO `tfournisseur` (`id_fournisseur`, `noms`, `telephone`, `adresse`, `mail`) VALUES
(1, 'mbonyimbunga dorcas', '+243976729986', 'ville de goma', 'dorcasmbonyimbunga@gmail.com'),
(2, 'muhindo kami el', '+243974177011', 'ville de goma', 'bethelkami@gmail.com'),
(3, 'dorcas', '098754', 'ville de goma', 'dorcasmbonyi@gmail.com');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vapprovisionnement`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vapprovisionnement` (
`id_approvisionnement` int
,`fournisseur` varchar(100)
,`date_approvisionnement` date
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vdetailapprovisionnement`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vdetailapprovisionnement` (
`id_detailApprovisionnement` int
,`fournisseur` varchar(100)
,`dateApprovisionnement` date
,`produit` varchar(20)
,`quantite` int
,`prixu` decimal(10,2)
,`approvisionnement_id` int
,`prix_total` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vdetailvente`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vdetailvente` (
`id_detailVente` int
,`client` varchar(100)
,`datevente` date
,`produit` varchar(20)
,`quantite` int
,`prixu` decimal(10,2)
,`vente_id` int
,`prix_total` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `id_vente` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `date_vente` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id_vente`, `client_id`, `date_vente`) VALUES
(1, 2, '2024-02-03'),
(2, 1, '2024-02-07');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vmouvementstock`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vmouvementstock` (
`id_mouvement` int
,`produit` varchar(20)
,`quantite` int
,`prixu` decimal(10,2)
,`type_operation` enum('ENTREE','SORTIE')
,`dateoperation` datetime
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vproduit`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vproduit` (
`id_produit` int
,`categorie` varchar(20)
,`designation` varchar(20)
,`quantite` int
,`image` varchar(255)
,`prixu` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vvente`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vvente` (
`id_vente` int
,`client` varchar(100)
,`date_vente` date
);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD PRIMARY KEY (`id_approvisionnement`),
  ADD KEY `fk_approvisionnement_fournisseur` (`fournisseur_id`);

--
-- Index pour la table `categorieproduit`
--
ALTER TABLE `categorieproduit`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `detail_approvisionnement`
--
ALTER TABLE `detail_approvisionnement`
  ADD PRIMARY KEY (`id_detailApprovisionnement`) USING BTREE,
  ADD KEY `fk_detail_approvisionnement_approvisionnement` (`approvisionnement_id`),
  ADD KEY `fk_detail_approvisionnement_produit` (`produit_id`);

--
-- Index pour la table `detail_vente`
--
ALTER TABLE `detail_vente`
  ADD PRIMARY KEY (`id_detailVente`) USING BTREE,
  ADD KEY `fk_detail_vente_vente` (`vente_id`),
  ADD KEY `fk_detail_vente_produit` (`produit_id`);

--
-- Index pour la table `mouvementstock`
--
ALTER TABLE `mouvementstock`
  ADD PRIMARY KEY (`id_mouvement`),
  ADD KEY `fk_mouvementstock_produit` (`produit_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `fk_produit_categorie` (`categorie_id`);

--
-- Index pour la table `tclient`
--
ALTER TABLE `tclient`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `tfournisseur`
--
ALTER TABLE `tfournisseur`
  ADD PRIMARY KEY (`id_fournisseur`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id_vente`),
  ADD KEY `fk_vente_client` (`client_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  MODIFY `id_approvisionnement` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `categorieproduit`
--
ALTER TABLE `categorieproduit`
  MODIFY `id_categorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `detail_approvisionnement`
--
ALTER TABLE `detail_approvisionnement`
  MODIFY `id_detailApprovisionnement` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `detail_vente`
--
ALTER TABLE `detail_vente`
  MODIFY `id_detailVente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `mouvementstock`
--
ALTER TABLE `mouvementstock`
  MODIFY `id_mouvement` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tclient`
--
ALTER TABLE `tclient`
  MODIFY `id_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tfournisseur`
--
ALTER TABLE `tfournisseur`
  MODIFY `id_fournisseur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `vente`
--
ALTER TABLE `vente`
  MODIFY `id_vente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- --------------------------------------------------------

--
-- Structure de la vue `vapprovisionnement`
--
DROP TABLE IF EXISTS `vapprovisionnement`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vapprovisionnement`  AS SELECT `approvisionnement`.`id_approvisionnement` AS `id_approvisionnement`, `tfournisseur`.`noms` AS `fournisseur`, `approvisionnement`.`date_approvisionnement` AS `date_approvisionnement` FROM (`approvisionnement` join `tfournisseur` on((`tfournisseur`.`id_fournisseur` = `approvisionnement`.`fournisseur_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vdetailapprovisionnement`
--
DROP TABLE IF EXISTS `vdetailapprovisionnement`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vdetailapprovisionnement`  AS SELECT `detail_approvisionnement`.`id_detailApprovisionnement` AS `id_detailApprovisionnement`, `vapprovisionnement`.`fournisseur` AS `fournisseur`, `vapprovisionnement`.`date_approvisionnement` AS `dateApprovisionnement`, `produit`.`designation` AS `produit`, `detail_approvisionnement`.`quantite` AS `quantite`, `detail_approvisionnement`.`prixu` AS `prixu`, `detail_approvisionnement`.`approvisionnement_id` AS `approvisionnement_id`, (`detail_approvisionnement`.`quantite` * `detail_approvisionnement`.`prixu`) AS `prix_total` FROM ((`detail_approvisionnement` join `vapprovisionnement` on((`vapprovisionnement`.`id_approvisionnement` = `detail_approvisionnement`.`approvisionnement_id`))) join `produit` on((`produit`.`id_produit` = `detail_approvisionnement`.`produit_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vdetailvente`
--
DROP TABLE IF EXISTS `vdetailvente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vdetailvente`  AS SELECT `detail_vente`.`id_detailVente` AS `id_detailVente`, `vvente`.`client` AS `client`, `vvente`.`date_vente` AS `datevente`, `produit`.`designation` AS `produit`, `detail_vente`.`quantite` AS `quantite`, `detail_vente`.`prixu` AS `prixu`, `detail_vente`.`vente_id` AS `vente_id`, (`detail_vente`.`quantite` * `detail_vente`.`prixu`) AS `prix_total` FROM ((`detail_vente` join `vvente` on((`vvente`.`id_vente` = `detail_vente`.`vente_id`))) join `produit` on((`produit`.`id_produit` = `detail_vente`.`produit_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vmouvementstock`
--
DROP TABLE IF EXISTS `vmouvementstock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmouvementstock`  AS SELECT `mouvementstock`.`id_mouvement` AS `id_mouvement`, `produit`.`designation` AS `produit`, `mouvementstock`.`quantite` AS `quantite`, `mouvementstock`.`prixu` AS `prixu`, `mouvementstock`.`type_operation` AS `type_operation`, `mouvementstock`.`dateoperation` AS `dateoperation` FROM (`mouvementstock` join `produit` on((`produit`.`id_produit` = `mouvementstock`.`produit_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vproduit`
--
DROP TABLE IF EXISTS `vproduit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vproduit`  AS SELECT `produit`.`id_produit` AS `id_produit`, `categorieproduit`.`designation` AS `categorie`, `produit`.`designation` AS `designation`, `produit`.`quantite` AS `quantite`, `produit`.`image` AS `image`, `produit`.`prixu` AS `prixu` FROM (`produit` join `categorieproduit` on((`categorieproduit`.`id_categorie` = `produit`.`categorie_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vvente`
--
DROP TABLE IF EXISTS `vvente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vvente`  AS SELECT `vente`.`id_vente` AS `id_vente`, `tclient`.`noms` AS `client`, `vente`.`date_vente` AS `date_vente` FROM (`vente` join `tclient` on((`tclient`.`id_client` = `vente`.`client_id`))) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD CONSTRAINT `fk_approvisionnement_fournisseur` FOREIGN KEY (`fournisseur_id`) REFERENCES `tfournisseur` (`id_fournisseur`);

--
-- Contraintes pour la table `detail_approvisionnement`
--
ALTER TABLE `detail_approvisionnement`
  ADD CONSTRAINT `fk_detail_approvisionnement_approvisionnement` FOREIGN KEY (`approvisionnement_id`) REFERENCES `approvisionnement` (`id_approvisionnement`),
  ADD CONSTRAINT `fk_detail_approvisionnement_produit` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `detail_vente`
--
ALTER TABLE `detail_vente`
  ADD CONSTRAINT `fk_detail_vente_produit` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fk_detail_vente_vente` FOREIGN KEY (`vente_id`) REFERENCES `vente` (`id_vente`);

--
-- Contraintes pour la table `mouvementstock`
--
ALTER TABLE `mouvementstock`
  ADD CONSTRAINT `fk_mouvementstock_produit` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categorieproduit` (`id_categorie`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `fk_vente_client` FOREIGN KEY (`client_id`) REFERENCES `tclient` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
