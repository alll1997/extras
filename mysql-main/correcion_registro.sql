CREATE TABLE factura(
NUMERO int(5) not null,
FECHA date,
DNI varchar(11) NOT NULL,
MATRICULA varchar(5) NOT NULL,
IMPUESTO float,
primary key(NUMERO),
FOREIGN KEY(DNI) REFERENCES cliente(DNI),
FOREIGN KEY (MATRICULA) REFERENCES vendedor(MATRICULA)
);

CREATE TABLE items(
NUMERO int(5) not null,
CODIGO varchar(10) not null,
CANTIDAD int,
PRECIO float,
primary key(numero, codigo),
FOREIGN KEY (NUMERO) REFERENCES factura(NUMERO),
FOREIGN KEY (CODIGO) REFERENCES producto(CODIGO)
);

insert into factura select NUMERO, FECHA_VENTA AS FECHA, DNI, MATRICULA,IMPUESTO FROM jugos_ventas.facturas;
select * from factura;

insert into items select NUMERO, CODIGO_DEL_PRODUCTO as CODIGO, CANTIDAD, PRECIO FROM jugos_ventas.items_facturas;
select * from items;

select * from factura f inner join items fa on f.numero=fa.numero;