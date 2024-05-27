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

boxplot(
  data = operationTable,
  operationTable$Numero_de_casos ~ operationTable$Tipo_de_operacion,
  horizontal = TRUE,
  notch = TRUE,
  add = TRUE,
  main = "Numero de casos por tipo de operación",
  xlab = "Tipo de operación",
  ylab = "Numero de casos")
