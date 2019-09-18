##%######################################################%##
#                                                          #
####                Rostos de Chernoff                ####
#                                                          #
##%######################################################%##

# install.packages("aplpack")
library(aplpack)

respostas <- read.delim("C:/Users/Leticia/Desktop/respostas.txt")

respostas$curso <- as.numeric(respostas$curso)
respostas$r <- as.numeric(respostas$r)
respostas$estatistica <- as.numeric(respostas$estatistica)
str(respostas)

faces(respostas)
