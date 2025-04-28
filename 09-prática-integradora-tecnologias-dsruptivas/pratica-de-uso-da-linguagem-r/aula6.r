#chamando bibliotecas
install.packages("ggplot2") #para fazer gráficos
install.packages("dplyr")

#fim das chamadas da biblioteca

#ativando bibliotecas
library(ggplot2)
library(dplyr)

#carregar dados
saude_df <- read.csv("saude_data.csv")
logistica_df <- read.csv("logistica_data.csv")
terceiro_setor_df <- read.csv("terceiro_setor_data.csv")

#para ver se funciona precisamos invocar o nome que demos:
saude_df$Data <- as.Date(saude_df$Data)
logistica_df$Data <- as.Date(logistica_df$Data)
terceiro_setor_df$Data <- as.Date(terceiro_setor_df$Data)

#O $ sigifica atribuição, menção. as.Date: Convertendo esse dado para o tipo data 
#de calendário