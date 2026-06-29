-- =====================================================
-- VISTA 1: Estado actual de cada subtarea por usuario
-- =====================================================
CREATE VIEW vw_Estado_Subtareas_Usuario AS
SELECT
    u.id_usuario,
    u.nombre AS usuario,
    h.nombre_habito,
    t.nombre_tarea,
    s.id_subtarea,
    s.nombre_subtarea,
    s.estimacion_minutos,
    -- Obtener el último estado registrado para esta subtarea/usuario
    ISNULL((
        SELECT TOP 1 e.nombre_estado
        FROM Fact_Seguimiento f
        INNER JOIN Dim_Estado e ON f.id_estado = e.id_estado
        WHERE f.id_usuario = u.id_usuario
            AND f.id_subtarea = s.id_subtarea
        ORDER BY f.id_fecha DESC -- El más reciente
    ), 'No iniciado') AS estado_actual,
    -- Tiempo total invertido en esta subtarea por este usuario
    ISNULL((
        SELECT SUM(f.tiempo_minutos)
        FROM Fact_Seguimiento f
        WHERE f.id_usuario = u.id_usuario
            AND f.id_subtarea = s.id_subtarea
    ), 0) AS tiempo_total_invertido,
    -- Última fecha en que se trabajó esta subtarea
    ISNULL((
        SELECT TOP 1 f.id_fecha
        FROM Fact_Seguimiento f
        WHERE f.id_usuario = u.id_usuario
            AND f.id_subtarea = s.id_subtarea
        ORDER BY f.id_fecha DESC
    ), NULL) AS ultima_fecha
FROM Dim_Usuario u
CROSS JOIN Dim_Subtarea s
INNER JOIN Dim_Tarea t ON s.id_tarea = t.id_tarea
INNER JOIN Dim_Habito h ON t.id_habito = h.id_habito;
