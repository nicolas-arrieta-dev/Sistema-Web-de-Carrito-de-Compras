create proc sp_RegistrarCategoria(
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
	begin
		insert into CATEGORIA(Descripcion, Activo) values (@Descripcion, @Activo)
		SET @Resultado = SCOPE_IDENTITY()

	end
	else
	set @Mensaje = 'La categoria ya existe'
end

select * from CATEGORIA;


create proc sp_EditarCategoria(
@IdCategoria int, 
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin 
	set @Resultado = 0
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @descripcion and IdCategoria != @IdCategoria)
	begin
		update top (1) CATEGORIA set
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria

		set @Resultado = 1
	end
	else
	set @Mensaje = 'La cadtegoria ya existe'
end

create proc sp_EliminarCategoria(
@IdCategoria int, 
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF Not exists (select * from PRODUCTO p
	inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
	where p.IdCategoria = @IdCategoria)
	begin
		delete top (1) from CATEGORIA where IdCategoria = @IdCategoria
		set @Resultado = 1
	end
	else
		set @Mensaje = 'La categoria se encuentra relacionada a un producto'
end



SELECT * FROM MARCA;

create proc sp_RegistrarMarca(
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)
	begin
		insert into  MARCA(Descripcion, Activo) values (@Descripcion, @Activo)
		SET @Resultado = SCOPE_IDENTITY()

	end
	else
	set @Mensaje = 'La marca ya existe'
end

create proc sp_EditarMarca(
@IdMarca int, 
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin 
	set @Resultado = 0
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @descripcion and IdMarca != @IdMarca)
	begin
		update top (1) MARCA set
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca

		set @Resultado = 1
	end
	else
	set @Mensaje = 'La marca ya existe'
end

create proc sp_EliminarMarca(
@IdMarca int, 
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF Not exists (select * from PRODUCTO p
	inner join MARCA m on m.IdMarca = p.IdMarca
	where p.IdMarca = @IdMarca)
	begin
		delete top (1) from MARCA where IdMarca = @IdMarca
		set @Resultado = 1
	end
	else
		set @Mensaje = 'La marca se encuentra relacionada a un producto'
end

