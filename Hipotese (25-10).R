#Media--------------------------------------------------------------------------
#Uma amostra de 30 produtos foi obtida para que o tamanho médio desses sejam
#avaliados (ex1.csv)
bd1=read.csv('ex1-2510.csv', sep=',', dec='.')
bd1

#Teste, considerando um nível de significância 6%, se a média do tamanho desses 
#produtos é diferente de 20.
#H0: media=20, H1: media!=20
t.test(bd1$tamanho, alternative='two.side', mu=20, conf.level=0.94)
#p-value=0.004265 < alfa=0.06, entao nao é igual a 20

#Teste, considerando um nível de significância 4%, se a média do tamanho desses
#produtos é menor de 18.
#H0: media=18, H1: media<18
t.test(bd1$tamanho, alternative='less', mu=18, conf.level=0.96)
#p-value=0.6046 > alfa=0.04, nao rejeita H0, entao nao fala nada

#Teste, considerando um nível de significância 3%, se a média do tamanho desses
#produtos é maior de 16.
#H0: media=16, H1: media>16
t.test(bd1$tamanho, alternative='greater', mu=16, conf.level=0.97)
#p-value=0.0005309 < alfa=0.03, entao nao é igual a 16

#Proporcao----------------------------------------------------------------------
#Uma amostra de 50 objetos foi obtida para avaliar as proporções de produtos 
#que apresentaram falhas, observando 24 defeitos

#Teste, considerando um nível de significância 2%, se a proporção de falhas é
#diferente de 50%.
#H0: prop=0.5, H1: prop!=0.5
prop.test(24, 50, alternative='two.side', p=0.5, conf.level=0.98)

#Teste, considerando um nível de significância 6%, se a proporção de falhas é
#menor de 65%.
#H0: prop=0.65, H1: prop<65
prop.test(24, 50, alternative='less', p=0.65, conf.level=0.94)

#Media 2 amostras---------------------------------------------------------------
#Suponha que duas amostras foram obtidas, uma para cada marca de fabricantes de
#tijolos (ex2.csv), para comparar as resistências desses
(bd2=read.csv('ex2-2510.csv', sep=',', dec='.'))

#Teste, considerando um nível de significância 5%, se as resistências médias 
#são iguais ou diferentes
#H0: a-b=0, H1: a-b!=0
t.test(bd2$a, bd2$b, alternative='two.side', conf.level=0.95)
#p-value=0.008341 < alfa=0.05, entao nao é igual

#Teste, considerando um nível de significância 5%, se a resistência de A é menor 
#que a resistência de B
#H0: a-b=0, H1: a-b<0
t.test(bd2$a, bd2$b, alternative='less', conf.level=0.95)
#p-value=0.9958 > alfa=0.05, nao rejeita H0, entao nao afirma H1

#Teste, considerando um nível de significância 5%, se a resistência de A é 
#MAIOR que a resistência de B
#H0: a-b=0, H1: a-b>0
t.test(bd2$a, bd2$b, alternative='greater', conf.level=0.95)
#p-value=0.004171 < alfa=0.05, rejeita H0, entao a>b

#Proporcao 2 amostras-----------------------------------------------------------
#Duas amostras de duas marcas de equipamentos foram obtidas, com o objetivo de 
#realizar comparações entre as mesmas. Os resultados foram:
#A= 20 falhas entre 50 B=30 falhas entre 80

#Teste, considerando um nível de significância 5%, se a proporção de falhas de
#A é igual ou diferente da proporção de falhas de B
#H0: p1-p2=0, H1: p1-p2!=0
prop.test(c(20,30), c(50,80), alternative='two.side', conf.level=0.95)
#p-value = 0.9205 > alfa=0.05, nao rejeita H0, entao nao afirma H1

#Media 2 dependente-------------------------------------------------------------
#O teor alcoólico (g/ml) de 50 cervejas foram avaliados antes e após a 
#aplicação de um novo método de produção (ex3.csv
(bd3=read.csv('ex3-2510.csv', sep=',', dec='.'))

#Teste, considerando um nível de significância 5%, se o teor alcoólico
#alterou após a aplicação do método
#H0: m1-m2=0, H1: m1-m2!=0
t.test(bd3$antes, bd3$apos, alternative='two.side', conf.level=0.95, paired=T)
#p-value<2.2e-16 < alfa=0.05, rejeita H0