insert into tb_cliente VALUES
('9283760794', 'Edson Calisaya', 'Sta Úrsula Xitla', 'Barrio del Niño Jesús', 'Ciudad de México', 'EM', '22002002', '1995-01-07', 25, 'M', 150000, 250000, 1),
('7771579779', 'Marcelo Perez', 'F.C. de Cuernavaca 13', 'Carola', 'Ciudad de México', 'EM', '88202912', '1992-01-25', 29, 'M', 70000, 160000, 1),
('5576228758', 'Patricia Olivera', 'Pachuca 75', 'Condesa', 'Ciudad de México', 'EM', '88192029', '1995-01-14', 25, 'F', 70000, 160000, 1.);

SELECT * FROM TB_CLIENTE;

insert into tb_producto
select CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION, SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA
FROM jugos_ventas.tabla_de_productos
where CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);
select * from tb_producto;

insert into tb_cliente
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION, BARRIO, CIUDAD,  ESTADO, CP, FECHA_DE_NACIMIENTO AS FECHA_NACIMINETO, EDAD, SEXO, LIMITE_DE_CREDITO AS  LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_DE_COMPRA, PRIMERA_COMPRA 
FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (select DNI FROM tb_cliente);
SELECT * FROM tb_cliente;

SELECT * FROM tabla_de_clientes;