drop table aluno;

-- CHECK CONSTRAINT
CREATE TABLE aluno (
  ra char(08) NOT NULL,
  nome  varchar(100) NOT NULL,
  situacao varchar(10) not null default 'Ativo',
  PRIMARY KEY (ra),
  constraint check(situacao in('Ativo', 'Inativo'))
);

select * from aluno;
insert into aluno(ra, nome)
values ('01241221', 'AMANDA'),
		('01241222', 'ANA CLAUDIA'),
		('01241223', 'BEATRIZ'),
		('01241224', 'BIANCA'),
		('01241225', 'BRUNA'),
		('01241226', 'FERNANDO'),
		('01241227', 'GIOVANA'),
		('01241228', 'GUILHERME'),
		('01241229', 'PAULO'),
		('01241230', 'PEDRO');
--
select * from aluno;
--
-- alterar situação
update aluno set situacao = 'Não Sei' where ra = '01241226';

update aluno set situacao = 'Ativo' where ra = '01241226';

select distinct situacao from aluno;

alter table aluno drop constraint aluno_chk_1;

ALTER TABLE aluno 
	ADD CONSTRAINT aluno_chk_1 
	CHECK (situacao in('Ativo', 'Inativo'));

alter table aluno modify situacao varchar(10) not null;

CREATE TABLE aluno (
  ra char(8) NOT NULL,
  nome varchar(100) NOT NULL,
  situacao varchar(10) NOT NULL,
  PRIMARY KEY (ra),
  CONSTRAINT aluno_chk_1 CHECK ((situacao in (_utf8mb4'Ativo',_utf8mb4'Inativo')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

drop table aluno;

create table aluno (
	id int not null primary key auto_increment,
    name varchar(50) not null,
    fkempresa int
);

create table empresa (
	id int primary key auto_increment,
    nome varchar(50) not null,
    representante varchar(50) not null
);

alter table aluno add foreign key fkaluno_empresa(fkempresa) references empresa(id);

alter table aluno add constraint foreign key fkaluno_empresa(fkempresa) references empresa(id);

select * from information_schema.tables where table_schema = 'aluno';

select * from information_schema.referential_constraints where constraint_schema = 'sprint1' and table_name = 'aluno';