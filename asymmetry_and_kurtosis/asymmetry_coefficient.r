# PACKAGES
install.packages("tidyr")
library(tidyr)
isntall.packages("dplyr")
library(dplyr)
istall.packages("ggplot2")
library(ggplot2)
install.packages("readxl")
library(readxl)
install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("moments")
library(moments)

# Coeficiente de asimetría Pearson cuando N > 30: Ap= (media-moda)/desviacion estandar

# EJERCICIO 1
print("---------")
print("EJERCICIO 1")
Fuerza_de_atraccion = c(296,338,341,261,250,347,336,297,279,297,259,334,281,284,279,266,300,305,310,253)

# skewness(Value) Retorna el coeficiente de asimetría de Pearson
# La función skewness() se encuentra en el paquete moments
# skewness(Value) se usa para cantidad de datos menor a 30
coef_asimetria_fuerza = skewness(Fuerza_de_atraccion)
# A igual a 0 Simétrica (Normal)
# A mayor a 0 Simetría Positiva
# A menor a 0 Simetría Negativa
paste("-> Coeficiente de asimetría de Pearson: ", coef_asimetria_fuerza)
print("---------")

#EJERCICIO 2
print("---------")
print("EJERCICIO 2")
hombres = c(173,178,145,146,157,175,173,137,152,171,163,170,135,159,199,131)
coef_asimetria_hombres = skewness(hombres)
coef_asimetria_hombres
paste("-> Coeficiente de asimetría de Pearson: ", coef_asimetria_fuerza)
print("---------")


# EJERCICIO 3
print("---------")
print("EJERCICIO 3")
data("swiss")
View(swiss)

# Asignar la variable a evaluar a x
x = swiss$Education
# Calcular la medía
education_media = mean(x)
paste("-> Media: ", education_media)
# Calcular la moda, usando la función table()
moda_education = table(x)
paste("-> Moda: ", moda_education)
# Calcular la desviciación estandar
education_desv_estandar = sd(x)
paste("-> Desviación estandar: ", education_desv_estandar)
coef_asimetria_education = (education_media-7)/education_desv_estandar
paste("Coeficiente de asimetría de Pearson de la educación: ", coef_asimetria_education)
print("---------")

