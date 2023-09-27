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
