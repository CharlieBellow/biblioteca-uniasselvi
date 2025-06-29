use biblioteca;
create table usuario (
ID int not null auto_increment,
nome varchar(40) not null,
genero enum('M', 'F', 'HT', 'MT', 'NB', 'AG', 'I', 'GF', 'Q', 'AN', 'OU', 'PNI') not null,
email varchar(30) not null,
matricula int(11),
telefone int(11) not null,
vinculo enum('Docente','Discente') not null,
status tinyInt(1) not null,
primary key (ID)
);
describe usuario;
select * from usuario;

/* adicionar a foreng key de polo, curso, multa */ 
alter table usuario add column (polo int, curso int, multa int);

alter table usuario add constraint fk_polo_usuario
foreign key(polo) references polo(ID);

alter table usuario add constraint fk_usuario_curso
foreign key(curso) references curso(ID);

alter table usuario add constraint fk_usuario_multa
foreign key(multa) references multa(ID);

alter table usuario
modify column matricula bigint(11) unique; /* tornando a matricula única */
alter table usuario 
modify column telefone bigint(11);

insert into usuario (nome, email, matricula, telefone, vinculo, status, polo ) 
values ('Charlie Bellow', 'charlie@email.com', 15861245639, 829925467856, 'Discente', 1, 1);

insert into usuario (nome, email, matricula, telefone, vinculo, status, polo ) 
values ('David Bernardo', 'david@email.com', 20861245435, 829945667885, 'Docente', 1, 1);

alter table usuario add column nascimento date after matricula;

update usuario set genero = 'HT' where ID = 1;
update usuario set genero = 'M' where ID = 2;

update usuario set nascimento = '1994-01-16' where ID = 1;
update usuario set nascimento = '1985-05-05' where ID = 2;

update usuario set curso = 1 where ID = 2;
update usuario set multa = 1 where ID = 2;

/* join com polo, curso e multa */

select usuario.ID, usuario.nome, usuario.genero, 
usuario.email, usuario.matricula, usuario.nascimento, usuario.telefone, 
usuario.vinculo, case when usuario.status = 1 then 'Ativo' when usuario.status = 0 then 'inativo' end as status, polo.nome as polo, curso.nome as curso, multa.ID as ID_multa from usuario
join polo on polo.Id = usuario.polo
join curso on curso.ID = usuario.curso
join multa on multa.ID = usuario.multa order by nome;
