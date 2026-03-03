--BANCO DE DADOS DE UM HOTEL
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

insert into funcionario values(1,'2010-09-14','Hidrogênio');
insert into funcionario values(2,'2009-07-12','Oxigênio');
insert into funcionario values(3,'2010-03-08','Boro');
insert into funcionario values(4,'2010-02-05','Cobre');

insert into categoria values(1,'simples','sim',300);
insert into categoria values(2,'complexo','não',450);
insert into categoria values(3,'wow','talvez',600);

insert into apto values(101,'D',1);
insert into apto values(102,'D',2);
insert into apto values(201,'O',3);

insert into hospedagem values(1,201,3,1,1200,'2020-10-12','2020-10-14');

insert into hospede values(1,'2010-04-03','Computador');

--SINTAXE INSERT:
--INSERT INTO tabela(s) VALUES(valor1,valor2,...);

--SINTAXE SELECT:
--SELECT atributo(s) FROM tabela(s) WHERE condição(ões);

--QUESTÃO (03/03/2026)
--A) O NOME DOS FUNCIONÁRIOS DE CÓDIGO 1 ou 3
select nome from funcionario where cod_func=1 or cod_func=3;

--B) O CÓDIGO E O NOME DAS CATEGORIAS QUE CUSTAM MAIS DE R$400,00 A DIÁRIA
select cod_cat,nome from categoria where valor_dia>400;

--C) O NÚMERO DOS APARTAMENTOS DA CATETGORIA DE CÓDIGO 1, 2 ou 3
select num from apto where cod_cat=1 or cod_cat=2 or cod_cat=3;

--D) O CÓDIGO DAS HOSPEDAGENS REALIZADAS PARA O HÓSPEDE DE CÓDIGO 1 NO APARTAMENTO 101
select cod_hospeda from hospedagem where cod_hosp=1 and num=101;

--E) TODAS AS INFORMAÇÕES DOS FUNCIONÁRIOS QUE NASCERAM NO ANO DE 2010
select * from funcionario where dt_nasc>='2010-01-01' and dt_nasc<'2011-01-01';
