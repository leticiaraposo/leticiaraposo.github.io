##%######################################################%##
#                                                          #
####                     MEMES NO R                     ####
#                                                          #
##%######################################################%##

# Mostra as tirinhas com conteúdo da palavra escrita entre parênteses
# install.packages("RXKCD")
library("RXKCD")
searchXKCD("math")
getXKCD(539)

# Meme
# install.packages("memery")
library("memery")

web <- "https://pbs.twimg.com/media/CQLIvUKW8AA2Olu.jpg"

txt <- c("Senhora, senhora?", "Já ouviu falar do R?")
memery::meme(web, txt, "senhora.png")
