/*Criação das Tabelas utilizadas*/
Create Table Person.tb_usuario(
	usu_idusuario numeric(18,0) not null,
	usu_nome Varchar(60) not null,
	usu_sobrenome varchar(60) not null,
	usu_sexo char(1),
	usu_email varchar(120) not null,
	usu_senha varchar(240),
	usu_cpf varchar(11) not null,
	usu_datainclusao datetime default current_timestamp,
	constraint usu_idusuario_pk primary key clustered(
		usu_idusuario asc
	)
)


Create Table Person.tb_endereco(
	end_idusuario numeric(18,0) not null,
	end_logradouro varchar(120),
	end_numero varchar(30),
	end_cidade varchar(60),
	end_estado varchar(2),
	end_bairro varchar(120),
	end_cep varchar(30),
	end_datainclusao datetime default current_timestamp,
	constraint end_idusuario_fk primary key(
		end_idusuario asc
	)
		
)


Create Table Person.tb_telefone(
	tel_idusuario numeric(18,0) not null,
	tel_numero varchar(30),
	tel_datainclusao datetime default current_timestamp,
	constraint tel_idusuario_pk primary key clustered(
		tel_idusuario asc
	)
)


--Criado essa tabela para armazenamento de logs de execuções de procedimentos armazenados

Create table Log.th_procedimentos(
	proc_id_procedimento numeric(18,0) identity(1,1) not null,
	proc_errormessage varchar(240),
	proc_errorline int,
	proc_errorprocedure varchar(60),
	proc_datainclusao datetime default current_timestamp
	constraint proc_id_procedimento_pk primary key clustered(
		proc_id_procedimento asc
	)
)


