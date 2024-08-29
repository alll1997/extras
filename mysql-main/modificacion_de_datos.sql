INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA)
     VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);

SELECT * FROM tb_producto WHERE DESCRIPCION = 'Sabor Alpino';

DELETE FROM tb_producto where codigo = '1001001';
DELETE FROM tb_producto where tamano = '1 Litro' and DESCRIPCION = 'Sabor Alpino';

select codigo from tb_producto where CODIGO not in (select CODIGO_del_producto from jugos_ventas.tabla_de_productos );
delete from tb_producto where CODIGO not in (select CODIGO_del_producto from jugos_ventas.tabla_de_productos );

SELECT A.DNI FROM tb_cliente A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO;

delete A FROM tb_factura A
INNER JOIN tb_cliente B
ON A.DNI = B.DNI
WHERE B.EDAD <18;

