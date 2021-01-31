-- Exercices 1 du site web: sql.sh

-- Question 1: obtenir la liste des 10 villes les plus peuplées en 2012.

SELECT * 
FROM villes
ORDER BY ville_population_2012 DESC
LIMIT 10 ;

-- Question 2: obtenir la liste des 50 villes ayant la plus faible superficie.

SELECT ville_departement, ville_nom, ville_surface
FROM villes
ORDER BY ville_surface ASC
LIMIT 50 ;

-- Question 3: obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département 
-- commencent par “97”.

SELECT departement_code, departement_nom
FROM departement
WHERE departement_code LIKE '97%' ;

-- Question 4: obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé.

SELECT villes.ville_id, villes.ville_departement, departement.departement_nom, villes.ville_nom_reel, villes.ville_population_1999, villes.ville_population_2010, villes.ville_population_2012
FROM villes, departement
WHERE villes.ville_departement = departement.departement_code
ORDER BY ville_population_2012 DESC
LIMIT 10 ;

-- Question 5: obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein 
-- de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes.

SELECT departement.departement_nom, departement.departement_code, villes.ville_departement, COUNT(*) as Nbr_commune
FROM villes, departement
WHERE villes.ville_departement = departement.departement_code
GROUP BY villes.ville_departement
ORDER BY Nbr_commune DESC
LIMIT 10 ;

-- Question 6: obtenir la liste des 10 plus grands départements, en terme de superficie.

SELECT departement.departement_code, departement.departement_nom, villes.ville_departement, SUM(villes.ville_surface) AS Surface_departement
FROM departement, villes
WHERE villes.ville_departement = departement.departement_code
GROUP BY departement.departement_code ;

-- Question 7: compter le nombre de villes dont le nom commence par “Saint”.

SELECT COUNT(*)
FROM villes
WHERE villes.ville_nom_reel LIKE("saint%")

-- Question 8: obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en 
-- premier celles dont le nom est le plus souvent utilisé par plusieurs communes.

SELECT villes.ville_nom_reel, COUNT(villes.ville_nom_reel) AS Nombre_commune
FROM villes
GROUP BY villes.ville_nom_reel
ORDER BY Nombre_commune DESC

-- Question 9: obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la 
-- superficie moyenne.

