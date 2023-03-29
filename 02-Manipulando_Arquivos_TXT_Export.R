# Carregando e Manipulando Arquivos TXT - Parte 2


# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/5.Manipulacao-de-Arquivos-TXT-CSV-e-Planilhas-Excel-em-R")
getwd()


# importa
?read.table

# exporta
?write.table



# Salvando arquivo (mtcars que vem com R) em um arquivo TXT
# (sem parametro)

write.table(mtcars, file = 'mtcars.txt')

# conteudo do diretorio
dir()


# Importando arquivo com read.table
df_mtcars <- read.table("mtcars.txt")

View(df_mtcars)
dim(df_mtcars)
dim(mtcars)


# Salvando arquivo (mtcars que vem com R) em um arquivo TXT
# (até aqui o separador de coluna era o " " (tab), agora vamos colocar o separador como "|")
# (não vamos levar nome de colunas para o arquivo com col.names = NA)
# (qmethod é para identificar as strings para que ele possa manter. Útil para nomes com espaços)

write.table(mtcars, file = 'mtcars2.txt', sep = "|", col.names = NA, qmethod = "double")

# conteudo do diretorio
list.files()


# Importando arquivo com read.table indicando o separador

df_mtcars2 <- read.table("mtcars2.txt", sep = '|')

View(df_mtcars2)
dim(df_mtcars2)


# Importando arquivo com read.table indicando o separador e importando com cabeçalho

df_mtcars2 <- read.table("mtcars2.txt", header = TRUE, sep = '|', encoding = 'UTF-8')

View(df_mtcars2)
dim(df_mtcars2)




View(mtcars)
