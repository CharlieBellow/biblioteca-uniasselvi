create table biblioteca (
ID int not null auto_increment,
nome varchar(30) not null,
endereco varchar(30) not null,
n_acervo int(5) default 0,
telefone int(11) not null,
email varchar(30) not null,
hor_funcionamento varchar(100) not null,
primary key (ID)
) default charset = utf8;

/* adicionar a foreng key de bibliotecario, polo */ 
alter table biblioteca add column (responsavel int, polo int, usuario int); /* adicionando a foreing key depois da tabela já criada */

alter table biblioteca add constraint fk_bibliotecario
foreign key(responsavel) references bibliotecario(ID);

alter table biblioteca add constraint fk_polo
foreign key(polo) references polo(ID);

alter table biblioteca add constraint fk_usuario
foreign key(usuario) references usuario(ID); /* fazendo a relação do campo criado com a foreing key */

alter table biblioteca modify telefone bigint(11); /* modificando o tipo do campo */

insert into biblioteca (nome, endereco, n_acervo, telefone, email, hor_funcionamento)
values ('Biblioteca do Polo Arapiraca', 'Bloco A sala 3', 3450, 08235427689, 'biblioteca@ufal.com.br', '8h às 18h de segunda a sexta');

update biblioteca set responsavel = 1 where ID = 1; /*inserindo as foreign key */
update biblioteca set polo = 1 where ID = 1; 

describe biblioteca;
select * from biblioteca;
alter table biblioteca drop column usuario;
/* join com polo, usuario, bibliotecario */

select biblioteca.ID, biblioteca.nome, biblioteca.endereco, biblioteca.hor_funcionamento, 
biblioteca.email, biblioteca.n_acervo, usuario.nome as responsavel, biblioteca.telefone, polo.nome as polo
from biblioteca
join polo on polo.ID = biblioteca.polo
join usuario on usuario.ID = biblioteca.responsavel
