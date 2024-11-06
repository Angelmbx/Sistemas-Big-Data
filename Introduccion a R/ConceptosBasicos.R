a = 1+1
b = 3*a
c = b/a
d = sqrt(b) # sqrt = raíz cuadrada
?sqrt # ? proporciona documentación sobre el elemento que venga después - en este caso sqrt -

# para conocer el tipo de dato
class(d) # [1] "numeric"

# convertir a tipo character
b = as.character(5)
class(b) # [1] "character"


### VECTORES SECUENCIAS Y LISTAS

## Vectores
vec1 <- c(2,4,5,6)
vec2 <- c("Alicia", "Miguel", "Juan")
vec3 <- c(4,6,7,12)
vec4 = vec1 + vec3 # num [1:4] 6 10 12 18

vec5 <- c(4, "2", 3) 
# Cuando un vector contiene una mezcla de números y caracteres, R convierte todos los elementos 
# al tipo de dato más general, que en este caso es el tipo "character" (carácter).
# Es decir, los números se convierten en cadenas de texto.
vec5 # [1] "4" "2" "3"
# Para manejar conjuntos de datos heterogéneos por lo tanto es mejor utilizar listas y no vectores.

length(vec3) # [1] 4
vec6 = vec1*vec3
vec6 # [1]  8 24 35 72

vec6[1] # 8
vec6[c(1,3)] # elementos 1 y 3 (8, 35). En R los arrays comienzan en 1 y no en 0.
vec6[1:3] # a diferencia de Python, R muestra los elementos 1 2 y 3, mientras que en Python mostraría los elementos 1 y 2, excluyendo el 3
vec7 <- c(primero = 31, segundo = 52, tercero = 39)
vec7["segundo"] # 52


## Secuencias
sec1 <- seq(1,20, by = 3) # números del 1 al 20 de 3 en 3 -> num [1:7] 1 4 7 10 13 16 19


## Listas
# permiten agrupar datos de distintos tipos
# para acceder a los valores hay que utilizar doble corchete [[ ]]

lista1 <- list(nombre = "Juan", edad = 24, altura = 1.82) # Funcionan de manera similar a los diccionarios de Python

list1 = list(1, "uno", 3i, TRUE)
list1[[4]] # TRUE

list2 = list(Módulo = c("SBD", "PIA", "MIA", "ML", "BDA"), Calificación = c(6.0, 7.25, 9.0, 5.75, 8.5))
# se trata de una lista compuesta por dos vectores (cada vector está compuesto por el mismo tipo de datos)
list2$Módulo # muestra los valores de Módulo [1] "SBD" "PIA" "MIA" "ML"  "BDA"
list2$Calificación
list2$Calificació[[5]] #8.5
