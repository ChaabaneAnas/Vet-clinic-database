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

/*Milestone(4)*/
select animals.name as name ,date_of_visit as date , vets.name as vet_name from animals join visits on visits.animal_id = animals.id join vets on visits.vet_id = vets.id order by date desc limit 1;

 select vets.name as vets, count(*) as animals_count from visits join vets on vet_id = vets.id where vets.name = 'Stephanie Mendez' group by vets.name;

 select vets.name as "vet_name", species.name as "specialtie" from vets
    left join specializations on vets.id = vet_id left join species on species.id = species_id;
   
select a.name as animal_name, v.name as vet_name, visits.date_of_visit from animals a 
join visits on a.id = animal_id
join vets v on v.id = vet_id 
where date_of_visit between 'apr 1,2020' and 'aug 30, 2020' and v.name = 'Stephanie Mendez';

select name as animal_name, count(*) as number_of_visits from animals a join visits v on a.id = animal_id group by name order by number_of_visits desc limit 1;

select a.name, v.name, date_of_visit from animals a 
join visits on a.id = animal_id
join vets v on v.id = vet_id
order by date_of_visit limit 1;

select * from animals a 
join visits vi on a.id = animal_id
join vets v on v.id = vet_id
order by date_of_visit desc limit 1 ;

select count(*) as "not specialty" FROM animals
join visits ON visits.animal_id = animals.id
join vets ON vets.id = visits.vet_id
jOin species ON species.id = animals.species_id
join specializations ON specializations.vet_id = vets.id
where animals.species_id != specializations.species_id;

select v.name as vet_name, s.name as specie_name, count (*) as number_of_visits from animals a
join visits  on a.id = animal_id 
join vets v on v.id = vet_id
join species s on s.id = species_id
where v.name = 'Maisy Smith'
group by specie_name, v.name
order by count(*) desc limit 1;
