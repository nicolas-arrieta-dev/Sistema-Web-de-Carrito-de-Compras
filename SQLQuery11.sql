
select count(*) from carrito where idcliente = 1

create proc sp_ExisteCarrito(
@IdCliente int,
@IdProducto int,
@Resultado bit output
)
as
begin
if exists(select * from carrito where idcliente = @IdCliente and idproducto = @IdProducto)
set @Resultado = 1
else
set @Resultado = 0
end

create proc sp_OperacionCarrito(
 @IdCliente int,
 @IdProducto int,
 @Sumar bit,
 @Mensaje varchar(500) output,
 @Resultado bit output
)
as
begin

 set @Resultado = 1
 set @Mensaje = ''

 declare @existecarrito bit = iif(exists(select * from carrito where idcliente = @IdCliente and idproducto = @IdProducto),1,0)
 declare @stockproducto int=(select stock from PRODUCTO where IdProducto = @IdProducto)

 BEGIN TRY

 BEGIN TRANSACTION OPERACION

 if(@Sumar = 1)
 begin

 if(@stockproducto > 0)
 begin

 if(@existecarrito = 1)
 update CARRITO set Cantidad = Cantidad + 1 where idcliente = @IdCliente and idproducto = @IdProducto
 else
 insert into CARRITO(IdCliente,IdProducto,Cantidad) values(@IdCliente,@IdProducto,1)

 update PRODUCTO set Stock = Stock - 1 where IdProducto = @IdProducto

 end
else
	begin
			set @Resultado = 0
			set @Mensaje = 'El Producto no cuenta con sotck disponible'
		end
	end
else
begin
	update CARRITO set Cantidad = Cantidad - 1 where idcliente = @IdCliente and idproducto = @IdProducto
	update PRODUCTO set Stock = Stock + 1 where IdProducto = @IdProducto
end

COMMIT TRANSACTION OPERACION

END TRY
BEGIN CATCH
	set @Resultado = 0
	set @Mensaje = ERROR_MESSAGE()
	ROLLBACK TRANSACTION OPERACION
end CATCH

end