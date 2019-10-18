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

library(ggplot2)

p1 <- ggplot(dados) +
 aes(x = treatment, fill = improvement) +
 geom_bar(position = "fill") +
 scale_fill_hue() +
 labs(x = "Tratamento", y = "Frequência relativa", fill = "Melhora") +
 theme_minimal()
graph2ppt(p1, "qui-quadrado.ppt") #export para PowerPoint

# Tabela
table(dados$treatment, dados$improvement)

# Teste
chisq.test(dados$treatment, dados$improvement)

#-----------------------------------------------------------------------#

#### Teste exato de Fisher ####

# Banco de Dados
library(MASS)  
data("survey")
# Exer: Frequência que os estudantes se exercitam
# Smoke: quantos estudantes fumam.

# Gráfico

# Mudando a ordem das categorias
survey$Exer <- factor(survey$Exer, levels = c("None", "Some", "Freq"))
survey$Smoke <- factor(survey$Smoke, levels = c("Never", "Occas", "Regul", "Heavy"))

survey <- survey %>%
 filter(!is.na(Exer)) %>%
 filter(!is.na(Smoke))

library(ggplot2)

p2 <- ggplot(survey) +
 aes(x = Exer, fill = Smoke) +
 geom_bar(position = "fill") +
 scale_fill_hue() +
 labs(x = "Execícios", y = "Frequência Relativa", fill = "Fumo") +
 theme_minimal()
graph2pdf(p2, "fisher.pdf") #exporta para PDF

# Tabela
table(survey$Exer, survey$Smoke)

# Teste
fisher.test(survey$Exer, survey$Smoke)

#-----------------------------------------------------------------------#

#### Teste de correlação de Pearson ####

data("mtcars")
# mpg: milhas por galão.
# wt: peso (1000 lbs).

# Avaliando a normalidade
shapiro.test(mtcars$mpg)
shapiro.test(mtcars$wt)

# Gráfico

library(ggplot2)

p3 <- ggplot(mtcars) +
 aes(x = wt, y = mpg) +
 geom_point(size = 2L, colour = "#0c4c8a") +
 geom_smooth(span = 1L) +
 labs(x = "Peso", y = "Milhas por galão") +
 theme_minimal()
graph2doc(p3, "pearson.doc") #exporta para Word

# Teste
cor.test(mtcars$wt, mtcars$mpg, alternative = "less")

#-----------------------------------------------------------------------#

#### Teste de correlação de Spearman ####

data("muscle")
# Conc: concentração da solução de cloreto de cálcio, em múltiplos de 2,2 mM.
# Length: mudança no comprimento (encurtamento) da tira, (supostamente) em mm.

# Avaliando a normalidade
shapiro.test(muscle$Conc)
shapiro.test(muscle$Length)

# Gráfico

library(ggplot2)

p4 <- ggplot(muscle) +
  aes(x = Conc, y = Length) +
  geom_point(size = 2L, colour = "#0c4c8a") +
  geom_smooth(span = 0.75) +
  labs(x = "Concentração da solução de cloreto de cálcio, em múltiplos de 2,2 mM.", y = "Mudança no comprimento (encurtamento) da tira, (supostamente) em mm.") +
  theme_minimal()
graph2png(p4, "spearman.png") #exporta para o formato de imagem

# Teste
cor.test(muscle$Conc, muscle$Length, method = "spearman", alternative = "grater")

#-----------------------------------------------------------------------#

