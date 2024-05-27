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

data(mtcars)
View(mtcars)

boxplot(
  disp  ~ gear,
  data = mtcars,
  col = "blue",
  main = "Dispersion por engranaje",
  xlab = "Engranaje",
  ylab = "Dispersion"
)

variables <- c("mpg", "disp", "hp", "wt")

# Set up the plotting layout
par(mfrow = c(1, length(variables)))

# Create the box plots
for (var in variables) {
  boxplot(get(var) ~ gear, data = mtcars,
          main = paste("Box Plot of", var),
          xlab = "Gear",
          ylab = var,
          col = "skyblue",
          border = "black",
          notch = TRUE,
          notchwidth = 0.5,
          medcol = "white",
          whiskcol = "black",
          boxwex = 0.5,
          outpch = 19,
          outcol = "black")
}

# Reset the plotting layout
par(mfrow = c(1, 1))



