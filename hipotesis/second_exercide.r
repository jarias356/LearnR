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


# Calcular T-Student
media <- 27.5 # Medía obtenida del ejercicio
media_poblacional <- 25 # Media poblacional del ejercicio
desviacion_estandar <- 5 # Desvisción esntandar del ejercicio
N <- 15 # Número de muestras


# Calcular T-Student
# sqrt(N) -> Raiz de N
# t = (media-media_poblacional) / (desviacion_estandar / sqrt(N))
tstudent <- (media-media_poblacional) / (desviacion_estandar / sqrt(N))
paste("T-Studfent -> ", tstudent)

nivel_signifcancia <- 0.01 # Nivel de significacía del 1%, Rango de error del ejercicio
grados_de_libertad <- N - 1 
paste("Grados de libertad -> ", grados_de_libertad)
# Grado de libertad, si es varianaza y desviación estandar simple se resta 1
# Si es una sola muestra sera N -1

# El valor critico tiene que ser mayor a t-student
valor_critico <- qt(1 - nivel_signifcancia/2,grados_de_libertad)
paste("Valor critico calculado: ", valor_critico)

# El area dentro d elos valores criticos es area de aceptación 
# El area fuera de los valores criticos es el area de rechazo
valor_critico_superior <- valor_critico
valor_critico_inferior <- -valor_critico_superior
paste("Valor critico superior: ", valor_critico_superior)
paste("Valor critico inferior: ", valor_critico_inferior)

# Grafica
# seq() Generar valores de nuemeros entre los valores definidos
t_valores <- seq(-4, 4, by = 0.01) # Se pone 4 Por el valor critico +-2.98

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

# Plantear hipostesis
# Hipótesis nula (Ho): μ ≠ tiempo de elaboración del tornillo
# Hipótesis alternativa (H₁): µ = tiempo de elaboración del tornillo

# Revisar diapositiva para revisar la hipotesis
# El valor de T - student calculado está en la región de aceptación de la hipótesis nula.
# Por lo tanto, se rechaza la hipótesis alternativa, de que el tiempo de elaboración de los tornillos es igual
# a la media poblacional.