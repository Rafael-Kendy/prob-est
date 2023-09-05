CalculaImc=function(peso, altura){
  round(peso/(altura)^2, 2)
}#CalculaImc

dados_ex=read.csv('Ex1.csv', sep=';', dec=',')
dados_ex

dados_ex$imc=CalculaImc(dados_ex$peso, dados_ex$altura)
dados_ex

dados_ex$class=ifelse(dados_ex$imc<19, "Baixo", "Normal")
dados_ex
