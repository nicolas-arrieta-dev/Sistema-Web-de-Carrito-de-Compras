CREATE FUNCTION fn_ListarCompra
(
    @idCliente INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        p.RutaImagen,
        p.NombreImagen,
        p.Nombre,
        p.Precio,
        dv.Cantidad,
        dv.Total,
        v.IdTransaccion
    FROM
        DETALLE_VENTA dv
    INNER JOIN
        PRODUCTO p ON p.IdProducto = dv.IdProducto
    INNER JOIN
        VENTA v ON v.IdVenta = dv.IdVenta
    WHERE
        v.IdCliente = @idCliente
)
GO