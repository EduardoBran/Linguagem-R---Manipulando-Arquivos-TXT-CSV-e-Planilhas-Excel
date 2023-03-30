# Manipulação de Arquivos XML


# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/5.Manipulacao-de-Arquivos-TXT-CSV-e-Planilhas-Excel-em-R")
getwd()



# Instala o pacote
install.packages("XML")

# Carrega o pacote
library("XML")

# Carrega o pacote necessssário para manipular conteúdo XML
library("methods")



# Carrega o arquivo
arquivo_xml <- xmlParse(file = 'funcionarios.xml')

arquivo_xml


# Extrai o nó raiz do arquivo    (neste exemplo é o <RECORDS>)
rootnode <- xmlRoot(arquivo_xml)

# exibe tudo dentro de <RECORDS>
rootnode

# Número de elementos do nós no arquivo
rootsize <- xmlSize(rootnode)

rootsize


# Extrai o primeiro elemento do nó raiz do arquivo (neste exemplo é o <EMPLOYEE>)
rootnode[1]

# Extrai o primeiro elemento do primeiro nó raiz do arquivo (neste exemplo é o <ID>)
rootnode[[1]][[1]]

# Extrai o quinto elemento do primeiro nó raiz do arquivo (neste exemplo é o <DEPT>)
rootnode[[1]][[5]]

# Extrai o segundo elemento do terceiro nó raiz do arquivo (neste exemplo é o <SALARY>)
rootnode[[2]][[3]]


# Carrega o arquivo XML como dataframe

xmldataframe <- xmlToDataFrame("funcionarios.xml")

xmldataframe


# Salvando para CSV
# O parâmetro row.names = FALSE é usado para não incluir uma coluna com os nomes das linhas no arquivo CSV.

write.csv(xmldataframe, "funcionariosCSV2.csv", row.names = FALSE, sep = ",")
