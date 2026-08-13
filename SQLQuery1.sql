create database DBCARRITO

GO 

Use DBCARRITO

GO


CREATE TABLE CATEGORIA (
IdCategoria int primary key identity,
Descripcion varchar(100),
Activo bit default 1, 
FechaRegistro datetime default getdate()
)

go 

CREATE TABLE  MARCA (
IdMarca int primary key identity,
Descripcion varchar(100),
Activo bit default 1, 
FechaRegistro datetime default getdate()
)

go

CREATE TABLE PRODUCTO (
IdProducto int primary key identity,
Nombre varchar(500),
Descripcion varchar(500),
IdMarca int references Marca(IdMarca),
IdCategoria int references Categoria(IdCategoria),
Precio decimal(10,2) default 0,
Stock int ,
RutaImagen varchar(100),
NombreImagen Varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)
go 


CREATE TABLE CLIENTE (
IdCliente int Primary key identity,
Nombres varchar(100),
Apellidos varchar(100),
Correo varchar(100),
Clave varchar(150),
Restablecer bit default 0,
FechaRegistro datetime default getdate()
)
go

CREATE TABLE CARRITO(
IdCarrito int primary key identity,
IdCliente int references CLIENTE(IdCliente),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int
)
go

CREATE TABLE VENTA (
IdVenta int primary key identity,
IdCliente int references Cliente(IdCliente),
TotalProducto int,
MontoTotal	decimal(10,2),
Contacto varchar(50),
IdDistrito varchar(10),
Telefono varchar(50),
Direccion varchar(500),
IdTransaccion varchar(50),
FechaVenta  datetime default getdate()
)
go

CREATE TABLE DETALLE_VENTA(
IdDetalleVenta int primary key identity,
IdVenta int references Venta(IdVenta),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int,
Total decimal (10,2)
)
go 

CREATE TABLE USUARIO (
IdUsuario int primary key identity,
Nombres varchar(100),
Apellidos varchar(100),
Correro varchar(100),
Clave varchar(150),
Reestablecer bit default 1,
Activo	bit default 1,
FechaRegistro datetime default getdate()
)
go

CREATE TABLE DEPARTAMENTO (
IdDepartamento varchar(2) not null,
Descripcion varchar(45) not null
)
go

CREATE TABLE PROVINCIA (
IdProvincia varchar(4) not null,
Descripcion varchar(45) not null,
IdDepartamento varchar(2) not null
)
go

CREATE TABLE DISTRITO (
IdDistrito varchar(6) not null,
Descripcion varchar(45) not null,
IdProvincia varchar(4) not null,
IdDepartamento varchar(2) not null
)
go