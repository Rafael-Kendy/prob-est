#Base de dados-----------------------------------------------------------------
(idade=c(18,20,23,25)) #quantitativa - discreta
(sexo=c('M', 'F', 'F', 'M')) #qualitativa - nominal

(dados=data.frame(idade, sexo))

#Escreve e le o arq (escreveu na mao msm)
dados_lidos=read.csv('Dados.csv', sep=";", dec = ',') #nome, separado, decimal
dados_lidos

#Acessa variavel
dados_lidos$idade #pega a coluna
dados_lidos$idade+5

#Adiciona uma variavel na tabela
dados_lidos$classe=c('a','a','b','b') #onde, nome, valor
dados_lidos

#Informacao dados
dim(dados_lidos) #dimensao
names(dados_lidos) #nomes das variavel
head(dados_lidos, 2) #mostra tantas linhas do comeco
tail(dados_lidos, 2) #mostra tantas linhas do fim

dados_lidos[1,2] #pega um dado especifico (linha, coluna)
dados_lidos[1,]
dados_lidos[,2]
dados_lidos[1:3,2]
dados_lidos[4, 3]='c'
dados_lidos

#Condicao----------------------------------------------------------------------
ifelse(dados_lidos$idade<=20, "jovem", "tmj")
dados_lidos$idade

dados_lidos$tipo=ifelse(dados_lidos$idade<=20, "jovem", "tmj")
dados_lidos$tipoteste=c(ifelse(dados_lidos$idade<=20, "jovem", "tmj"))
dados_lidos
