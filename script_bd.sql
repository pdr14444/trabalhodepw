create table categoria(
cod_cat int not null primary key,
nome varchar(50) not null,
descr varchar(100) not null,
valor_dia float not null);

create table apto(
num int not null primary key,
status varchar(1) not null check(status='D' or status='O'),
cod_cat int not null references categoria(cod_cat));

create table funcionario(
cod_func int not null primary key,
dt_nasc date not null,
nome varchar(100) not null);

create table hospede(
cod_hosp int not null primary key,
dt_nasc date not null,
nome varchar(100) not null);

create table hospedagem(
cod_hospeda int not null primary key,
num int not null references apto(num),
cod_func int not null references funcionario(cod_func),
cod_hosp int not null references hospede(cod_hosp),
valor_total float not null,
dt_ent date not null,
dt_sai date not null);