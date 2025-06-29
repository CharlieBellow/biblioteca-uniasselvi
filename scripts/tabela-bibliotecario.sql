create table bibliotecario (
ID int not null auto_increment,
nome varchar(40) not null,
genero enum('M', 'F', 'HT', 'MT', 'NB', 'AG', 'I', 'GF', 'Q', 'AN', 'OU', 'PNI') not null,
registro int(7) not null,
telefone int(11) not null,
primary key (ID)
) default charset = utf8;
describe bibliotecario;

/* adicionar a foreng key de biblioteca */ 
alter table bibliotecario add column biblioteca int;
alter table bibliotecario modify telefone bigint(11);

alter table bibliotecario 
add constraint fk_biblioteca 
foreign key (biblioteca) references biblioteca(ID);

insert into bibliotecario (nome, registro, telefone )
values ('Magna', '167895', '82996445126');


update bibliotecario set genero = 'F' where ID = 1;

select * from bibliotecario;

describe bibliotecario;

/* adicionar foreng key de biblioteca */
/* join com  biblioteca */
