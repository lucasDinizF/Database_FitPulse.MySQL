
create database if not exists fit_pulse;

use fit_pulse;

create table if not exists plano (
	id_plano varchar(1) not null,
    	nome_plano varchar(10) not null,
    	valor double not null, 

	primary key (id_plano)
);

create table if not exists aluno (	
	id_aluno varchar(10) not null,
	nome_aluno varchar(100) not null,
    	cpf_aluno varchar(20) not null,
    	telefone_aluno varchar(20) not null,
	Email_aluno varchar(100) not null,
	status_aluno boolean not null,
	data_nascimento_aluno date not null,
	data_inscricao date not null,
	senha_aluno varchar(100) not null,
	endereco_aluno varchar(100) not null,
	genero_aluno varchar(10) not null,
	id_plano varchar(1) not null,
	    
	primary key (id_aluno),
    	constraint fk_aluno_plano foreign key (id_plano) references plano(id_plano)
    
);


create table if not exists exercicio (
	id_exercicio varchar(10) not null,
    	nome_exercicio varchar(100) not null,
    	tipo_exercicio varchar(50) not null,
    	maquina_exercicio varchar(100) not null,
    	descricao_exercicio varchar(1000) not null,

    
    	primary key (id_exercicio)
);

create table if not exists pagamento  (
	id_pagamento varchar(1) not null,
    	tipo_pagamento varchar(10) not null,
    	valor_total double not null,
    	mes_pagamento date not null,	
    
    	primary key (id_pagamento)
);

create table if not exists treino (
	id_aluno varchar(10) not null,
	id_exercicio varchar(10) not null,
    	serie_exercicio int not null,
    	repeticoes_exercicio int not null,
    	tipo_treino varchar(1) not null,
    
    
    	primary key (id_aluno, id_exercicio),
    	constraint fk_treino_aluno foreign key (id_aluno) references aluno(id_aluno),
    	constraint fk_treino_exercicio foreign key (id_exercicio) references exercicio(id_exercicio)
    
);

create table if not exists pagamento_aluno (
	id_pagamento varchar(1) not null,
    id_aluno varchar(10) not null,
    
    primary key (id_pagamento, id_aluno),
    constraint fk_pagamento_aluno foreign key (id_aluno) references aluno(id_aluno),
    constraint fk_aluno_pagamento foreign key (id_pagamento) references pagamento(id_pagamento)
    
);
