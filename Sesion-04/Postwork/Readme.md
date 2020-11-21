# Postwork Sesión 4

# Objetivo

- Llevar a cabo un contraste de hipótesis acerca de la diferencia de medias de dos poblaciones normales cuando los tamaños muestrales son pequeños

# Requisitos

- R, RStudio
- Haber trabajado con el Prework y el Work

# Desarrollo

#### Contraste de cola superior para mu1 - mu2

Dadas dos muestras aleatorias independientes de tamaño n1 = 8 y n2 = 9 de la distribución normal con sigma1 = sigma2

```R
set.seed(666)
m1 <- rnorm(n = 8, mean = 100, sd = 5)
tail(as.data.frame(m1), 1)
m2 <- rnorm(n = 9, mean = 85, sd = 5)
tail(as.data.frame(m2), 1)
100 - 85 # diferencia real de medias
```

estamos interesados en contrastar las hipótesis H0: mu1 - mu2 = 0 *vs* H1: mu1 - mu2 > 0 (contraste de cola superior).

1. Decida si rechazar o no la hipótesis nula si el nivel de significancia es alpha = 0.05
2. Obtenga el p-value de la prueba
3. Lleve a cabo la prueba con la función `t.test`

Quiz
Suponga que realiza un examen de opción múltiple con 30 preguntas, en donde cada pregunta tiene 5 posibles respuestas, pero solo una es correcta siempre. Si elige la respuesta al azar en cada pregunta, y estamos interesados en el número de respuestas correctas obtenidas al final ¿Podemos decir que estamos ante un experimento binomial?

Dada una muestra aleatoria X1, X2, …, Xn de una población con media  y varianza 2 finitas, ¿Podemos saber cómo se distribuye aproximadamente la variable aleatoria (X-μ)/(σ/√n)? 
Justifique su respuesta.

Consulte en diferentes fuentes cuando consideramos que una muestra es grande o pequeña cuando llevamos a cabo contrastes de hipótesis.
