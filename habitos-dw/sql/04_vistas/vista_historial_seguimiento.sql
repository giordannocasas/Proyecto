CREATE VIEW Vista_Historial_Seguimiento AS
SELECT
    f.id_fact,
    u.nombre AS usuario,
    h.nombre_habito AS habito,
    f.tiempo_minutos AS minutos,
    f.id_fecha AS fecha,
    f.id_usuario,
    f.id_subtarea
FROM Fact_Seguimiento f
INNER JOIN Dim_Usuario u ON f.id_usuario = u.id_usuario
INNER JOIN Dim_Subtarea s ON f.id_subtarea = s.id_subtarea
INNER JOIN Dim_Tarea t ON s.id_tarea = t.id_tarea
INNER JOIN Dim_Habito h ON t.id_habito = h.id_habito;
