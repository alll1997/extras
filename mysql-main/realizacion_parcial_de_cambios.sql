select * FROM TB_VENDEDOR;

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`VACACIONES`)
VALUES
(340,
'Pablo Suarez',
'Vargas',
0.15,
'2023-05-01',
0);

START transaction;
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`VACACIONES`)
VALUES
(341,
'Paolo Suarez',
'Vargas',
0.10,
'2023-04-01',
0),
(342,
'Paolo Benitti',
'Polo',
0.10,
'2023-04-01',
0);
rollback;
commit;