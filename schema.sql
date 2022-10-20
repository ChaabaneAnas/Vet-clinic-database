/* Database schema to keep the structure of entire database. */

/* Create vet_clinic database
CREATE DATABASE vet_clinic;

/* Create Animals table */
create table animals(
id int primary key not null,
name text not null, 
date_of_birth date not null, 
escape_attempts int, neutered boolean, 
weight_kg decimal
);

/* Milestone(2)*/
alter table animals add species char(15);

