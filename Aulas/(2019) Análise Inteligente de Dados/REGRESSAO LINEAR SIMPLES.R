##%######################################################%##
#                                                          #
####              REGRESSÃO LINEAR SIMPLES              ####
#                                                          #
##%######################################################%##

# Definindo o diretório
setwd("C:\\Users\\Leticia\\Google Drive\\Curso Ministrados\\(2020) Análise Inteligente de Dados")

# Lendo os dados
dados <- read.table("C:\\Users\\Leticia\\Google Drive\\Curso Ministrados\\(2020) Análise Inteligente de Dados\\dadosRLS.txt", header = T)
str(dados) # estrutura dos dados

# Variável resposta: felicidade
# Variável explicativa: renda

### Pré-processamento dos dados ###

# Diagnóstico dos dados
# install.packages("dlookr")
library(dlookr)
diagnose(dados)
diagnose_numeric(dados)
# summary(dados)
desc <- describe(dados)

# Identificação de outliers
diagnose_outlier(dados)
plot_outlier(dados)

# Relatório de diagnóstico
diagnose_report(dados)

# Avaliação das variáveis numéricas
normality(dados)
plot_normality(dados)

library(rcompanion)
plotNormalHistogram(dados$felicidade)

# Correlação das variáveis numéricas
correlate(dados)

# Gráficos 
plot(felicidade ~ renda, data = dados)

scatter.smooth(dados$renda, dados$felicidade, main = "Felicidade ~ Renda")

library(ggplot2)

ggplot(dados, aes(renda, felicidade)) +
  geom_point() +
  stat_smooth(method = lm)

# Divisão em treinamento e teste
set.seed(123)
library(caret)
training.samples <- createDataPartition(dados$felicidade, p = 0.7, list = FALSE)
train.data  <- dados[training.samples, ]
test.data <- dados[-training.samples, ]

# Vamos usar agora os dados de treinamento

### Modelagem ###

mod <- lm(felicidade ~ renda, data = train.data)
mod
summary(mod)

# Call: mostra a chamada de função usada para calcular o modelo de regressão.
# Residuals: fornece uma visão rápida da distribuição dos resíduos, que por definição 
# têm média igual a zero. Portanto, a mediana não deve estar longe de zero e o mínimo 
# e o máximo devem ser aproximadamente iguais em valor absoluto.
# Coefficients: mostra os coeficientes beta de regressão e sua significância estatística.
# Variáveis preditoras, significativamente associadas à variável resposta, são marcadas
# por asteriscos.
# Erro padrão residual (RSE), coeficiente de determinação (R2) e estatística F são
# métricas usadas para verificar quão bem o modelo se ajusta aos nossos dados.
# A primeira etapa na interpretação da análise de regressão é examinar a 
# estatística F e o valor p associado, na parte inferior do resumo do modelo.

summary(mod)$coef

# Para uma variável preditora, a estatística t avalia se existe ou não associação 
# significativa entre o preditor e a variável resposta, ou seja, se o coeficiente beta
# do preditor é significativamente diferente de zero.
# O coeficiente (Beta1) pode ser interpretado como o efeito médio em y de um aumento de 
# uma unidade da variável preditora, mantendo todos os outros preditores fixos 
# (no caso de mais de um preditor).

### Qualidado do ajuste ###

# A qualidade geral do ajuste de regressão linear pode ser avaliada usando:
# Erro padrão residual (RSE)
# R ao quadrado (R2) e R2 ajustado
# Estatística F

# Erro padrão residual (RSE): correspondente ao erro de predição, representa 
# aproximadamente a diferença média entre os valores de y observados e os valores 
# previstos pelo modelo. Quanto menor o RSE, melhor o modelo se ajusta aos nossos dados.

summary(mod)$sigma

# Dividir o RSE pelo valor médio da variável resposta fornecerá a taxa de erro
# de predição, que deve ser a menor possível.
# Em nosso exemplo, o RSE =  0.7074125, significando que os valores observados divergem 
# dos valores previstos em aproximadamente 0.70 em média.
# Isso corresponde a uma taxa de erro de 0.7074125/média(train.data$felicidade) = 21%, 
# o que é baixo.

# R ao quadrado e R ao quadrado ajustado: R2 varia de 0 a 1 e representa a 
# proporção de variação na variável resposta que pode ser explicada pela(s) variável(is) 
# preditiva(s) do modelo.

summary(mod)$adj.r.squared

# O R2 mede como o modelo se ajusta aos dados. Quanto maior o R2, melhor o modelo. 
# No entanto, um problema com o R2 é que ele sempre aumentará quando mais variáveis 
# forem adicionadas ao modelo, mesmo que essas variáveis estejam apenas fracamente 
# associadas ao resultado. Uma solução é ajustar o R2 levando em consideração o número
# de variáveis preditoras.
# Portanto, você deve considerar principalmente o R ao quadrado ajustado, que é um R2 
# penalizado para um número maior de preditores.
# Um R2 (ajustado) próximo a 1 indica que uma grande proporção da variabilidade na 
# variável resposta foi explicada pelo modelo de regressão.
# Um número próximo de 0 indica que o modelo de regressão não explicou grande parte 
# da variabilidade da variável resposta.

# Estatística F: fornece a significância geral do modelo. Ele avalia se pelo menos uma
# variável preditora possui um coeficiente diferente de zero (na regressão múltipla).

anova(mod)

# Em uma regressão linear simples, esse teste não é realmente interessante, pois apenas
# duplica as informações fornecidas pelo teste t, disponíveis na tabela de coeficientes.
# A estatística F se torna mais importante quando começamos a usar múltiplos preditores,
# como na regressão linear múltipla.
# Uma estatística F grande corresponde a um valor p estatisticamente significativo 
# (p <0,05). 

### Diagnóstico do modelo ###

# Linearidade dos dados
# Verificada por meio da inspeção do gráfico Residuals vs Fitted

# Idealmente, o gráfico não mostrará nenhum padrão, com a linha vermelha 
# aproximadamente horizontal e próxima do zero. 
# A presença de um padrão pode indicar um problema com algum aspecto do modelo linear.
# Se o gráfico residual indicar uma relação não linear nos dados, 
# pode-se tentar transformações não lineares do(s) preditor(es), como log(x), sqrt(x) e x^2.

plot(mod, 1)

# Normalidade de resíduos

# O gráfico QQ de resíduos pode ser usado para verificar visualmente a suposição de 
# normalidade. O gráfico deve seguir aproximadamente uma linha reta.

plot(mod, 2)

# Homogeneidade de variância

# Verificada examinando o gráfico Scale-Location.
# Esse gráfico mostra se os resíduos são distribuídos igualmente ao longo dos 
# intervalos do preditor. O ideal é observar uma linha horizontal com pontos 
# igualmente dispersos.

# Uma solução possível para reduzir o problema da heterocedasticidade é 
# usar uma transformação de log ou raiz quadrada da variável resposta (y).

plot(mod, 3)

# Valores influentes

# Sua inclusão ou exclusão pode alterar os resultados da análise de regressão. 
# Esse valor está associado a um grande resíduo.
# Nem todos os outliers são influentes na análise de regressão linear.
# Distância de Cook: define influência como uma combinação de alavancagem e 
# tamanho residual.
# Se uma observação tem alta influência, a distância de Cook excederá 4/(n-p-1), 
# em que n é o número de observações e p o número de variáveis preditoras.

# O gráfico Residuals vs Leverage pode nos ajudar a encontrar observações influentes,
# se houver. Nesse gráfico, os valores que irão influenciar na regressão geralmente 
# estão localizados no canto superior direito ou no canto inferior direito. 

plot(mod, 4)
plot(mod, 5)

# Outliers e pontos de alta alavancagem

# Outlier: ponto que possui um valor de variável resposta extremo.
# A presença de outliers pode afetar a interpretação do modelo, pois aumenta o RSE.
# (Residual Standard Error)
# Os valores extremos podem ser identificados examinando o resíduo padronizado.
# Os resíduos padronizados podem ser interpretados como o número de erros padrão 
# afastados da linha de regressão.
# Observações cujos resíduos padronizados são maiores que 3 em valor absoluto são 
# possíveis discrepantes.

# Ponto de alta alavancagem: um ponto de dados tem alta alavancagem se tiver valores
# extremos do preditor x. Isso pode ser detectado examinando a estatística de 
# alavancagem. Um valor dessa estatística acima de 2(p + 1)/n indica uma observação 
# com alta alavancagem, em que p é o número de preditores e n é o número de observações.

# Outliers e pontos de alta alavancagem podem ser identificados 
# inspecionando o gráfico Residuals vs Leverage.

plot(mod, 5)

# Pacote extra para análise de resíduos

library(gvlma)
gvmodel <- gvlma(mod)
summary(gvmodel)

# Global Stat - Os relacionamentos entre seus preditores X e Y são aproximadamente 
# lineares? A rejeição de H0 (p<0,05) indica uma relação não linear entre um ou mais 
# dos seus X e Y.
# Skewness - Sua distribuição é inclinada positiva ou negativamente, 
# necessitando de uma transformação para atender à suposição de normalidade? 
# A rejeição de H0 (p<0,05) indica que você provavelmente deve transformar seus dados.
# Kurtosis - A sua distribuição é kurtótica (com um pico muito alto ou muito 
# baixo), necessitando de uma transformação para atender à suposição de 
# normalidade? A rejeição de H0 (p<0,05) indica que você provavelmente deve transformar
# seus dados.
# Link Function - Sua variável dependente é verdadeiramente contínua (no caso
# da regressão linear)? A rejeição de H0 (p<0,05) indica que você deve usar uma
# forma alternativa do modelo linear generalizado.
# Heteroscedasticity - A variação dos resíduos do seu modelo é constante no 
# intervalo de X (suposição de homoscedastidade)? A rejeição de H0 (p<0,05) indica 
# que seus resíduos são heterocedásticos e, portanto, não constantes em toda a 
# faixa de X. Seu modelo é melhor/pior na previsão de certas faixas de X.

plot.gvlma(gvmodel)

### Predições ###
pred <- predict(mod, test.data)

### Desempenho do modelo ###

# Erro de predição - RMSE (Root Mean Squared Error):
# Representa a diferença média entre os valores de y conhecidos observados 
# nos dados de teste e os valores de y previstos pelo modelo. 
# Quanto menor o RMSE, melhor o modelo.

library(DMwR)
regr.eval(test.data$felicidade, pred)

# mae: erro absoluto médio
# mse: erro quadrático médio
# rmse: raiz quadrada do erro quadrático médio
# mape: erro percentual absoluto médio (medida relativa)

### Exportando a tabela do modelo ###

library(sjPlot)
tab_model(mod)



