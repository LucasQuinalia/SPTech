CREATE DATABASE aula_7;
 
USE aula_7;
 
CREATE TABLE empresa (
	idEmpresa int primary key auto_increment,
	nome varchar(45),
	responsavel varchar(45)
) auto_increment = 1000
;
 
INSERT INTO empresa VALUES
	(null, 'Accenture', 'Rafaela'),
    (null, 'C6Bank', 'Andresa')
;
    
SELECT * FROM empresa;
 
CREATE TABLE aluno (
	ra char(8) primary key,
	nome varchar(45),
	bairro varchar(45),
	fkEmpresa int,
	constraint fkEmp foreign key (fkEmpresa)
	references empresa(idEmpresa)
);
 
INSERT INTO aluno VALUES
	('01232999', 'Pedro', 'Consolação', 1000),
    ('01232998', 'Big Suzane', 'Paraíso', 1000),
    ('01232997', 'Hikari', 'Consolacion', 1001)
;
    
select * from aluno;

insert into aluno values ('01233000', 'Joaozinho', 'Consolação', 1010);

alter table aluno add foreign key (fkEmpresa) references empresa(idEmpresa);

select * from aluno where fkempresa not in (select idempresa from empresa);

delete from empresa where idEmpresa = 1000;

insert into aluno values ('01233002', 'Joaquim', 'Consolação', null);

select * from aluno inner join empresa on empresa.idempresa = aluno.fkempresa;

alter table aluno drop foreign key aluno_ibfk_1;

alter table aluno add constraint fk_empresa foreign key (fkEmpresa) references empresa(idEmpresa);