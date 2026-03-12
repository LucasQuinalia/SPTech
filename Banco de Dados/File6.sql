select current_date();

select current_time();

select current_timestamp();

use sprint1;

create table empresa (
	id int not null primary key,
    nome varchar(50) not null,
    representante varchar(50)
);

create table empresa (
	id int not null auto_increment,
    nome varchar(50) not null,
    representante varchar(50),
    primary key pk(id, nome)
);

-- drop do auto_increment
alter table empresa modify id int not null;

-- drop da primary key
alter table empresa drop primary key;

-- criar nova primary key
alter table empresa add primary key (id);

desc empresa;

insert into empresa (id, nome, representante) 
values (1, "Safra", "Safraboy"),
(2, "C6", "John Bank"),
(3, "Accenture", "Mark MacAccenture");

select * from empresa;

drop table empresa;

create table aluno (
	ra char (8) not null,
    nome varchar(100),
    situacao varchar(10) not null default 'Ativo',
    primary key (ra),
    constraint check (situacao in ('Ativo','Inativo'))
);

select * from aluno;
desc aluno;

insert into aluno (ra, nome, situacao)
values
	('04261088', 'Lucas Quinália', 'Ativo'),
    ('04261067', 'Letícia Miranda', 'Inativo'),
    ('04261112', 'Milena Maria', 'Ativo');