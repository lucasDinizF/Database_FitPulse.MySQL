create database if not exists funcionarios_fit_pulse;

use funcionarios_fit_pulse;

create table if not exists funcionario (	
	id_funcionario varchar(10) not null,
	nome_funcionario varchar(100) not null,
    cpf_funcionario varchar(20) not null,
    telefone_funcionario varchar(20) not null,
    Email_funcionario varchar(100) not null,
    status_funcionario boolean not null,
    data_nascimento_funcionario date not null,
    data_contratacao date not null,
    senha_funcionario varchar(100) not null,
    endereco_funcionario varchar(100) not null,
    genero_funcionario varchar(10) not null,
    cargo varchar(10) not null,
    salario double not null,
    
	primary key (id_funcionario)
);