##%######################################################%##
#                                                          #
####           INSTALANDO OS PACOTES INICIAIS           ####
####           NECESSÁRIOS PARA A DISCIPLINA            ####
#                                                          #
##%######################################################%##


# Se aparecer a pergunta para atualizar outros pacotes, digite 3 (None).

install.packages("devtools")

# Addin para colocar palavras em maiúsculo/minúsculo
devtools::install_github("strboul/caseconverter")

# Addin para converter tipo da variável e juntar bancos de dados
devtools::install_github("sarupurisailalith/commonUtilAddins")

# Addin para filtrar dados
devtools::install_github("kieranjmartin/viewenhance")

# Addin para escolher cores
install.packages("colourpicker")

# Addin para montar gráficos
install.packages("esquisse")

# Addin para editar detalhes do gráfico
install.packages("ggThemeAssist")

# Addin para acrescentar gráficos marginais
install.packages("ggExtra")

# Addin para converter tipo da variável, ordem dos fatores e criar intervalos de classe 
install.packages("questionr")