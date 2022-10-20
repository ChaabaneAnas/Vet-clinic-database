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
rollback;

begin;
update animals set species = 'digimon' where name like '%mon';
update aimals set species = 'pokemon' where species is null;
commit;

begin; 
delete from animals;
rollback;

begin;
delete from animals where data_of_birth > 'jan 1, 2022';
savepoint savepoint_1
update animals set weight_kg = weight_kg *-1;
rollback to savepoint savepoint_1;
commit;


