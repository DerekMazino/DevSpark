----------------------------------------------------------------------------
--
-- Procedimiento que actualzia el stock de un determinado producto.
-- © DEVSPARK.2025-02-07.
--
-----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE P_ACTUALIZA_STOCK(producto_id INT, nueva_cantidad INT)
AS $$
BEGIN
    UPDATE Productos
    SET stock = GREATEST(stock + nueva_cantidad, 0)
    WHERE id_producto = producto_id;
END;
$$ LANGUAGE plpgsql;