#Ctrl+enter roda a linha inteiro q ta o cursor
#Ctrl+L limpa o console
#Vassoura no environment limpa td as variavel

####Basico####---------------------------------------------------------
5+8
5-8
5*8
5/8

#Funcoes trig (essas ta em radiano)
sin(pi/2)
cos(pi)
tan(pi/4)

####Vetor####-----------------------------------------------------------
(x=c(1,2,3,4)) #c() coloca os numeros lado a lado
x+1
(y=c(2:5)) #() mostrar oq ta dentro, 2:5=sequencia de 2 ate 5
x+y
(x=c(1:4))

#Matriz
(z=matrix(x, nrow=2, byrow=F)) #x vira a matriz, nrow=numero de linhas, 
                               #byrow=se vai organizar por linha
(z=matrix(x, nrow=2, byrow=T))
solve(z) #inversa
t(z) #transposta
determinant(z)

####Derivada####--------------------------------------------------------
D(expression(x^2), 'x') #oq eu quero derivar, em realacao a quem
D(expression(tan(x)*sin(x)^2), 'x')
D(expression(x^2+y*2*a+y*x), 'x')

#Instala o pacote, da pra instalar so no pc tbm, mas dai tem q lembrar
#d baixar em tds os pc q for rodar o codigo
install.packages("mosaicCalc")
#Carrega o pacote
library(mosaicCalc)

#Integral
antiD(a*x^2 ~ x) #oq integra, em quem
antiD(2*x ~ x)

####Funcoes####---------------------------------------------------------
nome_funcao=function(argumento){
  2*argumento-1
}#nome_funcao
nome_funcao(5)

testfunc=function(x, y){
  x+y
}#testfunc
testfunc(5, 8)

#Curva de -10 a 10
curve(nome_funcao, -10, 10)
#Linha, h=horiz, v=vert, col=cor, lwd=grossura
abline(h=0, col='purple')
abline(v=0, col='red')

####Raiz da funcao####--------------------------------------------------
uniroot(nome_funcao, lower=0.2, upper=0.8) #vai procurar a raiz entre 0 e 4

#Pra raiz multipla
install.packages("rootSolve")
library(rootSolve)

func2=function(x){
  2*x^2-3*x-4
}#func2
curve(func2, -2, 3)
abline(h=0)

multiroot(func2, start=c(-1, 3))
abline(v=c(-0.8507811, 2.3507811), col=2)

#Integral definida
integrate(nome_funcao, 0, 2) #oq vai integrar, limite max e min

####Base de dados####----------------------------------------------------
(idade=c(18,20,23,25))
(sexo=c('M', 'F', 'F', 'M'))

(dados=data.frame(idade, sexo))

#Escreve e le o arq
write.csv(dados, "H:\\Prob e Est\\Dados.csv", row.names = F)
dados_lidos=read.csv('Dados.csv', sep=";", dec=",", header=T)
dados_lidos

#Adiciona uma variavel na matriz
dados_lidos$classe=c('a','a','b','b')
dados_lidos
