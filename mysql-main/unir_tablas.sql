select * from tb_producto;
update tb_producto set DESCRIPCION = "Sabor de la Montaña", TAMANO = "1 Litro", ENVASE = "Botella PET", PRECIO_LISTA = 5
WHERE CODIGO =  '1000889';

select * from tb_cliente;
update tb_cliente set VOLUMEN_COMPRA = VOLUMEN_COMPRA/10;

UPDATE TB_CLIENTE SET ESTADO ='JC'
WHERE DNI = '5840119709';
select * from tb_cliente;


select * from tb_vendedor;
select * from jugos_ventas.tabla_de_vendedores;

select * from tb_vendedor A inner join jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA,3,3);

UPDATE tb_vendedor A inner join jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA,3,3)
SET A.VACACIONES =  B.VACACIONES;


SELECT A.DNI FROM tb_cliente A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO

UPDATE tb_cliente A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO
SET A.VOLUMEN_COMPRA = A.VOLUMEN_COMPRA*1.30;
SELECT * FROM tb_cliente;