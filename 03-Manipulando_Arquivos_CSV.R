# Carregando e Manipulando Arquivos CSV


# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/5.Manipulacao-de-Arquivos-TXT-CSV-e-Planilhas-Excel-em-R")
getwd()


# Usando o pacote readr

# install.packages('readr')
library(readr)


# Exportando o dataset e gerando o arquivo com o write_csv()
write_csv(iris, 'iris.csv')

# conteudo do diretorio
dir()


## Tipos de dados

# col_integer()      
# col_double()
# col_logical()
# col_character()
# col_factor()
# col_skip()
# col_date() (alias = "D"), col_datetime() (alias = "T"), col_time() (alias = "t")


# Carregando o arquivo com read_csv()
# (definindo os tipos das colunas - 4 do tipo double e a ultima do tipo fator com um vetor de string para nomes dos fatores)

df_iris <- read_csv("iris.csv",
                    col_types = list(
                      Sepal.Length = col_double(),
                      Sepal.Width = col_double(),
                      Petal.Length = col_double(),
                      Petal.Width = col_double(),
                      Species = col_factor(c('setosa', 'versicolor', 'virginica'))
                    ))
View(df_iris)
dim(df_iris)
str(df_iris)



# Usando o pacote utils

# Carregando o arquivo com read.csv() sem parametros

df_iris2 <- read.csv("iris.csv")

View(df_iris2)
dim(df_iris2)
str(df_iris2)


# Carregando o arquivo com read.csv() com parametro para coluna com string ser do tipo factor

df_iris2 <- read.csv("iris.csv", stringsAsFactors = TRUE)

View(df_iris2)
str(df_iris2)




# Gerando mais um arquivo CSV     (com esse, neste diretorio teremos 2 arquivos csv)
write_csv(mtcars, 'mtcars.csv')

dir()


# Carregando e Manipulando Vários Arquivos CSV Simultaneamente

# exibindo conteudo do diretorio
list.files()


# carregando todos os arquivos do tipo csv neste diretório

lista_arquivos_csv <- list.files(getwd(), full.names = TRUE, pattern = "*.csv")
lista_arquivos_csv


# loop para carregar cada arquivo e gerar uma lista

lista_arquivos_csv2 <- lapply(lista_arquivos_csv, read_csv)

View(lista_arquivos_csv2)
