CREATE TABLE Dim_Tarea (
    id_tarea INT NOT NULL PRIMARY KEY,
    id_habito INT NULL,
    nombre_tarea VARCHAR(100) NULL,
    FOREIGN KEY (id_habito) REFERENCES Dim_Habito(id_habito)
);
