##%######################################################%##
#                                                          #
####                   GRÁFICO LOLLIPOP                 ####
#                                                          #
##%######################################################%##
# Adaptado de: 
# https://www.r-graph-gallery.com/301-custom-lollipop-chart.html#horiz

# Um gráfico Lollipop é basicamente um gráfico de barras, 
# onde a barra é transformada em uma linha e um ponto. 

# Pacote necessário
# Caso não o tenha instalado, faça isso com o comando install.packages("ggplot2")
library(ggplot2)

# Criando os dados 
# Cada letra do alfabeto receberá uma valor positivo aleatório
dados <- data.frame(
  letra = LETTERS[1:26], 
  valor = abs(rnorm(26))
)
head(dados) # vendo as 6 primeiras linhas do conjunto de dados

# Gráfico
p <-
  ggplot(dados, aes(x = letra, y = valor)) + # informando quem será x e quem será y
  geom_point(color = "dodgerblue4") + # inserindo os pontos e definindo a cor
  geom_segment(aes( # inserindo os segmentos
    x = letra, # valor inicial do segmento para x
    xend = letra, # valor final do segmento para x
    y = 0, # valor inicial do segmento para y
    yend = valor # valor final do segmento para y
  ), color = "deepskyblue3") + # cor
  labs(title = "Gráfico Lollipop") + # título
  xlab("Letra") + # Nome do eixo x
  ylab("Valor") # Nome do eixo y

p

# Salvando o gráfico
ggsave("lollipop.png", plot = p)
