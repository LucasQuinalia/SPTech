-- ================================================ Lista de Desafios ================================================

-- 1. Criar um banco de dados chamado biblioteca.
create database biblioteca;

-- 2. Definir que o banco de dados em uso seja o biblioteca.
use biblioteca;

-- 3. Criar uma tabela chamada livro com os campos: codigo (chave primária), titulo, autor e ano de publicação. 
-- O campo autor deve ter o valor padrão definido como 'Sem Autor'.
create table livro(
	codigo int not null primary key,
    titulo varchar(50),
    autor varchar(50) not null default 'Sem autor',
    ano_publicacao date
);

-- 4. Adicionar dois registros na tabela livro.
insert into livro (codigo, titulo, autor, ano_publicacao) 
values 
	(1, 'Dedique-se de coração', 'Howard Schultz', '1997-01-01'), 
	(2, '1984', default, '1949-06-08');

-- 5. Exibir todos os registros existentes na tabela livro.
select * from livro;

-- 6. Alterar o nome do autor de um dos livros já cadastrados.
update livro set autor = 'George Orwell' where codigo = '2';

-- 7. Exibir o titulo e nome do registro alterado.
select titulo, autor from livro where codigo = '2';

-- 8. Remover um registro da tabela livro.
delete from livro where codigo = '1';

-- 9. Mostrar a estrutura (colunas e tipos de dados) da tabela livro.
desc livro;

-- 10. Acrescentar uma nova coluna chamada editora na tabela livro.
alter table livro add editora varchar(50);

-- 11. Exiba todos os registros que contém a letra a na coluna autor
select * from livro where autor like '%a%';

-- 12. Excluir a coluna editora da tabela livro.
alter table livro drop editora;

-- 13. Criar uma tabela chamada usuario com os campos: codigo, nome e tipo
-- A coluna nome deve ser inserida, obrigatóriamente.
create table usuario(
	codigo int not null primary key,
    nome varchar(50) not null,
    tipo varchar(50)
);

-- 14. Adicionar dois usuários à tabela criada. 
insert into usuario (codigo, nome) 
values 
	(1, 'Lucas Quinália'),
    (2, 'Marcelo Rosim');

-- 15. Alterar o campo tipo, para que aceite apenas determinados valores (ex.: docente, discente, visitante). 
alter table usuario add constraint chkTipoUsuario check(tipo in ('Docente', 'Discente', 'Visitante'));

-- 16. Atualizar os dois registros de usuario, inserindo o valor do campo tipo.
update usuario set tipo = 'Discente' where codigo = '1';
update usuario set tipo = 'Docente' where codigo = '2';

-- 17. Exibir todos os registros da tabela usuario em que a penúltima letra do nome é m. 
select * from usuario where nome like '%m_';

-- 18. Acrescentar uma nova coluna chamada telefone na tabela usuario.
alter table usuario add telefone varchar(11);

-- 19. Alterar a tabela usuario, aumentando a quantidade de caracteres na coluna nome
alter table usuario modify nome varchar(60);

-- 20. Criar uma consulta na tabela usuario, renomeando a coluna nome para nome_completo.
select codigo, nome as 'nome_completo', tipo, telefone from usuario;

-- 21. Criar uma consulta na tabela livro, mostrando titulo e autor juntos em uma única coluna chamada detalhes.
select codigo, ano_publicacao, concat(titulo, ', ', autor) as 'detalhes' from livro;

-- 22. Criar uma consulta na tabela livro, mostrando titulo, ano_publicacao e uma coluna classificacao,
--  que classifica livros publicados antes do ano 2000 como “Antigo” e os demais como “Moderno”.

select titulo, ano_publicacao, 
	case
		when ano_publicacao >= '2000-01-01' then 'Moderno'
        else 'Antigo'
	end as 'classificacao'
from livro;

-- 23. Criar uma consulta na tabela livro, mostrando todos os dados, em ordem decrescente pelo nome
select * from livro order by titulo desc;

-- 24. Criar uma consulta na tabela usuario, mostrando todos os dados em que o dado na coluna tipo seja diferente de docente
select * from usuario where tipo != 'Docente';

-- 25. Esvaziar todos os registros da tabela livro, mantendo sua estrutura.
truncate livro;

-- 26. Apagar o banco de dados biblioteca.
drop database biblioteca;