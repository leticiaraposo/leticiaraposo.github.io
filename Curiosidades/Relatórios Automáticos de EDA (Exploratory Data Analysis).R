##%######################################################%##
#                                                          #
####           ANÁLISE EXPLORATÓRIA DOS DADOS           ####
####     PACOTES PARA GERAR RELATÓRIOS AUTOMÁTICOS      ####
#                                                          #
##%######################################################%##

#### Banco de dados usado como exemplo ####
data(iris)

##%######################################################%##
#                                                          #
####                   PACOTE DLOOKR                    ####
#                                                          #
##%######################################################%##

# install.packages("dlookr")
library(dlookr)
eda_report(iris, "Species", output_format = "html")

##%######################################################%##
#                                                          #
####                PACOTE DATAEXPLORER                 ####
#                                                          #
##%######################################################%##

# install.packages("DataExplorer")
library(DataExplorer)
create_report(iris)

##%######################################################%##
#                                                          #
####                  PACOTE DATAMAID                   ####
#                                                          #
##%######################################################%##

# install.packages("dataMaid")
library(dataMaid)
makeDataReport(iris)

