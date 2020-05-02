##%######################################################%##
#                                                          #
####             REGRESSÃO LINEAR MÚLTIPLA              ####
#                                                          #
##%######################################################%##

# Definindo o diretório
setwd("C:\\Users\\Leticia\\Google Drive\\Cursos Ministrados\\(2020) Análise Inteligente de Dados")

# Carregando os dados 
data("Boston", package = "MASS")
??Boston
str(Boston)

# Variável resposta: medv
# Variáveis explicativas: as demais

### Pré-processamento dos dados ###

# Diagnóstico dos dados
# install.packages("dlookr")
library(dlookr)
diagnose(Boston)
diagnose_numeric(Boston)
# summary(Boston)
desc <- describe(Boston)

# Identificação de outliers
diagnose_outlier(Boston)
plot_outlier(Boston)

# Relatório de diagnóstico
diagnose_report(Boston)

# Avaliação das variáveis numéricas
normality(Boston)
plot_normality(Boston)

library(rcompanion)
plotNormalHistogram(Boston$medv)

# Correlação das variáveis numéricas
correlate(Boston)
plot_correlate(Boston)

# Divisão em treinamento e teste
set.seed(123)
library(caret)
training.samples <- createDataPartition(Boston$medv, p = 0.7, list = FALSE)
train.data  <- Boston[training.samples, ]
test.data <- Boston[-training.samples, ]

# Vamos usar agora os dados de treinamento

### Modelagem ###

# Modelo 1
mod1 <- lm(medv ~ ., data = train.data)
mod1
summary(mod1)

# A primeira etapa na interpretação da análise de regressão é examinar a 
# estatística F e o valor p associado, na parte inferior do resumo do modelo.

# F-statistic: 78.15 on 13 and 342 DF,  p-value: < 2.2e-16

# Isso significa que, pelo menos, uma das variáveis preditivas está significativamente 
# relacionada à variável resposta.

# Para ver quais variáveis preditivas são significativas, é possível examinar a tabela de
# coeficientes, que mostra a estimativa dos coeficientes beta de regressão e os valores p 
# da estatística t associada.

round(summary(mod1)$coef, 2)

# Para uma dada variável preditora, o coeficiente (b) pode ser interpretado como o efeito 
# médio em y de um aumento de uma unidade na variável preditiva, mantendo todos os outros 
# preditores fixos.

# Usando outro pacote
library(olsrr)
mod_ols <- ols_regress(medv ~ ., data = train.data)
mod_ols

# Como as variáveis indus e age não são significativas, é possível removê-la do modelo

# Modelo 2
mod2 <- lm(medv ~ crim + chas + zn + nox + rm + dis + rad + 
             tax + ptratio + black + lstat, data = train.data)
# mod2 <- lm(medv ~. - indus - age, data = Boston)
summary(mod2)

# Intervalo de confiança
confint(mod2)

# Outra forma de selecionar variáveis
step(mod1, direction = "backward") # baseado no AIC
ols_step_both_p(mod1) # adiciona e remove
ols_step_backward_aic(mod1) # remove
ols_step_forward_aic(mod1) # adiciona
# testa <- ols_step_all_possible(mod2) # Testa todas as regressões com uma, duas, três... variáveis explicativas
# plot(testa)

### Qualidado do ajuste ###

# Erro padrão residual (RSE)
sigma(mod2)

# R ao quadrado ajustado
summary(mod2)$adj.r.squared

### Diagnóstico do modelo ###

plot(mod2, 1) # não linearidade - padrão de U
plot(mod2, 2) # não normalidade - problemas nas extremidados
plot(mod2, 3) # heterocedasticidade - padrão de U
plot(mod2, 4) # pontos influentes
plot(mod2, 5) # pontos de alavancagem

# Diagnóstico do pacote gvlma
library(gvlma)
gvmodel <- gvlma(mod2)
summary(gvmodel)

# Diagnóstico do pacote olsrr
ols_plot_diagnostics(mod2)

ols_plot_comp_plus_resid(mod2) # linearidade para cada preditor
ols_plot_resid_fit(mod2) # linearidade, homocedasticidade, outliers

ols_plot_response(mod2) # variável resposta
ols_plot_resid_qq(mod2) # normalidade

ols_plot_resid_lev(mod2) # pontos de alavancagem e outliers
ols_plot_dffits(mod2) # pontos influentes
ols_plot_cooksd_bar(mod2) # distância de Cook / outliers

ols_plot_obs_fit(mod2) # ajustados vs observados

acf(mod2$residuals) # autocorrelação dos resíduos (a partir do lag 2 deveria estar entre as linhas azuis)

### Multicolinearidade ###

car::vif(mod2) # remover valores acima de 5 (ou 10)

cor(Boston$rad, Boston$tax) # correlação entre rad e tax

# Removendo a variável tax

# Modelo 3
mod3 <- lm(medv ~ crim + zn + chas + nox + rm + dis + rad +
             ptratio + black + lstat, data = Boston)
summary(mod3) 
car::vif(mod3)

### Modificações mais profundas ###

Boston2 <- Boston

library(dlookr)
plot_normality(Boston2)

# Aplicando sqrt na variável resposta
Boston2$medv2 <- transform(Boston2$medv, method = "sqrt")

library(rcompanion)
plotNormalHistogram(Boston2$medv)
plotNormalHistogram(Boston2$medv2)

Boston2$medv <- NULL

# Divisão em treinamento e teste
set.seed(123)
library(caret)
training.samples2 <- createDataPartition(Boston2$medv2, p = 0.7, list = FALSE)
train.data2  <- Boston2[training.samples2, ]
test.data2 <- Boston2[-training.samples2, ]

# Modelo 4
mod4 <- lm(medv2 ~., data = train.data2)
summary(mod4)

# Modelo 5
mod5 <- step(mod4)
summary(mod5)

# Diagnóstico
ols_plot_diagnostics(mod5)
plot(mod5)

library(gvlma)
gvmodel5 <- gvlma(mod5)
summary(gvmodel5)

# Removendo tax
car::vif(mod5)
mod6 <- lm(medv2 ~ crim + zn + chas + nox + rm + dis + rad +
  ptratio + black + lstat, data = Boston2)
summary(mod6)

### Predições ###
pred1 <- predict(mod1, test.data) 
pred2 <- predict(mod2, test.data) 
pred3 <- predict(mod3, test.data) 
pred4 <- predict(mod4, test.data2) 
pred5 <- predict(mod5, test.data2) 
pred6 <- predict(mod6, test.data2)

### Desempenho do modelo ###

# Erro de predição - RMSE (Root Mean Squared Error):
# Representa a diferença média entre os valores de y conhecidos observados 
# nos dados de teste e os valores de y previstos pelo modelo. 
# Quanto menor o RMSE, melhor o modelo.

library(DMwR)
regr.eval(test.data$medv, pred1)
regr.eval(test.data$medv, pred2)
regr.eval(test.data$medv, pred3)
regr.eval(test.data2$medv2^2, pred4^2) # voltando para os valores originais
regr.eval(test.data2$medv2^2, pred5^2)
regr.eval(test.data2$medv2^2, pred6^2)

# mae: erro absoluto médio
# mse: erro quadrático médio
# rmse: raiz quadrada do erro quadrático médio
# mape: erro percentual absoluto médio (medida relativa)

### Exportando a tabela do modelo ###

library(sjPlot)
tab_model(mod6)





