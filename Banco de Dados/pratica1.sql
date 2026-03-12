
-- Exercício 1

create database sprint1;

use sprint1;

create table Atleta(
	idAtleta int not null primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

insert into Atleta (idAtleta, nome, modalidade, qtdMedalha) 
values 
	(1, "Lucas", "Natação", 0), 
	(2, "Guilherme", "Basquete", 3), 
	(3, "Luiz", "Tiro ao alvo", 1),
    (4, "Marcos", "Basquete", 6),
    (5, "Antônio", "Natação", 2),
    (6, "Samantha", "Natação", 3),
    (7, "Lara", "Tiro ao alvo", 0)
;

select * from Atleta;

select nome, qtdMedalha from Atleta;

select * from Atleta where modalidade = "Basquete";

select * from Atleta order by modalidade;

select * from Atleta order by qtdMedalha desc;

select * from Atleta where nome like "%s%";

select * from Atleta where nome like "l%";

select * from Atleta where nome like "%o";

select * from Atleta where nome like "%r_";

drop table Atleta;

-- Exercício 2

/*
No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas.
Execute os comandos para:
a) Exibir todos os dados da tabela.
b) Exibir apenas os títulos e os artistas das músicas.
c) Exibir apenas os dados das músicas de um determinado gênero.
d) Exibir apenas os dados das músicas de um determinado artista.
e) Exibir os dados da tabela ordenados pelo título da música.
f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma
determinada letra.
j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma
determinada letra.
k) Elimine a tabela.
*/

-- Exercício 3

/*
No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.
Execute os comandos para:
• Exibir todos os dados da tabela.
• Exibir apenas os títulos e os diretores dos filmes.
• Exibir apenas os dados dos filmes de um determinado gênero.
• Exibir apenas os dados dos filmes de um determinado diretor.
• Exibir os dados da tabela ordenados pelo título do filme.
• Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
• Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
• Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
• Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma
determinada letra.
• Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma
determinada letra.
• Elimine a tabela.
*/

-- Exercício 4

/*
No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela.
Exemplo do campo data: ‘AAAA-MM-DD’ - ‘1983-10-13’.
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.
Execute os comandos para:
a) Exibir todos os dados da tabela.
b) Exibir apenas as especialidades dos professores.
c) Exibir apenas os dados dos professores de uma determinada especialidade.
d) Exibir os dados da tabela ordenados pelo nome do professor.
e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem
decrescente.
f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada
letra.
g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada
letra.
h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma
determinada letra.
i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma
determinada letra.
j) Elimine a tabela.
*/

-- Exercício 5

/*
Exercício 5:

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Jogo para conter os dados: idJogo, nome (tamanho 50), comentario (tamanho 200), ranking (número inteiro), sendo que idJogo é a chave primária da tabela.

Inserir dados na tabela.
Procure inserir pelo menos 5 jogos.
Execute os comandos para:
a) Exibir todos os dados da tabela.
b) Exibir apenas os nomes dos jogos.
c) Exibir apenas o comentário de um determinado jogo.
d) Exibir os dados da tabela ordenados pelo nome do jogo.
e) Exibir os dados da tabela ordenados pelo ranking em ordem decrescente.
f) Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra.
g) Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra.
h) Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra.
i) Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima letra uma determinada letra.

j) Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft.
k) Elimine a tabela.
*/