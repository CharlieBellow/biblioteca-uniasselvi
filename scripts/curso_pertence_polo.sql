create table curso_pertence_polo (
ID int not null auto_increment,
curso int(11),
polo int(11),
primary key (ID),
foreign key (curso) references curso(ID),
foreign key (polo) references polo(ID)
) default charset = utf8;

describe curso_pertence_polo;
select * from curso_pertence_polo;

insert into curso_pertence_polo values (default, 1, 1);
insert into curso_pertence_polo values (default, 1, 2);

select curso.ID, curso.nome as curso, polo.nome as polo
from curso join curso_pertence_polo
on curso.ID = curso_pertence_polo.ID
join polo on curso_pertence_polo.ID = polo.ID;
