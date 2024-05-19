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
Estatura <- c(65, 65, 62, 67, 69, 65, 61, 67)
Peso <- c(105, 125, 110, 120, 140, 135, 95, 130)


RemuneracionPorHora <- c(2.19, 2.26, 2.32, 2.39, 2.46, 2.53, 2.61, 2.72, 2.83, 3.01, 3.19, 3.36, 3.56)
TasaDeDesempleo <- c(6.1, 6.2, 7.8, 5.8, 5.7, 5.0, 4.0, 3.2, 3.6, 3.3, 3.3, 5.6, 6.8)

regresion1 <- lm(RemuneracionPorHora ~  TasaDeDesempleo)
plot(TasaDeDesempleo, RemuneracionPorHora, pch = 19, col = "black", main = "Diagrama de dispersion", xlab = "Tasa de desempleo", ylab = "remuneracion por hora")
abline(regresion1, col = "orange", lwd = 3)

summary(regresion1)

intercepto1 <- coef(regresion1)[1]
pendiente1 <- coef(regresion1)[2]

cat(paste("y =", pendiente1,"x", "+", "(",intercepto1,")"))

cat(paste(-0.0794306677283586*(5.2) + ( 3.13109202593562 )))




Estado <- c("Missuori", "Iowa", "Dakota de Sur", "Dakota del Norte")
Millas <- c(123, 161, 252, 217)
NumeroDeIntersecciones <- c(37, 32, 44, 40)


regresionInterestatal <- lm(NumeroDeIntersecciones ~  Millas)
plot(Millas, NumeroDeIntersecciones, pch = 19, col = "black", main = "Diagrama de dispersion", xlab = "Millas", ylab = "Numero de intersecciones")
abline(regresionInterestatal, col = "orange", lwd = 3)

summary(regresionInterestatal)

interceptoI29 <- coef(regresionInterestatal)[1]
pendienteI29 <- coef(regresionInterestatal)[2]

cat(paste("y =", pendienteI29,"x", "+", "(",interceptoI29,")"))

cat(paste((35 - 25.521724843919)/0.067613679447969))

# Interprertación positiva: De y, x menor a y, x mayor(/)
# Fuerza de correlación fuerte: De y, x menor a y, x mayor(/)

# Interprertación negativa: De y, x mayor a y, x menor(\)
# Fuerza de correlación débil: De y, x mayor a y, x menor(\))

regresion <- lm(Peso ~ Estatura)

plot(Estatura, Peso, pch = 19, col = "black", main = "Diagrama de dispersion", xlab = "Estatura", ylab = "Peso")
abline(regresion, col = "orange", lwd = 3)

summary(regresion)

intercepto <- coef(regresion)[1]
pendiente <- coef(regresion)[2]

cat(paste("y =", pendiente,"x", "+", "(",intercepto,")"))

# Coefficients:
# Estimate Std. Error t value Pr(>|t|)  
# (Intercept) -186.471     94.583  -1.972   0.0961 .
# Estatura       4.706      1.451   3.243   0.0176 *

# y = mx + b
# y = 