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

/* Milestone(3)*/
create table owners(id int not null generated always as identity, full_name text, age int);
create table species (id int primary key generated always as identity, name text);

begin;

alter table animals drop column species;
alter table animals add column species_id int;
alter table animals add constraint fk_species foreign key(species_id) references species(id);

alter table animals add column owner_id int;
alter table animals add constraint fk_owners foreign key (owner_id) references owners(id);

commit;