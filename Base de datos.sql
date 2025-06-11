use master 
go 
Create database SISGimnasio
	ON PRIMARY 
		(name= SISGimnasio,
		filename = 'C:\BD\ SISGimnasio.mdf',
		size=20, maxsize=unlimited, filegrowth=10%)
	LOG ON 
		(name = SISGimnasio_LG, 
		 filename = 'C:\BD\ SISGimnasio.ldf',
		SIZE=50)
go

use SISGimnasio
go


 create table Membresias (
    ID_Membresia     varchar(50) not null,
    Tipo             varchar(50) not null, -- Ejemplo: Básica, Premium, VIP
    DuracionMeses    int not null, -- Tiempo de duración de la membresía
    Costo            decimal(10,2) not null, -- Costo de la membresía
    Beneficios       varchar(100) not null, -- Descripción de los beneficios incluidos
    Estado           varchar(20) not null default 'Activa', -- Estado: Activa/Inactiva
    constraint PK_Membresias primary key (ID_Membresia)
);
Go

insert into Membresias (ID_Membresia, Tipo, DuracionMeses, Costo, Beneficios, Estado)
values ('MBasica1','Básica', 1, 25.000, 'Acceso limitado', 'Activa'),
       ('MPremium1','Premium', 3, 65.000, 'Acceso total', 'Activa'),
       ('MVIP1','VIP', 6, 120.000, 'Todo incluido', 'Activa'),
       ('MBasica2','Básica', 2, 25.000, 'Acceso limitado', 'Inactiva'),
       ('MPremium2','Premium', 12, 340.000, 'Acceso total', 'Activa');

SELECT * FROM Membresias

create table Clientes
(
	Cedula_Cliente			varchar(30) not null,
	Nombre1			varchar(30) not null, 
	Nombre2			varchar(30) , 
	AP1				varchar(30) not null,
	AP2				varchar(30) not null, 
	Sexo			varchar(10)  not null,
	FechaNacimiento date not null,
	FechaIngreso    date not null,
	ID_Membresia    VARCHAR(50),
	Estado          varchar(20) not null default 'Activa', 
	CONSTRAINT PK_SCE_NUM_Clientes PRIMARY KEY (Cedula_Cliente),
    CONSTRAINT FK_Clientes_Membresia FOREIGN KEY (ID_Membresia) REFERENCES Membresias(ID_Membresia)
);
Go

INSERT INTO Clientes (Cedula_Cliente, Nombre1, Nombre2, AP1, AP2, Sexo, FechaNacimiento, FechaIngreso, ID_Membresia, Estado)
VALUES('30875619', 'Carlos', 'Andrés', 'Pérez', 'Gómez', 'M', '1990-05-10', '2023-01-15','MBasica1','Activa'),
      ('25970365', 'Ana', 'Lucía', 'Ramírez', 'Torres', 'F', '1985-11-25', '2023-02-10','MPremium1','Activa'),
      ('10728008', 'Luis', NULL, 'Martínez', 'Díaz', 'M', '1992-03-08', '2023-03-20','MPremium2','Activa'),
      ('30879254', 'Rebeca', 'María', 'Fernández', 'Rojas', 'F', '1998-07-14', '2023-04-05','MBasica1','Activa'),
      ('90245873', 'Jorge', 'Enrique', 'Morales', 'López', 'M', '1987-09-30', '2023-05-12','MVIP1','Activa');

create table Empleados 
(
    Cedula_Empleados  varchar(30) not null,
	ID_Empleado       varchar(30) not null, 
    Nombre1           varchar(30) not null, 
    Nombre2           varchar(30), 
    AP1               varchar(30) not null,
    AP2               varchar(30) not null, 
    Sexo              varchar(1) not null,
    FechaNacimiento   date not null,
    FechaIngreso      date not null,
    Especialidad      varchar(50) not null, 
    Horario           varchar(20)  null, 
	Estado           varchar(20) not null default 'Activa'
    constraint PK_Empleados primary key (ID_Empleado)
); 
Go

INSERT INTO Empleados (Cedula_Empleados, ID_Empleado, Nombre1, Nombre2, AP1, AP2, Sexo, FechaNacimiento, FechaIngreso, Especialidad, Horario, Estado) 
VALUES('948234571', 'ENTRP001', 'Pedro', 'Luis', 'Santos', 'Rivera', 'M', '1980-02-15', '2022-01-10', 'Musculación', '08:00-12:00','Activa'),
      ('725637982', 'ENTRC002', 'Claudia', NULL, 'Mendoza', 'Salas', 'F', '1989-06-22', '2022-03-05', 'Cardio', '12:00-16:00','Activa'),
      ('198756423', 'ENTRD003', 'David', 'Alonso', 'Vargas', 'Cruz', 'M', '1991-12-01', '2022-06-15', 'Crossfit', '14:00-18:00','Activa'),
      ('102305798', 'ENTRM004', 'Maria', 'Esther', 'Paz', 'Morales', 'F', '1983-08-10', '2022-09-01', 'Boxeo', '07:00-11:00','Activa'),
      ('379520019', 'ENTRA005', 'Andrés', 'Felipe', 'Herrera', 'Zamora', 'M', '1995-04-19', '2022-11-25', 'HIIT', '15:00-19:00','Activa'),
	  ('483579100', 'RECPC006', 'Carolina', NULL, 'Pereira', 'Mora', 'F', '1995-04-19', '2022-11-25', 'Recepcion', '05:00-15:00','Activa'),
	  ('197562807', 'ADMIK007',  'Karla', 'Maria', 'Perez', 'Zamora', 'F', '1995-04-19', '2022-11-25', 'Administrador', '9:00-15:00','Activa'),
	  ('367841095', 'GERENA008', 'Arturo', NULL , 'Gonzales', 'Guzman', 'M', '1995-04-19', '2022-11-25', 'Gerencia', '08:00-14:00','Activa');
	  

create table Rutinas (
    ID_Rutina      varchar(50) not null,
    ID_Empleados   varchar(30) not null, 
    NombreRutina    varchar(50) not null, 
    Descripcion     varchar(100) not null, 
    DuracionSemanas int not null, 
    Frecuencia      varchar(20) not null, 
    NivelDificultad varchar(20) not null, 
    FechaInicio     date not null, 
    FechaFin        date not null, 
    Estado          varchar(20) not null default 'Activa',
    constraint PK_Rutinas primary key (ID_Rutina),
    constraint FK_Rutinas_Empleados foreign key (ID_Empleados) references Empleados(ID_Empleado)
);
Go

insert into Rutinas 
(ID_Rutina,ID_Empleados, NombreRutina, Descripcion, DuracionSemanas, Frecuencia, NivelDificultad, FechaInicio, FechaFin, Estado)
values 
('R001', 'ENTRP001', 'Fuerza Básica', 'Entrenamiento de fuerza para principiantes', 6, '3 veces/semana', 'Baja', '2023-01-20', '2023-03-03', 'Activa'),
('R002', 'ENTRC002', 'Cardio Intenso', 'Entrenamiento resistencia cardiovascular', 8, '5 veces/semana', 'Media', '2023-02-15', '2023-04-10', 'Activa'),
('R003', 'ENTRD003', 'Crossfit Power', 'Entrenamiento de crossfit', 10, '4 veces/semana', 'Alta', '2023-03-25', '2023-06-03', 'Activa'),
('R004','ENTRM004', 'Boxeo Funcional', 'Técnicas de boxeo y acondicionamiento físico', 6, '3 veces/semana', 'Media', '2023-04-10', '2023-05-22', 'Activa'),
('R005','ENTRA005', 'HIT Quema Grasa', 'Entrenamiento HIIT para perder grasa', 4, '4 veces/semana', 'Alta', '2023-05-15', '2023-06-12', 'Activa');


create table Factura(
    ID_Factura      int not null IDENTITY(1,1),
    Cedula_Cliente  varchar(30) not null, 
    FechaEmision    date not null, 
    MontoTotal      decimal(10,2) not null,
    MetodoPago      varchar(50) not null, 
    Estado          varchar(20) not null default 'Emitida', 
    Detalle         varchar(100) not null, 
    ID_Membresia    VARCHAR(50) not null ,
    constraint PK_Facturas primary key (ID_Factura),
    constraint FK_Facturas_Cliente foreign key (Cedula_Cliente) references Clientes(Cedula_Cliente),
	constraint FK_Factura_Membresia foreign key (ID_Membresia) references Membresias(ID_Membresia)
);
Go

insert into Factura (Cedula_Cliente, FechaEmision, MontoTotal, MetodoPago, Estado, Detalle, ID_Membresia)
values ('30875619', '2023-01-25', 25.000, 'Tarjeta de Crédito', 'Pagada', 'Membresía Básica enero','MBasica1'),
       ('25970365', '2023-02-12', 65.000, 'Efectivo', 'Emitida', 'Membresía Premium 3 meses','MPremium1'),
       ('10728008', '2023-03-28', 340.000, 'Transferencia', 'Pagada', 'Sesiones de Crossfit','MPremium2'),
       ('30879254', '2023-04-15', 25.000, 'Tarjeta de Débito', 'Anulada', 'Membresía Básica abril','MBasica1'),
       ('90245873', '2023-05-20', 120.000, 'Paypal', 'Emitida', 'Entrenamiento HIT personalizado','MVIP1');



--Roles
create table Roles (
    ID_Rol		int identity (1,1) not null,
    NombreRol	varchar(30) not null,
	Descripcion		varchar(100) not null,
	Estado bit default 1 not null, 
	constraint PK_SCE_NUM_Roles primary key (ID_Rol)
);

INSERT INTO Roles (NombreRol, Descripcion)
VALUES 
('Administrador', 'Usuario con acceso completo al sistema'),
('Gerente', 'Usuario con permisos de gestión general'),
('Recepcionista', 'Usuario con permisos limitados para gestión de clientes y miembros'),
('Entrenador', 'Usuario con permisos para crear y gestionar rutinas de entrenamiento');

SELECT * FROM Roles;


--PERMISOS
CREATE TABLE Permisos (
    ID_Permiso INT IDENTITY(1,1) NOT NULL,
    NombrePermiso VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
	Estado BIT DEFAULT 1 NOT NULL,
	constraint PK_SCE_NUM_Permisos primary key (ID_Permiso)
);

INSERT INTO Permisos (NombrePermiso, Descripcion)
VALUES
('CrearRutinas', 'Permiso para crear nuevas rutinas de entrenamiento'),
('GestionarClientes', 'Permiso para gestionar clientes y su información'),
('CrearFactura', 'Permiso para ver reportes de actividad del gimnasio'),
('AdministrarUsuarios', 'Permiso para gestionar usuarios y roles'),
('AdministrarEmpleados', 'Permiso para gestionar empleados y su informacion '),
('GestionarMembresias', 'Permiso para gestionar Membresias ');
SELECT * FROM Permisos;

--PERMISOSROL
CREATE TABLE PermisosRol (
	ID_PermisoRol INT IDENTITY(1,1) NOT NULL,
    Rol_ID INT NOT NULL,
    Permiso_ID INT NOT NULL,
	Estado bit default 1 not null,
    constraint PK_SCE_NUM_PermisoRol primary key (ID_PermisoRol),
    constraint FK_SCE_Roles_PermisoRol foreign key (Rol_ID) references Roles(ID_Rol),
    constraint FK_SCE_Permiso_PermisoRol foreign key (Permiso_ID) references Permisos(ID_Permiso),
	CONSTRAINT UQ_Rol_Permiso UNIQUE (Rol_ID, Permiso_ID)
); 

INSERT INTO PermisosRol (Rol_ID, Permiso_ID)
VALUES 
(1,4), --ADMINISTRADOR ADMINISTRA USUARIOS
(3,2), --RECEPCIONISTA GESTIONA CLIENTES
(3,3), --RECEPCIONISTA GESTIONA FACTURA
(4,1), --ENTRENADOR GESTIONA RUTINAS
(2,1), --GERENTE GEST RUTINAS
(2,2), --GERENTE GEST CLIENTES
(2,3), --GERENTE GEST FACTURA
(2,4), --GERENTE GEST USUARIOS
(2,5), --GERENTE GEST EMPLEADOS
(2,6);  --GERENTE GEST MEMBRESIAS

--USUARIOS
create table Usuario(
    ID_Usuario		int identity (1,1) not null,
    Username		varchar(30) not null,
	Contraseña		varchar(30) not null,
	Rol_ID			int not null,	
	ID_Empleados	varchar(30) not null,
	Estado			bit default 1 not null,
	constraint PK_SCE_NUM_Usuario primary key (ID_Usuario),
	constraint FK_SCE_Usuario_Rol foreign key (Rol_ID) references Roles(ID_Rol),
	constraint FK_SCE_U_ID_Empleados foreign key (ID_Empleados) references Empleados(ID_Empleado)
);
INSERT INTO Usuario (Username, Contraseña, Rol_ID, ID_Empleados)
VALUES
('admin01', 'admin123', 1, 'ADMIK007'),  -- Administrador
('gerente01', 'gerente123', 2, 'GERENA008'),  -- Gerente
('recep01', 'recep123', 3, 'RECPC006'),  -- Recepcionista
('entrenador01', 'entrenador123', 4, 'ENTRP001'),  -- Entrenador
('entrenador02', 'entrenador1234', 4, 'ENTRC002'),  -- Entrenador
('entrenador03', 'entrenador1235', 4, 'ENTRD003'),  -- Entrenador
('entrenador04', 'entrenador1236', 4, 'ENTRM004'),  -- Entrenador
('entrenador05', 'entrenador1237', 4, 'ENTRA005');  -- Entrenador


--PROCEDIMIENTOS ALMACENADOS--

CREATE PROCEDURE PA_Membresias
    @opc INT,
    @ID_Membresia VARCHAR(50) = NULL,
    @Tipo VARCHAR(50) = NULL,
    @DuracionMeses INT = NULL,
    @Costo DECIMAL(10,2) = NULL,
    @Beneficios VARCHAR(100) = NULL,
	@Estado    VARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @opc = 1
    BEGIN
        SELECT * FROM Membresias;
    END
    ELSE IF @opc = 2
    BEGIN
        SELECT * FROM Membresias WHERE ID_Membresia = @ID_Membresia;
    END
    ELSE IF @opc = 3
    BEGIN
        INSERT INTO Membresias (ID_Membresia, Tipo, DuracionMeses, Costo, Beneficios)
        VALUES (@ID_Membresia, @Tipo, @DuracionMeses, @Costo, @Beneficios);
    END
    ELSE IF @opc = 4
    BEGIN
        UPDATE Membresias
        SET  ID_Membresia = @ID_Membresia, Tipo = @Tipo, DuracionMeses = @DuracionMeses, Costo = @Costo, Beneficios = @Beneficios
        WHERE ID_Membresia = @ID_Membresia;
    END
    ELSE IF @opc = 5
    BEGIN
       

        DELETE FROM Membresias WHERE ID_Membresia = @ID_Membresia;
    END
END;

--------------------------------------------------

CREATE PROCEDURE PA_Clientes
    @opc INT, 
    @Cedula_Cliente           VARCHAR(30) = NULL,
    @Nombre1          VARCHAR(30) = NULL, 
    @Nombre2          VARCHAR(30) = NULL, 
    @AP1              VARCHAR(30) = NULL,
    @AP2              VARCHAR(30) = NULL, 
    @Sexo             VARCHAR(10)  = NULL,
    @FechaNacimiento  DATE = NULL,
    @FechaIngreso     DATE = NULL,
    @ID_Membresia     VARCHAR(50) = NULL, 
	@Estado			  VARCHAR(20)=NULL 
AS
BEGIN
    SET NOCOUNT ON;

    IF @opc = 1
    BEGIN
        SELECT * FROM Clientes;
    END
    ELSE IF @opc = 2
    BEGIN
        SELECT * FROM Clientes WHERE Cedula_Cliente = @Cedula_Cliente;
    END
    ELSE IF @opc = 3
    BEGIN
        INSERT INTO Clientes (Cedula_Cliente, Nombre1, Nombre2, AP1, AP2, Sexo, FechaNacimiento, FechaIngreso, ID_Membresia, Estado)
        VALUES (@Cedula_Cliente, @Nombre1, @Nombre2, @AP1, @AP2, @Sexo, @FechaNacimiento, @FechaIngreso, @ID_Membresia, ISNULL(@Estado,'Activo'));
    END
    ELSE IF @opc = 4
    BEGIN
        UPDATE Clientes 
        SET Nombre1 = @Nombre1, Nombre2 = @Nombre2, AP1 = @AP1, AP2 = @AP2,
            Sexo = @Sexo, FechaNacimiento = @FechaNacimiento, FechaIngreso = @FechaIngreso,
            ID_Membresia = @ID_Membresia, Estado = @Estado
        WHERE Cedula_Cliente = @Cedula_Cliente;
    END
    ELSE IF @opc = 5
    BEGIN
        UPDATE Clientes
        SET Estado = ISNULL (@Estado, 'Inactiva')
        WHERE Cedula_Cliente = @Cedula_Cliente;
    END
END;
------------------------------------------------------------------------

Create Procedure PA_Empleados
@opc int, 
@Cedula_Empleados  varchar(30) =NULL,
@ID_Empleado      varchar(30) =NULL, 
@Nombre1           varchar(30) =NULL, 
@Nombre2           varchar(30) =NULL, 
@AP1               varchar(30) =NULL,
@AP2               varchar(30) =NULL, 
@Sexo              varchar(1)  =NULL,
@FechaNacimiento   date =NULL,
@FechaIngreso      date =NULL,
@Especialidad      varchar(50)  =NULL, 
@Horario           varchar(20) =NULL,
@Estado            bit = NULL 
AS
BEGIN 
	IF @opc=1
		SELECT * FROM Empleados;

	ELSE IF @opc = 2
		SELECT * FROM Empleados WHERE ID_Empleado = @ID_Empleado;

	ELSE IF @opc = 3
		INSERT INTO Empleados (Cedula_Empleados, ID_Empleado,Nombre1, Nombre2, AP1, AP2, Sexo, FechaNacimiento, FechaIngreso, Especialidad, Horario, Estado)
		VALUES (@Cedula_Empleados,@ID_Empleado, @Nombre1, @Nombre2, @AP1, @AP2, @Sexo, @FechaNacimiento, @FechaIngreso, @Especialidad, @Horario, ISNULL(@Estado,1));

	ELSE IF @opc = 4
		UPDATE Empleados 
		SET ID_Empleado = @ID_Empleado, Nombre1 = @Nombre1, Nombre2 = @Nombre2, AP1 = @AP1, AP2 = @AP2, Sexo = @Sexo, FechaNacimiento = @FechaNacimiento, FechaIngreso = @FechaIngreso, Especialidad =@Especialidad, Horario =@Horario, Estado = @Estado 
		WHERE ID_Empleado = @ID_Empleado;
		
	ELSE IF @opc = 5
		BEGIN
        DELETE FROM Empleados WHERE ID_Empleado = @ID_Empleado;
		END
END;

----------------------------------------------------------------------------
CREATE PROCEDURE PA_Rutinas
    @opc INT,
    @ID_Rutina       VARCHAR(50) = NULL, 
    @Cedula_Cliente  VARCHAR(30) = NULL,
    @ID_Empleados    VARCHAR(30) =NULL, 
    @NombreRutina    VARCHAR(50) =NULL, 
    @Descripcion     VARCHAR(100)= NULL, 
    @DuracionSemanas INT =NULL, 
    @Frecuencia      VARCHAR(20) =NULL, 
    @NivelDificultad VARCHAR(20) =NULL, 
    @FechaInicio     DATE =NULL,
    @FechaFin        DATE =NULL,
	@Estado          varchar(20)= NULL
AS
BEGIN 
    SET NOCOUNT ON;

    IF @opc = 1
    BEGIN
        SELECT * FROM Rutinas;
    END

    ELSE IF @opc = 2
    BEGIN
        SELECT * FROM Rutinas WHERE ID_Rutina = @ID_Rutina;
    END

    ELSE IF @opc = 3
    BEGIN
        INSERT INTO Rutinas (ID_Rutina, ID_Empleados, NombreRutina, Descripcion, DuracionSemanas, Frecuencia, NivelDificultad, FechaInicio, FechaFin)
        VALUES (@ID_Rutina, @ID_Empleados, @NombreRutina, @Descripcion, @DuracionSemanas, @Frecuencia, @NivelDificultad, @FechaInicio, @FechaFin);
    END

    ELSE IF @opc = 4
    BEGIN
        UPDATE Rutinas 
        SET ID_Rutina = @ID_Rutina, 
            ID_Empleados = @ID_Empleados,
            NombreRutina = @NombreRutina, 
            Descripcion = @Descripcion, 
            DuracionSemanas = @DuracionSemanas, 
            Frecuencia = @Frecuencia, 
            NivelDificultad = @NivelDificultad, 
            FechaInicio = @FechaInicio, 
            FechaFin = @FechaFin
        WHERE ID_Rutina = @ID_Rutina;
    END

    ELSE IF @opc = 5
    BEGIN
        
        DELETE FROM Rutinas WHERE ID_Rutina = @ID_Rutina;
    END
END;
------------------------------------------------------------------------
	
Create Procedure PA_Factura 
@opc INT, 
@ID_Factura      int =NULL,
@Cedula_Cliente  varchar(30) =NULL, 
@FechaEmision    date =NULL,
@MontoTotal      decimal(10,2) =NULL,
@MetodoPago      varchar(50) =NULL, 
@Detalle         varchar(100)=NULL,
@ID_Membresia    varchar(50) =NULL,
@Estado          varchar(20) = 'Emitida' -- Añadido Estado como parámetro
AS
BEGIN 
	IF @opc=1
		SELECT * FROM Factura;

	ELSE IF @opc = 2
		SELECT * FROM Factura WHERE Cedula_Cliente = @Cedula_Cliente;

	ELSE IF @opc = 3
		INSERT INTO Factura (Cedula_Cliente, FechaEmision, MontoTotal, MetodoPago, Detalle, ID_Membresia, Estado)
		VALUES (@Cedula_Cliente, @FechaEmision, @MontoTotal, @MetodoPago, @Detalle, @ID_Membresia, @Estado);

	ELSE IF @opc = 4
		UPDATE Factura 
		SET Cedula_Cliente = @Cedula_Cliente, FechaEmision = @FechaEmision, MontoTotal = @MontoTotal, MetodoPago = @MetodoPago, Detalle = @Detalle, ID_Membresia = @ID_Membresia, Estado = @Estado
		WHERE ID_Factura = @ID_Factura;
		
	ELSE IF @opc = 5
		BEGIN
        DELETE FROM Factura WHERE ID_Factura = @ID_Factura;
		END
END;

--------------------------------------------------------------------------------------------------------
	CREATE PROCEDURE PA_ROLES
    @opc INT,
    @ID_Rol INT = NULL OUTPUT,
    @nombreRol VARCHAR(30) = NULL,
    @descripcion VARCHAR(150) = NULL,
    @estado BIT = 1
AS
BEGIN
    -- Opción 1: Obtener todos los roles
    IF @opc = 1
    BEGIN
        SELECT * FROM Roles;
    END

    -- Opción 2: Insertar un nuevo rol
    IF @opc = 2
    BEGIN
        INSERT INTO Roles (NombreRol, Descripcion, Estado)
        VALUES (@nombreRol, @descripcion, @estado);

        
        SET @ID_Rol = SCOPE_IDENTITY();
    END

    -- Opción 3: Actualizar un rol existente
    IF @opc = 3
    BEGIN
        UPDATE Roles
        SET NombreRol = @nombreRol, Descripcion = @descripcion
        WHERE ID_Rol = @ID_Rol;
    END

    -- Opción 4: Eliminar un rol de manera lógica (cambiar el estado)
    IF @opc = 4
    BEGIN
        UPDATE Roles
        SET Estado = @estado
        WHERE ID_Rol = @ID_Rol;
    END
END;

----------------------------------------------------------------------------------------

CREATE PROCEDURE PA_Permisos
    @opc INT,
    @ID_Permiso INT = NULL,
    @nombrePermiso VARCHAR(100) = NULL,
    @descripcion VARCHAR(100) = NULL,
    @Estado BIT = 1
AS
BEGIN
    -- Opción 1: Obtener todos los permisos
    IF @opc = 1
    BEGIN
        SELECT * FROM Permisos;
    END

    -- Opción 3: Insertar un nuevo permiso
    IF @opc = 3
    BEGIN
        INSERT INTO Permisos (NombrePermiso, Descripcion, Estado)
        VALUES (@nombrePermiso, @descripcion, @Estado);
    END

    -- Opción 4: Actualizar un permiso existente
    IF @opc = 4
    BEGIN
        UPDATE Permisos
        SET NombrePermiso = @nombrePermiso, Descripcion = @descripcion
        WHERE ID_Permiso = @ID_Permiso;
    END

    -- Opción 5: Eliminar un permiso de manera lógica (cambiar el estado)
    IF @opc = 5
    BEGIN
        UPDATE Permisos
        SET Estado = @Estado
        WHERE ID_Permiso = @ID_Permiso;
    END
END;
---------------------------------------------------------------------------------

CREATE PROCEDURE PA_PermisosRol
    @opc INT,
    @Id_PermisoRol INT = NULL,
    @Rol_ID INT = NULL,
    @Permiso_ID INT = NULL,
	@Estado bit=  1
AS
BEGIN
    IF @opc = 1
    BEGIN
        -- Listar todos los permisos 
        SELECT pr.ID_PermisoRol, r.NombreRol, p.NombrePermiso, p.Descripcion
        FROM PermisosRol pr
        JOIN Roles r ON pr.Rol_ID = r.ID_Rol
        JOIN Permisos p ON pr.Permiso_ID = p.ID_Permiso;
    END
 
    ELSE IF @opc = 2
    BEGIN
        -- Asignar permiso a rol
        INSERT INTO PermisosRol (Rol_ID, Permiso_ID)
        VALUES (@Rol_ID, @Permiso_ID);
    END
    ELSE IF @opc = 3
    BEGIN
        -- Eliminar permiso asignado
		 UPDATE PermisosRol
        SET Estado = @Estado
        WHERE ID_PermisoRol = @ID_PermisoRol;
    END
END;

-------------------------------------------------------------------------------------

CREATE PROCEDURE PA_Usuario
@opc INT,
@ID_Usuario INT = NULL,
@username VARCHAR(30) = NULL,
@contraseña VARCHAR(9) = NULL,
@rol_ID INT = NULL,
@ID_Empleados VARCHAR(9) = NULL,
@estado BIT = 1
AS
BEGIN
	-- Opción 1: Ver todos los usuarios
	IF @opc = 1
	BEGIN
		SELECT * FROM Usuario;
	END

	-- Opción 2: Buscar usuario por ID
	IF @opc = 2
	BEGIN
		SELECT * FROM Usuario WHERE ID_Usuario = @ID_Usuario;
	END

	-- Opción 3: Insertar usuario
	IF @opc = 3
	BEGIN
		INSERT INTO Usuario (Username, Contraseña, Rol_ID, ID_Empleados, Estado)
		VALUES (@username, @contraseña, @rol_ID, @ID_Empleados, @estado);
	END

	-- Opción 4: Actualizar usuario
	IF @opc = 4
	BEGIN
		UPDATE Usuario
		SET Username = @username,
			Contraseña = @contraseña,
			Rol_ID = @rol_ID,
			ID_Empleados = @ID_Empleados,
			Estado = @estado
		WHERE ID_Usuario = @ID_Usuario;
	END

	-- Opción 5: Eliminar lógico (Estado)
	IF @opc = 5
	BEGIN
		UPDATE Usuario
		SET Estado = @estado
		WHERE ID_Usuario = @ID_Usuario;
	END

	-- Opción 6: Autenticación
	IF @opc = 6
	BEGIN
		SELECT ID_Usuario, Username, Rol_ID, ID_Empleados, Estado
		FROM Usuario
		WHERE Username = @username
		  AND Contraseña = @contraseña
		  AND Estado = 1;
	END
END;
