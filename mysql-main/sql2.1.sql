USE jugos;

INSERT INTO registro_vendedores(
matricula, nombre, porcentaje_comision) VALUES (
'00233','Joan Geraldo de la Fonseca', 0.1);
INSERT INTO registro_vendedores(
matricula, nombre, porcentaje_comision) VALUES (
'00235','Márcio Almeida Silva', 0.08);
INSERT INTO registro_vendedores(
matricula, nombre, porcentaje_comision) VALUES (
'00236','Cláudia Morais', 0.08);

SELECT * FROM registro_vendedores;


UPDATE registro_vendedores SET porcentaje_comision= 0.11
WHERE matricula= '00236';
UPDATE registro_vendedores SET nombre = 'Joan Geraldo de la Fonseca Junior'
WHERE matricula= '00233';
SELECT * FROM registro_vendedores;


DELETE FROM registro_vendedores where MATRICULA ='00233';
SELECT * FROM registro_vendedores;

alter table registro_vendedores add primary key(matricula);
alter table registro_vendedores add column (FECHA_ADMISION date, DE_VACACIONES BIT(1));
select * from registro_vendedores;

UPDATE registro_vendedores set FECHA_ADMISION = '2014-08-15', DE_VACACIONES =0
WHERE matricula = 00235;
UPDATE registro_vendedores set FECHA_ADMISION = '2013-09-17', DE_VACACIONES =1
WHERE matricula = 00236;

insert into registro_vendedores (
MATRICULA, NOMBRE, PORCENTAJE_COMISION, FECHA_ADMISION, DE_VACACIONES) VALUES(
'00237', 'Roberta Martins', 0.11, '2017-03-21', 1);
insert into registro_vendedores (
MATRICULA, NOMBRE, PORCENTAJE_COMISION, FECHA_ADMISION, DE_VACACIONES) VALUES(
'0023O', 'Péricles Alves', 0.11, '2016-08-21', 0);
select * from registro_vendedores;

select nombre, matricula from registro_vendedores;
select * from registro_vendedores where NOMBRE='Claudia Morais';
select * from registro_vendedores where PORCENTAJE_COMISION >= 0.10 and DE_VACACIONES = 1;
select nombre, matricula from registro_vendedores;