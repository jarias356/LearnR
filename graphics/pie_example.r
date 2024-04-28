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
Tipo_de_operación <- c(
  "Toracica",
  "Huesos y articulaciones",
  "Ojo, oido, nariz y garganta",
  "General",
  "Abdominal",
  "Urologica",
  "Practologica",
  "Neurocirugia")
Numero_de_casos <- c(20, 45, 58, 98, 115, 74, 65, 23)
operationTable <- data.frame(
  Tipo_de_operación,
  Numero_de_casos
)
View(operationTable)

color <- brewer.pal(length(operationTable$Tipo_de_operación), "Set2")

percentageByOperation <- round((100 * operationTable$Numero_de_casos)/sum(operationTable$Numero_de_casos), 1)
label <- paste0(operationTable$Tipo_de_operación, " (", percentageByOperation, "%)")
pie(
  operationTable$Numero_de_casos, 
  labels = label,
  main = "Operaciones realizadas en Hospital General el ultimo año",
  col = color,
  density = 50,
  angle = 45)