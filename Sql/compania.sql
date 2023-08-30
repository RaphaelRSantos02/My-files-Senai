create database company_ex2;
use company_ex2;

create table jobs(
	id bigint not null auto_increment,
    name varchar(100) not null,
    primary key (id)
    );
    
create table employee(
	id bigint not null auto_increment,
    birthdate date not null,
    cpf varchar(11) not null,
    name varchar(100) not null,
    gender enum("M","F") not null, #o enum serve pra fazer com q seja apenas usados as escolhas colocadas
    hiredDate date not null,
    primary key (id)
    );
    
create table job_employee(
	id bigint not null auto_increment,
    employeeFK bigint not null,
    jobFK bigint not null,
    startDate date not null,
    endDate date,
    primary key (id),
    foreign key(employeeFK) references employee(id),
    foreign key(jobFK) references jobs(id)
    );
    
create table salary(
    id bigint not null auto_increment,
    employeeFK bigint not null,
    amount float not null,
    startDate date not null,
    endDate date,
    primary key(id),
    foreign key(employeeFK) references employee(id)
    );
    
create table departaments(
    id bigint not null auto_increment,
    name varchar(100) not null,
    primary key(id)
    );
    
create table department_employee(
    id bigint not null auto_increment,
    departmentFK bigint not null,
    employeeFK bigint not null,
    startDate date not null,
    endDate date,
    primary key(id),
    foreign key(employeeFK) references employee(id),
    foreign key(departmentFK) references departaments(id)
    );
    
create table manegers(
	id bigint not null auto_increment,
	employeeFK bigint not null,
	departmentFK bigint not null,
	startDate date not null,
	endDate date,
	primary key(id),
    foreign key(employeeFK) references employee(id),
    foreign key(departmentFK) references departaments(id)
    );