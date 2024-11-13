# Tarea 1 - Carga de datps desde fichero XLSX

# install.packages("readxl")
# library(readxl)
# Para ejecutar script -> R en terminal , despues source('nombredearchivo')


ruta_archivo <- "EstadísticasNetflix.xlsx"
nombre_hoja <- "Netflix annual revenue 2011 to "

hojas_disponibles <- excel_sheets("EstadísticasNetflix.xlsx")

if (nombre_hoja %in% hojas_disponibles) {
  datos_excel <- read_excel(ruta_archivo, sheet = nombre_hoja)
  
  print(datos_excel)
} else {
  # Imprime un mensaje si la hoja no está presente
  cat("La hoja", nombre_hoja, "no está presente en el archivo Excel.\n")
}