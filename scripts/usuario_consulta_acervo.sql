create table usuario_consulta_acervo (
ID int not null auto_increment,
usuario int(11),
acervo int(11),
primary key (ID),
foreign key (usuario) references usuario(ID),
foreign key (acervo) references acervo(ID)
) default charset = utf8;

describe usuario_consulta_acervo;
select * from usuario_consulta_acervo;

insert into usuario_consulta_acervo values (default, 1, 1);
insert into usuario_consulta_acervo values (default, 2, 1);

select usuario.ID, usuario.nome as usuario, acervo.titulo
from usuario join usuario_consulta_acervo
on usuario.ID = usuario_consulta_acervo.ID
join acervo on usuario_consulta_acervo.ID = acervo.ID;