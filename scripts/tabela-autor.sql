use biblioteca;
create table autor (
ID int not null auto_increment,
nome varchar(40) not null,
nascimento date not null,
genero enum('M', 'F', 'HT', 'MT', 'NB', 'AG', 'I', 'GF', 'Q', 'AN', 'OU', 'PNI') not null,
nacionalidade varchar(30) not null,
area_formacao  varchar(30) not null,
n_publi_acervo tinyInt(3) not null default 1,
primary key (ID)
) default charset = utf8;
insert into autor (nome, nascimento, genero, nacionalidade, area_formacao, n_publi_acervo ) 
values ('Gilles Deleuze', '1925-01-18', 'M', 'França', 'Filosofia', '2'), 
('Félix Guattari', '1930-04-30', 'M', 'França', 'Psicanálise', '2'),
('Michel Foucault', '1926-10-15', 'M', 'França', 'Psicologia', '1');

delete from autor where id = 2;

select * from autor;
describe autor;