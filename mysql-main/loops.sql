/* Control de flujo*/
-- if , else, then
SELECT * FROM TABLA_DE_CLIENTES;
SELECT FECHA_DE_NACIMIENTO FROM tabla_de_clientes WHERE DNI="5576228758";

call flujo_edad ('5576228758');
call flujo_edad ('94387591700');


SELECT * FROM facturas;
SELECT count(*) FROM facturas WHERE FECHA_VENTA= "2015-01-01";
call evaluacion_facturas ("2015-01-01");

-- if , elseif, else, then
select * from tabla_de_productos;
select precio_de_lista from tabla_de_productos where CODIGO_DEL_PRODUCTO = "1000889";
CALL adsequibilidad ("1000889");

SELECT SUM(B.CANTIDAD * B.PRECIO) AS TOTAL_VENTA FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = '20170301';
CALL comparacion_ventas(20170301, 20170101);


-- CASE
SELECT * FROM tabla_de_productos;
SELECT sabor, CODIGO_DEL_PRODUCTO FROM tabla_de_productos;
SELECT SABOR FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO ="1000889";
SELECT DISTINCT SABOR FROM tabla_de_productos;
call caracterizacion_sabores ("1001448");

call caracterizacion_error (1002334)


-- if vs case
/* CREATE DEFINER=`root`@`localhost` PROCEDURE `adsequibilidad`(v_codigo varchar(10))
BEGIN
declare v_clasificacion varchar(20);
declare v_precio float;
select precio_de_lista into v_precio from tabla_de_productos where CODIGO_DEL_PRODUCTO = v_codigo;
IF v_precio>= 12 THEN SET v_clasificacion="Costos" ;
ELSEIF v_precio>=7 AND v_precio<12 THEN SET v_clasificacion="Adsequible";
ELSE SET v_clasificacion="Economico";
END IF;
SELECT v_clasificacion;
END
*/

delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `adsequibilidad_case`(v_codigo varchar(10))
BEGIN
declare v_clasificacion varchar(20);
declare v_precio float;
select precio_de_lista into v_precio from tabla_de_productos where CODIGO_DEL_PRODUCTO = v_codigo;
CASE
WHEN v_precio>= 12 THEN SET v_clasificacion="Costos" ;
WHEN v_precio>=7 AND v_precio<12 THEN SET v_clasificacion="Adsequible";
ELSE SET v_clasificacion="Economico";
END CASE;
SELECT v_clasificacion;
END $$

call adsequibilidad_case ("1000889");

CALL comparacion_ventas_case(20170301, 20170101);


-- WHILE
CREATE TABLE tb_loop (id_n int);
select * from tb_loop;
call looping(1,100);

SELECT ADDDATE(FECHA_VENTA, INTERVAL 1 DAY) from facturas;
call suma_dias_facturas;

