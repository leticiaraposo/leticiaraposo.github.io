##%######################################################%##
#                                                          #
####                TESTES DE HIPÓTESES                 ####
#                                                          #
##%######################################################%##

# Pacote novo para exportar gráficos
library(export)

#### Teste t ####

# Dados
peso_mulher <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 48.8, 48.5)
peso_homem <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 62.4) 
# Criando o banco de dados
dados <- data.frame( 
  grupo = rep(c("Mulher", "Homem"), each = 9),
  peso = c(peso_mulher,  peso_homem)
)

# Gráfico

library(ggplot2)

ggplot(dados) +
 aes(x = "", y = peso, fill = grupo) +
 geom_boxplot() +
 scale_fill_hue() +
 labs(x = " ", y = "Peso", fill = "Grupo") +
 theme_minimal()

# Avaliando a normalidade
library(RVAideMemoire)
byf.shapiro(peso ~ grupo, data = dados)

# Avaliando a homocedasticidade
library(car)
leveneTest(peso ~ grupo, data = dados)

t.test(peso ~ grupo, data = dados, var.equal = T, alternative = "greater")
#-----------------------------------------------------------------------#

#### Teste de Mann-Whitney ####

# Banco de Dados
data(TitanicSurvival)
str(TitanicSurvival)

# Gráfico

library(ggplot2)

ggplot(TitanicSurvival) +
 aes(x = "", y = age, fill = survived) +
 geom_boxplot() +
 scale_fill_hue() +
 labs(x = " ", y = "Idade", fill = "Sobreviveu") +
 theme_minimal()

# Avaliando a normalidade
library(RVAideMemoire)
byf.shapiro(age ~ survived, data = TitanicSurvival)

wilcox.test(age ~ survived, data = TitanicSurvival)
#-----------------------------------------------------------------------#

#### Teste t pareado ####

# Peso antes do tratamento
antes <- c(200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2, 185.5, 205.2, 193.7)
# Peso após o tratamento
depois <- c(392.9, 393.2, 345.1, 393, 434, 427.9, 422, 383.9, 392.3, 352.2)
# Criando 
dados2 <- data.frame( 
  grupo = rep(c("antes", "depois"), each = 10),
  peso = c(antes, depois)
)

# Gráfico

library(ggplot2)

ggplot(dados2) +
 aes(x = "", y = peso, fill = grupo) +
 geom_boxplot() +
 scale_fill_hue() +
 labs(x = " ", y = "Peso", fill = "Grupo") +
 theme_minimal()

# Avaliando a normalidade
library(RVAideMemoire)
byf.shapiro(peso ~ grupo, data = dados2)

t.test(peso ~ grupo, data = dados2, paired = T)
#-----------------------------------------------------------------------#

#### Teste de Wilcoxon ####
wilcox.test(peso ~ grupo, data = dados2)
#-----------------------------------------------------------------------#

#### ANOVA de um fator ####

# Banco de dados
data(iris)
str(iris)

# Gráfico

library(ggplot2)

ggplot(iris) +
 aes(x = "", y = Sepal.Width, fill = Species) +
 geom_boxplot() +
 scale_fill_hue() +
 labs(x = " ", y = "Largura da Sépala", fill = "Espécie") +
 theme_minimal()

library(RVAideMemoire)
byf.shapiro(Sepal.Width ~ Species, data = iris)

# Avaliando a homocedasticidade

library(car)
leveneTest(Sepal.Width ~ Species, data = iris)

anova <- aov(Sepal.Width ~ Species, data = iris)
summary(anova)

# Teste de Tukey
TukeyHSD(anova, "Species")
#-----------------------------------------------------------------------#

#### Kruskal-Wallis ####

# Gráfico

library(ggplot2)

ggplot(iris) +
 aes(x = "", y = Petal.Width, fill = Species) +
 geom_boxplot() +
 scale_fill_hue() +
 labs(x = " ", y = "Largura da Pétala", fill = "Espécie") +
 theme_minimal()

# Avaliando a normalidade
library(RVAideMemoire)
byf.shapiro(Petal.Width ~ Species, data = iris)

kruskal.test(Petal.Width ~ Species, data = iris)

# Teste de Nemenyi
library(PMCMR)
posthoc.kruskal.nemenyi.test(Petal.Width ~ Species, data = iris)
#-----------------------------------------------------------------------#

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
# dist: peso (1000 lbs).

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
cor.test(mtcars$wt, mtcars$mpg)

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
cor.test(muscle$Conc, muscle$Length, method = "spearman")

#-----------------------------------------------------------------------#


