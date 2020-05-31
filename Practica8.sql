use BAR

create procedure Empleados1001 as
select nombre,ApellidoMa,ApellidoPA,FechaNac from Empleado where ID_EmpleadoSucursal = 1001

exec Empleados1001

create procedure Empleados1002 as 
select nombre,ApellidoMa,ApellidoPA,FechaNac from Empleado where ID_EmpleadoSucursal = 1002
exec Empleados1002

create procedure Empleados1003 as 
select nombre,ApellidoMa,ApellidoPA,FechaNac from Empleado where ID_EmpleadoSucursal = 1003
exec Empleados1003

create procedure NuevoEmpleado as
insert into Empleado values(1016,'Paulina','Garza','Garcia',null,89654888,null, 1003)

exec NuevoEmpleado

create procedure EliminarEmpleado as
delete from Empleado where ID = 1016

exec EliminarEmpleado

create procedure AgregarPlato as
insert into Plato values(1012, 'Alitas', 60, 'Alitas en Salsa Buffalo')

create procedure AgregarBebida as
insert into Bebida values(1017, 'Mezcal', 60, 'Mezcal Clasico')

create trigger NuevoTicket
on Ticket
for insert 
as 
begin 
	declare @IDNuevo int
	set @IDNuevo = (select max(ID) from Pedido )
	update Pedido
	set ID_Ticket = @IDNuevo +1
end

declare @sql nvarchar(1000)
declare @parametros nvarchar(1000)

set @sql = 'Select * from Empleado' + ' where ApellidoMa = @ApellidoMa and ApellidoPa = @ApellidoPa'
set @parametros = '@ApellidoMa nvarchar(50), @ApellidoPa nvarchar(50)'

execute sp_executesql @sql, @parametros, @ApellidoMa = 'Gonzalez', @ApellidoPa = 'Torres'