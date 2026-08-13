
2
create proc sp_RegistrarCliente(
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
SET @Resultado = 0
IF NOT EXISTS (SELECT * FROM CLIENTE WHERE Correo = @Correo)
begin
insert into CLIENTE(Nombres,Apellidos,Correo,Clave,Restablecer) values
(@Nombres,@Apellidos,@Correo,@Clave,0)

SET @Resultado = scope_identity()
end
else
set @Mensaje = 'El correo del usuario ya existe'
end