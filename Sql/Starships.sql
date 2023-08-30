create database starship;

use starship;

create table ships(
id bigint not null auto_increment primary key,
name varchar(150) not null,
model varchar(150) not null,
cost_in_credits bigint not null,
length float not null,
max_atmosphering_speed bigint not null,
crew float not null,
passengers bigint,
cargo_capacity bigint not null,
consumable varchar(50) not null,
hyperdrive_rating bigint not null,
MGLT bigint not null,
Starship_class varchar(200) not null
);

create table films(
id bigint auto_increment primary key,
name varchar(200) not null,
categoria varchar(100) not null
);

create table characters(
id bigint primary key auto_increment,
name varchar(200) not null,
age bigint not null,
gender varchar(50) not null
);

create table films_ships(
	id bigint primary key auto_increment,
    id_fk_star bigint not null,
    id_fk_films bigint not null,
    foreign key (id_fk_star) references ships(id),
    foreign key (id_fk_films) references films(id)
);

create table pilots_ships(
	id bigint primary key auto_increment,
    id_fk_star bigint not null,
    id_fk_char bigint not null,
    foreign key (id_fk_star) references ships(id),
    foreign key (id_fk_char) references characters(id)
    );


