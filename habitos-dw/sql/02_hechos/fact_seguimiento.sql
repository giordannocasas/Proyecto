CREATE TABLE Fact_Seguimiento (
    id_fact INT NOT NULL PRIMARY KEY,
    id_usuario INT NULL,
    id_subtarea INT NULL,
    id_fecha INT NULL,
    id_estado INT NULL,
    tiempo_minutos INT NULL,
    tiempo_estimado_total INT NULL,
    tiempo_real_total INT NULL,
    fecha_hora_registro DATETIME NULL,
    id_grupo_fact INT NULL
);
