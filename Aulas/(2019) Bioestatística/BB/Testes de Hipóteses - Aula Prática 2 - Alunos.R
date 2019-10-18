##%######################################################%##
#                                                          #
####                TESTES DE HIPÓTESES                 ####
#                                                          #
##%######################################################%##

# Pacote novo para exportar gráficos
library(export)

#### Teste qui-quadrado ####

# Dados
dados <- read.csv("https://goo.gl/j6lRXD")
str(dados)
# treatment: fez tratamento ou não
# improvement: teve melhora ou não

# Gráfico



# Tabela


# Teste


#-----------------------------------------------------------------------#

#### Teste exato de Fisher ####

# Banco de Dados
library(MASS)  
data("survey")
# Exer: Frequência que os estudantes se exercitam
# Smoke: quantos estudantes fumam.

# Gráfico


# Tabela


# Teste


#-----------------------------------------------------------------------#

#### Teste de correlação de Pearson ####

data("mtcars")
# mpg: milhas por galão.
# dist: peso (1000 lbs).

# Avaliando a normalidade


# Gráfico


# Teste


#-----------------------------------------------------------------------#

#### Teste de correlação de Spearman ####

data("muscle")
# Conc: concentração da solução de cloreto de cálcio, em múltiplos de 2,2 mM.
# Length: mudança no comprimento (encurtamento) da tira, (supostamente) em mm.

# Avaliando a normalidade


# Gráfico


# Teste


#-----------------------------------------------------------------------#

