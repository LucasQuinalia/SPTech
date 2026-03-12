-- 1. Crie o banco de dados chamado ARENA_PERFORMANCE.

create database ARENA_PERFORMANCE;

-- 2. Coloque o banco ARENA_PERFORMANCE em uso.

use ARENA_PERFORMANCE;

-- 3. Crie uma tabela chamada modalidades apenas com nome (VARCHAR(45)). Não defina PK.

create table modalidades (
	nome varchar(45)
);

-- 4. Crie a tabela atletas com nome (VARCHAR(100)) e id_modalidade (INT).

create table atletas (
	nome varchar(100),
    id_modalidade int
);

-- 5. Altere a tabela modalidades para adicionar uma Chave Primária coluna id.

alter table modalidades add column id int primary key;

-- 6. Configure a coluna id da tabela modalidades para ser AUTO_INCREMENT, iniciando a partir do número 100.

alter table modalidades modify column id int auto_increment;
alter table modalidades auto_increment = 100;

-- 7. Adicione uma Chave Primária na coluna id_atleta da tabela atletas.

alter table atletas add column id_atleta int primary key;

-- 8. Na tabela atletas, torne a coluna nome obrigatória (NOT NULL).

alter table atletas modify column nome varchar(100) not null;

-- 9. Adicione uma coluna data_cadastro na tabela atletas com o valor padrão sendo a data e hora

alter table atletas add column data_cadastro datetime default current_timestamp();

-- 10. Adicione a coluna email com 100 posições na tabela atletas.

alter table atletas add column email varchar(100);

-- 11. Adicione a coluna cpf CHAR(11) na tabela atletas, garantindo que ela seja ÚNICA.

alter table atletas add column cpf char(11) unique;

-- 12. Altere o tamanho da coluna nome na tabela modalidades para 100 posições.

alter table modalidades modify column nome varchar(100);

-- 13. Renomeie a coluna id da tabela modalidades para id_modalidade.

alter table modalidades rename column id to id_modalidade;

-- 14. Adicione uma coluna chamada status que aceite apenas os valores 'Ativo' ou 'Inativo'.

alter table modalidades add column status char(7) check (status in ('Ativo', 'Inativo'));

-- 15. Remova a coluna data_cadastro da tabela atletas.

alter table atletas drop column data_cadastro;

-- 16. Adicione uma coluna genero (CHAR(1)) na tabela atletas.

alter table atletas add column genero char(1);

-- 17. Crie uma tabela treinadores com id_treinador (PK), nome e experiencia_anos (INT).

create table treinadores (
	id_treinador int primary key,
    nome varchar(45),
    experiencia_anos int
);

-- 18. Crie uma coluna na tabela atleta para informar quem é seu treinador

alter table atletas add column id_treinador int references treinadores(id_treinador);
desc atletas;

-- 19. Adicione as colunas, salario inicial e salario atual na tabela treinadores.

alter table treinadores add column salario_inicial decimal(10,2), add column salario_atual decimal(10,2);

-- 20. Altere a tabela treinadores para que os salario não possam ser menor que zero.

alter table treinadores add constraint salario_inicial check (salario_inicial > 0), add constraint salario_atual check (salario_atual > 0);

-- 21. Não permita que o salario atual seja menor que o salario inicial

alter table treinadores add constraint salarioAtualMaiorQueInicial check (salario_atual > salario_inicial);

-- 22. Renomeie a tabela modalidades para esportes.

alter table modalidades rename to esportes;

-- 23. Renomeie a tabela atletas para membros.

alter table atletas rename to membros;

-- 24. Altere o nome da coluna id_modalidade na tabela membros para id_esporte.

alter table membros rename column id_modalidade to id_esporte;

-- 25. Crie um índice para a coluna nome na tabela membros para acelerar buscas.

create index ix_nome on membros(nome);

-- ========== (20 minutos) ==========

-- 26. insira um treinador sem informar colunas.

insert into treinadores values (1, 'Lucas', 2, 1000.00, 2000.00);

-- 27. insira três esportes de uma vez.

insert into esportes (nome, id_modalidade, status) values 
	('Futebol', default, 'Ativo'),
    ('Basquete', default, 'Inativo'),
    ('Vôlei', default, 'Ativo')
;

-- 28. insira um membro sem informar colunas.

insert into membros values ('Heitor', 100, 1, 'heitor@gmail.com', '50040020011', 'M', 1);

-- 29. insira dois membros vinculados ao esporte 101.

insert into membros (nome, id_esporte, id_atleta, email, cpf, genero, id_treinador) values 
	('Letícia', 101, 2, 'leticia@gmail.com', '50070020011', 'F', 1),
	('Rafaela', 101, 3, 'rafaela@gmail.com', '50080020011', 'F', 1)
;

-- 30. insira um treinador apenas com nome e experiencia.

insert into treinadores (id_treinador, nome, experiencia_anos) values (2, 'Murilo', 2);

-- 31. insira um esporte sem status definido.

insert into esportes (nome, id_modalidade) values 
	('Skate', default)
;

-- 32. insira um membro apenas com nome.

insert into membros (nome, id_atleta) values 
	('Luiz', 4)
;

-- 33. insira treinador com salario_atual maior que salario_inicial.

insert into treinadores (id_treinador, nome, experiencia_anos, salario_inicial, salario_atual) values (3, 'Yuri', 5, 2000.00, 5000.00);

-- 34. insira membro com id_treinador null explicitamente.

insert into membros (nome, id_esporte, id_atleta, email, cpf, genero, id_treinador) values 
	('Milena', 103, 5, 'milena@gmail.com', '50099920011', 'F', null)
;

-- 35. insira membro usando null ou default na posição da pk.

-- Não pôde ser colocado o id null ou default
insert into membros (nome, id_esporte, id_atleta, email, cpf, genero, id_treinador) values 
	('Guilherme', 102, 6, 'guilherme@gmail.com', '50077720011', 'M', 2)
;

-- 36. atualize salario_atual onde experiencia_anos seja maior que 5 e menor 10.

update treinadores set salario_atual = 7000.00 where experiencia_anos > 5 and experiencia_anos < 10;

-- 37. atualize status para 'Ativo' onde id_modalidade seja maior 100 e menor 105.

update esportes set status = 'Ativo' where id_modalidade > 100 and id_modalidade < 105;

-- 38. atualize genero para 'F' onde nome inicia com a letra P

update membros set genero = 'F' where nome like 'P%';

-- 39. atualize salario_atual onde salario_atual > 8000.

update treinadores set salario_atual = 9000.00 where salario_atual > 8000.00;

-- 40. atualize experiencia_anos para 20 onde experiencia_anos < 3.

update treinadores set experiencia_anos = 20 where experiencia_anos < 3;

-- 41. atualize id_esporte para 100 onde id_esporte seja 101 ou 102.

update membros set id_esporte = 100 where id_esporte in (101, 102);

-- 42. atualize email onde id_atleta esteja entre 1 e 10.

update membros set email = 'email@exemplo.com' where id_atleta between 1 and 10;

-- 43. atualize status para 'Inativo' onde nome igual a Boxe ou Karate.

update esportes set status = 'Inativo' where nome in ('Boxe', 'Karate');

-- 44. aumente salario_atual onde experiencia_anos > 10 and salario_atual < 9000.

update treinadores set salario_atual = 10000 where experiencia_anos > 10 and salario_atual < 9000;

-- 45. atualize gênero para 'M' onde nome contenha Silva.

update membros set genero = 'M' where nome like '%Silva%';

-- 46. atualize email onde genero = 'F' ou genero = 'M'.

update membros set email = 'atleta@membros.com' where genero in ('F', 'M');

-- 47. atualize salario_atual onde salario_inicial entre 3000 e 6000.

update treinadores set salario_atual = 6700.00 where salario_inicial between 3000 and 6000;

-- 48. atualize status para 'Ativo' onde nome contenha a letra i.

update esportes set status = 'Ativo' where nome like '%i%';

-- 49. atualize id_treinador para 1 onde id_treinador for nulo

update membros set id_treinador = 1 where id_treinador = null;

-- 50. atualize salario_atual onde experiencia_anos > 5 or salario_atual < 4000.

update treinadores set salario_atual = 9700.00 where experiencia_anos > 5 or salario_atual < 4000;

-- 51. atualize experiencia_anos onde nome contenha a letra M.

update treinadores set experiencia_anos = 12 where nome like '%M%';

-- 52. atualize id_esporte para nulo onde id_esporte > 105.

update membros set id_esporte = null where id_esporte > 105;

-- 53. atualize status para 'Inativo' onde id_modalidade > 110.

update esportes set status = 'Inativo' where id_modalidade > 110;

-- 54. atualize salario_atual onde salario_atual esteja no intervalo 4000 e 7000.

update treinadores set salario_atual = 5500.00 where salario_atual between 4000 and 7000;

-- 55. atualize email para os nome Diego Torres , Larissa Gomes, o email deve ser o nome mais ‘@sptech.school’.

insert into membros (nome, id_esporte, id_atleta, email, cpf, genero, id_treinador) values
	('Diego Torres', 102, 7, 'teste@teste.com', '55577788899', 'M', 2),
    ('Larissa Gomes', 100, 8, 'teste@teste.com', '00011122233', 'F', 3)
;

update membros set email = concat(lower(replace(nome, ' ', '.')), '@sptech.school') where nome in ('Diego Torres', 'Larissa Gomes');

-- ========== (20 minutos) ==========

-- 56. Liste o nome e o status dos esportes, exibindo o nome da coluna nome como modalidade.

select nome as 'modalidade', status from esportes;

-- 57. Liste o nome dos membros e o email, exibindo o email com o alias correio_eletronico.

select nome, email as correio_eletronico from membros;

-- 58. Liste o nome dos treinadores e o salário atual com alias salario.

select nome, salario_atual as salario from treinadores;

-- 59. Liste nome e cpf dos membros cujo gênero seja igual a 'F'.

select nome, cpf from membros where genero = 'F';

-- 60. Liste nome e experiência dos treinadores cuja experiência seja maior que 10 anos.

select nome, experiencia_anos from treinadores where experiencia_anos > 10;

-- 61. Liste nome e salário atual dos treinadores cujo salário atual seja menor que 4000.

select nome, salario_atual from treinadores where salario_atual < 4000;

-- 62. Liste os membros cujo id_esporte esteja entre 100 e 105.

select * from membros where id_esporte between 100 and 105;

-- 63. Liste os treinadores cuja experiência esteja entre 5 e 15 anos.

select * from treinadores where experiencia_anos between 5 and 15;

-- 64. Liste os esportes cujo nome comece com a letra 'B'.

select * from esportes where nome like 'B%';

-- 65. Liste os membros cujo nome termine com 'Silva'.

select * from membros where nome like '%Silva';

-- 66. Liste os membros cujo nome contenha a palavra 'Junior'.

select * from membros where nome like '%Junior%';

-- 67. Liste os esportes cujo status seja diferente de 'Ativo'.

select * from esportes where status != 'Ativo';

-- 68. Liste os treinadores cujo salário atual seja maior que 5000 e experiência maior que 8 anos.

select * from treinadores where salario_atual > 5000 and experiencia_anos > 8;

-- 69. Liste os membros cujo gênero seja 'F' ou id_esporte seja 101.

select * from membros where genero = 'F' or id_esporte = 101;

-- 70. Liste os membros cujo gênero não seja 'M'.



-- 71. Liste os membros cujo id_esporte esteja na lista (100, 101, 102).



-- 72. Liste os treinadores cujo nome esteja na lista ('Carlos Silva', 'Marcelo Dias').



-- 73. Liste os membros cujo email seja nulo.



-- 74. Liste os membros cujo id_treinador não seja nulo.



-- 75. Liste nome e salário atual dos treinadores, exibindo 'Sem salário definido' quando o salário atual for nulo.

select nome,
	case
		when salario_atual is null then 'Sem salário definido'
        else salario_atual
	end as salario_atual
from treinadores;

-- 76. Liste nome e cpf dos membros concatenando ambos em uma única coluna chamada identificacao.



-- 77. Liste nome e salário atual dos treinadores, exibindo uma coluna chamada situacao_salarial, onde:
-- 'Alto' para salário > 8000
-- 'Médio' para salário entre 4000 e 8000
-- 'Baixo' para salário < 4000



-- 78. Liste nome e status dos esportes, exibindo 'Disponível' quando status for 'Ativo' e 'Indisponível' quando for 'Inativo'.



-- 79. Liste nome dos membros e uma coluna chamada possui_treinador, indicando 'Sim' quando id_treinador não for nulo e 'Não' quando for nulo.



-- 80. Liste nome e salário atual dos treinadores cujo salário esteja entre 3000 e 7000 e experiência maior que 5 anos.



-- 81. Liste nome dos membros cujo nome comece com 'A' e gênero seja 'F'.



-- 82. Liste nome dos membros cujo nome comece com 'A' ou 'B'.



-- 83. Liste nome dos membros cujo nome não comece com 'C'.



-- 84. Liste nome e experiência dos treinadores cuja experiência seja maior que 5 e menor que 15.



-- 85. Liste nome e salário atual dos treinadores cujo salário atual seja maior que 5000 ou experiência maior que 12 anos.



-- 86. Liste nome e cpf dos membros cujo cpf esteja entre '20000000000' e '50000000000'.



-- 87. Liste nome dos membros cujo id_esporte não esteja na lista (100, 101).



-- 88. Liste nome e status dos esportes cujo nome contenha a letra 'e' e status seja 'Ativo'.



-- 89. Liste nome dos membros cujo email não seja nulo e gênero seja 'M'.



-- 90. Liste nome e salário atual dos treinadores cujo salário atual seja diferente do salário inicial.



-- 91. Liste nome dos membros e concatene o texto ' - Atleta' ao final do nome.



-- 92. Liste nome dos membros e uma coluna chamada tipo_genero, onde:
-- 'Masculino' para 'M'
-- 'Feminino' para 'F'
-- 'Não informado' quando for nulo



-- 93. Liste nome dos treinadores e uma coluna chamada faixa_experiencia, classificando:
-- 'Iniciante' até 5 anos
-- 'Intermediário' entre 6 e 10
-- 'Avançado' acima de 10



-- 94. Liste nome e salário atual dos treinadores exibindo 0 quando o salário for nulo.



-- 95. Liste nome dos membros cujo nome contenha a letra 'a' e não contenha a letra 'z'.



-- 96. Liste nome dos membros cujo id_atleta seja maior que 10 e menor que 50.



-- 97. Liste nome e salário atual dos treinadores cujo salário atual esteja entre 4000 e 9000 e não seja igual a 7000.



-- 98. Liste nome e status dos esportes cujo status seja 'Ativo' e id_modalidade maior que



-- 99. Liste nome dos membros cujo nome esteja na lista ('Ana Paula', 'Lucas Lima', 'Diego Torres').



-- 100. Liste nome e cpf dos membros cujo cpf não esteja na lista ('11122233344','55566677788').



-- 101. Liste nome dos treinadores cujo nome comece com 'M' e experiência maior que 5.



-- 102. Liste nome dos membros cujo gênero seja 'F' e id_esporte entre 100 e 110.



-- 103. Liste nome e salário atual dos treinadores cujo salário atual seja maior que 3000 e menor que 10000 e experiência diferente de 7. 



-- 104. Liste nome dos esportes cujo nome termine com 'o' ou termine com 'e'.



-- 105. Liste nome dos membros e crie uma coluna chamada resumo, concatenando nome, cpf e genero separados por hífen.



-- 106. Liste nome e salário atual dos treinadores cujo salário seja maior que 5000 e experiência maior que 5, ou cujo salário seja maior que 8000 independentemente da experiência.



-- 107. Liste nome dos membros cujo gênero seja 'F' e id_esporte esteja entre 100 e 105, ou cujo nome comece com 'L'.



-- 108. Liste nome e cpf dos membros cujo cpf esteja entre dois valores e gênero seja 'M', mas exclua aqueles cujo nome termine com 'Silva'.



-- 109. Liste nome dos esportes cujo status seja 'Ativo' e id_modalidade maior que 100, ou cujo nome contenha a letra 'a' e status não seja 'Inativo'.



-- 110. Liste nome e salário atual dos treinadores cuja experiência esteja entre 5 e 15 anos e salário maior que 4000, ou cuja experiência seja maior que 20.



-- 111. Liste nome dos membros cujo id_treinador não seja nulo e (gênero seja 'F' ou nome comece com 'A').



-- 112. Liste nome dos membros cujo id_esporte esteja na lista (100,101) e gênero seja 'M', ou cujo email seja nulo.



-- 113. Liste nome e salário atual dos treinadores cujo salário atual seja maior que o salário inicial e experiência diferente de 10, e cujo nome não comece com 'R'.



-- 114. Liste nome dos esportes cujo nome contenha a letra 'e' e não contenha a letra 'i', ou cujo status seja 'Inativo'.



-- 115. Liste nome dos membros cujo nome comece com 'A' ou 'B' e cujo gênero não seja nulo, mas exclua aqueles cujo cpf esteja na lista ('00000000000','11111111111').



-- 116. Liste nome e salário atual dos treinadores cuja experiência seja maior que 5 e menor que 15 e cujo salário não esteja entre 3000 e 6000.



-- 117. Liste nome dos membros cujo id_atleta seja maior que 10 e menor que 100 e cujo id_esporte não esteja na lista (102,103).



-- 118. Liste nome dos treinadores cujo nome comece com 'M' ou 'C' e cuja experiência seja maior que 8 e salário atual maior que 5000.



-- 119. Liste nome dos membros cujo email não seja nulo e (gênero seja 'F' e id_esporte entre 100 e 110).



-- 120. Liste nome dos esportes cujo status seja 'Ativo' e id_modalidade entre 100 e 120 e cujo nome não termine com 'o'.



-- 121. Liste nome e salário atual dos treinadores cuja experiência seja maior que 5 ou salário maior que 7000, mas exclua aqueles cuja experiência seja menor que 3.



-- 122. Liste nome dos membros cujo gênero seja 'F' e nome contenha 'a', ou cujo gênero seja 'M' e nome contenha 'o'.



-- 123. Liste nome dos treinadores cujo salário atual seja maior que 5000 e (experiência maior que 10 ou salário maior que 9000).



-- 124. Liste nome dos membros cujo id_esporte esteja entre 100 e 110 e cujo nome não contenha a letra 'r'.



-- 125. Liste nome e cpf dos membros cujo cpf esteja entre dois valores e (gênero seja 'F' ou id_treinador não seja nulo).

-- ========== (30 minutos) ==========

-- 126. Apagar membros onde id_atleta entre 20 e 30.
-- 127. Apagar treinadores onde experiencia_anos < 2.
-- 128. Apagar esportes onde id_modalidade > 120.
-- 129. Apagar membros onde nome like 'A%'.
-- 130. Apagar treinadores onde salario_atual > 9000.
-- 131. Apagar esportes onde nome seja igual a Surf ou Ciclismo.
-- 132. Apagar membros onde genero = 'F' e id_esporte = 100.
-- 133. Apagar membros onde genero = 'M' OU id_esporte nulo.
-- 134. Apagar treinadores onde salario_inicial entre 2000 e 3000.
-- 135. Apagar esportes onde status = 'Inativo' e id_modalidade entre 100 e 110.
-- 136. Apagar membros onde id_esporte igual 100,101 e 102.
-- 137. Apagar treinadores onde nome contenha a palavra Dias
-- 138. Apagar esportes onde nome contenha a legra ‘e’.
-- 139. Apagar membros onde cpf seja '12312312399' ou '32132132188'.
-- 140. Apagar treinadores onde salario_atual < 3500 OU experiencia_anos > 20.
-- 141. Apagar membros onde id_atleta > 50.
-- 142. Apagar esportes onde id_modalidade < 100.
-- 143. Apagar treinadores onde experiencia_anos entre 8 e 12.
-- 144. Apagar membros onde nome contenha a palavra 'Junior'.
-- 145. Apagar esportes onde status seja 'Inativo'.
-- 146. remova todos os registros da tabela membros.
-- 147. remova todos os registros da tabela treinadores.
-- 148. remova todos os registros da tabela esportes.

-- ========== (20 minutos) ==========

-- 149. identifique o erro e reescreva corretamente:
-- insert into treinadores (nome, experiencia_anos, salario_inicial, salario_atual)
-- values ('Felipão', 5, 5000.00, 3000.00);

-- 150. identifique o erro e reescreva corretamente:
-- insert into treinadores (nome, experiencia_anos, salario_inicial, salario_atual)
-- values ('Abel Ferreira', 8, -2000.00, 3000.00);

-- 151. identifique o erro e reescreva corretamente:
-- insert into membros (nome, cpf)
-- values ('Marcelino', '12312312399');

-- 152. identifique o erro e reescreva corretamente:
-- insert into esportes (nome, status)
-- values ('Esgrima', 'Ativado');

-- 153. identifique o erro e reescreva corretamente:
-- insert into membros (nome, cpf)
-- values (null, '55544433322');

-- 154. identifique o erro e reescreva corretamente:
-- insert into membros (nome, cpf, genero)
-- values ('Isabella', '11111111111');

-- 155. identifique o erro e reescreva corretamente:
-- insert into membros (nome, cpf, telefone)
-- values ('Vanessa', '22222222222', '999999999');

-- 156. identifique o erro e reescreva corretamente:
-- insert into atleta (nome, cpf)
-- values ('Marcela', '33333333333');

-- 157. identifique o erro e reescreva corretamente:
-- insert into membros
-- values (100, 'Giovanni', null, 'email@email.com', '44444444444', 'M', 1);

-- 158. identifique o erro e reescreva corretamente:
-- insert into esportes (id_modalidade, nome, status)
-- values (100, 'Truco', 'Ativo');

-- 159. identifique o erro e reescreva corretamente:
-- insert into treinadores (nome, experiencia_anos, salario_inicial, salario_atual)
-- values ('Monica', 5, 'abc', 4000.00);

-- 160. identifique o erro e reescreva corretamente:
-- insert into treinadores (nome, experiencia_anos, salario_inicial, salario_atual)
-- values ('Luizinho', 'dez', 3000.00, 3500.00);

-- 161. identifique o erro e reescreva corretamente:
-- insert into membros (nome, cpf)
-- values ('Mariazinha', '123456789012345');

-- 162. identifique o erro e reescreva corretamente:
-- insert into treinadores
-- values (1, 'Abel Ferreira', 4, 2000.00, 2500.00);

-- 163. identifique o erro e reescreva corretamente:
-- insert into esportes (nome, status)
-- values ('Atletismo', 'Indefinido');

-- 164. identifique o erro e reescreva corretamente:
-- insert into esportes (id_modalidade, nome, status)
-- values (null, 'Peteca', 'Ativo');

-- 165. identifique o erro e reescreva corretamente:
-- insert into membros (nome, cpf)
-- values ('Joaozinho, '99988877766');