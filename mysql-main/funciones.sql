SET GLOBAL log_bin_trust_function_creators = 1;

select f_aleatorio (1,10);

select count(*) from cliente;
select f_cliente_a() AS C;

select count(*) from VENDEDOR;
select f_vendedor_a () AS V;

select count(*) from producto;
select f_producto_a () AS P;

select * from items;
SELECT MAX(NUMERO) from factura;
SELECT MAX(NUMERO)+1 from factura;
CALL sp_factura ('20210619', 30, 100);
SELECT MAX(NUMERO) from factura;

SELECT COUNT(*) FROM items;

-- FACTURACION
SELECT A.FECHA, SUM(B.CANTIDAD*B.PRECIO) 
FROM factura A 
INNER JOIN items B
ON A.NUMERO=B.NUMERO
WHERE A.FECHA = '20210619'
GROUP BY A.FECHA;

-- FACTURACION IMPUESTO
SELECT YEAR(A.FECHA), CEIL(SUM(A.IMPUESTO*(B.CANTIDAD*B.PRECIO))) AS VALOR_IMPUESTO
FROM factura A 
INNER JOIN items B
ON A.NUMERO=B.NUMERO
WHERE YEAR(A.FECHA) = '2021'
GROUP BY YEAR(A.FECHA);
