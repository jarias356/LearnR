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

# Interprertación positiva: De y, x menor a y, x mayor(/)
# Fuerza de correlación fuerte: De y, x menor a y, x mayor(/)

# Interprertación negativa: De y, x mayor a y, x menor(\)
# Fuerza de correlación débil: De y, x mayor a y, x menor(\)

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