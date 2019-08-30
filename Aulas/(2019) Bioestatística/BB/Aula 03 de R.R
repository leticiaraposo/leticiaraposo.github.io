# Estatística Descritiva Bivariada

## Variáveis Qualitativa x Qualitativa

# Vamos avaliar as variáveis Sex e Survived como exemplo.

### Tabela de distribuição de frequências

#total, com estatística qui-quadrado
ctable(Titanic$Sex, Titanic$Survived, prop = "t", chisq = T) 
#perfil linha, com estatística qui-quadrado
ctable(Titanic$Sex, Titanic$Survived, prop = "r", chisq = T) 
#perfil coluna, sem estatística qui-quadrado
ctable(Titanic$Sex, Titanic$Survived, prop = "c", chisq = F) 

### Gráficos

#Gráfico de barras múltiplas

library(ggplot2)

ggplot(Titanic) +
 aes(x = Survived, fill = Sex) +
 geom_bar(position = "dodge") +
 scale_fill_viridis_d(option = "viridis") +
 labs(x = "Sobreviveu", y = "Frequência", 
      title = "Sobrevivência dos passageiros segundo o sexo", fill = "Sexo") +
 theme_minimal()

#Gráfico de barras empilhadas
ggplot(Titanic) +
 aes(x = Survived, fill = Sex) +
 geom_bar(position = "fill") +
 scale_fill_viridis_d(option = "viridis") +
 labs(x = "Sobreviveu", y = "Frequência relativa", 
      title = "Sobrevivência dos passageiros segundo o sexo", fill = "Sexo") +
 theme_minimal()


## Variáveis Quantitativa x Quantitativa

# Vamos avaliar as variáveis Age e Fare como exemplo.

### Correlação

cor(Titanic$Age, Titanic$Fare, use = "complete.obs")

### Gráficos

library(ggplot2)

ggplot(Titanic) +
 aes(x = Age, y = Fare) +
 geom_point(size = 1.7, colour = "#0c4c8a") +
 geom_smooth(span = 0.75) +
 labs(x = "Idade", y = "Tarifa", title = "Tarifa paga e idade") +
 theme_minimal()


## Variáveis Quantitativa x Qualitativa

### Medidas-resumo

# Vamos avaliar a variável quantitativa **Age** segundo o desfecho **Survived** como exemplo:

with(Titanic, stby(Age, Survived, descr))

### Gráficos

library(ggplot2)

# Histograma
ggplot(Titanic) +
 aes(x = Age, fill = Survived) +
 geom_histogram(bins = 30L) +
 scale_fill_hue() +
 labs(x = "Idade", y = "Frequência", 
      title = "Histograma das idades segundo o desfecho de sobrevivência", 
      fill = "Sobrevivência") +
 theme_minimal()

# Gráfico de densidades
ggplot(Titanic) +
 aes(x = Age, fill = Survived) +
 geom_density(adjust = 1L) +
 scale_fill_hue() +
 labs(x = "Idade", y = "Densidade", 
      title = "Gráfico de densidades das idades segundo o desfecho de sobrevivência", 
      fill = "Sobrevivência") +
 theme_minimal()

# Boxplot
ggplot(Titanic) +
 aes(x = "", y = Age, fill = Survived) +
 geom_boxplot() +
 scale_fill_hue() +
 labs(y = "Idade", title = "Boxplot das idades segundo o desfecho de sobrevivência", 
      fill = "Sobrevivência") +
 theme_minimal()

#Gráfico de violino
ggplot(Titanic) +
 aes(x = "", y = Age, fill = Survived) +
 geom_violin(adjust = 1L, scale = "area") +
 scale_fill_hue() +
 labs(y = "Idade", 
      title = "Gráfico de violino das idades segundo o desfecho de sobrevivência", 
      fill = "Sobrevivência") +
 theme_minimal()

