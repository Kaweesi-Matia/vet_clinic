/* Database schema to keep the structure of entire database. */


CREATE TABLE Animals ( id INT PRIMARY KEY NOT NULL, name TEXT NOT NULL ,date_of_birth DATE NOT NULL ,escape_attempts 
INT NOT NULL, neutered BOOL NOT NULL,weight_kg DECIMAL NOT NULL);

ALTER TABLE Animals ADD COLUMN SPECIES TEXT ;

CREATE TABLE owners (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, full_name TEXT NOT NULL,age INT NOT NULL);
CREATE TABLE species (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name TEXT NOT NULL);
ALTER TABLE Animals DROP COLUMN SPECIES;

ALTER TABLE Animals  ADD COLUMN species_id INT;
ALTER TABLE AnimalS ADD CONSTRAINT species_id FOREIGN KEY (species_id) REFERENCES SPECIES (id);
ALTER TABLE Animals  ADD COLUMN owner_id INT;
ALTER TABLE Animals ADD CONSTRAINT owners_id FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,name TEXT NOT NULL,age INT NOT NULL,date_of_graduation DATE NOT NULL);

CREATE TABLE specializations (species_id INT NOT NULL,vet_id INT NOT NULL,FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE,FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE );

CREATE TABLE visits (animal_id INT NOT NULL,vet_id INT NOT NULL,date_of_visit DATE NOT NULL, FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE,FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE );


ALTER TABLE owners ADD COLUMN email VARCHAR(120);

ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;

CREATE INDEX animal_id_index on visits(animal_id ASC);

CREATE INDEX vet_id_index on visits(vet_id ASC);

CREATE INDEX owner_email_index on owners(email ASC);
