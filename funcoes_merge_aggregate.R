# Funções merge() e aggregate()

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/5.Manipulacao-de-Arquivos-TXT-CSV-e-Planilhas-Excel-em-R")
getwd()


# - As funções merge() e aggregate() são muito úteis em R para manipulação e análise de dados. A principal diferença entre elas
#   é que a função merge() combina duas ou mais tabelas com base em uma ou mais variáveis em comum, enquanto a função
#   aggregate() agrupa os dados com base em uma ou mais variáveis e, em seguida, realiza uma operação estatística em cada grupo.

# - A função merge() é geralmente usada para combinar duas ou mais tabelas que compartilham uma ou mais colunas em comum.
#   Por exemplo, se você tiver uma tabela com informações de clientes e outra tabela com informações de vendas, pode usar a
#   função merge() para combinar essas tabelas com base na coluna "ID do cliente" para criar uma nova tabela com informações
#   de clientes e suas compras.

# - Já a função aggregate() é usada para calcular estatísticas resumidas em um conjunto de dados, agrupados por uma ou mais
#   variáveis. Por exemplo, se você tiver um conjunto de dados com informações de vendas, pode usar a função aggregate() para
#   calcular o total de vendas para cada cliente ou região, agrupando os dados com base na coluna "ID do cliente" ou "região".

# - Em resumo, a função merge() é usada para combinar tabelas com base em uma ou mais colunas em comum, enquanto a função
#   aggregate() é usada para agrupar dados com base em uma ou mais variáveis e, em seguida, realizar operações estatísticas
#   em cada grupo. 
# - Em geral, a função merge() é útil quando você precisa combinar dados de várias fontes, enquanto a função aggregate() é útil
#   para resumir e analisar os dados em um nível agregado. No entanto, em alguns casos, pode ser necessário usar ambas
#   as funções para realizar análises mais complexas e completas.



# *** Função merge() ***


# Ex1 - criar as tabelas de funcionários

funcionarios1 <- data.frame(id = c(1, 2, 3, 4, 5),
                            nome = c("João", "Maria", "Pedro", "Julia", "Felipe"),
                            idade = c(20, 25, 30, 35, 40))

funcionarios2 <- data.frame(id = c(1, 2, 3, 6),
                            salario = c(2000, 2500, 3000, 3500),
                            estado_civil = c("Solteiro", "Casado", "Casado", "Divorciado"))

View(funcionarios1)
View(funcionarios2)

# mesclar as tabelas com base no id do funcionário
funcionarios_completos <- merge(funcionarios1, funcionarios2, by = "id", all = TRUE)

# imprimir a tabela combinada
View(funcionarios_completos)



# Ex2 - criar as tabelas de vendas, clientes e produtos

vendas <- data.frame(id_venda = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                     id_cliente = c(2, 3, 1, 1, 2, 3, 4, 4, 1, 2),
                     id_produto = c(1, 3, 5, 2, 4, 1, 5, 4, 3, 2),
                     quantidade = c(2, 1, 4, 3, 2, 5, 1, 3, 4, 2))

clientes <- data.frame(id_cliente = c(1, 2, 3, 4, 5),
                       nome_cliente = c("João", "Maria", "Pedro", "Julia", "Felipe"),
                       cidade = c("São Paulo", "Rio de Janeiro", "Belo Horizonte", "Porto Alegre", "Recife"))

produtos <- data.frame(id_produto = c(1, 2, 3, 4, 5),
                       nome_produto = c("Arroz", "Feijão", "Macarrão", "Azeite", "Leite"),
                       categoria = c("Alimentos", "Alimentos", "Alimentos", "Óleos e Temperos", "Laticínios"))

View(vendas)
View(clientes)
View(produtos)

# mesclar as tabelas com base nos ids de cliente e produto (parametro all é para manter na tabela somente quando as combinacoes forem todas iguais)
vendas_completas <- merge(merge(vendas, clientes, by = "id_cliente", all = FALSE),
                          produtos, by = "id_produto", all = FALSE)

# imprimir a tabela combinada
View(vendas_completas)



# Ex3 - criar duas tabelas com informações diferentes

tabela1 <- data.frame(id = c(1, 2, 3), valor1 = c(10, 20, 30))
tabela2 <- data.frame(identificador = c(1, 2, 3), valor2 = c(40, 50, 60))

View(tabela1)
View(tabela2)

# mesclar as duas tabelas com base no id
tabela_completa <- merge(tabela1, tabela2, by.x = "id", by.y = "identificador")

# imprimir a tabela combinada
View(tabela_completa)



# Ex4 - criar três tabelas com informações diferentes

tabela1 <- data.frame(id = c(1, 2, 3), valor1 = c(10, 20, 30))
tabela2 <- data.frame(identificador = c(1, 2, 3), valor2 = c(40, 50, 60))
tabela3 <- data.frame(chave = c(1, 2, 3), valor3 = c(70, 80, 90))

View(tabela1)
View(tabela2)
View(tabela3)

# mesclar as três tabelas com base no id, identificador e chave
tabela_completa <- merge(merge(tabela1, tabela2, by.x = "id", by.y = "identificador"), tabela3, by.x = "id", by.y = "chave")

# imprimir a tabela combinada
View(tabela_completa)




# *** Função aggregate() ***


# Ex1 - média por grupo

# Criação dos dados
frutas <- data.frame(
  tipo = c("maçã", "maçã", "banana", "banana", "laranja", "laranja"),
  peso = c(100, 120, 80, 90, 70, 80)
)

View(frutas)

# Calcula a média do peso por tipo de fruta
media <- aggregate(peso ~ tipo, data = frutas, mean)
media2 <- aggregate(frutas$peso, list(frutas$tipo), FUN = mean)

View(media)
View(media2)



# Ex2 - mínimo e máximo por grupo

# Criação dos dados
temperatura <- data.frame(
  cidade = c("Paris", "Londres", "Madrid", "Barcelona", "Roma", "Milão"),
  país = c("França", "Reino Unido", "Espanha", "Espanha", "Itália", "Itália"),
  temperatura = c(10, 8, 25, 27, 15, 18)
)

View(temperatura)

# Calcula o mínimo e o máximo da temperatura por país
temp_pais <- aggregate(temperatura ~ país, data = temperatura, function(x) c(min = min(x), max = max(x)))

View(temp_pais)



# Ex3 - calcular a média do peso de cada tipo de animal


# Criação da base de dados "animais"
animais <- data.frame(
  tipo = c("mamífero", "reptil", "ave", "mamífero", "reptil", "ave"),
  peso = c(120, 50, 2, 80, 10, 0.5)
)

View(animais)

animaisMedia <- aggregate(data = animais, peso ~ tipo, mean)
animaisMedia2 <- aggregate(x = animais$peso, by = list(animais$tipo), FUN = mean)

View(animaisMedia)
View(animaisMedia2)



# Ex4 - calcular a soma das vendas de cada categoria de produto

# Criação da base de dados "vendas"
vendas <- data.frame(
  categoria = c("eletrônicos", "vestuário", "alimentos", "eletrônicos", "alimentos", "vestuário"),
  valor = c(1000, 500, 200, 800, 300, 700)
)

View(vendas)

vendasValor <- aggregate(x = vendas$valor, by = list(vendas$categoria), FUN = sum)

View(vendasValor)
