# Ejemplo 6. Lectura de JSON y XML



Para comenzar necesimos instalar los paquetes `rjson`, y `XML`, por ejemplo, utilizando la función `install.packages`. Una vez que hemos instalado los paquetes, podemos cargarlos en `R` mediante la instrucción

```R
library(rjson)
library(XML)
```

#### Lectura de JSON

Podemos leer un archivo json de la siguiente manera

```R
URL1 <- "http://www.ipab.org.mx/ipab/datosabiertos?od=02-21"
JsonData <- fromJSON(file = URL1)
class(JsonData)
length(JsonData)
str(JsonData)
```

#### Lectura de XML

Podemos leer un archivo xml de la siguiente manera

```R
URL2 <- "http://www.ipab.org.mx/ipab/datosabiertos?od=03-21"
xmlfile <- xmlTreeParse(URL2) # Parse the XML file. Analizando el XML
topxml <- xmlSApply(xmlfile, function(x) xmlSApply(x, xmlValue)) # Mostrando los datos de una forma amigable
xml_df <- data.frame(t(topxml), row.names= NULL) # Colocandolos en un Data Frame
str(xml_df) # Observar la naturaleza de las variables del DF
head(xml_df)
```

Una manera más fácil para el usuario

```R
url3 <- URL2 # cargue el URL del XML
data_df <- xmlToDataFrame(url3)
head(data_df)
# Datos obtenidos de: https://datos.gob.mx/busca/dataset/saldo-de-bonos-de-proteccion-al-ahorro-bpas
```
