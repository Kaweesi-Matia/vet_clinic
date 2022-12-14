/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
);
 CREATE TABLE Animals ( id INT PRIMARY KEY NOT NULL, name TEXT NOT NULL ,date_of_birth DATE NOT NULL ,escape_attempts 
INT NOT NULL, neutered BOOL NOT NULL,weight_kg DECIMAL NOT NULL);

 ALTER TABLE Animals ADD COLUMN SPECIES TEXT ;
