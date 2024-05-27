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

pesos <- c(173, 178, 145, 146, 157, 175, 173, 137, 152, 171, 163, 170, 135, 159, 199, 131)
media_poblacional <- 170 
media <- mean(pesos)
desviacion_estandar <- sd(pesos)
N <- 16

tstudent <- (media-media_poblacional) / (desviacion_estandar / sqrt(N))
tstudent

nivel_signifcancia <- 0.05 # Nivel de significacía del 1%, Rango de error del ejercicio
grados_de_libertad <- N - 1 


valor_critico <- qt(1 - nivel_signifcancia/2,grados_de_libertad)
valor_critico
valor_critico_superior <- valor_critico
valor_critico_inferior <- -valor_critico_superior

t_valores <- seq(-4, 4, by = 0.05) # Se pone 4 Por el valor critico +-2.98

# dt Calcular la densidas en los puntp t_valores
# dy(x1, x2) x1 -> Valor de t_valores a evaluar, x2 -> Grados de libertad
densidad_t <- dt(t_valores, df = grados_de_libertad)
df <- data.frame(t_valores, densidad_t) # Crea una tabla con los valores t_valores y densidad_t
View(df)

# Grafica
# data -> Datos a graficar
# aes (x, y) mapeo de los datos x y y
ggplot(data = df, aes(x = t_valores, y = densidad_t)) +
  # Línea conectando los puntos especificados en tus datos, y les asigna el color azul.
  geom_line(color = "blue") + 
  # Esto rellena el área bajo la curva de densidad de probabilidad. área sombreada en tu gráfico, que representa las regiones críticas
  # subset para seleccionar solo los puntos de df que están dentro de las regiones críticas.
  geom_area(data = subset(df, t_valores >= valor_critico_superior | t_valores <= valor_critico_inferior), # Esto rellena el área bajo la curva de densidad de probabilidad. área sombreada en tu gráfico, que representa las regiones críticas
            aes(x = t_valores, y = densidad_t), fill = "red", alpha = 0.5) +
  # Línea vertical punteada para los valores criticos
  geom_vline(xintercept = c(valor_critico_superior, valor_critico_inferior),
             linetype = "dashed", color = "red") +
  # Línea vertical punteada para el t-student
  geom_vline(xintercept = tstudent, linetype = "dashed", color = "black") +
  # Etiqueta para el valor t-student
  geom_text(aes(x = tstudent, y = 0.2, label = round(tstudent, 2)), color = "black", size = 4, hjust = -0.5) +
  # Etiqueta para el valor critico superior
  geom_text(aes(x = valor_critico_superior, y = 0.2, label = round(valor_critico_superior, 2)), color = "red", size = 4, hjust = -0.5) +
  # Etiqueta para el valor critico inferior
  geom_text(aes(x = valor_critico_inferior, y = 0.2, label = round(valor_critico_inferior, 2)), color = "red", size = 4, hjust = -0.5) +
  # Titulos al grafico
  labs(title = "Distribución t de Student",
       x = "Valor t",
       y = "Densidad de probabilidad") +
  theme_minimal()

# Se plantea la hipótesis de que el peso de los hombres es
# igual a la media poblacional de 170 horas.
# H0: mu = 170
# Hi: mu != 170

# El valor de tstudent cae en la región crítica, por lo que se acepta la hipótesis nula.