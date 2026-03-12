use aula_7;

-- EXERCICIO 1

create table pessoa (
	idpessoa int primary key auto_increment,
    nome varchar(45),
    cpf char(11)
);

create table Reserva (
	idReserva int primary key auto_increment,
    dtReserva datetime,
    dtRetirada datetime,
    dtDevolucao datetime,
    fkPessoa int
);

insert into pessoa (nome, cpf) values 
	('Lucas Quinália', '12345671234'),
    ('Heitor Galdino', '23456781234'),
    ('Letícia Miranda', '34567891234'),
    ('Eduarda Crispim', '45678901234'),
	('Murilo Mendes', '56789011234')
;

insert into reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) values
	('2026-03-11 11:47:00', '2026-03-11 11:47:00', '2026-03-11 11:47:00', 1),
    ('2026-03-11 05:35:00', '2026-03-11 05:35:00', '2026-03-11 05:35:00', 2),
    ('2026-03-11 02:11:00', '2026-03-11 02:11:00', '2026-03-11 02:11:00', 3),
    ('2026-03-11 10:14:00', '2026-03-11 10:14:00', '2026-03-11 10:14:00', 4),
    ('2026-03-11 03:52:00', '2026-03-11 03:52:00', '2026-03-11 03:52:00', 5)
;

alter table reserva add constraint fkPessoa foreign key (fkPessoa) references pessoa(idpessoa);

select * from pessoa;
select * from reserva;

select nome as 'nome_pessoa', cpf as 'CPF' from pessoa;
select dtReserva as 'Data da reserva', dtRetirada as 'Data da retirada', dtDevolucao as 'Data da devolução', fkPessoa as 'Responsável pela reserva' from reserva;

select *,
	case
		when dtDevolucao < now() then 'Devolvido'
        else 'Pendente'
	end as status_devolucao
from reserva;

select ifnull(nome, 'Sem nome') as nome from pessoa;

-- EXERCICIO 2

create table Pessoa1 (
	idPessoa1 int primary key auto_increment,
    nome varchar(45),
    dtNascimento date
);

create table Pessoa2 (
	idPessoa2 int primary key auto_increment,
    nome varchar(45),
    dtNascimento date,
    fkPessoa1 int
);

insert into pessoa1 (nome, dtNascimento) values 
	('Lucas Quinália', '2005-06-21'),
    ('Heitor Galdino', '2008-02-14'),
    ('Letícia Miranda', '2003-07-12'),
    ('Eduarda Crispim', '2001-09-11'),
	('Murilo Mendes', '2007-05-08')
;

insert into pessoa2 (nome, dtNascimento, fkPessoa1) values 
	('Raphael Quinália', '2002-03-21', 1),
    ('Mario Galdino', '2007-04-14', 2),
    ('Ursula Miranda', '2008-01-12', 3),
    ('Mariana Crispim', '2002-11-20', 4),
	('Jailson Mendes', '2001-07-08', 5)
;

alter table pessoa2 add constraint fkPessoa1 foreign key (fkPessoa1) references pessoa1(idPessoa1);

select * from pessoa1;
select * from pessoa2;

select nome as 'Nome da pessoa', dtNascimento as 'Data de nascimento' from pessoa1;

select *,
	case
		when dtNascimento < current_date() then 'Nasceu'
        else 'Não nasceu ainda'
	end as 'Nasceu?'
from pessoa1;

select ifnull(nome, 'Sem nome') as nome from pessoa1;

-- EXERCICIO 3

create table habilitacao (
	idHabilitacao int primary key auto_increment,
	tipo varchar(10),
    validade int default 1
);

create table candidato (
	idCandidato int primary key auto_increment,
    nome varchar(45),
    habilitacao int
);

insert into habilitacao (tipo) values 
	('A'),
    ('B'),
    ('A e B'),
    ('ACC e B')
;

insert into candidato (nome, habilitacao) values
	('Lucas Quinália', 1),
    ('Eduarda Crispim', 2),
    ('Lucas Yugui', 3),
    ('Thabata Vitória', 4),
    ('Guilherme Polizelo', 1)
;

alter table candidato add constraint fkHabilitacao foreign key (habilitacao) references habilitacao(idHabilitacao);

select * from habilitacao;
select * from candidato;

select nome as 'Nome do Candidato', habilitacao as 'Habilitação Escolhida' from candidato;
select tipo as 'Tipo de Habilitação', validade as 'Validade em Anos' from habilitacao;

select nome,
	case
		when habilitacao = 1 then 'A'
        when habilitacao = 2 then 'B'
        when habilitacao = 3 then 'A e B'
        else 'ACC e B'
	end as 'Tipo da Habilitação'
from candidato;

select ifnull(habilitacao, 'Sem habilitação') as 'Habilitação' from candidato;

-- EXERCICIO 4

create table farmacia (
	idFarmacia int primary key auto_increment,
    nome varchar(50)
);

create table endereco (
	idEndereco int primary key auto_increment,
    cep char(8),
    logradouro varchar(100),
    numero int,
    complemento varchar(100),
    siglaEstado char(2),
    municipio varchar(50),
    idFarmacia int,
    foreign key (idFarmacia) references farmacia(idFarmacia)
);

create table farmaceutico (
	idFarmaceutico int primary key auto_increment,
    nome varchar(50),
    idFarmacia int,
    foreign key (idFarmacia) references farmacia(idFarmacia)
);

insert into farmacia (nome) values 
	('Drogasil'),
    ('Farmanita'),
    ('Ultrafarma'),
    ('Farmaconde'),
    ('Drogaria São Paulo')
;

insert into endereco (cep, logradouro, numero, siglaEstado, municipio, idFarmacia) values
	('03344555', 'Rua 1', 99, 'SP', 'São Paulo', 1),
    ('03344777', 'Rua 2', 100, 'SP', 'São Paulo', 2),
    ('03344888', 'Rua 3', 101, 'SP', 'São Paulo', 3),
    ('03344999', 'Rua 4', 102, 'SP', 'São Paulo', 4),
    ('03344000', 'Rua 5', 103, 'SP', 'São Paulo', 5)
;

insert into farmaceutico (nome, idFarmacia) values
	('John', 1),
    ('Mariah', 1),
    ('Daniel', 2),
    ('Erick', 3),
    ('David', 4),
    ('Marcus', 5)
;

alter table farmaceutico add constraint fkFarmaceutico foreign key (idFarmacia) references farmacia(idFarmacia);
alter table endereco add constraint fkEndereco foreign key (idFarmacia) references farmacia(idFarmacia);

select * from farmacia;
select * from endereco;
select * from farmaceutico;

select nome as 'Nome da Farmácia' from farmacia;
select cep as 'CEP', logradouro as 'Logradouro', numero as 'Número do Local', siglaEstado as 'UF', municipio as 'Município', idFarmacia as 'Farmácia' from endereco;
select nome as 'Nome do Farmacêutico', idFarmacia as 'Farmácia onde trabalha' from farmaceutico;

select
	case
		when siglaEstado = 'SP' then 'São Paulo'
        when siglaEstado = 'RJ' then 'Rio de Janeiro'
        else siglaEstado
	end as 'Estado'
from endereco;

select cep, logradouro, numero, ifnull(complemento, 'Sem complemento') as 'Complemento', siglaEstado, municipio from endereco;