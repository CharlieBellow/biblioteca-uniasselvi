create table multa (
ID int not null auto_increment,
data_criacao dateTime not null,
status tinyInt(1) not null,
primary key (ID)
);
/* adicionar a foreng key de usuario e evento */ 

describe multa;
select * from multa;

alter table multa add column (usuario int, evento int);
alter table multa add column valor decimal(5,2);

alter table multa add constraint fk_multa_usuario
foreign key(usuario) references usuario(ID);

alter table multa add column biblioteca int(11) after usuario;
alter table multa add constraint fk_multa_biblioteca 
foreign key(biblioteca) references biblioteca(ID);

alter table multa add constraint fk_multa_evento
foreign key(evento) references evento(ID);

insert into multa (data_criacao, status, valor) 
values ('2025-04-12', '1', 3.00);

update multa set usuario = 1 where ID = 1;
update multa set evento = 1 where ID = 1;
update multa set biblioteca = 1 where ID = 1;
update multa set evento = 1 where ID = 1;
/* join com evento, e usuário */

select multa.ID, multa.data_criacao, 
case when multa.status = 1 then 'Pendente' when multa.status = 0 then 'Paga' end as status, 
usuario.nome as usuario, biblioteca.nome as biblioteca, evento.natureza_evento as evento, multa.valor from multa
join usuario on usuario.ID = multa.usuario
join biblioteca on biblioteca.ID = multa.biblioteca
join evento on evento.ID = multa.evento;