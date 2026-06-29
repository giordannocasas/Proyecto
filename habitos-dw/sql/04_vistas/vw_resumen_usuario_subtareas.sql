-- =====================================================
-- VISTA 2: Resumen rápido por usuario
-- =====================================================
CREATE VIEW vw_Resumen_Usuario_Subtareas AS
SELECT
    id_usuario,
    usuario,
    COUNT(*) AS total_subtareas,
    SUM(CASE WHEN estado_actual = 'Completado' THEN 1 ELSE 0 END) AS completadas,
    SUM(CASE WHEN estado_actual = 'En progreso' THEN 1 ELSE 0 END) AS en_progreso,
    SUM(CASE WHEN estado_actual = 'No iniciado' THEN 1 ELSE 0 END) AS no_iniciadas,
    SUM(estimacion_minutos) AS tiempo_estimado_total,
    SUM(tiempo_total_invertido) AS tiempo_invertido_total,
    CAST(100.0 * SUM(CASE WHEN estado_actual = 'Completado' THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS porcentaje_completado
FROM vw_Estado_Subtareas_Usuario
GROUP BY id_usuario, usuario;
