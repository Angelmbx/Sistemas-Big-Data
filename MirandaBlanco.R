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


## Tarea 3. Suma los valores por áreas mundiales

ruta_archivo_3 <- "EstadísticasNetflix.xlsx"
nombre_hoja_3 <- "Netflix subscribers by areas"
hojas_disponibles_3 <- excel_sheets(ruta_archivo_3)

if (nombre_hoja_3 %in% hojas_disponibles_3) {
  datos_excel_3 <- read_excel(ruta_archivo_3, sheet = nombre_hoja_3)
  print(datos_excel_3)
  df3 = data.frame(datos_excel_3)
  print(df3)
  #View(df3)
} else {
  cat("La hoja", nombre_hoja, "no está presente en el archivo Excel.\n")
}

# Suma de todas menos year
suma_columnas <- colSums(df3[,-1])
# Añadir al DataFrame
df3 <- rbind(df3, c("Total", suma_columnas))

print(df3)
View(df3)


# TAREA 4 =====================================================================

# Reemplaza "tu_archivo.xls" con la ruta y nombre de tu archivo Excel
ruta_archivo <- "EstadísticasNetflix.xlsx"

# Especifica el nombre de la hoja que deseas leer
nombre_hoja <- "Netflix annual net incomeloss"

# Obtiene la lista de nombres de hojas en el archivo Excel
hojas_disponibles <- excel_sheets(ruta_archivo)

# Verifica si la hoja deseada está presente en la lista
if (nombre_hoja %in% hojas_disponibles) {
  # Lee la hoja específica del archivo Excel. Ya los vuelca en un dataframe
  datos_excel2 <- read_excel(ruta_archivo, sheet = nombre_hoja)
  
  View(datos_excel2)
  
} else {
  # Imprime un mensaje si la hoja no está presente en el archivo Excel
  cat("La hoja", nombre_hoja, "no está presente en el archivo Excel.\n")
}

# Tomar los cinco últimos valores de la columna 'NetIncome/Loss ($mm)'
ultimos_valores <- tail(datos_excel2$`Net Income/Loss ($mm)`, 5)

# Calcular la suma de los cinco últimos valores
suma_ultimos_valores <- sum(ultimos_valores, na.rm = TRUE)

resultado_suma <- data.frame(
  Suma_NetIncome_Loss = suma_ultimos_valores
)

View(resultado_suma)

# Tarea 5 relación de datos
valores <- list()


# Crear un vector para almacenar los valores
valores <- numeric(nrow(datos_excel2))

# Calcular el porcentaje de cambio
for (i in 2:(nrow(datos_excel2))) {
  anterior <- datos_excel2[i-1, 'Net Income/Loss ($mm)']
  posterior <- datos_excel2[i , 'Net Income/Loss ($mm)']
  porcentaje <- ((posterior - anterior) / anterior) * 100
  valores[i] <- round(porcentaje,2)
}

# Agregar valores al principio y al final del vector
# valores[c(1, nrow(datos_excel2))] <- NA


# Agregar la nueva columna 'gananciasperdidas' al DataFrame original
datos_excel2$porcentaje_gananciasperdidas <- valores

# Visualizar el DataFrame
View(datos_excel2)


#Tarea 6 . Ordenar el dataframe

# Reemplaza "tu_archivo.xls" con la ruta y nombre de tu archivo Excel
ruta_archivo <- "EstadísticasNetflix.xlsx"

# Especifica el nombre de la hoja que deseas leer
nombre_hoja <- "Netflix subscribers by areas"

# Obtiene la lista de nombres de hojas en el archivo Excel
hojas_disponibles <- excel_sheets(ruta_archivo)

# Verifica si la hoja deseada está presente en la lista
if (nombre_hoja %in% hojas_disponibles) {
  # Lee la hoja específica del archivo Excel. Ya los vuelca en un dataframe
  datos_excel <- read_excel(ruta_archivo, sheet = nombre_hoja)
} else {
  # Imprime un mensaje si la hoja no está presente en el archivo Excel
  cat("La hoja", nombre_hoja, "no está presente en el archivo Excel.\n")
}
# Imprime una vista previa de los datos

datos_excel_ordenado <- datos_excel[order(datos_excel$`US & Canada`, datos_excel$EMEA,
                                          datos_excel$`Latin America`, datos_excel$`Asia-Pacific`),]

#mostrar todos menos la columna YEAR
View(datos_excel_ordenado[,-1])

#Tarea 7  Correlación  

correlacion <- cor(datos_excel)

View(correlacion[,-1])

# Tarea 8 Gráficos


library(ggplot2)

print(ggplot(datos_excel, aes(x = Year)) +
        geom_line(aes(y = `US & Canada`, color = "US & Canada"), size = 1.2) +
        geom_line(aes(y = EMEA, color = "EMEA"), size = 1.2) +
        geom_line(aes(y = `Latin America`, color = "Latin America"), size = 1.2) +
        geom_line(aes(y = `Asia-Pacific`, color = "Asia-Pacific"), size = 1.2) +
        labs(title = "Evolución de Suscriptores por Región",
             x = "Año",
             y = "Suscriptores",
             color = "Región") +
        scale_color_manual(values = c("US & Canada" = "blue", "EMEA" = "red", "Latin America" = "green", "Asia-Pacific" = "purple")))


