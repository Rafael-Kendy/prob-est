#Binomial-----------------------------------------------------------------------
binomial=function(n, x, p){
  choose(n,x)*(p^(x))*((1-p)^(n-x))
}#binomial

#1.capacitor com prob de queimar=0.1, 10 capacitor
n=10
p=0.1
#todas as probabilidades
binomial(n, 0:10, p)

#a)prob de nenhum queimar
binomial(n, 0, p)

#b)2 queimar, 2 nao queimar
binomial(n, 2, p)
binomial(10, 2, 0.9)

#c)ao menos 1
#1-p(x=0), pega tds as probabilidade(1) e tira oq n quer (p(x=0))
1-binomial(n, 0, p)
sum(binomial(n, 1:10, p))

#d) 9 ou menos
1-binomial(n, 10, p)
sum(binomial(n, 0:9, p))

#e)media de queimados por equipamento
esperanca=n*p

#f)variancia e desvio padrao
(variancia=p*(1-p))
(desvio=sqrt(variancia))



#2.3 em 4 alunos fez curso, 16 escolhidos
n=16
p=0.75

#a)pelo menos 12
sum(binomial(n, 12:16, p))

#b)maximo 13
sum(binomial(n, 0:13, p))

#c)12
binomial(n, 12, p)

#d)80 escolhido, esperado, variancia
80*p
p*(1-p)
#dbim()

#Poisson------------------------------------------------------------------------
poisson=function(x,A){
  return((exp(-A)*A^x)/factorial(x))
}#poisson
A=5

#receber 2 ligacoes
poisson(2, A)

#receber menos d 3
sum(poisson(0:2, A))

#mais d 5
1-sum(poisson(0:5, A))
#a chance de acontecer 0:5 é tal, e de não acontecer é 1-tal

#260 em 2 dias
poisson(260, 240)

#Agora com funções prontas------------------------------------------------------
# dMODELO = probabilidade igual
# pMODELO = menor ou igual
# qMODELO = contrario do p, qual é o valor de x para tantos por cento de ser
            #menor ou igual a ele
# rMODELO = amostra aleatoria do modelo

#2 vezes do dado dar <3 em 5 tentativas
dbinom(2,5,2/6)

#todas as vezes
dbinom(0:5,5,2/6)
install.packages('ggplot2')
library(ggplot2)
bd=data.frame(0:5, dbinom(0:5,5,2/6))
names(bd)=c('x', 'prob')
bd
ggplot(bd, aes(x,prob))+geom_col(fill='orange')

#menor q 2 vezes
pbinom(2,5,2/6)

#valor de A tal q a prob de ser menor ou igual a A é 0.7901
qbinom(0.7901,5,2/6)

#amostra de tamanho 10
rbinom(10,5,2/6)

