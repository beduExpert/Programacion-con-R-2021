# Postwork Sesión 4

#### Contraste de cola superior para mu1 - m2

# Dadas dos muestras aleatorias independientes de tamaño n1 = 8 y n2 = 9 
# de la distribución normal con sigma1 = sigma2

set.seed(666)
m1 <- rnorm(n = 8, mean = 100, sd = 5)
tail(as.data.frame(m1))
m2 <- rnorm(n = 9, mean = 85, sd = 5)
tail(as.data.frame(m2))
100 - 85 # diferencia real de medias

# estamos interesados en contrastar las hipótesis H0: mu1 - mu2 = 0 vs H1: mu1 - mu2 > 0 (contraste de cola superior).

# 1. Decida si rechazar o no la hipótesis nula si el nivel de significancia es alpha = 0.05
# 2. Obtenga el p-value de la prueba
# 3. Lleve a cabo la prueba con la función t.test


# **Solución**

#### Contraste de cola superior

# 1.

# El valor observado del estadístico de prueba en este caso está dado por

t0 <- (mean(m1)-mean(m2)-0)/(sqrt(((8-1)*var(m1)+(9-1)*var(m2))/(8 + 9 - 2))*sqrt(1/8+1/9))
t0

# que proviene de una distribución $t$ de Student con 8 + 9 - 2 = 15 gl

# Estamos interesados en encontrar la región de rechazo (de cola superior) 
# con un nivel de significancia alpha = 0.05, debemos encontrar el valor 
# t.05 que satisface P(T > t.05) = 0.05.

(t.05 <- qt(p = 0.05, df= 15, lower.tail = FALSE))

# Como

t0 > t.05

# rechazamos la hipótesis nula.

  
# **p-value** El p-value lo podemos calcular como 

(pvalue <- pt(t0, df = 15, lower.tail = FALSE)) # 2.

t.test(x = m1, y = m2,                          # 3.
       alternative = "greater",
       mu = 0, paired = FALSE, var.equal = TRUE)
