create table autor_publi_acervo (
ID int not null auto_increment,
autor int(11),
acervo int(11),
primary key (ID),
foreign key (autor) references autor(ID),
foreign key (acervo) references acervo(ID)
) default charset = utf8;

describe autor_publi_acervo;
select * from autor_publi_acervo;

insert into autor_publi_acervo values (default, 1, 1);
insert into autor_publi_acervo values (default, 2, 1);
desc acervo;

select autor.ID, autor.nome, autor.n_publi_acervo, 
acervo.titulo, acervo.data_publi from autor
join autor_publi_acervo on autor.ID = autor_publi_acervo.ID
join acervo on acervo.ID = autor_publi_acervo.ID;