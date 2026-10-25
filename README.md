# Analyse des tarifs d'hébergement en ehpad

Projet universitaire d'analyse statistique des données de prix des ehpad en 2020, fournies dans le cadre du cours à partir des données de la cnsa. L'étude explore les différences de tarifs selon le statut juridique des établissements, le type de chambre et l'habilitation à l'aide sociale à l'hébergement.

Le dépôt rassemble les données, le script d'analyse, le rapport et le support de présentation.

## Analyses réalisées

- Sélection des variables utiles, transformation des catégories en facteurs et traitement des valeurs manquantes.
- Description des prix d'hébergement permanent selon les statuts public, privé non lucratif et privé commercial.
- Comparaison des tarifs des chambres simples et doubles, ainsi que des tarifs associés à l'aide sociale à l'hébergement.
- Étude de l'association entre statut juridique et habilitation à l'aide sociale à l'hébergement.
- Calculs d'intervalles de confiance, tests du khi-deux, tests appariés de comparaison et analyses de variance.
- Création de graphiques pour la restitution orale.

## Fichiers à consulter

| Fichier | Contenu |
| --- | --- |
| [RAPPORT.pdf](RAPPORT.pdf) | Rapport de l'étude |
| [DIAPO_RAPPORT_CNSA__L2_SPS-_GRP3_.pdf](DIAPO_RAPPORT_CNSA__L2_SPS-_GRP3_.pdf) | Présentation des analyses |
| [SCRIPT_ORAL.R](SCRIPT_ORAL.R) | Préparation des données, analyses et graphiques |
| [cnsa.csv](cnsa.csv) | Données utilisées |
| [cnsa-documentation-donnees-ehpad-retraitee.pdf](cnsa-documentation-donnees-ehpad-retraitee.pdf) | Documentation des variables |

## Utilisation

Les documents pdf permettent de consulter le travail sans exécuter de code.

Pour explorer l'analyse, ouvrir le dépôt dans rstudio, importer `cnsa.csv` avec le séparateur point-virgule et nommer le tableau importé `cnsa`. Vérifier que les colonnes de prix sont numériques et que les noms de colonnes sont conservés, puis ouvrir `SCRIPT_ORAL.R` et exécuter les sections dans l'ordre.

Le script utilise les fonctions statistiques et graphiques fournies avec r. Il suppose que l'objet `cnsa` existe déjà dans l'environnement : l'importation du fichier n'est pas incluse dans le script.

## Contexte du travail

Travail réalisé par hâjar abdaoui, shaïnez romana et karima zouzane, groupe 3.

Il s'agit d'une analyse pédagogique des données de 2020. Certains paramètres de calcul sont renseignés directement dans le script ; ils doivent être revus avant de réutiliser le code sur un autre jeu de données.

<details>
<summary>Consignes pédagogiques d'origine</summary>

# consignes rapport_cnsa
L’objectif du projet est d’analyser les données fournies et de présenter les résultats des analyses en définissant bien sûr une problématique.
— Le projet se fait en trinôme/binôme
— Rapport : le rapport doit être déposé au format *.pdf sur moodle. Le rapport contient les objectifs de
l’analyse clairement définis, les questions posées, les graphiques et les interprétations.
— Présentation : la présentation du rapport (format de votre choix *.ppt, beamer, ...) aura lieu pendant la dernière séance des TP. Cette présentation durera 10 minutes et sera suivie par des questions. Penser à enregistrer votre présentation au format pdf afin d’éviter des surprises lors de la lecture en salle.
— Le script : le script propre et commenté doit être déposé sur moodle au format .R. Le script contiendra le programme permettant d’obtenir les résultats d’analyses. Le rapport devra contenir 5 pages (page de
garde comprise).
Bon travail !
Les Données : Prix EHPAD 2020 (cf PJ)

</details>
