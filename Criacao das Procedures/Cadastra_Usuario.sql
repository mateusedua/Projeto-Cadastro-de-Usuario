create procedure Person.sp_cadastra_usuario
	@usu_nome varchar(60),
	@usu_sobrenome varchar(60),
	@usu_sexo char(1),
	@usu_email varchar(120),
	@usu_senha varchar(240),
	@usu_cpf varchar(11),
	@end_logradouro varchar(120),
	@end_numero varchar(30),
	@end_cidade varchar(60),
	@end_estado varchar(2),
	@end_bairro varchar(120),
	@end_cep varchar(30),
	@tel_numero varchar(30)
	
as

declare @seq_idusuario int = 0
--Gerando o ID do usuario
select @seq_idusuario = next value for Person.tb_usuario_seq


begin try
	begin transaction
		--Insert do Usuario
		begin
			insert into Person.tb_usuario(	usu_idusuario,
											usu_nome,
											usu_sobrenome,
											usu_sexo,
											usu_email,
											usu_senha,
											usu_cpf)
			values(	@seq_idusuario,
					@usu_nome,
					@usu_sobrenome,
					@usu_sexo,
					@usu_email,
					@usu_senha,
					@usu_cpf)
		end
		--Insert do Endereço
		begin 
			insert into Person.tb_endereco(	end_idpessoa,
											end_logradouro,
											end_numero,
											end_cidade,
											end_estado,
											end_bairro,
											end_cep)
			values(	@seq_idusuario,
					@end_logradouro,
					@end_numero,
					@end_cidade,
					@end_estado,
					@end_bairro,
					@end_cep
					)
		end
		-- Insert do Telefone
		begin 
			insert into Person.tb_telefone(	tel_idpessoa,
											tel_numero)
			values(	@seq_idusuario,
					@tel_numero)
		end
	commit transaction

end try

begin catch
	rollback transaction
	--Coso aconteça algum erro na execução da procedure sera armazenado
	insert into Log.th_procedimentos
	values(	ERROR_MESSAGE(),
			ERROR_LINE(),
			ERROR_PROCEDURE())

end catch

