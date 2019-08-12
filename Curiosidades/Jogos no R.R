##%######################################################%##
#                                                          #
####                     JOGOS NO R                     ####
#                                                          #
##%######################################################%##

# install.packages("fun")
library(fun)

# Teste neurológico
alzheimer_test()

# Gomuku - O vencedor é o primeiro jogador a obter uma linha ininterrupta de cinco pedras na horizontal, vertical ou diagonal.
gomoku()


# Por padrão, os quadrados brancos no gráfico denotam as luzes que estão acesas, e as pretas as que estão acesas. 
# Quando você clica em uma luz, esta luz, assim como os quatro vizinhos, mudará o status. Sua missão é desligar todas as luzes.

if (interactive()) {
  if (.Platform$OS.type == "windows")
    x11() else x11(type = "Xlib")
  lights_out()
}

# Campo minado 
# Clique no botão esquerdo do mouse para cavar em uma área e no botão direito para marcar ou desmarcar a área com bandeiras.
if (interactive()) {
  if (.Platform$OS.type == "windows")
    x11() else x11(type = "Xlib")
  mine_sweeper()
}

# Enigma deslizante
if (interactive()) {
  if (.Platform$OS.type == "windows")
    x11() else x11(type = "Xlib")
  sliding_puzzle()
}