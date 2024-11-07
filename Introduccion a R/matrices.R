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
