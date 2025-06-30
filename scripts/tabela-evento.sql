create table evento (
ID int not null auto_increment,
data_emprestimo dateTime not null,
data_devolucao dateTime,
tipo_evento tinyInt(1) not null, /* 0 - emprestimo, 1 - devolução */
natureza_evento varchar(30) not null,
primary key (ID)
);
describe evento;
select * from evento;
/* adicionar a foreng key de usuario, biblioteca, multa, acervo, */ 

alter table evento add column (biblioteca int, multa int, acervo int, usuario int);


ALTER TABLE evento
ADD CONSTRAINT fk_evento_biblioteca
FOREIGN KEY (biblioteca) REFERENCES biblioteca(ID);

alter table evento add constraint fk_evento_multa
foreign key (multa) references multa(ID);

alter table evento add constraint fk_evento_usuario
foreign key (usuario) references usuario(ID);

alter table evento add constraint fk_evento_acervo
foreign key (acervo) references acervo(ID);

insert into evento (data_emprestimo, data_devolucao, tipo_evento, natureza_evento, biblioteca, multa, usuario) 
values ('2025-06-12 09:00:00', 2025-06-21, 0, 'Emprestimo de livros', 1, 1, 1);

/* join com usuario, acervo, multa e biblioteca */

Select  evento.acervo, biblioteca.nome, evento.data_devolucao, evento.data_emprestimo, multa.ID as Id_multa, evento.natureza_evento, 
case when evento.tipo_evento = 0 then 'Usuário' when evento.tipo_evento = 1 then 'Biblioteca'  else '' end as tipo_evento, usuario.nome from evento
join biblioteca on evento.biblioteca = biblioteca.ID
join multa on multa.ID = evento.multa
join usuario on usuario.ID = evento.usuario;