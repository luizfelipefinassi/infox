-- criando o banco de dados
create database dbinfox;
use dbinfox;

-- criando tabela de usuarios(login)
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- o comando abaixo descreve a tabela
describe tbusuarios;

-- inserindo dados na tabela de usuarios
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Administrador','9999-9999','admin','123456');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Jose de Assis','8888-8888','joseassis','123');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Daniel Oliveira','7777-7777','danioliveira','102030');
-- a linha abaixo exibe os dados na tabela
select * from tbusuarios;

-- criando tabela de cadastro de clientes
create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

-- o comando abaixo descreve a tabela
describe tbclientes;

-- inserindo dados na tabela de cadastro de clientes
insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Arthur Gabriel','Rua 7 de Setembro, 2015','9898-7878','arthur@gmail.com');
-- a linha abaixo exibe os dados na tabela
select * from tbclientes;

-- criando tabela de ordens de serviço
create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

-- o comando abaixo descreve a tabela
describe tbos;

-- inserindo dados na tabela de ordens de serviço
insert into tbos(equipamento,defeito,servico,tecnico,valor,idcli)
values('Notebook','Não liga','Troca da fonte','João',87.50,1);
-- a linha abaixo exibe os dados na tabela
select * from tbos;

-- o código abaixo traz informações de duas tabelas
select 
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);
















