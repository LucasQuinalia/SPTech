create database CO2ntrol;

use CO2ntrol;

create table usuario (
	id int primary key auto_increment,
    nome_fantasia varchar(100),
    razao_social varchar(100) not null,
    cnpj char(14) not null,
    telefone char(11),
    email varchar(100) not null,
    senha varchar(100) not null,
    situacao tinyint check (situacao in (0,1)) not null default 1
);

create table endereco (
	id int primary key auto_increment,
    id_usuario int not null,
    cep char(8) not null,
    logradouro varchar(100) not null,
    numero int,
    complemento varchar(100),
    estado char(2) not null,
    municipio varchar(50) not null
);

create table armazenamento (
	id int primary key auto_increment,
    id_usuario int not null,
    tipo varchar(20) check (tipo in ('FOUDRE', 'TANQUE')) not null,
    capacidade decimal(10,2) not null,
    utilizacao tinyint check (utilizacao in (0,1)) not null
);

create table sensor (
	id int primary key auto_increment,
    id_armazenamento int not null,
    nivel_carbono decimal (10,2),
    nivel_carbono_min decimal(10,2) not null,
    nivel_carbono_max decimal(10,2) not null,
    data_registro datetime default current_timestamp(),
    situacao tinyint check (situacao in (0, 1))
);

insert into usuario (nome_fantasia, razao_social, cnpj, telefone, email, senha, situacao)
	values
		('Miolo', 'Miolo Wine Group Vitivinicultura S.A', '09357838000101', '5421051500', 'miolowine@gmail.com', '#$123456', 1),
		('Aurora', 'Cooperativa Vinícola Aurora Ltda', '87547188000170', '5421022000', 'aurora@gmail.com', '#29103@1', 1),
		('Guaspari', 'Industria e Comercio de Vinhos Guaspari Ltda', '11005453000127', '1936619198', 'guaspari@gmail.com', '83298#00', 1),
		('Góes', 'Vinícola Góes', '57563334000190', '11966666666', 'goes@gmail.com', '@9202uAJ', 1)
;

insert into endereco (id_usuario, cep, logradouro, numero, complemento, estado, municipio)
	values
		(1, '95711970', 'Rodovia RS-444', 21, 'Vale dos Vinhedos', 'RS', 'Bento Gonçalves'),
		(2, '95700362', 'Rua Olavo Bilac', 500, 'Cidade Alta', 'RS', 'Bento Gonçalves'),
		(3, '13990000', 'Rua Pedro Ferrari', 300, 'Parque do Lago', 'SP', 'Espírito Santo do Pinhal'),
		(4, '18145002', 'Estrada do Vinho', 9111, 'Cangueira', 'SP', 'São Roque')
;

insert into armazenamento (id_usuario, tipo, capacidade, utilizacao)
	values
		(1, 'TANQUE', 50000, 1),
		(1, 'FOUDRE', 20000, 1),
		(2, 'TANQUE', 30000, 1),
		(3, 'TANQUE', 10000, 1),
		(4, 'FOUDRE', 40000, 1)
;

insert into sensor (id_armazenamento, nivel_carbono, nivel_carbono_min, nivel_carbono_max, situacao)
	values
		(1, 0.80, 0.2, 0.4, 1),
		(1, 0.70, 0.2, 0.4, 1),
		(2, 0.20, 0.2, 0.4, 1),
		(3, 0.30, 0.2, 0.4, 1),
		(4, 0.20, 0.2, 0.4, 1),
		(5, 0.60, 0.2, 0.4, 1)
;

-- adicionar log

select * from usuario;
select * from endereco;
select * from armazenamento;
select * from sensor;

-- Dados coletados pelo sensor um dia atrás
select * from sensor where date(data_registro) = current_date() - 1;

-- Dados coletados pelo sensor na última semana
select * from sensor where date(data_registro) between current_date() - 7 and current_date();

-- Análise do nível de carbono histórico
select *,
	case
		when nivel_carbono > nivel_carbono_max then 'NÍVEL DE CARBONO ACIMA DO IDEAL'
        when nivel_carbono < nivel_carbono_min then 'NÍVEL DE CARBONO ABAIXO DO IDEAL'
        else 'Nível de carbono dentro do esperado'
	end as status_nivel_carbono
from sensor;

-- Análise do nível de carbono de um dia atrás
select *,
	case
		when nivel_carbono > nivel_carbono_max then 'NÍVEL DE CARBONO ACIMA DO IDEAL'
        when nivel_carbono < nivel_carbono_min then 'NÍVEL DE CARBONO ABAIXO DO IDEAL'
        else 'Nível de carbono dentro do esperado'
	end as status_nivel_carbono
from sensor where date(data_registro) = current_date() - 1; 

-- Análise do nível de carbono da última semana
select *,
	case
		when nivel_carbono > nivel_carbono_max then 'NÍVEL DE CARBONO ACIMA DO IDEAL'
        when nivel_carbono < nivel_carbono_min then 'NÍVEL DE CARBONO ABAIXO DO IDEAL'
        else 'Nível de carbono dentro do esperado'
	end as status_nivel_carbono
from sensor where date(data_registro) between current_date() - 7 and current_date();

-- Exibição de todos os tipos de armazenamento
select * from armazenamento where tipo = 'FOUDRE';
select * from armazenamento where tipo = 'TANQUE';

-- Exibição dos tipos de armazenamento por capacidade
select * from armazenamento where capacidade > 10000;
select * from armazenamento where capacidade <= 10000;

-- Exibição da utilização dos tipos de armazenamento
select * from armazenamento where utilizacao = 1;
select * from armazenamento where utilizacao = 0;

-- Análise dos armazenamentos não utilizados que possuem alta capacidade
select * from armazenamento where utilizacao = 0 and capacidade > 10000;

