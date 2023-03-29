# Carregando e Manipulando Arquivos Excel


# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/5.Manipulacao-de-Arquivos-TXT-CSV-e-Planilhas-Excel-em-R")
getwd()


# Instalando o pacote
install.packages('readxl')

# Carregando o pacote
library(readxl)


# Lista as worksheet (planilhas) no arquivo Excel
excel_sheets("PopUrbana.xlsx")



# Lendo as planilhas do arquivo Excel "PopUrbana.xlsx"

# Lendo a primeira planilha (ele carrega sempre a primeira)
read_excel("PopUrbana.xlsx")
View(read_excel("PopUrbana.xlsx"))

# Lendo somente planilha 'Period2'
read_excel("PopUrbana.xlsx", sheet = 'Period2')
View(read_excel("PopUrbana.xlsx", sheet = 'Period2'))

# Lendo somente planilha 'Period3'
read_excel("PopUrbana.xlsx", sheet = 3)
View(read_excel("PopUrbana.xlsx", sheet = 3))

# gera erro pois nao existe essa planilha
View(read_excel("PopUrbana.xlsx", sheet = 4))



# Importando uma worksheet (planilha) para um dataframe (planilha 'Period3')
df <- read_excel("PopUrbana.xlsx", sheet = 3)

View(df)


# Importando todas as worksheets (planilhas)

df_todas <- lapply(excel_sheets("PopUrbana.xlsx"), read_excel, path = "PopUrbana.xlsx")

View(df_todas)



# Evitar trabalhar direto com Excel, escolha sempre salvar como CSV.
