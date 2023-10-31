#1.-----------------------------------------------------------------------------
#intervalo de confiança para altura, 7% significancia, histograma da variavel
#com a media e os limites
bd1=read.csv('ex1-3110.csv', sep=',', dec='.')
bd1
t.test(bd1$altura, conf.level=0.93)

install.packages("ggplot2")
library(ggplot2)

ggplot(bd1, aes(altura))+geom_histogram(fill='orange')+
  geom_vline(xintercept=mean(bd1$altura), col='red')+
  geom_vline(xintercept=c(18.64731,20.19142), col='blue')


#2.-----------------------------------------------------------------------------
#200 equip, uns funfa outros nao, estimativa de quebrados, e proporçao de
#confiança com significancia de 3%
(bd2=read.csv('ex2-3110.csv', sep=',', dec='.'))
table(bd2$amostra)
prop.test(107,200,conf.level=0.97)


#3.-----------------------------------------------------------------------------
#da pra falar q a vdd media é menor q 21, considerando significancia 5%, 
#histograma e com o limite superior
#H0: media=21
#H1: media<21
t.test(bd1$altura, alternative='less', mu=21, conf.level=0.95)
#p-value=0.000185 < alfa=0.05, rejeita H0, entao a media é menor q 21
ggplot(bd1, aes(altura))+geom_histogram(bins=10,fill='orange')+
  geom_vline(xintercept=20.11849, col='blue')


#4.-----------------------------------------------------------------------------
#ex2 pode falar q a prop de equip quebrado é diferente de 60%, conf de 98%
#H0: prop=0.6
#H1: prop!=0.6
prop.test(107, 200, alternative='two.side', p=0.6, conf.level=0.98)
#p-value=0.0712 > alfa=0.02, entao nao rejeita nem afirma nada


#5.-----------------------------------------------------------------------------
#box plot comparando o resultado, qual é mais resistente, significancia de 94%
(bd5=read.csv('ex5-3110.csv', sep=',', dec='.'))
t.test(bd5$temperaturaA, conf.level=0.06)
t.test(bd5$temperaturaB, conf.level=0.06)
#B é mais resistente
(var=c(rep('a',60),rep('b',60)))
(plotbd=data.frame(var=var, res=c(bd5$temperaturaA,bd5$temperaturaB)))
#ou
as.data.frame(rbind(cbind(bd5$temperaturaA, 'a'), cbind(bd5$temperaturaB, 'b')))
ggplot(plotbd, aes(x=var, y=res, fill=var))+geom_boxplot()
       
       
