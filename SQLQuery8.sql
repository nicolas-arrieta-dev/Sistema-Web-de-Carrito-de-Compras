
create proc sp_ReporteVenta(
@fechainicio varchar(10), 
@fechafin varchar(10), 
@idtransaccion varchar(10)
)
as 
begin
set dateformat dmy;
select CONVERT( char(10), v.FechaVenta,103)[FechaVenta],CONCAT( c.Nombres,' ',c.Apellidos)[Cliente],
p.Nombre[Producto], p.Precio,dv.Cantidad, dv.Total, v.IdTransaccion
from DETALLE_VENTA dv
inner join PRODUCTO P ON P.IdProducto = dv.IdProducto
inner join VENTA v on v.IdVenta = dv.IdVenta
inner join CLIENTE c on c.IdCliente = v.IdCliente
where CONVERT(date,v.FechaVenta) between @fechainicio and @fechafin
and  v.IdTransaccion = iif(@idtransaccion = '', v.IdTransaccion, @idtransaccion)
end