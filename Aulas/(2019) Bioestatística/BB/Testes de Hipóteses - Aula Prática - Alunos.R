##%######################################################%##
#                                                          #
####                TESTES DE HIPÓTESES                 ####
#                                                          #
##%######################################################%##

#### Teste t ####

# Dados
peso_mulher <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 48.8, 48.5)
peso_homem <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 62.4) 
# Criando o banco de dados
dados <- data.frame( 
  grupo = rep(c("Mulher", "Homem"), each = 9),
  peso = c(peso_mulher,  peso_homem)
)

#-----------------------------------------------------------------------#

#### Teste de Mann-Whitney ####

# Banco de Dados
str(TitanicSurvival)

#-----------------------------------------------------------------------#

#### Teste t pareado ####

# Peso antes do tratamento
antes <- c(200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2, 185.5, 205.2, 193.7)
# Peso após o tratamento
depois <- c(392.9, 393.2, 345.1, 393, 434, 427.9, 422, 383.9, 392.3, 352.2)
# Criando o banco de dados
dados2 <- data.frame( 
  grupo = rep(c("antes", "depois"), each = 10),
  peso = c(antes, depois)
)

#-----------------------------------------------------------------------#

#### Teste de Wilcoxon ####



#-----------------------------------------------------------------------#

#### ANOVA de um fator ####

# Banco de dados
str(iris)

library(RVAideMemoire)
byf.shapiro(Sepal.Width ~ Species, data = iris)




#-----------------------------------------------------------------------#

#### Kruskal-Wallis ####





#-----------------------------------------------------------------------#
