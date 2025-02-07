----------------------------------------------------------------------------
--
-- Tabla para el registro de los datos de clientes.
-- © DEVSPARK.2025-02-07.
--
-----------------------------------------------------------------------------
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE Clientes
  IS 'Tabla para el registro de los datos de clientes';

COMMENT ON COLUMN Clientes.id_cliente
  IS 'Identificador único del cliente';
COMMENT ON COLUMN Clientes.nombre
  IS 'Nombres y Apellidos del cliente';
COMMENT ON COLUMN Clientes.correo
  IS 'Correo electrónico del cliente';
COMMENT ON COLUMN Clientes.telefono
  IS 'Telefóno de contacto del cliente';
COMMENT ON COLUMN Clientes.fecha_registro
  IS 'Fecha en que se registró el cliente en la base de datos';