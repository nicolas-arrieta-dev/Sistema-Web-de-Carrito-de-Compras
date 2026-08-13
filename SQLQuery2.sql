

Select * from usuario


insert into USUARIO(Nombres, Apellidos, Correro, Clave) values('test nombre', 'test apellido','test@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae')

select * from CATEGORIA

insert into CATEGORIA(Descripcion) values
('Tecnologia'),
('Muebles'),
('Dormitorio'),
('Deportes')

Select * from MARCA

insert into MARCA(Descripcion) values
('SONYTE'),
('HPTE'),
('LGTE'),
('HUNDAYTE'),
('CANONTE'),
('ROBERTA ALLANTE')


Select * from DEPARTAMENTO

insert into DEPARTAMENTO(IdDepartamento, Descripcion) values
('01','Arequipa'),
('02','Ica'),
('03','Lima')

select  * from PROVINCIA 

INSERT INTO PROVINCIA(IdProvincia, Descripcion,  IdDepartamento)values
('0101','Arequipa', '01'),
('0102','Camaná', '01'),
('0201','Ica', '02'),
('0202','Chinca', '02'),
('0301','Lima', '03'),
('0302','Barranca', '03')

select * from DISTRITO 


insert into DISTRITO(IdDistrito, Descripcion, IdProvincia, IdDepartamento) values

('010101','Nieva','0101','01'),
('010102','El cenapa','0101','01'),
('010201','Camaná','0102','01'),
('010202','José maria Quimper','0102','01'),

('020101','Ica','0201','02'),
('020102','La Tinguiña','0201','02'),
('020201','Chingua Alta','0202','02'),
('020202','Alto Laran','0202','02'),

('030101','Lima','0301','03'),
('030102','Ancón','0301','03'),
('030201','Barranca','0302','03'),
('030202','Paramonga','0302','03')



















