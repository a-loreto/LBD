USE [BAR]
GO

CREATE TABLE [dbo].[Nomina](
	[ID] [int] NOT NULL,
	[ID_EmpleadoNomina] [int] NULL,
	[Sueldo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[NominaResumen]
as select Id_EmpleadoNomina, Sueldo from Nomina;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Empleado](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[ApellidoPa] [varchar](20) NULL,
	[ApellidoMa] [varchar](20) NULL,
	[FechaNac] [date] NULL,
	[Telefono] [int] NULL,
	[Direccion] [varchar](30) NULL,
	[ID_EmpleadoSucursal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VistaEmpleado] as
select Nombre, ApellidoMa, ApellidoPa, FechaNac from Empleado;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[NominaResumen2] as
select * from Nomina
where Sueldo = 2500;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bebida](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Precio] [float] NULL,
	[Descripcion] [varchar](60) NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create VIEW [dbo].[BebidasSinAlcohol] as
select * from Bebida
where Precio<40;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pedido](
	[ID] [int] NOT NULL,
	[ID_Plato] [int] NULL,
	[ID_Bebida] [int] NULL,
	[ID_Ticket] [int] NULL,
	[ID_Empleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[DetalleDeOrden] as 
select * from Pedido
where ID_Empleado = 1015;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[EmpleadosGenerales] as
select * from Nomina
where Sueldo<2000;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[EmpleadosRelevantes] as 
select * from Nomina
where Sueldo>2000;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExEmpleado](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[ApellidoPa] [varchar](20) NULL,
	[ApellidoMa] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plato](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Precio] [int] NULL,
	[Descripcion] [varchar](60) NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[ID] [int] NOT NULL,
	[Direccion] [varchar](30) NULL,
	[Capacidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ID] [int] NOT NULL,
	[ID_SucursalTicket] [int] NULL,
	[Subtotal] [float] NULL,
	[Total] [float] NULL,
	[FechaEmision] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[ID] [int] NOT NULL,
	[ID_EmpleadoTurno] [int] NULL,
	[Turno] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1001, N'Tequila', 60.99, N'Tequila Jose Cuervo Especial', 100)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1002, N'Whisky', 60.99, N'Whisky Johnnie Walker, Red Label', 50)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1003, N'Ron', 60.99, N'Ron Bacardi, Carta Blanca', 40)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1004, N'Brandy', 60.99, N'Brandy Don Pedro', 23)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1005, N'Vodka', 60.99, N'Vodka Absolut', 14)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1006, N'Cerveza', 40.99, N'Nacional', 47)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1007, N'Cerveza', 50.99, N'Importada', 100)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1008, N'Perla Negra', 70.99, N'Jagermeister, Whisky, Bebida Energizante', 80)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1009, N'Paloma', 50.99, N'Tequila(blanco), Limon, Sal, Refresco de toronja', 50)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1010, N'Vampiro', 60, N'Tequila, Sangrita, Sal, Limon, Refresco de toronja', 30)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1011, N'Cuba', 50.99, N'Refresco(Normal), Ron', 101)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1012, N'Vodka con Jugo', 50.99, N'Vodka, Jugo(Piña, Arandano, Naranja', 11)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1013, N'Shots', 100.99, N'Ronda de 4 Caballitos (Cualquier Licor)', 10)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1014, N'Agua', 20.99, N'Agua natural', 95)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1015, N'Agua de Sabor', 30, N'Agua de Sabor(Limon, Jamaica, Piña)', 81)
INSERT [dbo].[Bebida] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1016, N'Refresco', 30.99, N'Cualquier tipo de Refresco', 100)
GO
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1001, N'Alonso', N'Garza', N'Garcia', CAST(N'1990-09-11' AS Date), 81125678, N'Flamingo 947', 1001)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1002, N'Pedro', N'Lopez', N'Garza', CAST(N'1995-04-21' AS Date), 86945678, N'Alcatraz 492', 1003)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1003, N'Francisco', N'Leal', N'Tovar', CAST(N'1990-11-11' AS Date), 80915678, N'Trebol 333', 1001)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1004, N'Noe', N'Perez', N'Leija', CAST(N'1993-09-11' AS Date), 83495678, N'Kiev 492', 1002)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1005, N'Juan', N'Rodriguez', N'Contreras', CAST(N'1911-11-11' AS Date), 86483678, N'Cipres 969', 1001)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1006, N'Alberto', N'Farias', N'Castro', CAST(N'1994-11-22' AS Date), 86946948, N'Lino 448', 1003)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1007, N'Hugo', N'Rodriguez', N'Gomez', CAST(N'1988-08-19' AS Date), 86942580, N'Lardo 694', 1001)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1008, N'Hector', N'Gonzales', N'Martinez', CAST(N'1881-11-19' AS Date), 86969488, N'Monclova 490', 1002)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1009, N'Juan', N'Diaz', N'Moreno', CAST(N'1993-01-13' AS Date), 86941036, N'Parras 968', 1001)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1010, N'Andres', N'Ruiz', N'Morales', CAST(N'1996-04-13' AS Date), 86159478, N'Sotelo 598', 1003)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1011, N'Martin', N'Prieto', N'Vidal', CAST(N'1994-11-18' AS Date), 86909638, N'Violeta 448', 1002)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1012, N'Osvaldo', N'Garza', N'Lopez', CAST(N'1991-10-20' AS Date), 86898980, N'Tabaco 694', 1001)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1013, N'Ivan', N'Blanco', N'Rubio', CAST(N'1997-09-01' AS Date), 81588488, N'Flor 490', 1002)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1014, N'Yahir', N'Luna', N'Campos', CAST(N'1992-06-28' AS Date), 85910864, N'Ceibo 968', 1001)
INSERT [dbo].[Empleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa], [FechaNac], [Telefono], [Direccion], [ID_EmpleadoSucursal]) VALUES (1015, N'Moises', N'Mier', N'Torres', CAST(N'1999-12-25' AS Date), 86106362, N'Noche Buena 598', 1003)
GO
INSERT [dbo].[ExEmpleado] ([ID], [Nombre], [ApellidoPa], [ApellidoMa]) VALUES (7, N'Angel', N'Rrevilla', N'Gomez')
GO
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1001, 1005, 1011, 1001, 1010)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1002, 1001, 1016, 1001, 1010)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1003, NULL, 1011, 1001, 1010)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1004, NULL, 1006, 1001, 1010)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1005, NULL, 1007, 1001, 1010)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1006, NULL, 1014, 1001, 1010)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1007, NULL, 1007, 1001, 1010)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1008, NULL, 1007, 1001, 1010)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1009, 1006, 1016, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1010, 1006, 1016, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1011, 1007, 1016, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1012, 1007, 1016, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1013, NULL, 1006, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1014, NULL, 1006, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1015, NULL, 1006, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1016, NULL, 1006, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1017, NULL, 1013, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1018, NULL, 1005, 1002, 1015)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1019, NULL, 1006, 1003, 1003)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1020, 1008, 1007, 1003, 1005)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1021, 1008, 1007, 1003, 1005)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1022, NULL, 1007, 1003, 1005)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1023, NULL, 1001, 1003, 1005)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1024, NULL, 1006, 1004, 1002)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1025, NULL, 1006, 1004, 1002)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1026, NULL, 1006, 1004, 1002)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1027, NULL, 1006, 1004, 1002)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1028, NULL, 1006, 1004, 1002)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1029, NULL, 1013, 1004, 1002)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1030, 1001, 1016, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1031, 1001, 1016, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1032, 1005, 1016, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1033, 1011, 1016, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1034, 1011, 1016, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1035, NULL, 1016, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1036, NULL, 1003, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1037, NULL, 1004, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1038, NULL, 1003, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1039, NULL, 1001, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1040, NULL, 1001, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1041, NULL, 1013, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1042, NULL, 1014, 1005, 1008)
INSERT [dbo].[Pedido] ([ID], [ID_Plato], [ID_Bebida], [ID_Ticket], [ID_Empleado]) VALUES (1043, NULL, 1014, 1005, 1008)
GO
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1001, N'Pizza', 80, N'Pizza Grande', 1)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1002, N'Pizza', 60, N'Pizza Mediana', 1)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1003, N'Pizza', 50, N'Pizza Individual', 1)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1004, N'Pasta', 60, N'Pasta Individual', 1)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1005, N'Pasta', 80, N'Pasta Grande', 3)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1006, N'Hamburguesa', 70, N'Hamburguesa Clasica', 5)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1007, N'Hamburguesa', 90, N'Hamburguesa Doble', 1)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1008, N'Hamburguesa', 70, N'Hamburguesa con Tocino', 1)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1009, N'Hamburguesa', 70, N'Hamburguesa con Champiñones', 1)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1010, N'Dedos de Queso', 70, N'Dedos de Queso', 2)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1011, N'Papas a la Francesa', 40, N'Papas sin Queso', 3)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1012, N'Papas con Queso', 50, N'Papas con Queso', 4)
INSERT [dbo].[Plato] ([ID], [Nombre], [Precio], [Descripcion], [Cantidad]) VALUES (1013, N'Extras', 88, N'Extra de cocina', 1)
GO
INSERT [dbo].[Ticket] ([ID], [ID_SucursalTicket], [Subtotal], [Total], [FechaEmision]) VALUES (1001, 1003, 468, 500, CAST(N'2018-12-22' AS Date))
INSERT [dbo].[Ticket] ([ID], [ID_SucursalTicket], [Subtotal], [Total], [FechaEmision]) VALUES (1002, 1003, 722, 800, CAST(N'1018-12-29' AS Date))
INSERT [dbo].[Ticket] ([ID], [ID_SucursalTicket], [Subtotal], [Total], [FechaEmision]) VALUES (1003, 1001, 376, 400, CAST(N'2019-12-20' AS Date))
INSERT [dbo].[Ticket] ([ID], [ID_SucursalTicket], [Subtotal], [Total], [FechaEmision]) VALUES (1004, 1003, 280, 300, CAST(N'2018-03-20' AS Date))
INSERT [dbo].[Ticket] ([ID], [ID_SucursalTicket], [Subtotal], [Total], [FechaEmision]) VALUES (1005, 1002, 910, 1000, CAST(N'2019-02-18' AS Date))
GO
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1001, 1001, N'Nocturno')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1002, 1002, N'Nocturno')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1003, 1003, N'Vespertino')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1004, 1004, N'Nocturno')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1005, 1005, N'Vespertino')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1006, 1006, N'Nocturno')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1007, 1007, N'Nocturno')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1008, 1008, N'Vespertino')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1009, 1009, N'Nocturno')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1010, 1010, N'Vespertino')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1011, 1011, N'Vespertino')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1012, 1012, N'Nocturno')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1013, 1013, N'Nocturno')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1014, 1014, N'Vespertino')
INSERT [dbo].[Turno] ([ID], [ID_EmpleadoTurno], [Turno]) VALUES (1015, 1015, N'Nocturno')
GO
ALTER TABLE [dbo].[Nomina]  WITH CHECK ADD FOREIGN KEY([ID_EmpleadoNomina])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([ID_Bebida])
REFERENCES [dbo].[Bebida] ([ID])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([ID_Plato])
REFERENCES [dbo].[Plato] ([ID])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([ID_Ticket])
REFERENCES [dbo].[Ticket] ([ID])
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD FOREIGN KEY([ID_EmpleadoTurno])
REFERENCES [dbo].[Empleado] ([ID])
GO

