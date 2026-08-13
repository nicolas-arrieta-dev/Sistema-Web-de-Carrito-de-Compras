create function fn_obtenerCarritoCliente (
    @idCliente int
)
returns table
as
return(
    select 
        p.IdProducto,
        m.Descripcion[DesMarca],
        p.Nombre,
        p.Precio,
        c.Cantidad,
        p.RutaImagen,
        p.NombreImagen
    from CARRITO c
    inner join PRODUCTO p on p.IdProducto = c.IdProducto
    inner join MARCA m on m.IdMarca = p.IdMarca
    where c.IdCliente = @idCliente
)
create proc sp_EliminarCarrito (
    @IdCliente int,
    @IdProducto int,
    @Resultado bit output
)
as
begin

    set @Resultado = 1
    declare @cantidadproducto int = (select Cantidad from CARRITO where IdCliente = @IdCliente and IdProducto = @IdProducto)

    BEGIN TRY
        
        BEGIN TRANSACTION OPERACION
        
        update PRODUCTO set Stock = Stock + @cantidadproducto where IdProducto = @IdProducto
        delete top (1) from CARRITO where IdCliente = @IdCliente and IdProducto = @IdProducto
        
        COMMIT TRANSACTION OPERACION
    
    END TRY
    BEGIN CATCH
        
        set @Resultado = 0
        ROLLBACK TRANSACTION OPERACION
    
    END CATCH

end