##%######################################################%##
#                                                          #
####                     MEMES NO R                     ####
#                                                          #
##%######################################################%##

# Mostra as tirinhas com conteúdo da palavra escrita entre parênteses
searchXKCD("math")
getXKCD(539)

# Meme
# install.packages("meme")
library(meme)
u <- system.file("angry8.jpg", package = "meme")
meme(u, "code", "all the things!")