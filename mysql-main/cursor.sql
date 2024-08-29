call cursor_limit;
select nombre from tabla_de_clientes limit 10;

call cursor_libre;
select nombre from tabla_de_clientes;

call limite_credito;
call limite_creditos;

CALL cursor_concat;

SELECT IFa.CANTIDAD, IFa.PRECIO FROM items_facturas IFa
INNER JOIN facturas  F ON F.NUMERO = IFa.NUMERO
WHERE MONTH(F.FECHA_VENTA) = 1 AND YEAR(F.FECHA_VENTA) = 2017;
call cursor_factura;