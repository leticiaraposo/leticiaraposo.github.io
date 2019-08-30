# Estatistica Descritiva Univariada 

# Processamento dos dados

## Lendo os dados

setwd("C:/Users/Leticia/Google Drive/UNIRIO/Disciplinas Ministradas/2019.2/Biologia - Biomedicina")
Titanic <- read.table("Titanic.txt", header = T)

## Vendo as primeiras/últimas linhas do banco e suas dimensões

head(Titanic) #ver as primeiras linhas do banco
tail(Titanic) #ver as últimas linhas do banco
dim(Titanic) #ver as dimensões do banco

str(Titanic) #ver a estrutura dos dados - bom para ver se as variáveis foram lidas corretamente

## Removendo variáveis

#colocando os nomes dos passageiros como 
# nome das linhas
rownames(Titanic) <- Titanic$Name 
Titanic$Name <- NULL
Titanic$PassengerId <- NULL
Titanic$Ticket <- NULL
Titanic$Cabin <- NULL

## Codificando corretamente as variáveis

Titanic$Survived <- as.factor(Titanic$Survived) #de numérica para fator
Titanic$Pclass <- as.factor(Titanic$Pclass) #de numérica para fator
str(Titanic) #revendo se elas ficaram corretas

## Removendo categorias

#removendo as linhas em que a variável Embarked possui ""
Titanic <- droplevels(Titanic[Titanic$Embarked != "",]) 
str(Titanic) #vendo se está tudo ok

## Vendo um resumo dos dados 

summary(Titanic) #mostra um resumo

# install.packages("summarytools")
library(summarytools)
dfSummary(Titanic)

# Estatística Descritiva Univariada

## Variável Qualitativa

# Vamos avaliar a variável Sex como exemplo.

### Tabela de distribuição de frequências

# freq(Titanic) #faria de todas as variáveis
freq(Titanic$Sex)

### Gráficos

#Gráfico de barras

library(ggplot2)

ggplot(Titanic) +
 aes(x = Sex) +
 geom_bar(fill = "#0c4c8a") +
 labs(x = "Sexo", y = "Frequência", title = "Sexo dos passageiros do Titanic") +
 theme_minimal()

#Gráfico de setores
pie(table(Titanic$Sex), main = "Sexo dos passageiros do Titanic")

## Variável Quantitativa

### Medidas-resumo

# Vamos avaliar a variável quantitativa Age como exemplo:

# descr(Titanic)
descr(Titanic$Age)

# Mean: média   
# Std.Dev: desvio-padrão    
# Min: mínimo   
# Q1: 1o quartil     
# Median: mediana    
# Q3: 3o quartil    
# Max: máximo    
# MAD: desvio médio absoluto    
# IQR: intervalo interquartílico    
# CV: coeficiente de variação (não está multiplicado por 100)     
# Skewness: assimetria    
# SE.Skewness: erro padrão da assimetria    
# Kurtosis: curtose     
# N.Valid: número de observações válidas   
# Pct.Valid: porcentagem de observações válidas    

# Moda
# install.packages("DescTools")
library(DescTools)
Mode(Titanic$Age, na.rm = T)

# Quantis
quantile(Titanic$Age, c(.25, .50, .75), na.rm = T)

### Gráficos

library(ggplot2)

# Histograma
ggplot(Titanic) +
 aes(x = Age) +
 geom_histogram(bins = 30L, fill = "#0c4c8a") +
 labs(x = "Idade", y = "Frequência", title = "Idade dos passageiros do Titanic") +
 theme_minimal()

# Gráfico de densidades
ggplot(Titanic) +
 aes(x = Age) +
 geom_density(adjust = 1L, fill = "#0c4c8a") +
 labs(x = "Idade", y = "Frequência", title = "Idade dos passageiros do Titanic") +
 theme_minimal()

# Boxplot
ggplot(Titanic) +
 aes(x = "", y = Age) +
 geom_boxplot(fill = "#0c4c8a") +
 labs(x = "Idade", y = "Frequência", title = "Idade dos passageiros do Titanic") +
 theme_minimal()

# Gráfico de violino
ggplot(Titanic) +
 aes(x = "", y = Age) +
 geom_violin(adjust = 1L, scale = "area", fill = "#0c4c8a") +
 labs(x = "Idade", y = "Frequência", title = "Idade dos passageiros do Titanic") +
 theme_minimal()

