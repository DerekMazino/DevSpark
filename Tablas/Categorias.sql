CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

COMMENT ON TABLE categorias
  IS 'Tabla para el registro de los datos de categorias';

COMMENT ON COLUMN categorias.id_cliente
  IS 'Identificador único de la categoria';
COMMENT ON COLUMN categorias.nombre
  IS 'Nombre de la categoria';