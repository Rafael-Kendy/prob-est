base_dados=read.csv('dados_plot.csv', sep=',', dec='.')
base_dados

names(base_dados)
names(base_dados)=c('linha', 'empresa', 'rendimento', 'tamanho', 'vendas', 'palavra', 'free_palavra')
head(base_dados)

#tabela com a quantidade de empresas para cada tipo
table(base_dados$empresa)

#tabela que faz a media de rendimento para cada tipo de empresa
#tapply(com oq vai calcular, pelo q vai separar, qual o calculo)
tapply(base_dados$rendimento, base_dados$empresa, mean)
#desvio padrao
tapply(base_dados$rendimento, base_dados$empresa, sd)

install.packages("ggplot2")
library(ggplot2)

#grafico de barras-------------------------------------------------------------

#so o grafico vazio
ggplot(base_dados, aes(x=empresa))

#+ barra pros valor e conta(nao precisa de y)
ggplot(base_dados, aes(x=empresa))+geom_bar()

#+ inverte x com y
ggplot(base_dados, aes(x=empresa))+geom_bar()+coord_flip()

#coloca cor + legenda
ggplot(base_dados, aes(x=empresa, fill=empresa))+geom_bar()

#coloca label nos eixo e nome
ggplot(base_dados, aes(x=empresa, fill=empresa))+geom_bar()+
  labs(title='Nome', x='Empresa', y='Total')

#muda a cor (Dark2, PuOr, Greys, Paired, Set1, Set2, Set3)
ggplot(base_dados, aes(x=empresa, fill=empresa))+geom_bar()+
  scale_fill_brewer(palette='Dark2')

#tema de fundo
ggplot(base_dados, aes(x=empresa, fill=empresa))+geom_bar()+
  scale_fill_brewer(palette='Paired')+theme_dark()

#cor por tamanho
ggplot(base_dados, aes(x=empresa, fill=tamanho))+geom_bar()+coord_flip()+
  scale_fill_brewer(palette='Paired')+theme_get()

#divide o grafico em algo (tamanho nesse caso)
ggplot(base_dados, aes(x=empresa, fill=tamanho))+geom_bar()+
  scale_fill_brewer(palette='Paired')+theme_get()+facet_wrap(~tamanho)

#grafico com pontos------------------------------------------------------------
ggplot(base_dados, aes(rendimento, vendas))+geom_point()+geom_smooth()

#cor por tipo de empresa
ggplot(base_dados, aes(rendimento, vendas, col=empresa))+geom_point()

#cor e smooth
ggplot(base_dados, aes(rendimento, vendas, col=empresa))+geom_point()+
  geom_smooth()

#remove desvio
ggplot(base_dados, aes(rendimento, vendas, col=empresa))+geom_point()+
  geom_smooth(se=F)

#tendencia por empresa
ggplot(base_dados, aes(rendimento, vendas, col=empresa))+geom_point()+
  geom_smooth(se=F)+facet_wrap(~empresa)

#histograma--------------------------------------------------------------------
#pra valor mto exato (continuo), tipo altura
#grafico de barra com intervalo
ggplot(base_dados, aes(rendimento))+geom_histogram()

#muda o intervalo com o numero de grupos que eu quero
ggplot(base_dados, aes(rendimento))+geom_histogram(bins=5)

#muda cor geral
ggplot(base_dados, aes(rendimento))+geom_histogram(bins=5, fill='orange')

#muda cor por dado
ggplot(base_dados, aes(rendimento))+geom_histogram(aes(fill=empresa), bins=5)+
  scale_fill_brewer(palette='Paired')

#grafico de densidade----------------------------------------------------------
#por porcentagem, tipo pegar o histograma e meter uma linha media 
ggplot(base_dados, aes(rendimento))+geom_density()

#cor por tipo
ggplot(base_dados, aes(rendimento))+geom_density(aes(fill=empresa))

#transparencia
ggplot(base_dados, aes(rendimento))+geom_density(aes(fill=empresa), alpha=0.55)

#boxplot-----------------------------------------------------------------------
#valor continuo, linha eh a mediana, ponto sao valores atipicos, cada parte eh
#25%, linha, caixa ate mediana, caixa dps da mediana, resto da linha
ggplot(base_dados, aes(y=rendimento))+geom_boxplot()

#por empresa
ggplot(base_dados, aes(x=empresa, y=rendimento))+geom_boxplot()

#cor
ggplot(base_dados, aes(x=empresa, y=rendimento, fill=empresa))+geom_boxplot()

#compara por tamanho
ggplot(base_dados, aes(x=empresa, y=rendimento, fill=empresa))+geom_boxplot()+
  facet_wrap(~tamanho)+scale_fill_brewer(palette='Paired')

#violino-----------------------------------------------------------------------
#tipo histograma, mistura de boxplot com densidade(deitado)
ggplot(base_dados, aes(x=empresa, y=rendimento, fill=empresa))+geom_violin()+
  scale_fill_brewer(palette='Paired')

#tamanho
ggplot(base_dados, aes(x=empresa, y=rendimento, fill=empresa))+geom_violin()+
  scale_fill_brewer(palette='Paired')+facet_wrap(~tamanho)

#grafico de folhas-------------------------------------------------------------
install.packages('treemapify')
library(treemapify)

table(base_dados$empresa)

(dados1=as.data.frame(table(base_dados$empresa)))
(names(dados1)=c('empresa', 'freq'))

ggplot(dados1, aes(area=freq, fill=empresa))+geom_treemap()

#faz combinacoes entre duas vaiaveis, tamanho e empresa, ex: a.pequeno, b.grande. a.medio e tals
#e salva em base_dados
(base_dados$interacao=interaction(base_dados$tamanho, base_dados$empresa))

#faz a media do rendimento pelo tipo da empresa, transforma em base de dados e salva em dados2
(dados2=as.data.frame(tapply(base_dados$rendimento, base_dados$interacao, mean)))
(names(dados2)='total')
#ate aqui os tipos de empresa e coisa da tabela, nao variavel, tem q mudar isso

#transforma o nome das linhas em variaveis
(dados2$nomes=labels(dados2)[[1]])
dados2

ggplot(dados2, aes(area=total, fill=nomes))+geom_treemap()+
  scale_fill_brewer(palette='Paired')

#nuvem de letras---------------------------------------------------------------
dados3=base_dados[,6:7]
dados3

install.packages('wordcloud2')
library(wordcloud2)

wordcloud2(data=dados3, size=1.6)

#pontos e linhas---------------------------------------------------------------
install.packages('gganimate')
library(gganimate)

install.packages('gifski')
library(gifski)

install.packages('png')
library(png)

graf=ggplot(base_dados, aes(x=rendimento, vendas, col=empresa))+geom_line()+
  geom_point()
graf

graf_anim=graf+transition_reveal(rendimento)
#se mandar um graf_anim n funfa, so renderiza tds os frame em png
animate(graf_anim, renderer=gifski_renderer())
