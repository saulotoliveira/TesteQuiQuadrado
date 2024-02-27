# Estatística na Prática 4 - Análise, Interpretação e Exercício com Teste do Qui-Quadrado

# Qui-Quadrado, simbolizado por χ2, é um teste de hipóteses que se destina a encontrar
# um valor da dispersão para duas variáveis nominais, avaliando a associação existente entre
# variáveis qualitativas.

# Leia os manuais em pdf no Capítulo 11 do curso.

# Suposição do teste:
# As variáveis devem ser independentes!

setwd("C:/Users/saulo/Documents/Cursos/DSA/FCD/BigDataRAzure/Cap11") # Para definir o diretório de trabalho.
getwd() # Para saber qual o diretório de trabalho.

# Carregando o dataset
df = read.csv("dados.csv")

# Visualizando os dados
View(df)

# Dimensões
dim(df)

# Separando x e y
# Tipo_Imovel é uma variável categórica
x = df$Tipo_Imovel
unique(x) # verifica os valores únicos para a variável

# Status_Imovel é uma variável categórica
y = df$Status_Imovel
unique(y)

# Tabela cruzada
table(x, y)
prop.table(table(x, y))

# Definindo as hipóteses:

# H0 = Não há relação entre x e y (o que tem valor negativo é colocado em H0)
# H1 = x e y estão relacionados (o que tem valor positivo é colocado em H1)

# Se o valor-p for menor que 0.05 rejeitamos a H0

# Teste do Qui-Quadrado
?chisq.test
chisq.test(table(x, y))

# Exercício:

# Se não considerarmos os imóveis do tipo Apartamento, há diferença no resultado do teste?
x = df$Tipo_Imovel
View(df)
unique(x) # verifica os valores únicos para a variável
df <- subset(df, Tipo_Imovel != "Apartamento") # Removendo os registros que contêm "apartamento" na coluna Tipo_Imovel
View(df)

# Separando x e y
# Tipo_Imovel é uma variável categórica
x = df$Tipo_Imovel
unique(x) # verifica os valores únicos para a variável

# Status_Imovel é uma variável categórica
y = df$Status_Imovel
unique(y)

# Tabela cruzada
table(x, y)
prop.table(table(x, y))

# Definindo as hipóteses:

# H0 = Não há relação entre x e y (o que tem valor negativo é colocado em H0)
# H1 = x e y estão relacionados (o que tem valor positivo é colocado em H1)

# Se o valor-p for menor que 0.05 rejeitamos a H0

# Teste do Qui-Quadrado
?chisq.test
chisq.test(table(x, y)) # p-value = 0,8501 indica falha em rejeitar a hipotese nula
