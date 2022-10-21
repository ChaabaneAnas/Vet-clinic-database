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

/* Milestone (3)*/
select full_name, name from owners join animals on owners.id = animals.owner_id  where owners.id = 4;

select animals.name, species.name from animals join species on animals.species_id = species.id where species.name = 'Pokemon' ;

select full_name, name from owners left join animals on owners.id = animals.owner_id ;

select species.name, count(*) from animals join species on animals.species_id = species.id group by species.name; 

select species.name, owners.full_name from animals join owners on animals.owner_id = owners.id join species on species.id = animals.species_id where (owners.full_name = 'Jennifer Orwell') and (species.name = 'Digimon');

select name, full_name, escape_attempts from animals join owners on owner_id = owners.id where (full_name = 'Dean Winchester') and (animals.escape_attempts = 0); 

select  count(*) as o_count, full_name from owners join animals on owners.id = animals.owner_id group by full_name order by o_count desc limit 1;



