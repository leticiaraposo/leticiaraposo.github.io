# AULA 01 - R
# Feito em sala de aula

3*sqrt(54) # sqrt - funcao raiz
?sqrt # ? Pede ajuda
help(sqrt) # Guia de ajuda de determinada funcao do R. Colocar a funcao entre () 
getwd() # Informa o diretorio
setwd("C:/Users/Leticia/Downloads") # Muda o diretorio
getwd() # Verificar de novo para ver se mudou
data("iris") # Abre banco de dados do R
iris # Depois de carregado, pode-se abrir o banco no console
names(iris) # Informa quais sao as variaveis do banco de dados
iris$Sepal.Length # Seleciona as observacoes de uma variavel especifica
iris$Sepal.Length[1:10] # Seleciona um intervalo especifico
iris[1:10,] # 10 linhas, mas todas as colunas
iris2 <- iris[1:10,] # Novo banco de dados. Símbolo <- significa atribuicao
iris3 <- iris[1:10,c(1,3)] # Selecionar colunas pontuais - usa-se concatenar c()
iris4 <- iris[c(1:10,20,30), c(1,3)] # [linha, coluna]
str(iris) # Abre a estrutura do banco para verificar se as variaveis estao codificadas de forma correta
