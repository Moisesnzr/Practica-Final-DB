-- Creación e ingresos de datos.

drop table Pacientes;

create table Pacientes(
	id_paciente varchar2(6) not null,
	Cedula varchar2(13) not null,
	Nombre varchar2(12),
	Apellidos varchar2(15),
	Fecha_naciemiento date,
    Sexo char(1),
	Direccion varchar2(60),
	Telefono varchar2(12),
	Correo_electronico varchar2(50) null,
    Asegurado char(2),
	Tipo_de_paciente varchar2(15),
    Nombre_parenteco varchar2(20),
    Parentesco varchar2 (15),
    Telefono_parentesco varchar2(12),
	Observaciones varchar2(50) DEFAULT 'No tiene ningun problema',
    primary key (id_paciente)
);

insert into Pacientes values ('PAC001', '098-7653423-1', 'Pedro', 'Marmolejo', '01-07-1991', 'M', 'Los mango #124', '809-334-1154', 'Tiopedro@yahoo.com', 'Si', 'Frecuente', 'Luis López', 'Hijo', '809-756-1154', 'El paciente es hipertenso');
insert into Pacientes values ('PAC002', '098-7582478-2', 'Miguel', 'Alcantara', '11-03-2002', 'M', 'Los Frailes #189', '829-202-1254', 'Tiopedro@gmail.com', 'Si', 'Frecuente', 'Luis López', 'Hijo', '849-123-2536', 'El paciente es asmatico y sufre del corazon');
insert into Pacientes values ('PAC003', '048-1235652-7', 'Amalia', 'López', '15-09-1981', 'F', 'Los Aguacaticos #24', '809-378-1985', 'njhg@gmail.com', 'No', 'Regular', 'Luis López', 'Comadre', '829-789-1425', default);
insert into Pacientes values ('PAC004', '402-4563423-1', 'Margarita', 'Guillermo', '01-11-1970', 'F', 'Villa Juana, residencial la paz M#12', '849-125-3256', 'TiaLopez@hotmail.com', 'No', ' No Frecuente', 'Luis López', 'Hermana', '809-852-4185', 'El paciente sufre de Alzheimer');
insert into Pacientes values ('PAC007', '004-1235433-7', 'Ramon', 'De la Cruz', '30-01-1995', 'M', 'Pantoja, Residencial villa de pantoja ñ#12', '829-547-4725', null, 'No', 'Regular', 'Luis López', 'Madre', '829-286-9784', default);

drop table Consultas;

create table Consultas(
	id_consulta varchar2(6) not null,
    id_paciente varchar2(6) not null,
	Fecha_hora date,  
	Tipo_de_consulta varchar2(10),
    Causa_consulta varchar2(35),
    Tipo_de_paciente varchar2(15),
	observaciones varchar2(50) null,
    primary key (id_consulta) 
);

insert into Consultas values ('CON001', 'PAC001', to_date('10/01/2021 10:30:44', 'dd/mm/yyyy hh24:mi:ss'), 'Individual', 'Dolor en la espada baja', 'Frecuente', 'Fue operado recientemente');
insert into Consultas values ('CON002', 'PAC002', to_date('11/01/2021 11:40:21', 'dd/mm/yyyy hh24:mi:ss'), 'Colectiva', 'Dolor intenso en el estomago', 'Frecuente', null);
insert into Consultas values ('CON003', 'PAC003', to_date('16/02/2021 15:30:50', 'dd/mm/yyyy hh24:mi:ss'), 'Colectiva', 'Problemas al defecar', 'Regular', null);
insert into Consultas values ('CON004', 'PAC004', to_date('17/03/2020 21:25:35', 'dd/mm/yyyy hh24:mi:ss'), 'Individual', 'Precion baja constantemente', 'Frecuente', 'Fue diagnosticada de covid-19');
insert into Consultas values ('CON005', 'PAC005', to_date('23/04/2020 18:58:00', 'dd/mm/yyyy hh24:mi:ss'), 'Individual', 'Diarrea y gripe', 'Regular', 'Ha sufrido dos infartos');

drop table Recetas;

create table Recetas(
	id_recetas varchar(6),
	fecha date, 
	id_paciente varchar2(6),
    id_prodctos varchar2(6),
	descripcion varchar2(45),
	observaciones varchar2(50),
    primary key (id_recetas)
);

insert into Recetas values ('REC001', to_date('13/01/2021', 'dd/mm/yyyy'), 'PAC001', 'PRO001', 'Lexotiroxina sódica, Aspirina', 'Tomas todos los dias antes de dormir en la noche');
insert into Recetas values ('REC002', to_date('12/01/2021', 'dd/mm/yyyy'), 'PAC002', 'PRO002', 'Aspirina, Omeprazol, Paracetamol', 'Tomas interdiario');
insert into Recetas values ('REC003', to_date('18/02/2021', 'dd/mm/yyyy'), 'PAC003', 'PRO003', 'Omeprazol, Paracetamol', 'Tomas todos en la mañana');
insert into Recetas values ('REC004', to_date('17/03/2020', 'dd/mm/yyyy'), 'PAC004', 'PRO004', 'Ramipril , Amlodipin, Paracetamol', 'Tomas todos los dias antes de dormir en la noche');
insert into Recetas values ('REC005', to_date('23/04/2020', 'dd/mm/yyyy'), 'PAC005', 'PRO005', 'Simvastatina, Lexotiroxina sódica, Ramipril ', 'Tomas interdiario');

drop table Pagos;

create table Pagos(
    id_pago varchar2(6) not null,
    Fecha date,
    id_paciente varchar2(6),
    Tipo_de_pago varchar2(20),
    Monto number(8,2),
    Observaciones varchar2(40) null,
    primary key (id_pago)
);

insert into Pagos values ('PAG001', to_date('10/01/2021', 'dd/mm/yyyy'), 'PAC001', 'Efectivo', 2300.00, null);
insert into Pagos values ('PAG002', to_date('11/01/2021', 'dd/mm/yyyy'), 'PAC002', 'Tarjeta de credito', 5600.00, 'Pagado con tardanza');
insert into Pagos values ('PAG003', to_date('16/02/2021', 'dd/mm/yyyy'), 'PAC003', 'Tarjeta de debito', 52000.00, null);
insert into Pagos values ('PAG004', to_date('17/03/2020', 'dd/mm/yyyy'), 'PAC004', 'Efectivo', 7050.00, 'Pagado con tardanza');
insert into Pagos values ('PAG005', to_date('23/04/2020', 'dd/mm/yyyy'), 'PAC005', 'Tarjeta de debito', 29000.00, null);

drop table Inventario;

create table Inventario(
    id_producto varchar2(6),
    Nombre varchar2 (25),
    Descripcion varchar2(45),
    Cantidad number(5),
    Proveedor varchar2(20),
    Fecha_de_Expiracion date,
    primary key (id_producto)
);

insert into Inventario values ('PRO001', 'Simvastatina', 'Para controlar el colesterol', 100, 'Laboratorios Alpha', to_date('23/04/2023', 'dd/mm/yyyy'));
insert into Inventario values ('PRO002', 'Aspirina', 'Casi para todo', 700, 'Laboratorios Rowe', to_date('12/07/2024', 'dd/mm/yyyy'));
insert into Inventario values ('PRO003', 'Omeprazol', 'Para controlar el colesterol', 1000, 'Bayer', to_date('30/09/2023', 'dd/mm/yyyy'));
insert into Inventario values ('PRO004', 'Lexotiroxina sódica', 'Para reemplazar la tiroxina', 400, 'Roche', to_date('01/06/2022', 'dd/mm/yyyy'));
insert into Inventario values ('PRO005', 'Paracetamol', 'Para aliviar el dolor', 2000, 'Bayer', to_date('13/01/2022', 'dd/mm/yyyy'));
insert into Inventario values ('PRO006', 'Ramipril ', 'Para la hipertensión', 500, 'Laboratorios Alpha', to_date('16/12/2021', 'dd/mm/yyyy'));

-- Consultas

-- 1- Muestra la estructura de cada una de las tablas

Describe Pacientes;
Describe Consultas;
Describe Recetas;
Describe Pagos;
Describe Inventario;

-- 2- Realiza una consulta general por cada una de la tabla

Select *from Pacientes;
Select *from Consultas;
Select *from Recetas;
Select *from Pagos;
Select *from Inventario;

-- 3- Muestra sólo el código y el nombre del paciente

Select id_paciente, Nombre from Pacientes;

-- 4- Muestra todo lo paciente que su nombre contenga la letra a.

Select *from Pacientes WHERE Nombre like '%a%';

-- 5- Muestra todo lo paciente que su código tengan el número 2.

Select *from Pacientes WHERE id_paciente like '%2%';

-- 6- Muestra todos los paciente de sexo femenino y organizado por nombre de forma descendente.

Select *from Pacientes WHERE Sexo = 'F' order by Nombre desc;

-- 7- Muestra el nombre y el número de teléfono y le pone una alia como contacto.

Select Nombre, Telefono as "Contacto" from Pacientes;

-- 8- Muestra todas las recetas comprendida entre una fecha y otra.

Select *from Recetas WHERE fecha BETWEEN '23/04/2020' and '16/02/2021';

-- 9- Actualiza la tabla paciente el tipo paciente por ambulatorio.

Update Pacientes set Tipo_de_paciente = 'ambulatorio';

-- 10- Determine la cantidad de paciente femenino qué.

Select count(*) as "Cantidad Femeninos" from Pacientes WHERE Sexo = 'F'; 

-- 11- Determina el monto total realizado por consulta.

Select sum(Monto) from Pagos;

-- 12- Cuánto paciente tienen seguro.

Select *from Pacientes WHERE Asegurado = 'Si';

-- 13- Elimina todos los pacientes qué su código contenga el número 7

Delete from Pacientes WHERE id_paciente like '%7%'; 

-- 14- Determine la cantidad de consulta realizada entre una fecha y otra.

Select count(*) from Consultas WHERE Fecha_hora BETWEEN '17/03/2020' and '16/02/2021';

-- 15- Muestra todo lo paciente Qué es un número de teléfono no termine en seis 6.

Select *from Pacientes WHERE Telefono not like '%6';

-- 16- Multiplique el costo de la consulta por un 15% y le pone la alias de beneficios.

Select (Monto * 0.15) as Beneficios from Pagos;

-- 17- visualice todos los registros nulo de la tabla paciente en el campo nombre.

select *from Pacientes where Nombre is null;



