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

/* Milestone(3)*/
insert into owners (full_name, age) values('same smith', 34);
insert into owners (full_name, age) values ('Jennifer Orwell', 19);
insert into owners (full_name, age) values ('Bob', 45);
insert into owners (full_name, age) values ('Melody Pond ', 77);
insert into owners (full_name, age) values ('Dean Winchester', 14);
insert into owners (full_name, age) values ('Jodie Whittaker', 38);

insert into species (name) values('Pokemon');
insert into species (name) values('Digimon');
update animals set species_id = 'Pokemon'
update animals set species_id = 2 where name like'%mon';
update animals set species_id = 1 where species_id is null ;

update animals set owner_id = 1 where name = 'Agumon';
update animals set owner_id = 2 where name in ('Gabumon','Pikachu');
update animals set owner_id = 3 where name = 'Plantmon','Devimon';
update animals set owner_id= 4 where name in ('Charmander', 'Squirtle','Blossom');
update animals set owner_id = 5 where name in ('Angemon','Boarmon');

/* Milestone(4)*/
insert into vets(name, age, date_of_graduation) values ('William Tatcher', 45, 'apr 23,2000');
insert into vets(name, age, date_of_graduation) values('Maisy Smith', 26, 'jan 17,2019');
insert into vets(name, age, date_of_graduation) values('Stephanie Mendez', 64, 'may 4,1981');
insert into vets(name, age, date_of_graduation) values('Jack Harkness', 38, 'jun 8,2008');

insert into specializations values(1,1);
insert into specializations values(2,2);
insert into specializations values(2,4);

insert into visits values (1,4,'may 24, 2020');
insert into visits values (3,4,'jul 22, 2020');
insert into visits values (4,5,'feb 2, 2021');
insert into visits values (2,6,'jan 5, 2020');
insert into visits values (2,6,'mar 8,2020');
insert into visits values (2,6,'may 14, 2020');
insert into visits values (3,7,'may 4, 2021');
insert into visits values (4,8,'feb 24, 2021');
insert into visits values (2,9,'dec 21, 2019');
insert into visits values (1,9,'aug 10,2020');
insert into visits values (2,9,'apr 7, 2021');
insert into visits values (3,10,'sep 29, 2019');
insert into visits values (4,11,'oct 3, 2020');
insert into visits values (4,11,'nov 4, 2020');
insert into visits values (2,12,'jan 24, 2019');
insert into visits values (2,12,'may 15, 2019');
insert into visits values (2,12,'feb 27, 2020');
insert into visits values (2,12,'aug 3, 2020');
insert into visits values (3,13,'may 24, 2020');
insert into visits values (1,13,'jan 11, 2021');

/* Advanced DB Milestone_1*/ 

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';











