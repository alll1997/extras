USE jugos_ventas;

select * from facturas;
select * from tabla_de_clientes;
select DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA, PRIMERA_COMPRA from tabla_de_clientes;
select DNI as Identificación, NOMBRE as Cliente from tabla_de_clientes;

select * from tabla_de_productos;
select * from tabla_de_productos where SABOR = 'mango';
select * from tabla_de_productos where ENVASE = 'botella pet';
select * from tabla_de_productos where PRECIO_DE_LISTA < 16;
select * from tabla_de_productos where PRECIO_DE_LISTA between 16 and 16.2;
select * from tabla_de_productos where SABOR in ('mango', 'naranja', 'uva') and not (ENVASE ='botella pet');
select * from tabla_de_productos where ENVASE LIKE ('botella%');

select * from tabla_de_clientes where NOMBRE LIKE ('%ez');
select distinct barrio from tabla_de_clientes where ciudad = 'Ciudad de Mexico';

select * from tabla_de_productos limit 6,3;
select * from facturas where FECHA_VENTA ='2017-01-01' limit 10;

select * from tabla_de_productos order by tamano DESC, nombre_del_producto;

select * from tabla_de_productos where sabor = 'Frutilla/Limón' and tamano='1 Litro';
select * from items_facturas where codigo_del_producto = '1101035' order by cantidad DESC;

select estado, barrio , max(limite_de_credito) as limite, edad from tabla_de_clientes where edad >=26 group by estado, barrio, edad order by edad;
select * from items_facturas;
select codigo_del_producto ,max(cantidad) as MAYOR_CANTIDAD from items_facturas where CODIGO_DEL_PRODUCTO = '1101035' group by CODIGO_DEL_PRODUCTO;
SELECT COUNT(*) FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035" AND CANTIDAD = 99;

select * from facturas;
select dni, count(*) from facturas Where year (fecha_venta) = 2016 group by DNI having count(*)>2000;

select * from tabla_de_productos;
select sabor, max(tamano) as max_tamano, min(tamano) as min_tamano, count(envase) as cantidad_envases from tabla_de_productos group by sabor having count(envase)<4 order by sabor desc;

select * from tabla_de_clientes;
select DNI, NOMBRE,FECHA_DE_NACIMIENTO,
CASE
	WHEN FECHA_DE_NACIMIENTO > 1990 THEN 'Viejos'
    WHEN FECHA_DE_NACIMIENTO >= 1990 AND FECHA_DE_NACIMIENTO <=1995 THEN 'Jóvenes y nacidos'
    ELSE 'Niños'
END AS CATEGORIZACION_DE_EDAD
from tabla_de_clientes;

select YEAR(A.fecha_venta), SUM(B.CANTIDAD * B.PRECIO) AS FACTURACION_ANUAL 
FROM FACTURAS A INNER join items_facturas B ON A.NUMERO = B.NUMERO 
group by  YEAR(A.fecha_venta);

SELECT A.ENVASE, SUM(B.CANTIDAD), SUM(PRECIO)
FROM TABLA_DE_PRODUCTOS A INNER JOIN  ITEMS_FACTURAS B ON A.CODIGO_DEL_PRODUCTO = B.CODIGO_DEL_PRODUCTO
WHERE A.ENVASE LIKE 'Botella%'
group BY A.ENVASE;

SELECT distinct BARRIO FROM tabla_de_clientes;
select BARRIO from tabla_de_vendedores; 
SELECT BARRIO FROM tabla_de_clientes UNION select BARRIO from tabla_de_vendedores; 
SELECT BARRIO FROM tabla_de_clientes UNION ALL select BARRIO from tabla_de_vendedores; 

SELECT A.NOMBRE, A.CIUDAD,VACACIONES
FROM tabla_de_clientes A LEFT JOIN tabla_de_vendedores B
ON A.BARRIO = B.BARRIO
UNION
SELECT A.NOMBRE, A.CIUDAD,VACACIONES
FROM tabla_de_clientes A RIGHT JOIN tabla_de_vendedores B
ON A.BARRIO = B.BARRIO;


select ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO
FROM tabla_de_productos group by ENVASE; 

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM
(SELECT ENVASE, MAX(PRECIO_DE_LISTA) 
AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE) X
where X.PRECIO_MAXIMO >=10;

SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

select DNI, COUNT(*) FROM facturas WHERE YEAR(FECHA_VENTA) = 2016 GROUP BY DNI;

SELECT X.DNI, X.CONTEO_TOTAL 
FROM (select DNI, COUNT(*) AS CONTEO_TOTAL 
FROM facturas WHERE YEAR(FECHA_VENTA) = 2016 GROUP BY DNI)X 
HAVING X.CONTEO_TOTAL > 2000;

SELECT ENVASE, PRECIO_MAXIMO FROM
vw_precio_maximo 
WHERE PRECIO_MAXIMO >=10;

SELECT CONCAT('El cliente ', TC.NOMBRE, 
' facturó ', CAST(SUM(IFa.CANTIDAD * IFa.precio) AS CHAR(20)) , 
' en el año ', CAST(YEAR(F.FECHA_VENTA) AS CHAR(20))) AS FRASE 
FROM facturas F INNER JOIN items_facturas IFa 
ON F.NUMERO = IFa.NUMERO 
INNER JOIN tabla_de_clientes TC 
ON F.DNI = TC.DNI 
WHERE YEAR(FECHA_VENTA) = 2016 
GROUP BY TC.NOMBRE, YEAR(FECHA_VENTA);
