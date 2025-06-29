create table acervo (
ID int not null auto_increment,
titulo varchar(100) not null,
autor int not null,
curso int,
multa int,
biblioteca int not null,
data_publi dateTime not null,
orgao_publi varchar(30) not null,
area_conhec varchar(30) not null,
tamanho varchar(30),
n_paginas int(5) not null default 1,
data_insert dateTime not null,
aquisicao varchar(30),
n_exemplares tinyInt(2),
tipo enum('Físico', 'Periódico'),
n_eventos tinyInt(4) not null default 0,
n_consultas int(3) not null default 0,
procedencia varchar(30) not null,
primary key (ID)
);
describe acervo;
select * from acervo;

/* adicionar a foreng key de autor, curso, multa, biblioteca */ 

alter table acervo add constraint fk_acervo_autor
foreign key(autor) references autor(ID);

alter table acervo add constraint fk_acervo_multa
foreign key (multa) references multa(ID);

alter table acervo add constraint fk_acervo_biblioteca 
foreign key (biblioteca) references biblioteca(ID);

alter table acervo add constraint fk_acervo_curso
foreign key (curso) references curso(ID);

insert into acervo (titulo, autor, curso, multa, biblioteca, data_publi, orgao_publi, area_conhec, 
tamanho, n_paginas, data_insert, aquisicao, n_exemplares, tipo,  procedencia)
values ('Anti-Édipo', 3, 1, 1, 1, '2010-06-15 09:00:00', 'Editora 34', 'psicologia', 
'20.45 X 18.6', 340, '2025-06-13', 'Compra', 1, 'Físico', 'Biblioteca de Maceió');

/* join com autor, curso, multa e biblioteca */

select acervo.ID, acervo.titulo, autor.nome as autor, acervo.data_publi, 
acervo.n_paginas, biblioteca.nome as biblioteca, acervo.n_consultas, 
acervo.n_exemplares, acervo.area_conhec, acervo.orgao_publi, 
curso.nome as curso, acervo.data_insert, acervo.procedencia, multa.ID as multa, 
acervo.n_eventos, acervo.tamanho, acervo.tipo from acervo
join autor on autor.ID = acervo.autor
join curso on curso.ID = acervo.curso
join multa on multa.ID = acervo.multa
join biblioteca on biblioteca.ID = acervo.biblioteca;