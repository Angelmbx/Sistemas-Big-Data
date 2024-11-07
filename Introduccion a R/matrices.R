## MATRICES ##
# Las matrices son un vector de vectores
# matrix (data = "datos", nrow, ncol, byrow = TRUE|FALSE)

mat1 =  matrix(c(1,2,4,6,5,6,7,9,3), 3,3)
View(mat1)

mat2 = matrix(c(1,2,4,6,5,6,7,9,3), 3,3, dimnames = list(c("R1", "R2", "R3"), c("C1", "C2", "C3")))
View(mat2)

#renombrar filas/columnas. También se pueden nombrar por primera vez así.
rownames(mat2) = c("Row1", "Row2", "Row3")
colnames(mat2) = c("Col1", "Col2", "Col3")
View(mat2)

vec1 = c(14,15,16)
mat2 = rbind(mat2, vec1) # añade una nueva fila (14,15,16) a la mat2 
View(mat2)

vec2 = c(23,9,62)
mat3 = cbind(mat2, vec2) # también se puede crear una nueva matriz a través de una anterior a la que le añades una fila/columna (columna en este caso)
View(mat3)

rownames(mat3) = c("Row1", "Row2", "Row3", "Row4") # renombramos la nueva fila añadida a mat3
colnames(mat3) = c("Col1", "Col2", "Col3", "Col4") # renombramos la nueva columna añadida a mat3
View(mat3)

matriz = matrix(1:20, 4,5) # crea una matriz con numeros del 1 al 20 de dimensión 4,5 (filas, columnas)
View(matriz)
matriz[4,5] # elemento de la posición fila 4 columna 5: 20
matriz[2,] # solo la fila 2, todas las columnas: 2 6 10 14 18
matriz[2:4, 1:3] # filas 2 3 y 4 + columnas 1 2 y 3
matriz[, 2:3] # columnas 2 y 3, todas las filas
matriz[c(2,4), c(1,3)] # de la fila 2 los elementos de las columnas 1 y 3, y de la fila 4 también los elementos de la columna 1 y 3
matriz[-c(2,4), c(1,3)] # de las filas que no son la 2 o 4, los elementos 1 y 3 de cada una.
