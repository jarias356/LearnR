# PACKAGES
install.packages("tidyr")
isntall.packages("dplyr")
istall.packages("ggplot2")
install.packages("readxl")
install.packages("RColorBrewer")
install.packages("moments")

# LIBRARIES
library(tidyr)
library(dplyr)
library(ggplot2)
library(readxl)
library(RColorBrewer)
library(moments)

# Calcular T-Student
media <- 27.5
media_poblacional <- 25
desviacion_estandar <- 5
N <- 15

tstudent <- (media-media_poblacional) / (desviacion_estandar / sqrt(N))
tstudent

nivel_signifcancia <- 0.01
grados_de_libertad <- N - 1
valor_critico <- qt(1 - nivel_signifcancia/2,grados_de_libertad)
valor_critico

valor_critico_superior <- valor_critico
valor_critico_inferior <- -valor_critico_superior

# Grafica
t_valores <- seq(-4, 4, by = 0.01) #se pone 4 Por el valor critico +-2.98

densidad_t <- dt(t_valores, df = grados_de_libertad)
df <- data.frame(t_valores, densidad_t)

ggplot(data = df, aes(x = t_valores, y = densidad_t)) +
  geom_line(color = "blue") +
  geom_area(data = subset(df, t_valores >= valor_critico_superior | t_valores <= valor_critico_inferior),
            aes(x = t_valores, y = densidad_t), fill = "red", alpha = 0.5) +
  geom_vline(xintercept = c(valor_critico_superior, valor_critico_inferior),
             linetype = "dashed", color = "red") +
  geom_vline(xintercept = tstudent, linetype = "dashed", color = "black") +
  geom_text(aes(x = tstudent, y = 0.2, label = round(tstudent, 2)), color = "black", size = 4, hjust = -0.5) +
  geom_text(aes(x = valor_critico_superior, y = 0.2, label = round(valor_critico_superior, 2)), color = "red", size = 4, hjust = -0.5) +
  geom_text(aes(x = valor_critico_inferior, y = 0.2, label = round(valor_critico_inferior, 2)), color = "red", size = 4, hjust = -0.5) +
  labs(title = "Distribución t de Student",
       x = "Valor t",
       y = "Densidad de probabilidad") +
  theme_minimal()

# Plantear hipostesis
# Revisar diapositiva para revisar la hipotesis