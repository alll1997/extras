use jugos;

alter table registro_clientes add primary key (DNI);

alter table registro_clientes add column (FECHA_NACIMIENTO date);

insert into registro_clientes(
DNI, NOMBRE, DIRECCION1, DIRECCION2, BARRIO, CIUDAD, ESTADO, CP, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA, FECHA_NACIMIENTO) values(
'15872248','Sebastian Parra', 'Calle 67f # suba - 05', '', 'Portal', 'Bachue', 'Boyoca', '014510', 23, 'M', 1000000, 20000, 0, '2000-01-01');
