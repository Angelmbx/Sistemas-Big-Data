## Tarea 1 - Carga de datps desde fichero XLSX

# install.packages("readxl")
library(readxl)
# Para ejecutar script -> R en terminal , despues source('nombredearchivo')


ruta_archivo <- "EstadísticasNetflix.xlsx"
nombre_hoja <- "Netflix annual revenue 2011 to "

hojas_disponibles <- excel_sheets("EstadísticasNetflix.xlsx")

if (nombre_hoja %in% hojas_disponibles) {
  datos_excel <- read_excel(ruta_archivo, sheet = nombre_hoja)
  df = data.frame(datos_excel)
  print(df)
  
} else {
  # Imprime un mensaje si la hoja no está presente
  cat("La hoja", nombre_hoja, "no está presente en el archivo Excel.\n")
}

## Tarea 2. Extracción de subconjunto
#a) Filas de los años comprendidos entre 2015 y 2016 inclusive

years_a <- df[(5:6),]
View(years_a)

#b) Valores de los años 2018 y 2020

years_b <- df[c(8,10),]
View(years_b)

#c) Los tres primeros registros

years_c <- df[1:3,]
View(years_c)

