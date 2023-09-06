install.packages('gganimate')
library(gganimate)
install.packages('gifski')
library(gifski)
install.packages('png')
library(png)

install.packages('gapminder')
library(gapminder)
#pelo jeito e uma base de dados feita ja
head(gapminder)

ggplot(gapminder, aes(gdpPercap, lifeExp))+geom_point()+theme_bw()

#cor por continente
ggplot(gapminder, aes(gdpPercap, lifeExp, col=continent))+geom_point()+theme_bw()

#tamanho ponto de acordo com a populacao
ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, col=continent))+geom_point()+
  theme_minimal()

#muda nome dos eixo
ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, col=continent))+geom_point()+
  theme_minimal()+labs(title='Ano:{frame_time}', x='Renda per capita', y='Expectativa de vida')

#animar
grafico=ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, col=continent))+geom_point()+
  theme_bw()+labs(title='Ano:{frame_time}', x='Renda per capita', y='Expectativa de vida')+
  transition_time(year)

animate(grafico, renderer=gifski_renderer())
