#Invervalo de confianca
bd=read.csv('ex1-2410.csv', sep=',', dec='.')
bd
t.test(bd$tamanho, conf.level=0.95)
t.test(bd$tamanho, conf.level=0.99)
t.test(bd$tamanho, conf.level=1)


prop.test(8, 20, conf.level=0.95)
prop.test(12, 20, conf.level=0.95)
