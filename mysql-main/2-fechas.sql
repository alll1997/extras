select concat(NOMBRE, '  ', DIRECCION_1, ' ', BARRIO, ' ', CIUDAD, ' ', ESTADO ) FROM tabla_de_clientes AS DATOS_CLIENTES;

select NOMBRE, timestampdiff(YEAR, FECHA_DE_NACIMIENTO, CURDATE()) AS EDAD FROM tabla_de_clientes;

select cantidad  * precio from items_facturas;
select * from facturas;

select YEAR(B.FECHA_VENTA), FLOOR(SUM((A.cantidad  * A.precio)* B.IMPUESTO)) 
AS VALOR 
from items_facturas A 
inner join facturas B on A.numero = B.numero 
where YEAR(B.FECHA_VENTA) = 2016
group by YEAR(B.FECHA_VENTA);

select concat('El cliente ', A.nombre, ' facturo ', 
A.volumen_de_compra , 
' para ', YEAR(B.FECHA_VENTA))
AS VENTAS_2016 from tabla_de_clientes A inner join facturas B on A.DNI = B.DNI 
WHERE YEAR(B.FECHA_VENTA) = 2016
group by A.NOMBRE,YEAR(B.FECHA_VENTA);

SELECT CONCAT('El cliente ', TC.NOMBRE, ' facturó ', 
CONVERT(SUM(IFa.CANTIDAD * IFa.precio), CHAR(20))
 , ' en el año ', CONVERT(YEAR(F.FECHA_VENTA), CHAR(20))) AS FRASE FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC ON F.DNI = TC.DNI
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY TC.NOMBRE, YEAR(FECHA_VENTA);