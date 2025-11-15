# Cargar el archivo CSV
student_data <- read.csv("StudentPerformanceFactors.csv")

# Convertir cadenas vacías en NA
student_data[student_data == ""] <- NA

# Renombrar las columnas a español con guiones bajos
library(dplyr)
student_data <- student_data %>%
  rename(
    Puntuacion_Examen = Exam_Score,
    Sexo = Gender,
    Horas_Estudio = Hours_Studied,
    Nivel_Motivacion = Motivation_Level,
    Horas_Sueno = Sleep_Hours,
    Puntuaciones_Previas = Previous_Scores,
    Actividad_Fisica = Physical_Activity,
    Asistencia = Attendance,
    Discapacidades_Aprendizaje = Learning_Disabilities,
    Involucramiento_Parental = Parental_Involvement,
    Nivel_Educativo_Padres = Parental_Education_Level,
    Sesiones_Tutoria = Tutoring_Sessions,
    Ingresos_Familiares = Family_Income,
    Influencia_Companeros = Peer_Influence,
    Actividades_Extracurriculares = Extracurricular_Activities,
    Acceso_Internet = Internet_Access,
    Acceso_Recursos = Access_to_Resources,
    Tipo_Escuela = School_Type,
    Calidad_Profesor = Teacher_Quality,
    Distancia_Hogar = Distance_from_Home
  )

# Convertir variables categóricas a factores con etiquetas en español
student_data$Nivel_Motivacion <- factor(student_data$Nivel_Motivacion, 
                                        levels = c("Low", "Medium", "High"), 
                                        labels = c("Baja", "Media", "Alta"),
                                        ordered = TRUE)

student_data$Involucramiento_Parental <- factor(student_data$Involucramiento_Parental, 
                                                levels = c("Low", "Medium", "High"),
                                                labels = c("Bajo", "Medio", "Alto"),
                                                ordered = TRUE)

student_data$Calidad_Profesor <- factor(student_data$Calidad_Profesor,
                                        levels = c("Low", "Medium", "High"),
                                        labels = c("Baja", "Media", "Alta"),
                                        ordered = TRUE)

student_data$Tipo_Escuela <- factor(student_data$Tipo_Escuela,
                                    levels = c("Public", "Private"),
                                    labels = c("Publica", "Privada"))

student_data$Sexo <- factor(student_data$Sexo, 
                            levels = c("Female", "Male"), 
                            labels = c("Femenino", "Masculino"))

student_data$Ingresos_Familiares <- factor(student_data$Ingresos_Familiares, 
                                           levels = c("Low", "Medium", "High"), 
                                           labels = c("Bajo", "Medio", "Alto"),
                                           ordered = TRUE)

student_data$Influencia_Companeros <- factor(student_data$Influencia_Companeros, 
                                             levels = c("Negative", "Neutral", "Positive"), 
                                             labels = c("Negativa", "Neutral", "Positiva"),
                                             ordered = TRUE)

student_data$Actividades_Extracurriculares <- factor(student_data$Actividades_Extracurriculares, 
                                                     levels = c("No", "Yes"), 
                                                     labels = c("No", "Si"),
                                                     ordered = TRUE)

student_data$Acceso_Internet <- factor(student_data$Acceso_Internet, 
                                       levels = c("No", "Yes"),
                                       labels = c("No", "Si"),
                                       ordered = TRUE)

student_data$Discapacidades_Aprendizaje <- factor(student_data$Discapacidades_Aprendizaje, 
                                                  levels = c("No", "Yes"), 
                                                  labels = c("No", "Si"),
                                                  ordered = TRUE)

student_data$Nivel_Educativo_Padres <- factor(student_data$Nivel_Educativo_Padres, 
                                              levels = c("High School", "College", "Postgraduate"), 
                                              labels = c("Secundaria", "Universitaria", "Postgrado"), 
                                              ordered = TRUE)

student_data$Acceso_Recursos <- factor(student_data$Acceso_Recursos,
                                       levels = c("Low", "Medium", "High"),
                                       labels = c("Bajo", "Medio", "Alto"),
                                       ordered = TRUE)

student_data$Distancia_Hogar <- factor(student_data$Distancia_Hogar,
                                       levels = c("Near", "Moderate", "Far"),
                                       labels = c("Cerca", "Moderado", "Lejos"),
                                       ordered = TRUE)

# Guardar la nueva base de datos limpia en un archivo CSV
write.csv(student_data, "StudentPerformanceFactors_Cleaned.csv", row.names = FALSE)
