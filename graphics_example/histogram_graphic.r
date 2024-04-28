# PACKAGES
install.packages("tidyr")
isntall.packages("dplyr")
istall.packages("ggplot2")
install.packages("readxl")
install.packages("RColorBrewer")

# LIBRARIES
library(tidyr)
library(dplyr)
library(ggplot2)
library(readxl)
library(RColorBrewer)

# EXAMPLE 1
Tipo_de_operacion <- c(
  "Toracica",
  "Huesos y articulaciones",
  "Ojo, oido, nariz y garganta",
  "General",
  "Abdominal",
  "Urologica",
  "Practologica",
  "Neurocirugia")
Numero_de_casos <- c(20, 45, 58, 98, 115, 74, 65, 23)
Id_operacion <- c(1, 2, 3, 4, 5, 6, 7, 8)
operationTable <- data.frame(
  Tipo_de_operacion,
  Numero_de_casos, 
  Id_operacion
)
View(operationTable)

# legendText <- paste(operationTable$Id_operacion, operationTable$Tipo_de_operacion, sep=": ")

meanNumberCases <-  mean(operationTable$Numero_de_casos)
medianNumberCases <- median(operationTable$Numero_de_casos)

numberCasesFactor <- factor(operationTable$Numero_de_casos)
fashionNumberCases <- mode(operationTable$Numero_de_casos_factor)

paste("Media: ", meanNumberCases)
paste("Mediana: ", medianNumberCases)
paste("Moda: ", fashionNumberCases)

# Sesgada positivamente: Madia es mayor a la mediana, y la media es mayor a la moda
# Sesgada negativamente: Madia es menor a la mediana, y la media es menor a la moda
# Ditribución normal: Media, mediana y moda son iguales

# Sesgada positivamente: Hay más barras hacia la derecha de la mas alta
# Sesgada negativamente: Hay más barras hacia la izquierda de la mas alta
# Ditribución normal: Es batsante simetrica con forma de campana

hist(operationTable$Numero_de_casos, col = "blue", main = "Histograma de casos por tipo de operación", xlab = "Numero de casos", ylab = "Frecuencia", breaks = 10)


