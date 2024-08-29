CREATE TABLE vendedor(
MATRICULA varchar(5) not null, 
NOMBRE varchar(100),
BARRIO varchar(50),
COMISION float,
FECHA_ADMISION date, 
VACACIONES bit(1),
PRIMARY KEY(MATRICULA)
);

CREATE TABLE cliente (
DNI varchar(11) NOT NULL,
NOMBRE varchar(100),
DIRECCION varchar(150),
BARRIO varchar(50),
CIUDAD varchar(50),
ESTADO varchar(10),
CP varchar(10),
FECHA_NACIMIENTO date,
EDAD smallint, 
SEXO varchar(1), 
LIMITE_CREDITO float, 
VOLUMEN_COMPRA float,
PRIMERA_COMPRA bit(1),
PRIMARY KEY (DNI)
);

CREATE TABLE producto (
CODIGO varchar(10) NOT NULL,
DESCRIPCION varchar(100), 
SABOR varchar(50),
TAMANO varchar(50), 
ENVASE varchar(50),
PRECIO_LISTA float,
PRIMARY KEY (CODIGO)
);

CREATE TABLE factura(
NUMERO varchar(5) not null,
FECHA date,
DNI varchar(11) NOT NULL,
MATRICULA varchar(5) NOT NULL,
IMPUESTO float,
primary key(NUMERO),
FOREIGN KEY(DNI) REFERENCES cliente(DNI),
FOREIGN KEY (MATRICULA) REFERENCES vendedor(MATRICULA)
);

CREATE TABLE items(
NUMERO varchar(5) not null,
CODIGO varchar(10) not null,
CANTIDAD int,
PRECIO float,
primary key(numero, codigo),
FOREIGN KEY (NUMERO) REFERENCES factura(NUMERO),
FOREIGN KEY (CODIGO) REFERENCES producto(CODIGO)
);