CREATE TABLE dbo.clientes (
	id_cliente INT, -- Uso INT porque sólo necesito que sea un número entero sin caracteres de texto.
	nombre VARCHAR(100), -- Uso VARCHAR porque es una cadena de texto de máximo 100 caracteres.
	perfil_bio TEXT, -- Uso TEXT porque permite registrar una cadena de texto larga para describir la biografía del cliente.
	fecha_registro DATE); -- Uso DATE para que me la registre en formato de FECHA.

CREATE TABLE dbo.productos (
	id_producto INT, -- Uso INT porque sólo necesito que sea un número entero sin caracteres de texto.
	descripcion VARCHAR(255), -- Uso VARCHAR porque es una cadena de texto de máximo 255 caracteres.
	precio DECIMAL(10,2), -- Uso DECIMAL porque me permite especificar que el número tiene un máximo de 10 dígitos, de los cuales 2 son decimales 
	esta_activo VARCHAR(2)); -- Uso VARCHAR (2) para permitir respuestas como SI/NO
