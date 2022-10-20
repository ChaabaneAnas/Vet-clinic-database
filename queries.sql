/*Queries that provide answers to the questions from all projects.*/
select * from animals where name like '%mon%';
select name from animals where date_of_birth between 'jan 1 ,2016' and 'jan 1 ,2020';
select name from animals where neutered = true and escape_attempts <3;
select date_of_birth from animals where name in ('Agumon','Pikachu');
select name ,escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

/*Milestone(2)*/
select count (*) from animals;
select count (*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, sum(escape_attempts) from animals group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between 'jan 1,1990' and 'jan 1, 2000' group by species ;

