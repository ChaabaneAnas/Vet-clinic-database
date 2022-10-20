/* Populate database with sample data. (Milestone (1)) */

insert into animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Agumon','feb 03, 2020', 0, true, 10.25);
insert into animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Gabumon','nov 15, 2018', 2, true, 8);
insert into animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Pikachu','Jan 7, 2021', 2, false, 15.04);
insert into animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Devimon','May 12, 2017', 5, true, 11);

/*  (Milestone(2)) */
 insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Charmender', 'feb 8, 2020', 0, false, -11);
 insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Plantmon', 'nov 15, 2021', 2, true, -5);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Squirtle', 'apr 2, 1993', 3, false, -12.13);
 insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Angemon', 'jun 12, 2005', 1, true, -45);
 insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Boarmon', 'jun 7, 2005', 7, true, 20.4);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Blossom', 'oct 13, 1998', 3, true, 17);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Ditto', 'may 14, 2022', 4, true, 22);

begin;
update animals set species ='unspecified';
select name, species from animals;
rollback;

begin;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is null;
select name, species from animals;
commit;


begin; 
delete from animals;
select name, date_of_birth, neutered, escape_attempts, species  from animals;
rollback;

begin;
delete from animals where date_of_birth > 'jan 1, 2022';
savepoint savepoint_1;
update animals set weight_kg = weight_kg *-1;
rollback to savepoint savepoint_1;
select name, date_of_birth, neutered, escape_attempts, species  from animals;
update set weight_kg = weight_kg *-1 where weight_kg < 0;
commit;





