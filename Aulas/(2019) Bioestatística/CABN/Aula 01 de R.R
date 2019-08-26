# Aula 1 de R
# 23/08/2019

getwd() # verificar o diretorio atual
setwd("C:/Users/Leticia/Desktop") # definir o diretorio

data(iris) # carrega banco de dados do R
iris

iris[1,] # pega a primeira linha
iris[1:10,] # pega da primeira à décima linha
iris[c(1,10,20,50),] # pega as linhas 1, 10, 20 e 50

iris[,1] # pega a primeira coluna
iris[,1:3] # pega as colunas de 1 a 3
iris[,c(1,3)] # pega as colunas 1 e 3

iris2 <- iris[1:50, c(1,3)] # pega as primeiras 50 linhas e as colunas 1 e 3

iris3 <- iris[iris$Species == "versicolor",] # pega todas as linhas que possuem a classe versicolor em Species

str(iris) # vê a estrutura dos dados 
iris$Species # vê a variável Species

write.table(iris3, "dados_iris3.txt") # salva o banco iris3 em um documento de texto

bancoiris3 <- read.table("C:/Users/Leticia/Desktop/dados_iris3.txt", header = TRUE) # lê o banco de dados contido no arquivo dados_ireis3.txt
