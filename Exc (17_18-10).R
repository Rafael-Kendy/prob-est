#1)-----------------------------------------------------------------------------
#determine k para que seja uma funçao de prob de variavel aleatoria discreta
#P(X=Xi)=xi*K  xi=1:10
#substitui os valores de Xi e faz a soma de td, q fica igual a 1
#isola o k e fica k=1/55

#2)-----------------------------------------------------------------------------
#70% nao falha, amostra de 10
#nenhum falha
dbinom(0,10,0.3)

#no minimo 1
1-(dbinom(0,10,0.3))
sum(dbinom(1:10,10,0.3))

#ao menos 3
1-(pbinom(2,10,0.3))
sum(dbinom(3:10,10,0.3))

#amostra de 50, qnts falham em media
50*0.3

#todas as prob de falhar
install.packages('ggplot2')
library(ggplot2)
bd=data.frame(0:10, dbinom(0:10,10,0.7))
names(bd)=c('x', 'prob')
bd
ggplot(bd, aes(x,prob))+geom_col(fill='orange')

#3)-----------------------------------------------------------------------------
#media de bloco com defeito é 4 por hora
#4 em 1 hora
dpois(4,4)

#6 ou + em 1 hora
1-(ppois(5,4))
1-(sum(dpois(0:5,4)))

#+80 por dia
1-(ppois(80,(4*24)))
1-(sum(dpois(0:80,(4*24))))

#-85
ppois(84,(4*24))

#todas as prob em 1h
install.packages('labeling')
library(labeling)

dpois(0:15,4)
bd=data.frame(0:15, dpois(0:15,4))
names(bd)=c('x', 'prob')
ggplot(bd, aes(x,prob))+geom_col(fill='orange')

#4)-----------------------------------------------------------------------------
#determine k pra que seja densidade de prob, 0<=x<1
#f(x)=k*x^4
#iguala isso a 1 e integra de 0 a 1
fx=function(x) x^4
a=integrate(fx,0,1)
(k=1/a$value)

#5)-----------------------------------------------------------------------------
#tempo de vida x horas segue uma distribuicao desconhecida, uma amostra foi 
  #retirada para estudo
bd=read.csv('dadosex5.csv')
ggplot(bd, aes(x))+geom_histogram()
#exponencial

#media do tempo de falha
(media=sum(bd$x)/nrow(bd))
(media=mean(bd$x))

#prob de falha apos 2 horas
1-pexp(2,1/media)#1/media pq é a taxa

#falhar antes de 5 horas
pexp(5,1/media)

#grafico ajustado
bd$prob=dexp(bd$x,1/media)
ggplot(bd, aes(x))+geom_histogram(aes(y=..density..),fill='orange')+
  geom_line(aes(x,prob),col='red')

#6)-----------------------------------------------------------------------------
