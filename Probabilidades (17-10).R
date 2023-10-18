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

#binominal-----------------------------
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

#poisson-------------------------------
#processa em media 40 itens por segundo
#35 itens
dpois(35,40)

#todas
dpois(0:500,40)
bd=data.frame(10:70, dpois(10:70,40))
names(bd)=c('x', 'prob')
bd
ggplot(bd, aes(x,prob))+geom_col(fill='orange')

install.packages('labeling')
library(labeling)

#45 ou menos
ppois(45,40)

#A para 0.8096
qpois(0.8096,40)

#amostra 10
rpois(10,40)

#CONTINUO----------------------------------------------------------------------
#exponencial----------------------------
#tempo de validade media de 7 anos
#vencer em 6 anos
dexp(6,1/7)
#calcula, mas é 0 pq continuo ñ tem em ponto exato

#5 ou menos
pexp(5,1/7)

#valor mediano
qexp(0.5,1/7)

#amostra 10
rexp(10,1/7)

x=rexp(500,1/7)
dx=dexp(x,1/7)
bd=data.frame(x,dx)
bd
ggplot(bd, aes(x))+geom_histogram(aes(y=..density..), fill='orange')+
  geom_line(aes(x,dx,col='red'))

#normal----------------------------
#media de peso=50, variancia=25
#20kg
dnorm(20,50,5)#pergunta, média, desvio padrão(raiz da variancia)
#calcula, mas é 0 pq continuo ñ tem em ponto exato

#+20kg
1-(pnorm(20,50,5))

#primeiro quartil (<=25%)
qnorm(0.25,50,5)

#amostra 20
rnorm(20,50,5)

#histograma de tamanho 700, adiciona linha com as probabilidades
n=rnorm(700,50,5)
dn=dnorm(n,50,5)
bd=data.frame(n,dn)
ggplot(bd, aes(n))+geom_histogram(aes(y=..density..), fill='blue')+
  geom_line(aes(n,dn,col='red'))
