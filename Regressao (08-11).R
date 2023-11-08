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

#Ex3----------------------------------------------------------------------------
(bd3=read.csv('dados3-0811.csv', sep=',', dec='.'))

install.packages('labeling')
install.packages('GGally')
library(GGally)

ggpairs(bd3)
modelo=gamlss(tempo~km+pb(chuva),data=bd3)
#viu q temp nao afeta, entao tira
#modelo=gamlss(tempo~km+temperatura+pb(chuva),data=bd3)
#Ex q facilita pra varios q seja linear: gamlss(tempo~.,data=bd3)
term.plot(modelo)
summary(modelo)
plot(modelo)
modelo$mu.fv

#outro jeito de ver se ta certo
(d=as.data.frame(cbind(modelo$mu.fv,bd3$tempo)))
ggplot(d, aes(V2,V1))+geom_point()+geom_smooth()
#ou bd3$ajuste=modelo$mu.fv
#ggplot(bd3, aes(tempo,ajuste))+geom_point()+geom_smooth()

#previsao pra algum tanto especifico
(dados=data.frame(km=35, chuva=82))
predict(modelo, newdata=dados)

#Exc 1--------------------------------------------------------------------------
bd=read.csv('house_price-0811.csv', sep=',', dec='.')
head(bd)

ggpairs(bd)
names(bd)=c("idade","distancia","lojas","latitude","longitude","preco")
m=gamlss(preco~pb(idade)+distancia+lojas+pb(latitude)+pb(longitude),data=bd)
term.plot(m)
summary(m)

bd
bd$ajuste=m$mu.fv
ggplot(bd, aes(preco,ajuste))+geom_point()+geom_smooth()

#Parada extra pra latitude e longitude
library(leaflet)
library(sp)
library(sf)

bd$classe=ifelse(bd$idade<=25,'nova','velha')

lon = bd$longitude
lat = bd$latitude

leaflet() %>%
  addTiles() %>%
  addCircles(lng=lon[bd$classe=='nova'], lat=lat[bd$classe=='nova'],color = 'red')%>%
  addCircles(lng=lon[bd$classe=='velha'], lat=lat[bd$classe=='velha'],color = 'blue')
