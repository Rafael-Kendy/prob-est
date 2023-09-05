#Crie uma função para a equação
func=function(x){
  x^2-5*x+6
}#func

#Faça um gráfico para verificar as raízes
curve(func, 1.5, 3.5)
abline(h=0, col=2)

#Determine as raízes
library(rootSolve)
multiroot(func, start=c(1.5, 3.5))
abline(v=c(2, 3), col=3)

#Calcule a área entre as raízes
integrate(func, 2, 3)
#-0.1666667