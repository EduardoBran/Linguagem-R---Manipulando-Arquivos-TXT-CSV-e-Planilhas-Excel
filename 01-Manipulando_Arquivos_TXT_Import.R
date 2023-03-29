# Carregando e Manipulando Arquivos TXT - Parte 1


# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/5.Manipulacao-de-Arquivos-TXT-CSV-e-Planilhas-Excel-em-R")
getwd()


# Mostra pacotes carregados na sessão atual
search()


# Importando arquivo com read.table()
?read.table


# carregando arquivo sem nenhum parâmetro

df1 <- read.table("jogadores.txt")
df1

# retorna numero de linhas e coluna
dim(df1)


# carregado arquivo com parâmetros header (importar com cabeçalho) e sep (separador de coluna)

df1 <- read.table("jogadores.txt", header = TRUE, sep = ',')
df1

# retorna numero de linhas e coluna
dim(df1)


# carregado arquivo com parâmetros acima e adicionando nome para as colunas

df1 <- read.table("jogadores.txt", header = TRUE, sep = ',',
                  col.names = c('var1', 'var2', 'var3'))
df1

# visualiza tipos de dados
str(df1)


# carregado arquivo com parâmetros acima se encontrar os termos 'Tulio' e 'Romario converter para NA


df1 <- read.table("jogadores.txt", header = TRUE, sep = ',',
                  col.names = c('var1', 'var2', 'var3'),
                  na.strings = c('Tulio', 'Romario'))
df1

# visualiza tipos de dados
str(df1)


# carregado arquivo com parâmetros acima e convertendo para se uma coluna pode
# ser do tipo fator, ele coloca como tipo fator. São variáveis categórias e assim podemos efetuar
# um tipo variável de manipulação

df1 <- read.table("jogadores.txt", header = TRUE, sep = ',',
                  col.names = c('var1', 'var2', 'var3'),
                  na.strings = c('Zico', 'Maradona'),
                  stringsAsFactors = TRUE)
df1

# visualiza tipos de dados
str(df1)



