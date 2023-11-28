library(datasets)

data("iris")
head(iris)
table(iris$Species)

install.packages("ggplot2")
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, col=Species))+geom_point()
#--------------------------------------------------------------------------
install.packages("randomForest")
library(randomForest)

modelo=randomForest(Species~Petal.Length, data=iris)
predict(modelo)
table(predict(modelo),iris$Species)
#ver oq acertou/errou lado a lado
cbind(predict(modelo),iris$Species)
#acertos
diag(table(predict(modelo),iris$Species))
#quant de acertos
sum(diag(table(predict(modelo),iris$Species)))
#porcentagem de acertos total
sum(diag(table(predict(modelo),iris$Species)))/sum(table(predict(modelo),iris$Species))
sum(diag(table(predict(modelo),iris$Species)))/length(iris$Species)
#% por especie
diag(table(predict(modelo),iris$Species))/table(iris$Species)

cores=ifelse(iris$Species==predict(modelo),iris$Species,'erro')
iris$cores=cores
ggplot(iris, aes(Petal.Length, Petal.Width, col=cores))+geom_point()
#--------------------------------------------------------------------------
#usando tds
data("iris")
head(iris)

m=randomForest(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris)
#pega todos
m=randomForest(Species~., data=iris)
table(iris$Species,predict(m))
sum(diag(table(predict(m),iris$Species)))/length(iris$Species)
#--------------------------------------------------------------------------
#divide a data, pra ficar um parte pra treino(construir) e o resto testar
set.seed(222)
split=sample(2,nrow(iris), replace=T, prob=c(0.7,0.3))
split
train<-iris[split==1,]
test<-iris[split==2,]

m=randomForest(Species~., data=train)
sum(diag(table(predict(m, newdata=test), test$Species)))/length(test$Species)

importance(m)
varImpPlot(m, sort=T, main="Importance")