create table curso (
ID int not null auto_increment,
nome varchar(30) not null,
n_inscritos  tinyInt(1) not null,
primary key (ID)
);
describe curso;
select * from curso;
/* adicionar a foreng key de polo, usuario */ 

alter table curso add column (polo int, coordenador int not null);

alter table curso add constraint fk_curso_polo
foreign key (polo) references polo(ID);

alter table curso add constraint fk_curso_usuario
foreign key(coordenador) references usuario(ID);

insert into curso (nome, n_inscritos, polo, coordenador) 
values ('Psicologia', 32, 1, 2);

/* join com usuario(professor), polo */