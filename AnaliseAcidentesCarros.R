# Não use diretórios com espaço no nome
setwd('/home/fernando/FCDDataScience/FCD/BIGDATARAZURE/Estudo/PoliciaFederalAcidentes')
getwd()
#Aprendendo como trabalhar com arquivos
#Acessando Arquivos do tipo CSV para manipulação
#Material Estudo
#View(AV1)https://analisereal.com/2017/02/07/data-frames/
install.packages("readr")
install.packages("ggplot2")
install.packages("stringr")
install.packages("dplyr")
install.packages("lubridate")
#dplyr
library(readr)
library(ggplot2)
library(stringr)
library(abjutils)
library(dplyr)
library(lubridate)
av <- read.csv2(file = "acidentes2018_todas_causas_tipos.csv", header = TRUE, sep = ";", stringsAsFactors = FALSE, encoding = "latin1")
#View(av)
#class(av)
#str(av)

#removendo Colunas do Data frame regional delegacia uop

av$delegacia <- NULL
av$regional <- NULL
av$uop <- NULL
av$marca <- NULL
av$ano_fabricacao_veiculo <- NULL
av$id_veiculo <- NULL
av$id <- NULL
av$pesid <- NULL
sentido_via <- NULL
uso_solo <- NULL
ordem_tipo_acidente <- NULL
causa_principal <- NULL
#Adiconar Nona Coluna estado

av$estado <-av$uf
av$pais <- 'Brasil'
#Remove ou omit todas as linhas que possuem NA
av <- na.omit(av)
#Convertendo data
#av <- dmy(av$data_inversa)
#av$data_inversa<-as.Date(av$data_inversa,format = "%d%m%Y")
#Filtra somente com idade ate < = 80 anos e o data frame passou a chamar avi
avi <- av  %>%
  filter (av$idade <= 80)

View(avi)
#Criando nova coluna no data frame coluna estado e alterando para o nome do estado
avi$estado[avi$estado== "RO"] <- "RONDONIA"
avi$estado[avi$estado== "SP"] <- "SAO PAULO"
avi$estado[avi$estado== "RJ"] <- "RIO DE JANEIRO"
avi$estado[avi$estado== "AC"] <- "ACRE"
avi$estado[avi$estado== "AL"] <- "ALAGOAS"
avi$estado[avi$estado== "AM"] <- "AMAZONAS"
avi$estado[avi$estado== "CE"] <- "CEARA"
avi$estado[avi$estado== "DF"] <- "DISTRITO FEDERAL"
avi$estado[avi$estado== "ES"] <- "ESPIRITO SANTO"
avi$estado[avi$estado== "MA"] <- "MARANHAO"
avi$estado[avi$estado== "MT"] <- "MATO GROSSO"
avi$estado[avi$estado== "MS"] <- "MATO GROSSO DO SUL"
avi$estado[avi$estado== "PA"] <- "PARA"
avi$estado[avi$estado== "PB"] <- "PARAIBA"
avi$estado[avi$estado== "PR"] <- "PARANA"
avi$estado[avi$estado== "PE"] <- "PERNANBUCO"
avi$estado[avi$estado== "PI"] <- "PIAUI"
avi$estado[avi$estado== "RN"] <- "RIO GRANDE DO NORTE"
avi$estado[avi$estado== "RS"] <- "RIO GRANDE DO SUL"
avi$estado[avi$estado== "RR"] <- "RORAIMA"
avi$estado[avi$estado== "SC"] <- "SANTA CATARINA"
avi$estado[avi$estado== "SE"] <- "SERGIPE"
avi$estado[avi$estado== "TO"] <- "TOCANTINS"
avi$estado[avi$estado== "GO"] <- "GOIAS"
avi$estado[avi$estado== "BA"] <- "BAHIA"
avi$estado[avi$estado== "AP"] <- "AMAPA"
avi$estado[avi$estado== "MG"] <- "MINAS GERAIS"


#verifica o tipo de informação na coluna
distinct_df = avi %>% distinct(estado,uf)
View(distinct_df)
View(avi)
str(avi)


#Salvando o arquivo alterado
write.csv(avi,file = "DadosManipulados.csv")

#Criando Graficos



