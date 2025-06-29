use biblioteca;
create table polo (
ID int not null auto_increment,
nome varchar(30) not null,
telefone bigint(11) not null,
endereco varchar(30) not null,
hor_funcionamento varchar(100),
primary key (ID)
) default charset = utf8;

insert into polo (nome, telefone, endereco, hor_funcionamento) 
values ('Arapiraca', '08231351818', 'Av. 113, 3', '8h às 18h de segunda a sexta'), 
('Maceió', '08232531000', 'Av. 115, 3', '8h às 18h de segunda a sexta');

select * from polo;
describe polo;




