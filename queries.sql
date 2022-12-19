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

SELECT full_name, name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT species.name, animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT FULL_NAME,NAME FROM ANIMALS FULL JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID;   
SELECT species.name, COUNT(species.name) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT full_name,species.name, animals.name FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id WHERE species.name = 'Digimon' AND full_name =  'Jennifer Orwell';
SELECT full_name,COUNT(animals.owner_id) FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY full_name, animals.owner_id ORDER BY COUNT(animals.owner_id) DESC LIMIT 1;


SELECT * FROM animals  JOIN owners  ON animals.owner_id = owners.id WHERE escape_attempts = 0 AND full_name = 'Dean Winchester';



SELECT vets.name, animals.name, date_of_visit FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

SELECT vets.name,COUNT(animals.name) FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

SELECT vets.name,species.name FROM specializations FULL OUTER JOIN vets ON specializations.vet_id = vets.id FULL OUTER JOIN species ON specializations.species_id = species.id;

SELECT vets.name, animals.name, date_of_visit FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(date_of_visit) FROM visits JOIN animals ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY COUNT(date_of_visit) DESC LIMIT 1;

SELECT vets.name, animals.name, date_of_visit FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;

SELECT vets.name,vets.age, date_of_graduation,animals.name,date_of_birth,escape_attempts,neutered,weight_kg,date_of_visit FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id  ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(*) FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id JOIN specializations ON specializations.vet_id = vets.id JOIN species ON specializations.species_id = species.id WHERE animals.species_id <> specializations.species_id;

SELECT species.name,COUNT(species.name) FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(species.name)DESC LIMIT 1;

-- perfomance optimisation

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;


SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT COUNT(*) FROM  visits WHERE  animal_id = 4;

SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT  * FROM  visits WHERE vet_id = 2;

SELECT * FROM owners where email = 'owner_18327@mail.com';
EXPLAIN ANALYZE SELECT  * FROM owners where  email = 'owner_18327@mail.com';

   

    

   

   

   

    

    

   

   

