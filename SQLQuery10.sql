declare @idcategoria int = 0

select  distinct m.IdMarca, m.Descripcion from  PRODUCTO P
inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
INNER join MARCA m on m.IdMarca = p.IdMarca and m.Activo = 1
where c.IdCategoria  =iif( @idcategoria = 0, c.IdCategoria, @idcategoria)

select * from MARCA;