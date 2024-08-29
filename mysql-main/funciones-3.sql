SET GLOBAL log_bin_trust_function_creators = 1;

select sabor, f_caracterizacion_sabores(sabor) from tabla_de_productos;

SELECT f_factura('20170101') AS RESULTADO from facturas;
SELECT f_numero_facturas('20170101') AS RESULTADO from facturas;