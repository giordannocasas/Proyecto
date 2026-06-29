-- =====================================================
-- PROCEDIMIENTO: Completar subtarea(s) en masa
-- =====================================================
CREATE PROCEDURE sp_CompletarSubtareas
    @id_usuario INT,
    @id_subtareas VARCHAR(MAX),  -- Ej: '1,3,5,7'
    @id_fecha INT  -- Fecha actual en formato YYYYMMDD
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sql NVARCHAR(MAX);
    DECLARE @id_estado_completado INT = (SELECT id_estado FROM Dim_Estado WHERE nombre_estado = 'Completado');
    DECLARE @id_fact_actual INT;

    -- Crear tabla temporal con los IDs
    CREATE TABLE #subs (id_subtarea INT);

    SET @sql = 'INSERT INTO #subs SELECT value FROM STRING_SPLIT(''' + @id_subtareas + ''', '','')';
    EXEC sp_executesql @sql;

    -- Obtener el próximo id_fact
    SELECT @id_fact_actual = ISNULL(MAX(id_fact), 0) + 1 FROM Fact_Seguimiento;

    -- Insertar registros de seguimiento para cada subtarea seleccionada
    INSERT INTO Fact_Seguimiento (id_fact, id_usuario, id_subtarea, id_fecha, id_estado, tiempo_minutos)
    SELECT
        @id_fact_actual + ROW_NUMBER() OVER (ORDER BY s.id_subtarea),
        @id_usuario,
        s.id_subtarea,
        @id_fecha,
        @id_estado_completado,
        s.estimacion_minutos  -- Al completar, se asume que se invirtió el tiempo estimado
    FROM #subs s_in
    INNER JOIN Dim_Subtarea s ON s_in.id_subtarea = s.id_subtarea
    WHERE NOT EXISTS (
        -- Evitar duplicados: si ya existe un registro Completado para esta subtarea/usuario, no insertar
        SELECT 1 FROM Fact_Seguimiento f
        WHERE f.id_usuario = @id_usuario
          AND f.id_subtarea = s.id_subtarea
          AND f.id_estado = @id_estado_completado
    );

    DROP TABLE #subs;

    SELECT @@ROWCOUNT AS registros_insertados;
END
