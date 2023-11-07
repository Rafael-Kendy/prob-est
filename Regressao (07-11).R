#-------------------------------------------------------------------------------
library(ggplot2)

x=runif(100,5,80)
y=10+6*x+rnorm(100,0,20)
dados=data.frame(x,y)

library(manipulate)
manipulate(plot(1:x), x = slider(5, 10))
a=10
b=6
manipulate(
  ggplot(dados,aes(x,y))+geom_point()+
    geom_abline(slope =b ,intercept = a,col='red')+
    annotate(geom = 'text',x=20,y=500,label='y=a+bx'),
  a=slider(0, 50), b=slider(0, 15)
)

#Ex1 ---------------------------------------------------------------------------
(bd1=read.csv('dados1-0711.csv', sep=',', dec='.'))
library(ggplot2)
ggplot(bd1, aes(x=km, y=tempo))+geom_point()+geom_smooth(se=F)

library(gamlss)
#esse -1 é pra começar em 0 msm, fica sem a linha Intercept
modelo=gamlss(tempo~km-1,data=bd1) #modelo
#Mu Coefficients:
#cada 1 km o tempo aumenta em 1.98833 (q é a inclinação da reta, Estimate x km)
#Extimate x Intercept: a(y=a+bx), e o x km é o b
#Pr(>|t|) x km é o p-valor
summary(modelo) #resumo
#é tipo o tempo teorico, isso - o real é o erro
modelo$mu.fv #medidas ajustadas
term.plot(modelo) #efeitos
#Density Estimate: gráfico com os erros, tem q ter media 0
#Normal Q-Q Plot: density só q com reta, tem q passar pelas bolinha
plot(modelo) #residuos

#Ex2----------------------------------------------------------------------------
(bd2=read.csv('dados2-0711.csv', sep=',', dec='.'))
ggplot(bd2, aes(x=km, y=tempo))+geom_point()+geom_smooth(method='lm',se=F)

modelo=gamlss(tempo~pb(km),data=bd2)
#ignora os coeficiente pb
summary(modelo)
modelo$mu.fv
#usa esse pra interpreta
term.plot(modelo)
plot(modelo)

km=c(1:10)
(dados=data.frame(km))
predict(modelo, newdata=dados)
