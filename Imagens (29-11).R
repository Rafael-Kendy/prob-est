#codigo full copiado
#parte de mexer com as imagem---------------------------------------------------
install.packages('OpenImageR')
library(OpenImageR) #instalar

#lendo imagem TUDO
tudo=readImage("tudo2.jpg")
imageShow(tudo)
dim(tudo) #linhas x colunas x matrix(R, G, B)
2261*1624 #cada matriz

#pega so uma parte da image
#imagem[Linha,Coluna,Matrix]
tudo2=tudo #nao perder original, backup
tudo2[,1:1000,3]=0 #zerar blue colunas
imageShow(tudo2)

tudo2[850:1350,,2]=0 #zerar B,G colunas
imageShow(tudo2)

tudo2[,1:1000,1]=0 #zerar R,G,B colunas
imageShow(tudo2)

#parte da matriz----------------------------------------------------------------
#lendo imagem verde
verde=readImage('verde.png')
imageShow(verde)

#lendo imagem ruim
ruim=readImage('ruim.png')
imageShow(ruim)

#lendo imagem fundo
fundo=readImage('folha.png')
imageShow(fundo)

#so pra ver o tamanho da matriz
dim(verde)
336*437

#(R, G, B)
c(verde[,,1])
length(c(verde[,,1]))
mverde=cbind(c(verde[,,1]),
             c(verde[,,2]),
             c(verde[,,3]))

dim(mverde)

mfundo=cbind(c(fundo[,,1]),
             c(fundo[,,2]),
             c(fundo[,,3]))

mruim=cbind(c(ruim[,,1]),
            c(ruim[,,2]),
            c(ruim[,,3]))

#exemplo de 4 amostra (nd a ver com a imagem)
sample(1:5,4)

dim(mverde)
dim(mfundo)
dim(mruim)
#vai do comeco ao fim, pegando 10k no verde/fundo e 5k no ruim
mverde=mverde[sample(1:146832,10000),]
dim(mverde)
mfundo=mfundo[sample(1:196900,10000),]
mruim=mruim[sample(1:49776,5000),]
dim(mruim)

#base de dados de verdade-------------------------------------------------------
#arrumando dados (0=fundo, 1=verde, 2=queimado)
cbind(mfundo,0)
cbind(mverde,1)
cbind(mruim,2)

dados=rbind(cbind(mfundo,0),cbind(mverde,1),cbind(mruim,2))
head(dados)
colnames(dados)=c("R","G","B",'Y')
head(dados)
dim(dados)

#random forest------------------------------------------------------------------
install.packages("randomForest")
library(randomForest)
modelo=randomForest(as.factor(Y)~R+G+B,data=dados)
print(modelo)
importance(modelo)

#predicao imagem tudo
mtudo=cbind(c(tudo[,,1]),
            c(tudo[,,2]),
            c(tudo[,,3]))

head(mtudo)
colnames(mtudo)=c('R',"G","B")
head(mtudo) #(0=fundo, 1=verde, 2=ferrugem)

pred=predict(modelo,newdata = mtudo)
table(pred)
table(as.numeric(pred)) #transforma numero
pred=as.numeric(pred)-1 #voltar ao original
table(pred)
#soma 1 e 2, pra planta td, divide 2 por isso pra porcentagem de ferrugem

ncol(tudo[,,3]) #quantas colunas original
mpred=matrix(pred,ncol=1624)
imageShow(mpred)
imageShow(tudo)

#(0=fundo, 1=verde, 2=queimado)
tudo2=tudo
tudo2[,,][pred==2]=1
imageShow(tudo2)

tudo2=tudo
tudo2[,,][pred==1]=0.5
imageShow(tudo2)

tudo2[,,][pred==0]=0
imageShow(tudo2)

