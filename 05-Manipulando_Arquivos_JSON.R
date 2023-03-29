# Manipulação de Arquivos JSON


# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/5.Manipulacao-de-Arquivos-TXT-CSV-e-Planilhas-Excel-em-R")
getwd()



# Instala o pacote
install.packages("rjson")

# Carrega o pacote
library(rjson)



# Carrega o arquivo
arquivo_json <- fromJSON(file = 'funcionarios.json')

arquivo_json
View(arquivo_json)


# convertendo para dataframe

json_data_frame <- as.data.frame(arquivo_json)

json_data_frame
View(json_data_frame)


# salvando como arquivo csv

library(readr)

write_csv(json_data_frame, 'funcionariosCSV.csv')
