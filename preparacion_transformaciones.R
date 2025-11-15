# Cargar librerías
library(dplyr)
library(fastDummies)

# Cargar el archivo preparado (StudentPerformanceFactors_Cleaned.csv)
student_data <- read.csv("StudentPerformanceFactors_Cleaned.csv")

# Convertir variables categóricas a factores con orden
student_data <- student_data %>%
  mutate(
    Nivel_Motivacion = factor(Nivel_Motivacion, levels = c("Baja", "Media", "Alta"), ordered = TRUE),
    Involucramiento_Parental = factor(Involucramiento_Parental, levels = c("Bajo", "Medio", "Alto"), ordered = TRUE),
    Calidad_Profesor = factor(Calidad_Profesor, levels = c("Baja", "Media", "Alta"), ordered = TRUE),
    Tipo_Escuela = factor(Tipo_Escuela, levels = c("Publica", "Privada")),
    Sexo = factor(Sexo, levels = c("Femenino", "Masculino")),
    Ingresos_Familiares = factor(Ingresos_Familiares, levels = c("Bajo", "Medio", "Alto"), ordered = TRUE),
    Influencia_Companeros = factor(Influencia_Companeros, levels = c("Negativa", "Neutral", "Positiva"), ordered = TRUE),
    Actividades_Extracurriculares = factor(Actividades_Extracurriculares, levels = c("No", "Si"), ordered = TRUE),
    Acceso_Internet = factor(Acceso_Internet, levels = c("No", "Si"), ordered = TRUE),
    Discapacidades_Aprendizaje = factor(Discapacidades_Aprendizaje, levels = c("No", "Si"), ordered = TRUE),
    Nivel_Educativo_Padres = factor(Nivel_Educativo_Padres, levels = c("Secundaria", "Universitaria", "Postgrado"), ordered = TRUE),
    Acceso_Recursos = factor(Acceso_Recursos, levels = c("Bajo", "Medio", "Alto"), ordered = TRUE),
    Distancia_Hogar = factor(Distancia_Hogar, levels = c("Cerca", "Moderado", "Lejos"), ordered = TRUE)
  )

# Eliminar registros con NA en todas las variables relevantes
student_data <- student_data %>% drop_na()

# Transformaciones de variables numéricas
student_data <- student_data %>%
  mutate(
    # Transformación logarítmica
    Sesiones_Tutoria_log = log1p(Sesiones_Tutoria),
    # Transformación logarítmica
    Asistencia_log = log1p(Asistencia),
    # Transformación raíz cuadrada
    Asistencia_sqrt = sqrt(Asistencia),
    # Transformación Box-Cox (requiere valores positivos)
    Asistencia_boxcox = predict(BoxCoxTrans(Asistencia), Asistencia)
  )

# Codificación de variables categóricas con One-Hot Encoding
student_data_encoded <- dummy_cols(student_data, 
                                   select_columns = c("Nivel_Motivacion", "Involucramiento_Parental", 
                                                      "Calidad_Profesor", "Tipo_Escuela"),
                                   remove_first_dummy = TRUE,   # Elimina una columna de referencia
                                   remove_selected_columns = TRUE) # Elimina las columnas originales

# Guardar los datos procesados en un archivo CSV
write.csv(student_data_encoded, "StudentPerformanceFactors_Processed.csv", row.names = FALSE)
