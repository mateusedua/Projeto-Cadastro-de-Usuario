Create procedure sp_atualiza_cadastro_usuario
	@usu_idusuario numeric(18,0),
	@end_logradouro varchar(120),
	@end_numero varchar(30),
	@end_cidade varchar(60),
	@end_estado varchar(2),
	@end_bairro varchar(120),
	@end_cep varchar(30)


as

	begin try
		
		--Verificado se o usuario existe na tabela de endereco
		if exists(select 1 from Person.tb_endereco where end_idusuario = @usu_idusuario)
			begin 
				update Person.tb_endereco
				set end_logradouro = @end_logradouro,
					end_numero = @end_numero,
					end_cidade = @end_cidade,
					end_estado = @end_estado,
					end_bairro = @end_bairro,
					end_cep = @end_cep
				where end_idusuario = @usu_idusuario
			end
		else
			begin
				select 'Usuario nao existe na tabela de endereco' Retorno
			end
	end try

	begin catch
		rollback transaction
		-- Inserindo na tabela de log caso algum erro ocorra
		insert into log.th_procedimentos(	proc_errorline,
											proc_errormessage,
											proc_errorprocedure)
		values(	ERROR_LINE(),
				ERROR_MESSAGE(),
				ERROR_PROCEDURE())

	end catch


