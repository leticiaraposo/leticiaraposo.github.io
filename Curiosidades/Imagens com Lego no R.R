##%######################################################%##
#                                                          #
####         CRIANDO IMAGENS NO R COM LEGO              ####
####         Todo tutorial foi baseado em               ####
####     https://www.littlemissdata.com/blog/rlego      ####
####   e http://www.ryantimpe.com/post/lego-mosaic3/    ####
#                                                          #
##%######################################################%##


#### INSTALANDO OS PACOTES NECESSÁRIOS ####

# install.packages("devtools")
# devtools::install_github("ryantimpe/brickr")
# install.packages("jpeg")
# install.packages("rayshader")

#### CARREGANDO OS PACOTES ####
library(jpeg)
library(brickr)
library(rayshader)

#### LEGO ####

mosaic1 <- readJPEG("C:/Users/Leticia/Desktop/IMG_3933.jpg") %>% #Basta colocar entre aspas o caminho da imagem a ser transformada
  scale_image(150) %>%
  legoize() %>% 
  collect_bricks() 

mosaic1 %>% display_set()

#### LEGO EM 3D ####

mosaic1 %>% 
  collect_3d(highest_el='dark') %>% 
  display_3d(fov=0,theta=-30,phi=40,windowsize=c(1000,800),zoom=0.8)
render_snapshot()
