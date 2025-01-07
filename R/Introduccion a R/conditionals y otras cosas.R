## CONDICIONALES ##

(nota <- runif(1, min = 0, max = 10)) # runif = numero aleatorio entre 1 y 10
print(as.integer(nota)) # convierte a numero entero

if (nota >=9){
  print('sobresaliente')
} else if (nota >= 7){
  print('notable') 
}else if (nota >= 5) {
  print('aprobao') 
} else {
  print('a pastar')
}

# bucles

for (x in c(2,5,6,9)) {
  print(x)
}

suma <- 0
n <- as.numeric(readline("Introduce un numero (0 para salir): "))

while (n!=0){
  suma <- suma +n
  n <- as.numeric(readline("Introduce un numero (0 para salir): "))
}

cat("La suma de los números es: ", suma)

# Funciones

maximo <- function(a,b) {
  if (a>b){
    m<-a
  }else {
    m<-b
  }
  return(m)
}

maximo(5,7)


