# Proyecto

# Apphabitos DW (Data Warehouse de Hábitos)

Modelo dimensional para el seguimiento de hábitos personales, organizados en tareas y subtareas, con historial de progreso por usuario.

## Estructura del proyecto

- `sql/01_dimensiones/` — Tablas de dimensión: Usuario, Categoría, Estado, Hábito, Tarea, Subtarea, Tiempo
- `sql/02_hechos/` — Tabla de hechos: Fact_Seguimiento (registro de progreso)
- `sql/03_relaciones/` — Llaves foráneas que conectan dimensiones y hechos
- `sql/04_vistas/` — Vistas de consulta y reportes
- `sql/05_procedimientos/` — Procedimientos almacenados

## Modelo de datos

El proyecto sigue una jerarquía:

Categoría → Hábito → Tarea → Subtarea

Cada subtarea se registra en `Fact_Seguimiento`, vinculada a un usuario, una fecha y un estado (Iniciado / En Progreso / Completado).

## Orden de ejecución

1. Ejecutar todos los scripts de `01_dimensiones/`
2. Ejecutar el script de `02_hechos/`
3. Ejecutar `03_relaciones/` (llaves foráneas)
4. Ejecutar `04_vistas/` (opcional, para reportes)
5. Ejecutar `05_procedimientos/` (opcional)

## Vistas disponibles

- `vw_Estado_Subtareas_Usuario` — Estado actual de cada subtarea por usuario
- `vw_Resumen_Usuario_Subtareas` — Resumen de progreso por usuario
- `Vista_Historial_Seguimiento` — Historial completo de seguimiento

## Procedimientos

- `sp_CompletarSubtareas` — Marca una o varias subtareas como completadas en una sola ejecución

## Diagrama

(Agregar aquí diagrama entidad-relación)
