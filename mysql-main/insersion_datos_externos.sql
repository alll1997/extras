insert into factura select NUMERO, FECHA_VENTA AS FECHA, DNI, MATRICULA,IMPUESTO FROM jugos_ventas.facturas;
select * from factura;

insert into items select NUMERO, CODIGO_DEL_PRODUCTO as CODIGO, CANTIDAD, PRECIO FROM jugos_ventas.items_facturas;
select * from items;

select * from factura f inner join items fa on f.numero=fa.numero;