
# Ejemplo 2. MSV

### OBJETIVO 

- Poner en práctica los recursos expuestos en los ejemplos de la sesión 

#### REQUISITOS 

1. 

#### DESARROLLO

En el archivo de datos csv adjunto se encuentran observaciones correspondientes a dos clases diferentes indicadas por la variable `y`. Únicamente hay dos variables predictoras o características. Realice lo siguiente:

1. Cargue los paquetes `ggplot2` y `e1071`; observe algunas características del data frame con las funciones `tail` y `dim`. Obtenga el gráfico de dispersión de los datos diferenciando las dos clases.

2. Genere de manera aleatoria un vector de índices para filtrar un conjunto de entrenamiento a partir del conjunto de datos dado. Con ayuda de las funciones `tune` y `svm` ajuste máquinas de vectores de soporte con un kernel radial a los datos de entrenamiento, para valores del parámetro `cost` igual a 0.1, 1, 10, 100, 1000 y valores del parámetro `gamma` igual a 0.5, 1, 2, 3, 4. Obtenga un resumen de los resultados.

3. Con el modelo que tuvo el mejor desempeño en el paso anterior realice clasificación con la función `predict` y el conjunto de datos de prueba. Muestre la matriz de confusión.
