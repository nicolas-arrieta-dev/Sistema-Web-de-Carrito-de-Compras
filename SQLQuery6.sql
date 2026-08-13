select * from PRODUCTO

create proc sp_RegistrarProducto(
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	set @Resultado = 0
	IF NOT EXISTS (SELECT* FROM PRODUCTO WHERE Nombre= @Nombre)
	begin 
		insert into PRODUCTO (Nombre, Descripcion, IdMarca, IdCategoria, Precio, Stock, Activo ) values
		(@Nombre, @Descripcion, @IdMarca, @IdCategoria, @Precio, @Stock, @Activo)
		set	 @Resultado = SCOPE_IDENTITY()

	end
	else
	set @Mensaje = 'El producto ya existe'
end

create proc sp_EditarProducto(
 @IdProducto int,
 @Nombre varchar(100),
 @Descripcion varchar(100),
 @IdMarca varchar(100),
 @IdCategoria varchar(100),
 @Precio decimal(10,2),
 @Stock int,
 @Activo bit,
 @Mensaje varchar(500) output,
 @Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre and IdProducto != @IdProducto)
	begin
		update PRODUCTO set
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdMarca = @IdMarca,
		IdCategoria = @IdCategoria,
		Precio = @Precio,
		Stock = @Stock,
		Activo = @Activo
		where IdProducto = @IdProducto

		SET @Resultado = 1
	end
	else
		set @Mensaje = 'El producto ya existe'
end

create proc sp_EliminarProducto(
 @IdProducto int,
 @Mensaje varchar(500) output,
 @Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (select * from DETALLE_VENTA dv
	inner join PRODUCTO p on p.IdProducto = dv.IdProducto
	where p.IdProducto = @IdProducto)
	begin
		delete top (1) from PRODUCTO where IdProducto = @IdProducto
		SET @Resultado = 1
	end
	else
		set @Mensaje = 'El producto se encuentra relacionado a una venta'
end

select p.IdProducto, p.Nombre,p.Descripcion, 
m.IdMarca, m.Descripcion[DesMarca], 
c.IdCategoria, c.Descripcion[DesCategoria],
p.Precio, p.Stock, p.RutaImagen, p.NombreImagen, p.Activo 
from  PRODUCTO P 
inner join Marca m on m.IdMarca = p.IdMarca 
inner join CATEGORIA c on c.IdCategoria = p.IdCategoria