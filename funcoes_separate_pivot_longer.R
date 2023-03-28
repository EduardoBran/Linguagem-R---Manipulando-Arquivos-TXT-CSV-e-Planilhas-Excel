# Funções separate() e pivot_longer()

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/5.Manipulacao-de-Arquivos-TXT-CSV-e-Planilhas-Excel-em-R")
getwd()


# Carregando pacote necessário
library(tidyr)


# *** Função separate() ***

# - A função separate() na linguagem R é usada para separar uma única coluna em várias colunas com base em um delimitador
#   especificado. Por exemplo, se uma coluna chamada "Nome Completo" contiver informações sobre o nome e sobrenome dos
#   indivíduos separados por um espaço, a função separate() pode ser usada para dividir essa coluna em duas colunas separadas,
#   uma para o primeiro nome e outra para o sobrenome.

# - O uso da função separate() é especialmente útil quando as informações contidas em uma única coluna precisam ser divididas
#   em várias colunas para permitir uma análise mais detalhada. A função também pode ser útil para extrair informações
#   específicas de uma coluna de texto, como datas ou códigos de identificação.

# - No entanto, deve-se ter cuidado ao usar a função separate(), pois a divisão incorreta de uma coluna pode resultar em
#   informações incompletas ou erradas. Além disso, se uma coluna já estiver dividida em várias colunas, a função separate()
#   pode não ser necessária.


# Ex1 - Dividir uma coluna de nomes em primeiro e último nome

# Criação da base de dados "pacientes"
pacientes <- data.frame(
  id = 1:5,
  nome_completo = c("João Silva", "Maria Santos", "Pedro Costa", "Ana Oliveira", "Luiz Souza")
)

View(pacientes)

# Separar a coluna "nome_completo" em duas colunas: "primeiro_nome" e "sobrenome"

pacientes_separados <- separate(pacientes, col = nome_completo, into = c("primeiro_nome", "sobrenome"), sep = " ")

# Exibir o resultado
View(pacientes_separados)



# Ex2 - Dividir uma coluna de datas em dia, mês e ano:

# Criação da base de dados
datas <- data.frame(
  data_completa = c("2022-01-01", "2022-02-15", "2022-03-30")
)

View(datas)

# Usando a função separate() para dividir em três colunas
datas_separadas <- separate(datas, data_completa, c("ano", "mes", "dia"), sep = "-")

View(datas_separadas)



# Ex3 - Separar dados contidos em várias colunas em um df chamado funcionarios e criar novas colunas com as
#       informações separadas:

funcionarios <- data.frame(
  nome_completo = c("João da Silva", "Maria Souza", "Pedro Rodrigues", "David Gilmour", "Alan Boksic"),
  cargo = c("Gerente de Vendas", "Analista de Marketing", "Assistente de RH", "Desenvolvedor R", "Analista de Dados"),
  departamento = c("Vendas / São Paulo", "Marketing / Rio de Janeiro", "RH / São Paulo", "TI / Alagoas", "RH / Paraná")
)

View(funcionarios)


funcionarios_separados <- separate(funcionarios, nome_completo, into = c("nome", "sobrenome"), sep = "\\s+")

View(funcionarios_separados)

funcionarios_separados2 <- separate(funcionarios_separados, departamento, into = c("area", "localizacao"), sep = " / ")

View(funcionarios_separados2)

# necessario para nomes como "Joao da Silv"
funcionarios_separados_extr <- extract(funcionarios, nome_completo, into = c("nome", "sobrenome"), regex = "(\\w+)\\s+(\\w+\\s*\\w*)")

View(funcionarios_separados_extr)







# *** Função pivot_longer() ***

# - A função pivot_longer() da linguagem R faz parte do pacote tidyr e é utilizada para transformar um conjunto de dados de
#   formato "wide" (largo) em "long" (longo), ou seja, para "esticar" os dados de colunas para linhas. Essa função é útil
#   para analisar ou visualizar dados que estão em formato "wide", mas que precisam estar em formato "long" para realizar
#   determinadas operações.

# - A função pivot_longer() funciona recebendo como argumentos o conjunto de dados a ser transformado, as colunas que devem
#   ser transformadas em variáveis e seus respectivos nomes, e as colunas que contêm os valores que serão usados para
#   preencher as variáveis criadas.

# - Devemos usar a função pivot_longer() quando os dados estão em formato "wide" e precisamos transformá-los em formato
#   "long" para realizar determinadas operações, como análises ou visualizações.

# - Não devemos usar a função pivot_longer() quando os dados já estão em formato "long" ou quando não há necessidade de
#   transformá-los em formato "long" para realizar as operações desejadas.



# Ex1 - transformação de colunas em variáveis

# criação da base de dados

dados <- data.frame(aluno = c("Ana", "Beto", "Clara"),
                    prova1 = c(7, 8, 6),
                    prova2 = c(9, 8, 7),
                    prova3 = c(6, 5, 8))

View(dados)

# usando a função pivot_longer() para transformar as colunas de prova em uma única coluna de nome "prova" e as notas
# em uma coluna de nome "nota":

dados_long <- pivot_longer(dados, cols = c(prova1, prova2, prova3),
                           names_to = "prova", values_to = "nota")

View(dados_long)



# Ex2 - Transformando múltiplas colunas em variáveis:

library(tidyverse)

# Criando os dados de exemplo
dados_covid <- data.frame(
  estado = c("SP", "RJ", "MG"),
  casos_0_10 = c(100, 80, 120),
  casos_11_20 = c(200, 150, 180),
  casos_21_30 = c(300, 200, 250)
)

View(dados_covid)

# Usando a função pivot_longer() para transformar as colunas de faixa etária em uma única coluna
dados_covid_long <- pivot_longer(dados_covid, 
                                 cols = c(casos_0_10, casos_11_20, casos_21_30), 
                                 names_to = "faixa_etaria", 
                                 values_to = "casos")
View(dados_covid_long)

