drop database if exists vetclinic;
create database if not exists vetclinic;
use vetclinic;

create table if not exists owner (
    owner_id int auto_increment primary key,
    owner_name varchar(50) not null,
    owner_phone varchar(20) not null unique
);

create table if not exists pet (
    pet_id int auto_increment primary key,
    pet_name varchar(50) not null,
    species varchar(50) not null,
    owner_id int not null,
    foreign key (owner_id) references owner (owner_id)
);

create table if not exists visit (
    visit_id int auto_increment primary key,
    visit_date date not null,
    diagnosis varchar(50),
    fee int not null check ( fee >= 0 ),
    pet_id int not null,
    foreign key (pet_id) references pet (pet_id)
);

insert into owner (owner_name, owner_phone)
values ('Anna Berg', '070-111 11 11'),
       ('Erik Holm', '070-222 22 22'),
       ('Sara Lind', '070-333 33 33'),
       ('Lisa Mosberger', '076-886 63 64');

insert into pet (pet_name, species, owner_id)
values ('Rex','Hund', (select owner_id from owner where owner_name = 'Anna Berg')),
       ('Misse','Katt', (select owner_id from owner where owner_name = 'Anna Berg')),
       ('Bella','Hund', (select owner_id from owner where owner_name = 'Erik Holm')),
       ('Pelle','Kanin', (select owner_id from owner where owner_name = 'Sara Lind')),
       ('Luna','Katt', (select owner_id from owner where owner_name = 'Lisa Mosberger'));

insert into visit (visit_date, diagnosis, fee, pet_id)
values ('2026-01-10','Vaccination',450,(select pet_id from pet where pet_name = 'Rex')),
       ('2026-03-02','Klokklippning',150,(select pet_id from pet where pet_name = 'Rex')),
       ('2026-02-14','Öroninflammation',600,(select pet_id from pet where pet_name = 'Misse')),
       ('2026-01-20','Hälta',800,(select pet_id from pet where pet_name = 'Bella')),
       ('2026-04-05','Kontroll',300,(select pet_id from pet where pet_name = 'Bella')),
       ('2026-02-28','Tandkontroll',350,(select pet_id from pet where pet_name = 'Pelle')),
       ('2026-10-15','Vaccination',450,(select pet_id from pet where pet_name = 'Luna'));

select count(*) from owner;
select count(*) from pet;
select count(*) from visit;

-- Task 5: Breaking against two rules
/*
- Fee can't be below 0:
insert into visit (visit_date, diagnosis, fee, pet_id)
value ('2026-03-15', 'Vaccination', -200, (select pet_id from pet where pet_name = 'Rex'));
 */

/*
- Phone number can't be a dublicate
insert into owner ( owner_name, owner_phone)
value ('Fred Karlsson', '070-111 11 11');
 */

-- Task 6: insert a new owner and move a pet to the new owner.
select p.pet_name, p.species, o.owner_id, o.owner_name
from pet p join owner o on o.owner_id = p.owner_id;

start transaction;

insert into owner (owner_name, owner_phone)
value ('Maja Larsson', '073-456 93 54');

update pet set owner_id = last_insert_id()
where pet_name = 'Bella';

commit;

select p.pet_name, p.species, o.owner_id, o.owner_name
from pet p join owner o on o.owner_id = p.owner_id;

-- Task 9: species table and forgein key in pet
create table if not exists species (
    species_id int auto_increment primary key,
    species_name varchar(50) not null unique
);

insert into species (species_name)
select distinct species from pet;

alter table pet
    add column species_id int,
    add foreign key (species_id) references species (species_id);

update pet p
join species s on s.species_name = p.species
set p.species_id = s.species_id;

alter table pet modify species_id int not null;
alter table pet drop column species;

select p.pet_name, s.species_name
from pet p join species s
on s.species_id = p.species_id;


select * from pet;
select * from visit;
select  * from owner;
select * from species;


