-- Llaves foráneas entre dimensiones
ALTER TABLE Dim_Habito ADD FOREIGN KEY (id_categoria)
REFERENCES Dim_Categoria (id_categoria);

ALTER TABLE Dim_Tarea ADD FOREIGN KEY (id_habito)
REFERENCES Dim_Habito (id_habito);

ALTER TABLE Dim_Subtarea ADD FOREIGN KEY (id_tarea)
REFERENCES Dim_Tarea (id_tarea);

-- Llaves foráneas de la tabla de hechos hacia las dimensiones
ALTER TABLE Fact_Seguimiento ADD FOREIGN KEY (id_estado)
REFERENCES Dim_Estado (id_estado);

ALTER TABLE Fact_Seguimiento ADD FOREIGN KEY (id_fecha)
REFERENCES Dim_Tiempo (id_fecha);

ALTER TABLE Fact_Seguimiento ADD FOREIGN KEY (id_subtarea)
REFERENCES Dim_Subtarea (id_subtarea);

ALTER TABLE Fact_Seguimiento ADD FOREIGN KEY (id_usuario)
REFERENCES Dim_Usuario (id_usuario);
