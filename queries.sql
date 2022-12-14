/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

-- below is the added queries
SELECT * FROM animals WHERE NAME LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name, date_of_birth, escape_attempts, weight_kg FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE  name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

UPDATE animals SET SPECIES = 'Unspecified';
UPDATE animals SET SPECIES = ' ';
UPDATE animals SET SPECIES = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET SPECIES = 'pokemon' WHERE species = ' ';
BEGIN;
COMMIT;


BEGIN;
DELETE FROM animals;
ROLLBACK;
BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;

 UPDATE animals SET weight_kg = weight_kg * -1;
 ROLLBACK TO SP1;

  UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
  COMMIT;

SELECT COUNT (*) FROM animals;
SELECT * FROM Animals WHERE escape_attempts < 1;

SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT Species, MAX(weight_kg) FROM animals GROUP BY species;
SELECT Species, MIN(weight_kg) FROM animals GROUP BY species;

SELECT Species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY Species;




