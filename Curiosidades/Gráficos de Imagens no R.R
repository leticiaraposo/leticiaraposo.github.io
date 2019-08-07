##%######################################################%###
#                                                           #
####           CRIANDO IMAGENS DE PONTOS NO R            ####
####            Este tutorial foi baseado em             ####
#### https://www.littlemissdata.com/blog/lmd-loves-cloud ####
#                                                           #
##%######################################################%###

#### ETAPAS PRÉVIAS #### 

# 1) Crie uma foto e converta para svg com qualquer ferramenta. Sugestão: http://pngtosvg.com/
# 2) Converta o svg em coordenadas de dados csv: https://spotify.github.io/coordinator/
# 3) Salve o csv

#### INSTALANDO OS PACOTES NECESSÁRIOS #### 
# install.packages("data.table")
# install.packages("ggplot2")

#### CARREGANDO OS PACOTES #### 

library(data.table)
library(ggplot2)

#### IMPORTANDO OS DADOS #### 

df= fread('C:/Users/Leticia/Downloads/coordinator (1).csv', stringsAsFactors = FALSE)

summary(df)
dim(df)
attach(df)

#### GRÁFICO #### 

# Gráfico de dispersão básico
p <-ggplot(df, aes(x=x, y=y)) +
  geom_point(colour = '#006699', size = 0.05) 
p

# Invertendo a escala
p <-p +  scale_y_reverse() 
p

# Tornando-o mais bonito
p +  
  theme(panel.background = element_rect(fill = 'white')) +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.position="none",
        panel.background=element_blank(),
        panel.border=element_blank(),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        plot.background=element_blank())
