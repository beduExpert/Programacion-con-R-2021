# Postwork

### Objetivo

El Postwork tiene como objetivo que practiques los comandos básicos aprendidos durante la sesión, de tal modo que sirvan para reafirmar el conocimiento. Recuerda que la programación es como un deporte en el que se debe practicar, habrá caídas, pero lo importante es levantarse y seguir adelante. Éxito

### Requisitos
- Concluir los retos
- Haber realizado los ejercicios durante la sesión

### Desarrollo
Al igual que durante las sesiones y en los retos, hay que revisar y ejecutar el siguiente código, se retomarán conocimientos de los ejercicios hechos y de los retos.

Comienza leyendo el siguiente repositorio el cual contiene datos sobre la elección de 2020 en USA, se encuentra en el siguiente link https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/governors_county_candidate.csv

Cargamos las librerías necesarias y se lee el archivo **.csv**, desde el repositorio

```R
library(dplyr)

candidates <- read.csv("../Sesiones/archive/governors_county_candidate.csv")
```
Se obtienen algunos datos de interés para comenzar el análisis exploratorio

```R
dim(candidates)
summary(candidates)
str(candidates)
```

Se puede hacer un poco más sencilla la lectura, agregando una columna que sea **votes/1000** para que sea el número de votos por 1000
```R
candidates <- candidates %>% mutate( votes_x1000 = votes/1000)
```

Ahora se agrupará por estado y se obtendrá la suma de votos por cada uno de ellos, y al final se organizarán en orden alfabético 

```R
names(candidates)
candidates %>% 
  group_by(state) %>%
  summarise(votes_state = sum(votes)) %>%
  arrange(state)
```

También se puede obtener el número de votos por partido y organizlo por menor número de votos a mayor.
```R
candidates %>% 
  group_by(party) %>%
  summarise(votes_party = sum(votes)) %>%
    arrange(votes_party)
```

Podemos realizar una gráfica por cada partido y cuántos votos obtuvo, de esta manera visualizar los resultados

```R
install.packages("ggplot")
library(ggplot2)

ggplot(party.v) + 
       geom_point(aes(x= party , y = votes_party, colour = party))
 ```
