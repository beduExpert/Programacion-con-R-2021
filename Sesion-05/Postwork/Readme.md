
agrega el programa que se desarrollara con backticks> [agrega la sesion con backticks]

## Titulo del Ejemplo

### OBJETIVO

- Lo que esperamos que el alumno aprenda

#### REQUISITOS

1. Lo necesario para desarrollar el ejemplo o el Reto

#### DESARROLLO

# Postwork Sesión 5

1. A partir del conjunto de datos de soccer de la liga española de las temporadas 2017/2018, 2018/2019 y 2019/2020, creé el data frame `SmallData`, que contenga las columnas `date`, `home.team`, `home.score`, `away.team` y `away.score`; esto lo puede hacer con ayuda de la función `select` del paquete `dplyr`. Luego establezca un directorio de trabajo y con ayuda de la función `write.csv` guarde el data frame como un archivo csv con nombre *soccer.csv*. Puede colocar como argumento `row.names = FALSE` en `write.csv`. 

2. Con la función `create.fbRanks.dataframes` del paquete `fbRanks` importe el archivo *soccer.csv* a `R` y al mismo tiempo asignelo a una variable llamada `listasoccer`. Se creará una lista con los elementos `scores` y `teams` que son data frames listos para la función `rank.teams`. Asigne estos data frames a variables llamadas `anotaciones` y `equipos`.

3. Con ayuda de la función `unique` creé un vector de fechas (`fecha`) que no se repitan y que correspondan a las fechas en las que se jugaron partidos. Creé una variable llamada `n` que contenga el número de fechas diferentes. Posteriormente, con la función `rank.teams` y usando como argumentos los data frames `anotaciones` y `equipos`, creé un ranking de equipos usando unicamente datos desde la fecha inicial y hasta la penúltima fecha en la que se jugaron partidos, estas fechas las deberá especificar en `max.date` y `min.date`. Guarde los resultados con el nombre `ranking`.

4. Finalmente estime las probabilidades de los eventos, el equipo de casa gana, el equipo visitante gana o el resultado es un empate para los partidos que se jugaron en la última fecha del vector de fechas `fecha`. Esto lo puede hacer con ayuda de la función `predict` y usando como argumentos `ranking` y `fecha[n]` que deberá especificar en `date`.
