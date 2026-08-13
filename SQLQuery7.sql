select * from PRODUCTO


create proc sp_ReporteDashboard
as
begin	
select 
(select count(*) from CLIENTE) [TotalCliente],
(select isnull(sum(cantidad), 0)from DETALLE_VENTA) [TotalVenta],
(select count(*) from PRODUCTO) [TotalProducto]
end

exec sp_ReporteDashboard