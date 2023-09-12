install.packages("ggplot2")
library(ggplot2)

dados_vinho=read.csv('winequality-all2.csv', sep=';', dec='.')
names(dados_vinho)

names(dados_vinho)=c('acidez_fixa', 'acidez_volatil', 'acido_citrico', 'acucar_residual', 
                     'cloretos', 'dioxido_de_enxofre_livre','dioxido_de_enxofre_total', 
                     'densidade', 'pH', 'sulfatos', 'alcool', 'qualidade', 'tipo')
head(dados_vinho)



#QUANTIDADE DE QUALIDADES
ggplot(dados_vinho, aes(x=qualidade))+geom_bar()+
  labs(title='Ex 1.', x='Qualidade', y='Quantidade')



#QUANTIDADE DE QUALIDADES, APRESENTANDO O TIPO NAS BARRAS
ggplot(dados_vinho, aes(x=qualidade, fill=tipo))+geom_bar()+
  labs(title='Ex 2.', x='Qualidade', y='Quantidade')+scale_fill_brewer(palette='Paired')



#EXISTE RELAÇÃO ENTRE DIÓXIDO DE ENXOFRE TOTAL E DIÓXIDO DE
#   ENXOFRE LIVRE (TOTAL.SULFUR.DIOXIDE , FREE.SULFUR.DIOXIDE)?
#   CONSIDERE O TIPO DE VINHO NA ANÁLISE
ggplot(dados_vinho, aes(x=dioxido_de_enxofre_total, y=dioxido_de_enxofre_livre, col=tipo))+
  geom_point()+geom_smooth()



#APRESENTE AS MÉDIAS DO TEOR DE ÁLCOOL POR QUALIDADE
media_alcool=as.data.frame(tapply(dados_vinho$alcool, dados_vinho$qualidade, mean))
media_alcool
media_alcool$qualidade=labels(media_alcool)[[1]]
(names(media_alcool)=c('media', 'qualidade'))
media_alcool
ggplot(media_alcool, aes(x=qualidade, y=media, fill=qualidade))+geom_col()+scale_fill_brewer(palette='Paired')+
  labs(title='Ex 4.', x='Qualidade', y='Média do teor de álcool')



#HISTOGRAMA DO TEOR DE ÁLCOOL
ggplot(dados_vinho, aes(alcool))+geom_histogram(aes(fill=tipo))+
  scale_fill_brewer(palette='Paired')+
  labs(title='Ex 5.', x='Teor de álcool', y='Quantidade')



#BOXPLOT DOS PHS POR QUALIDADE DO VINHO
#fazer isso pra qualidade pra mudar de numero pra caractere
ggplot(dados_vinho, aes(as.factor(qualidade), pH, fill=qualidade))+geom_boxplot()
