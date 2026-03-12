use sprint1;

create table venda (
idPedido int not null primary key auto_increment,
nomeProduto varchar(100),
quantidade decimal(10,3),
valorUnitario decimal(10,2)
);

rename table venda to vendaProdutos;

insert into vendaProdutos (nomeProduto, quantidade, valorUnitario) values ("Banana", 2, 11.90);
insert into vendaProdutos (nomeProduto, quantidade, valorUnitario) values ("Maçã", 8, 8.90);
insert into vendaProdutos (nomeProduto, quantidade, valorUnitario) values ("Uva", 2, 2.50);

select nomeProduto, quantidade, valorUnitario, quantidade * valorUnitario as 'Valor Total' from vendaProdutos;

select * from vendaProdutos;

select nomeProduto,
	case 
		when quantidade > 3 then 'Bastante'
        else 'Só um pouquinho'
	end as 'Categoria Produto'
from vendaProdutos
