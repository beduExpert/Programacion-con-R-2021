


## Postwork: Pronóstico de resultados de fútbol 

### OBJETIVO

- Realizar descarga de archivos desde internet
- Utilizar funciones tipo if
- Gráfica de resultados

#### REQUISITOS

1. R, RStudio
2. Haber realizado el prework y seguir el curso de los ejemplos de la sesión

#### DESARROLLO

El siguiente código descarga datos de la temporada 2019-2020 de la bundesliga y estima las probabilidades de los eventos "El equipo de casa gana",  "El equipo visitante gana" y "El resultado es un empate" con base en los momios ofrecidos para estos eventos por una casa de apuestas.

Analiza brevemente el código (no es necesario que comprendas cada detalle, aunque no es difícil). Ejecuta el código y observa el gráfico que muestra los resultados. 

#### Actividad
Ejecuta el mismo código pero tomando como data frame aquel que tenga los partidos jugados desde la temporada 2010-2011 hasta la temporada 2020-2021 (conjunto de datos mayor que el anterior), que puedes encontrar en https://www.football-data.co.uk/germanym.php

Descargando los archivos
```R
setwd("C:\\soccer") # Establezca primero un directorio de trabajo
url <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
download.file(url = url, destfile = "Bundesliga1.csv", mode = "wb")


library(dplyr)
library(ggplot2)
```

Realizando la lectura de los datos
```R
data <- read.csv("Bundesliga1.csv") # Leemos los datos descargados
tail(data)
dim(data)

B365 <- select(data, B365H:B365A) # Seleccionamos los momios ofrecidos por una casa de apuestas
tail(B365)

R <- data$FTR # Vector de resultados de los partidos
R <- gsub("H", 1, R) # Indicamos la victoria del equipo de casa con 1
R <- gsub("D", 2, R) # Indicamos el empate con 2
R <- gsub("A", 3, R) # Indicamos la victoria del equipo Visitante con 3
R <- as.numeric(R)
```
**Apuestas** 

Vamos a suponer que las apuestas son 1 a 1, es decir, que los apostadores, 
arriesgan la misma cantidad de dinero en cada apuesta

```R
Bookmaker <- B365 # Consideramos los momios de la casa de apuestas para estimar las probabilidades de los eventos

Bankroll <- 10000 # Capital disponible para apostar
Historial <- NULL # Este será un vector de resultados (de nuestro capital)
Stake <- 500 # Cantidad fija a arriesgar cada vez que apostamos

for(j in 1:dim(Bookmaker)[1]){ # Reslizamos una secuencia de apuestas
  if(max(1/Bookmaker[j,]) > 0.5){ # Apostamos únicamente cuando la probabilidad más grande entre los 3 eventos de interés es mayor que 0.5
    if(which.min(Bookmaker[j,]) == R[j]){ # El evento con la probabilidad más grande, es el evento con el momio más pequeño 
      Bankroll <- Bankroll + Stake # Si el evento con la probabilidad más grande y mayor a 0.5 ocurrió, entonces ganamos la apuesta y aumentamos nuestro capital
    } else{
      Bankroll <- Bankroll - Stake # Si el evento con la probabilidad más grande y mayor a 0.5 no ocurrió, entonces perdemos la apuesta y disminuimos nuestro capital
    }
    Historial <- c(Historial, Bankroll) # Guardamos nuestro capital actualizado como último elemento en el vector historial
  }
}

g <- data.frame(Num_Ap = 1:length(Historial), Capital = Historial) # Formamos un data frame con una columna que indica el número de apuesta y otra que indica el capital después de cada apuesta

```

# Graficamos nuestros resultados

```R
p <- ggplot(g, aes(x=Num_Ap, y=Capital)) + geom_line( color="purple") + geom_point() +
  labs(x = "NÃºmero de Apuesta", 
       y = "Capital",
       title = "Realizando una secuencia de apuestas") +
  theme(plot.title = element_text(size=12))  +
  theme(axis.text.x = element_text(face = "bold", color="blue" , size = 10, angle = 25, hjust = 1),
        axis.text.y = element_text(face = "bold", color="blue" , size = 10, angle = 25, hjust = 1))  # color, Ã¡ngulo y estilo de las abcisas y ordenadas 
p 
```
