create procedure sp_atualiza_telefone_usuario
	@usu_idusuario numeric(18,0),
	@tel_numero varchar(30)

as

	begin try
		--Verificado se o usuario existe na tabela de telefone
		if exists(select 1 from Person.tb_telefone where tel_idusuario = @usu_idusuario)
			begin
				update Person.tb_telefone
				set tel_numero = @tel_numero
				where tel_idusuario = @usu_idusuario
			end
		else
			begin 
				select 'Usuario nao existe na tabela de telefon' Retorno
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




	select * from Person.tb_telefone
