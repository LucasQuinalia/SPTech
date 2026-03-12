use sprit1;

-- Criação da Tabela
create table FashionStore (
	id int primary key auto_increment,
    nome varchar (100),
    categoria varchar (50),
    preco decimal(10,2),
    tamanho varchar(5),
    data_cadastro datetime,
    disponivel tinyint,
    constraint chkTamanho check (tamanho in ('P', 'M', 'G', 'GG'))
);

-- Inserção de Dados
-- Insira pelo menos 6 produtos variados, com diferentes categorias, tamanhos, datas e disponibilidade.

insert into FashionStore (nome, categoria, preco, tamanho, data_cadastro, disponivel) values 
	('Camiseta Rock n Roll', 'Camisetas', 20.19, 'P', '2026-01-01 00:00:00', 1),
	('Camiseta Banda Legal', 'Camisetas', 10, 'M', '2024-03-01 00:00:00', 0),
	('Bermuda Cargo', 'Bermudas', 19.99, 'G', '2025-07-25 00:00:00', 1),
	('Calça de Sarja Marrom', 'Calças', 15.67, 'GG', '2023-02-21 00:00:00', 1),
	('Tênis da Nike', 'Calçados', 120.99, 'M', '2025-11-01 00:00:00', 1),
	('Chapéu de Feltro', 'Chapéus', 19.99, 'M', '2024-12-11 00:00:00', 0)
;

-- Consultas
-- Agora, escreva as consultas SQL para responder às perguntas abaixo:
-- Listar os produtos que contenham a palavra "Camiseta" no nome.

select * from FashionStore where nome like '%Camiseta%';

-- Listar os produtos que não sejam do tamanho 'M'.

select * from FashionStore where tamanho != 'M';

-- Exibir apenas os produtos cadastrados depois de 18 de agosto de 2025.

select * from FashionStore where data_cadastro > '2025-08-18';

-- Listar os produtos disponíveis cuja categoria seja "Camiseta" ou "Blusa".

select * from FashionStore where disponivel = 1 and categoria in ('camiseta', 'blusa');

-- Exibir o nome do produto concatenado com seu preço, com o alias 'produto_preco'.

select concat(nome, ', R$', preco) as 'produto_preco' from FashionStore;

-- Listar os produtos cujo nome NÃO contenha a palavra "Blusa".

select * from FashionStore where nome not like 'Blusa';

-- Listar todos os produtos com uma coluna adicional chamada 'status' que mostre "Disponível" se disponivel = 1 e "Indisponível" caso contrário.

select *,
	case
		when disponivel = 1 then 'Disponível'
		else 'Indisponível'
	end as 'status'
from FashionStore;

-- Liste os produtos da categoria "Calça" com preço maior que 100 reais.

select * from FashionStore where categoria = 'Calça' and preco > 100;

-- Liste os produtos com nome que não contenha a palavra "Camiseta".

select * from FashionStore where nome not like '%Camiseta%';

-- Exiba os produtos cujo id seja 1, 3 ou 5.

select * from FashionStore where id in (1, 3, 5);

-- Liste os produtos com tamanho diferente de 'P' e 'M'.

select * from FashionStore where tamanho not in ('P', 'M');

-- Liste os produtos cadastrados antes de 18 de agosto de 2025.

select * from FashionStore where data_cadastro < '2025-08-18';

-- Liste o nome e preço de todos os produtos, com um alias chamado produto_valor.

select concat(nome, ', R$', preco) as produto_valor from FashionStore;

-- Mostre todos os produtos com uma coluna chamada info_completa que junte nome, categoria e preço.

select nome, categoria, preco, concat(nome, ', ', categoria, ', R$', preco) as info_completa from FashionStore;

-- Mostre os produtos que estão disponíveis e têm tamanho 'M'.

select * from FashionStore where disponivel = 1 and tamanho = 'M';

-- Liste os produtos com nomes que começam com a letra 'C'.

select * from FashionStore where nome like 'C%';

-- Atualize o preço da "Jaqueta Couro" para 270.00.

insert into FashionStore (nome, categoria, preco, tamanho, data_cadastro, disponivel) values 
	('Jaqueta Couro', 'Blusas', 167, 'M', '2025-01-19 00:00:00', 1)
;
update FashionStore set preco = 270 where nome = 'Jaqueta Couro';

-- Marque como indisponível todos os produtos da categoria "Blusa".

update FashionStore set disponivel = 0 where categoria like '%Blusa%';

-- Atualize o campo tamanho para 'M' nos produtos com nome que contenha "Short".

update FashionStore set tamanho = 'M' where nome like '%Short%';

-- Atualize a categoria para "Camiseta" em todos os produtos cujo nome contenha "Camiseta".

update FashionStore set categoria = 'Camiseta' where nome like '%Camiseta%';

-- Marque como disponível todos os produtos cadastrados após 20 de agosto de 2025.

update FashionStore set disponivel = 1 where data_cadastro > '2025-08-20';

-- Aumente em 5% o preço dos produtos com preço inferior a 100 reais.

update FashionStore set preco = preco * 1.05 where preco < 100;

-- Atualize o nome do produto de id 4 para "Short Esportivo Unissex".

update FashionStore set nome = 'Short Esportivo Unissex' where id = 4;

-- Marque como indisponíveis os produtos com nome que contenha "Blusa" ou "Moletom".

update FashionStore set disponivel = 0 where nome like 'Blusa' or nome like 'Moletom';

-- Atualize a data de cadastro de todos os produtos da categoria "Camiseta" para a data atual.

update FashionStore set data_cadastro = current_timestamp() where categoria = 'Camiseta';

-- Insira mais 6 produtos
insert into FashionStore (nome, categoria, preco, tamanho, data_cadastro, disponivel) values 
	('Jaqueta de Couro Marrom', 'Jaqueta', 20.19, 'P', '2026-01-01 00:00:00', 1),
	('Camiseta', 'Camiseta', 10, 'M', '2024-03-01 00:00:00', 0),
	('Calça cargo', 'Calça', 19.99, 'G', '2025-07-25 00:00:00', 1),
	('Short Esportivo', 'Short', 15.67, 'GG', '2023-02-21 00:00:00', 1),
	('Jaqueta de Time', 'Jaqueta', 120.99, 'M', '2025-11-01 00:00:00', 1),
	('Calça Social', 'Calça', 19.99, 'M', '2024-12-11 00:00:00', 0)
;

-- Exiba os produtos com categoria igual a "Jaqueta" e que não estejam disponíveis.

select * from FashionStore where categoria = 'Jaqueta' and disponivel = 0;

-- Liste os produtos com tamanho 'GG' ou 'P', ordenados pelo preço decrescente.

select * from FashionStore where tamanho in ('GG', 'P') order by preco desc;

-- Mostre apenas o nome e o tamanho dos produtos cadastrados no mês de agosto de 2025.

select nome, tamanho from FashionStore where data_cadastro like '2025-08%';

-- Exiba os produtos com nomes terminando em "a".

select * from FashionStore where nome like '%a';

-- Exiba os produtos cuja categoria não esteja entre "Camiseta", "Calça" e "Short".

select * from FashionStore where categoria not in ('Camiseta', 'Calça', 'Shorts');

-- Mostre os produtos com preço entre R$ 50,00 e R$ 150,00, com alias para nome e preço.

select nome as 'Produto', preco as 'Preço em R$' from FashionStore where preco between 50 and 150;

-- Exiba todos os produtos e adicione uma coluna chamada info que junte nome e categoria com hífen.

select concat(nome, '-', categoria) as info from FashionStore;

-- Mostre os produtos que estão indisponíveis com uma coluna status que diga "Em falta".

select *,
	case
		when disponivel = 0 then 'Em falta'
		else 'Disponível'
	end as 'status'
from FashionStore where disponivel = 0;

-- Liste todos os produtos cujo nome tenha 2 palavras (dica: um espaço).

select * from FashionStore where nome like '% %';

-- Exiba os produtos cujo nome não contenha a palavra "Blusa", que tenham tamanho 'M' ou 'G', estejam disponíveis, tenham sido cadastrados após 15 de agosto de 2025, e mostre:
-- O nome como nome_produto
-- O preço como preco_atual
-- A data de cadastro
-- Uma coluna chamada descricao concatenando nome, categoria e preço
-- Uma coluna status_disponibilidade usando CASE para mostrar "Disponível" ou "Indisponível"

select nome as 'nome_produto', preco as 'preco_atual', data_cadastro, concat(nome, ', ', categoria, ', R$', preco) as 'Descrição',
	case
		when disponivel = 0 then 'Indisponível'
        else 'Disponível'
	end as 'status_disponibilidade'
from FashionStore where nome not like '%Blusa%' and tamanho in ('M', 'G') and disponivel = 1 and data_cadastro > '2025-08-15';