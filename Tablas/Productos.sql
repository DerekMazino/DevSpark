CREATE TABLE Productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    marca VARCHAR(100),
    id_categoria INT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE SET NULL
);

COMMENT ON TABLE Productos
  IS 'Tabla para el registro de los datos de Productos';

COMMENT ON COLUMN Productos.id_producto
  IS 'Identificador único por producto';
COMMENT ON COLUMN Productos.nombre
  IS 'Nombre - Modelo del producto';
COMMENT ON COLUMN Productos.descripcion
  IS 'Descripción detallada del producto';
COMMENT ON COLUMN Productos.marca
  IS 'Marca o fabricante del producto';
COMMENT ON COLUMN Productos.id_categoria
  IS 'Categoria a la que pertenece el producto';
COMMENT ON COLUMN Productos.precio
  IS 'Precio de venta actual del producto';
COMMENT ON COLUMN Productos.stock
  IS 'Stock actual del producto';
COMMENT ON COLUMN Productos.fecha_ingreso
  IS 'Fecha en la que el producto se creó dentro del sistema';