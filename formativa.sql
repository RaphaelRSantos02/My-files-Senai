create database formativa;
use formativa;

create table funcoes(
	funcoes_Id bigint not null auto_increment primary key ,
    funcoes_name varchar(50) not null,
    description varchar(150) not null
);

create table AccessRole(
	id bigint not null auto_increment primary key,
    acesso varchar(20) not null,
    funcoes_Id_fk bigint not null,
    foreign key(funcoes_Id_fk) references funcoes(funcoes_Id)
);

create table Users(
	user_id bigint not null auto_increment primary key,
    status enum('ativo', 'inativo') not null,
    acesso_fk bigint not null,
    name varchar(150) not null,
    email varchar(150) not null,
    password varchar(50) not null,
    bornDate date not null,
    registerDate datetime not null default now(),
    foreign key(acesso_fk) references AccessRole(id)
);

create table local(
	local_id bigint not null auto_increment primary key,
    place_name varchar(50) not null,
    universityBlock varchar(1) not null,
    maxPeople bigint not null
);
create table Inventario (
	inventario_id bigint auto_increment primary key,
    item_name varchar(50) not null,
    description varchar(150) not null
);

create table CheckList(
	checkList_id bigint auto_increment primary key,
    local_id_fk bigint not null,
    inventario_id_fk bigint not null,
    onPlace bool not null,
    foreign key(local_id_fk) references local(local_id),
    foreign key(inventario_id_fk) references Inventario(inventario_id)
);

create table Evento(
	evento_id bigint auto_increment primary key,
    local_id_fk bigint not null,
    eventName varchar(50) not null,
    start_date datetime not null,
    end_date datetime not null,
    checkInMaxDate datetime not null,
    checkInMinDate datetime not null,
    quantityAvailable bigint not null,
    foreign key(local_id_fk) references local(local_id)
);

create table UserEvent(
	UserEvent_id bigint auto_increment primary key,
	evento_id_fk bigint not null,
    user_id_fk bigint not null,
    checkInDate datetime not null,
    foreign key(evento_id_fk) references Evento(evento_id),
    foreign key(user_id_fk) references Users(user_id)
);
