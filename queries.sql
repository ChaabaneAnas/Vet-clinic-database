/*Queries that provide answers to the questions from all projects.*/
select * from animals where name like '%mon%';
select name from animals where date_of_birth between 'jan 1 ,2016' and 'jan 1 ,2020';
select name from animals where neutered = true and escape_attempts <3;
select date_of_birth from animals where name in ('Agumon','Pikachu');
select name ,escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;
/* Milestone (2)*/
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

select count (*) from animals;
select count (*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, sum(escape_attempts) from animals group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species;

select species, avg(escape_attempts) from animals where date_of_birth between 'jan 1,1990' and 'jan 1, 2000' group by species ;


