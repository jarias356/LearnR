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

UnidadesDeAlojamientoWebster <- data.frame(
  Id <- c(1, 2, 3),
  UnidadAlojamiento <- c("Propietario", "Arrendatario", "Vacante"),
  Cantidad <- c(12627, 3803, 539)
)

barplot(
  UnidadesDeAlojamientoWebster$Cantidad,
  names.arg = UnidadesDeAlojamientoWebster$Id,
  # legend.text = legendText,
  axisnames = TRUE,
  col = "blue",
  space = 0,
  main = "Unidades Alojamiento Webster, NY",
  xlab = "Tipo de operación",
  ylab = "Numero de casos"
)

color <- brewer.pal(length(UnidadesDeAlojamientoWebster$UnidadAlojamiento), "Set2")
percentageByOperation <- round((100 * UnidadesDeAlojamientoWebster$Cantidad)/sum(UnidadesDeAlojamientoWebster$Cantidad), 1)
label <- paste0(UnidadesDeAlojamientoWebster$UnidadAlojamiento, " (", percentageByOperation, "%)")
pie(
  UnidadesDeAlojamientoWebster$Cantidad, 
  labels = label,
  main = "Unidades Alojamiento Webster, NY",
  col = color,
  density = 50,
  angle = 45
)