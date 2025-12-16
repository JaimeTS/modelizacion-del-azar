# Variables aleatorias {#varale}

En el estudio de fenómenos aleatorios —como lanzar una moneda, medir el tiempo que tarda en llegar un pedido o analizar el número de visitas a una página web— nos interesa modelizar los posibles resultados numéricamente. Para ello utilizamos las **variables aleatorias**, que permiten asociar un valor numérico a cada resultado posible de un experimento aleatorio. Esta idea sencilla nos permite transformar la incertidumbre en un objeto matemático que puede ser analizado con herramientas estadísticas.

Las variables aleatorias se utilizan cada vez que queremos cuantificar resultados inciertos, modelizar procesos aleatorios o construir modelos probabilísticos que nos ayuden a tomar decisiones. Son fundamentales en economía, empresa, ciencia de datos, ingeniería o ciencias sociales, ya que permiten calcular probabilidades, medias, varianzas y, en general, describir el comportamiento de un fenómeno aleatorio.

Una **variable aleatoria** es una función que asigna un número real a cada resultado del espacio muestral de un experimento aleatorio. Es decir, es una regla que traduce los posibles resultados de un fenómeno aleatorio en valores numéricos que podemos estudiar matemáticamente.

Formalmente, una variable aleatoria $X$ es una función:

$$
X: \Omega \longrightarrow \mathbb{R}
$$

donde $\Omega$ es el espacio muestral (conjunto de todos los posibles resultados del experimento) y $( \mathbb{R}$ es el conjunto de los números reales.

## Clasificación de las variables aleatorias

Podemos clasificar las variables aleatorias en función de dos criterios principales:

1.  **Número de dimensiones (número de variables)**:

    -   **Unidimensionales**: asocian un único número real a cada resultado del experimento.\
        Por ejemplo, medir el peso de un paquete o contar el número de reclamaciones recibidas en un día.

    -   **Bidimensionales** (o más generalmente, **multidimensionales**): asocian un vector de números reales a cada resultado del experimento.\
        Por ejemplo, registrar simultáneamente el peso y el volumen de un paquete, o medir el gasto mensual y el ingreso mensual de un hogar.\
        En este caso, hablamos de una *variable aleatoria vectorial* o un *vector aleatorio*.

    Formalmente, si $X = (X_1, X_2)$ es una variable aleatoria bidimensional:

    $$
    X: \Omega \longrightarrow \mathbb{R}^2
    $$

2.  **Naturaleza de los valores que pueden tomar**:

    -   **Discretas**: cuando sus valores posibles son finitos o infinitos numerables (por ejemplo, $0,1,2,\ldots$,el número de hijos de una familia o el número de fallos en una cadena de producción).
    -   **Continuas**: cuando pueden tomar cualquier valor dentro de un intervalo o subconjunto de los números reales (por ejemplo, la altura de una persona o el tiempo que tarda un cliente en ser atendido).

## Variables aleatorias Unidimensionales

### Variables aleatorias discretas

Una **variable aleatoria discreta** es aquella que solo puede tomar un número **finito o numerable** de valores. Estos valores suelen estar separados entre sí, como los números enteros, y cada uno tiene una probabilidad asociada.

Ejemplos comunes de variables aleatorias discretas son:

-   El número de caras al lanzar varias monedas.

-   El número de clientes que llegan a una tienda en una hora.

\- El número de errores en un documento.

#### Función de probabilidad o función de cuantía

La **función de probabilidad** (también llamada función de masa de probabilidad o función de cuantía) de una variable aleatoria discreta $X$ es una función que asigna a cada valor posible $x_i$ la probabilidad de que la variable tome ese valor:

$$
f(x_i) = P(X = x_i)
$$

Cumple dos propiedades fundamentales:

1.  $f(x_i) \geq 0$ para todo $x_i$
2.  $\sum_i f(x_i) = 1$

Estas probabilidades pueden representarse en una tabla, un gráfico de barras o en forma de función.

#### Función de distribución acumulada (FDA)

La **función de distribución acumulada** $F(x)$ de una variable aleatoria discreta se define como:

$$
F(x) = P(X \leq x) = \sum_{x_i \leq x} f(x_i)
$$

La FDA representa la probabilidad de que la variable tome un valor **menor o igual** que $x$. Es una función escalonada, monótona no decreciente, con las siguientes propiedades:

-   $\lim_{x \to -\infty} F(x) = 0$
-   $\lim_{x \to \infty} F(x) = 1$
-   $0 \leq F(x) \leq 1$ para todo $x$.
-   Es una función **monótona no decreciente**: si $x < y$, entonces $F(x) \leq F(y)$.
-   Es **escalonada**: aumenta en los puntos donde la variable aleatoria toma valores, y es constante entre ellos.
-   Es **continua por la derecha**: en cada punto $x$, se cumple que $F(x) = \lim_{t \downarrow x} F(t)$.

Gráficamente, tanto la función de cuantía como de distribución tienen la siguiente forma:

<img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-1-1.png" width="672" /><img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-1-2.png" width="672" />

**Ejemplos de variables aleatorias discretas**

**Ejemplo 1: Número de clientes atendidos en una hora**

La variable aleatoria $X$ representa el número de clientes que entran en una tienda durante una hora. Supongamos que los valores posibles son 0, 1, 2 o 3 clientes, y las probabilidades se basan en la experiencia previa.

| $x$ | $f(x) = P(X = x)$ | $F(x) = P(X \leq x)$ |
|----:|------------------:|---------------------:|
|   0 |               0.1 |                  0.1 |
|   1 |               0.3 |                  0.4 |
|   2 |               0.4 |                  0.8 |
|   3 |               0.2 |                  1.0 |

**Ejemplo 2 (distribución de Bernoulli): Aprobación de un test**

La variable aleatoria $X$ representa si un estudiante aprueba (1) o suspende (0) un test. Supongamos que la probabilidad de aprobar es 0.7.

| $x$ | $f(x) = P(X = x)$ | $F(x) = P(X \leq x)$ |
|----:|------------------:|---------------------:|
|   0 |               0.3 |                  0.3 |
|   1 |               0.7 |                  1.0 |

**Ejemplo 3 (distribución uniforme discreta): Sorteo de una plaza**

La variable aleatoria $X$ representa el número del participante que gana una beca, entre 5 candidatos con igual probabilidad.

| $x$ | $f(x) = P(X = x)$ | $F(x) = P(X \leq x)$ |
|----:|------------------:|---------------------:|
|   1 |               0.2 |                  0.2 |
|   2 |               0.2 |                  0.4 |
|   3 |               0.2 |                  0.6 |
|   4 |               0.2 |                  0.8 |
|   5 |               0.2 |                  1.0 |

**Ejemplo 4: número de caras al lanzar 3 monedas**

Sea $X$ la variable aleatoria que cuenta el *número de caras* *al lanzar tres monedas.*

Los posibles valores que puede tomar son: $X = 0, 1, 2, 3$

La tabla muestra la función de cuantía $f(x) = P(X = x)$ y la función de distribución acumulada $F(x) = P(X \leq x)$:

| $x$ |     $f(x) = P(X = x)$ | $F(x) = P(X \leq x)$ |
|----:|----------------------:|---------------------:|
|   0 | $\frac{1}{8}$ = 0.125 |                0.125 |
|   1 | $\frac{3}{8}$ = 0.375 |                0.500 |
|   2 | $\frac{3}{8}$ = 0.375 |                0.875 |
|   3 | $\frac{1}{8}$ = 0.125 |                1.000 |

------------------------------------------------------------------------

**Representación gráfica en R del "número de caras al lanzar tres monedas"**


```r
# Valores posibles de X
x <- 0:3
# Función de cuantía
p <- c(1, 3, 3, 1) / 8
# Función de distribución acumulada
F <- cumsum(p)

# Función de cuantía (gráfico de "palos")
plot(x, p, type = "h", lwd = 2, col = "blue",
     main = "Función de cuantía f(x)",
     xlab = "Valores de X", ylab = "P(X = x)")
points(x, p, pch = 16, col = "blue")
```

<img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-2-1.png" width="672" />

```r
# Función de distribución acumulada (gráfico escalera)
plot(x, F, type = "s", lwd = 2, col = "darkgreen",
     main = "Función de distribución acumulada F(x)",
     xlab = "Valores de X", ylab = "F(x)")
points(x, F, pch = 16, col = "darkgreen")
```

<img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-2-2.png" width="672" />

### Variables aleatorias continuas

Una **variable aleatoria continua** es aquella que puede tomar **infinitos valores dentro de un intervalo del conjunto de los números reales**. A diferencia de las variables discretas, donde los valores están separados unos de otros (por ejemplo, 0, 1, 2…), en las variables continuas no hay “saltos” entre los posibles resultados. Es decir, entre dos valores cualesquiera, siempre existe otro valor posible, por lo que el conjunto de valores que puede tomar **no es numerable**.

Dado que hay infinitos valores posibles, **la probabilidad de que la variable tome un valor exacto es siempre cero**: $P(X = x) = 0$. Por tanto, **solo se pueden calcular probabilidades sobre intervalos**, como $P(a \leq X \leq b)$.

Ejemplos comunes de variables aleatorias continuas son:

-   El tiempo de espera de un cliente en una cola: puede ser 1,85 minutos, 3,142 minutos, o cualquier número real positivo.
-   La cantidad diaria de lluvia en una ciudad, medida en litros por metro cuadrado: puede ser 0, 1,5, 2,78, etc.
-   La altura de una persona, que puede medirse con tanta precisión como permita el instrumento: 165,0 cm, 165,01 cm, 165,001 cm…

Estas variables requieren herramientas matemáticas diferentes a las discretas, como la función de densidad y el cálculo integral, para poder estudiar sus propiedades y calcular probabilidades.

#### Función de densidad de probabilidad

La función de densidad de una variable aleatoria continua $f(x)$ cumple:

-   $f(x) \geq 0$ para todo $x \in \mathbb{R}$ (es no negativa)
-   $\int_{-\infty}^{\infty} f(x) dx = 1$
-   La probabilidad de que $X$ esté entre dos puntos $a$ y $b$ se calcula como el área bajo la curva:

$$
P(a \leq X \leq b) = \int_a^b f(x) dx
$$

<img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-3-1.png" width="672" />

#### Función de distribución acumulada (FDA)

La función de distribución acumulada de una variable aleatoria continua $X$ es una función $F(x)$ que asocia a cada valor $a$ la probabilidad de que la variable tome un valor menor o igual que $a$, es decir:

$$
F(a) = P(X \leq a) = \int_{-\infty}^a f(x) dx
$$

Esta función también cumple:

-   $\lim_{x \to -\infty} F(x) = 0$
-   $\lim_{x \to \infty} F(x) = 1$
-   Es continua, monótona no decreciente.
-   Su derivada (si existe) es la función de densidad:\
    $$
    f(x) = \frac{dF(x)}{dx}
    $$

<img src="03-variables-aleatorias_files/figure-html/grafico-fda-continua-1.png" width="672" />

**Ejemplo del tiempo de espera en una cola**.

Sea $X$ la variable aleatoria que representa el tiempo (en minutos) que un cliente espera en una cola de atención. Aunque no podemos asignar una probabilidad exacta a un valor concreto (por ejemplo, $P(X = 3) = 0$), sí tiene sentido calcular probabilidades en intervalos, como:

-   $P(1 \leq X \leq 1,5)$: probabilidad de que espere entre 1 y 1,5 minutos.
-   $P(X \leq 5)$: probabilidad de que espere como mucho 5 minutos.

<img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-4-1.png" width="672" />

## Momentos estadísticos de una variable aleatoria unidimensional: esperanza y varianza

Los momentos son medidas que permiten describir las características fundamentales de una variable aleatoria, tales como su tendencia central, dispersión, asimetría o curtosis. De manera general, los momentos cuantifican el valor medio de las potencias de la variable aleatoria respecto a un punto de referencia.

Podemos distinguir dos tipos principales de momentos:

-   **Momentos respecto del origen**: miden la magnitud promedio de las potencias de la variable respecto a cero.
-   **Momentos respecto de la media**: miden la dispersión y forma de la distribución respecto a su media.

### Momentos respecto del origen

El momento de orden $k$ respecto del origen de una variable aleatoria $X$ se define como la esperanza de la variable aleatoria de orden $k$:

$$
\alpha_k = E\left[X^k\right]
$$

El caso particular más importante es el **momento de primer orden respecto del origen**, que corresponde a la media o Esperanza de la variable aleatoria $X$:

$$
\alpha_1 = E[X]
$$

### Momentos respecto de la media

El momento de orden $k$ respecto de la media (o momento central) se define como:

$$
\mu_k = E\left[(X - E[X])^k\right]
$$

Este tipo de momentos nos informa sobre la dispersión, la asimetría y la forma de la distribución. El más importante es el **momento de segundo orden respecto de la media**, que corresponde a la varianza ($\sigma^2$):

$$
\mu_2 =\sigma^2= Var(X) = E\left[(X - E[X])^2\right]
$$

En los siguientes puntos se explicará como se calcula para el caso discreto y continuo.

### Relación entre los momentos respecto de la media y del origen

Todos los momentos respecto de la media se pueden calcular como una función de los momentos respecto del origen. La fórmula general que los relaciona es:

$$
\mu_r = \sum_{k=0}^{r} \binom{r}{k} (-1)^{r-k}\,\mu^{r-k}\,\alpha_k.
$$

donde $r$ es el orden del momento respecto de la media, $k$ es un número entero que va desde 0 hasta $r$ y $\mu=\alpha_1$ es el momento respecto del origen de orden 1 o la media.

En particular, los primeros momentos cumplen:

-   **Momento respecto de la media de orden 1:**

    $$
    \mu_1 = 0.
    $$

-   **Momento respecto de la media de orden 2 (varianza):**

    $$
    \mu_2 = \alpha_2 - (\alpha_1)^2.
    $$ Demostración:

Partiendo de la fórmula general:

$$
\mu_r = \sum_{k=0}^{r} \binom{r}{k}\,(-1)^{r-k}\,\mu^{r-k}\,\alpha_k,
$$

Para $r=2$:

$$
\mu_2 = \sum_{k=0}^{2} \binom{2}{k}\,(-1)^{2-k}\,\mu^{2-k}\,\alpha_k.
$$

Desarrollamos término a término del valor $k$:

*Primer término (*$k=0$):

$$
\binom{2}{0}\,(-1)^{2-0}\,\mu^{2-0}\,\alpha_0 = (1)\,(+1)\,\mu^{2}\,(1) = \mu^2.
$$

*Segundo término (*$k=1$):

$$
\binom{2}{1}\,(-1)^{2-1}\,\mu^{2-1}\,\alpha_1 = (2)\,(-1)\,\mu\,\alpha_1 = -2\,\mu\,\alpha_1=-2\,\mu^2
$$

*Tercer término (*$k=2$):

$$
\binom{2}{2}\,(-1)^{2-2}\,\mu^{2-2}\,\alpha_2 = (1)\,(+1)\,(1)\,\alpha_2 = \alpha_2.
$$

Sumamos los tres términos:

$$
\mu_2 = \mu^2 - 2\mu^2 + \alpha_2=\alpha_2-\mu^2
$$

Finalmente:

$$
\boxed{
\mu_2 = \alpha_2 - \alpha_1^2
}
$$

-   **Momento respecto de la media de orden 3 (asimetría):**

    $$
    \mu_3 = \alpha_3 - 3\,\alpha_1\,\alpha_2 + 2\,(\alpha_1)^3.
    $$

-   **Momento respecto la media de orden 4 (curtosis):**

    $$
    \mu_4 = \alpha_4 - 4\,\alpha_1\,\alpha_3 + 6\,(\alpha_1)^2\,\alpha_2 - 3\,(\alpha_1)^4.
    $$

### Esperanza y varianza de las variables aleatorias unidimensionales

Para definir la media y la varianza de manera más concreta, debemos distinguir entre variables aleatorias discretas y continuas.

#### Esperanza y varianza para variables aleatorias discretas

Sea $X$ una variable aleatoria discreta con función de masa de probabilidad $p(x)$:

-   **Esperanza matemática (media):**

$$
\mu_X=E[X] = \sum_{x_i} x_i \, p(x_i)
$$

-   **Varianza:**

$$
\sigma^2=Var(X) = \sum_{x_i} (x_i - E[X])^2 \, p(x_i)=\sum_{x_i} (x_i - \mu_X)^2 \, p(x_i)
$$

que también se puede calcular como

$$
\sigma^2=\text{Var}(X) = E[X^2] - (E[X])^2=E[X^2] - \mu_X^2
$$

En este caso, $E[X^2]$ es el momento respecto del origen de orden 2 que se calcula como:

$$
E[X^2] = \sum_{x_i} x^2_i \, p(x_i)
$$

#### Esperanza y varianza para variables aleatorias continuas

Sea $X$ una variable aleatoria continua con función de densidad $f(x)$:

-   **Esperanza matemática:**

$$
E[X] = \int_{-\infty}^{\infty} x \, f(x) \, dx
$$

-   **Varianza:**

$$
\sigma^2=Var(X) = \int_{-\infty}^{\infty} (x - E[X])^2f(x)dx=\int_{-\infty}^{\infty} (x - \mu_X)^2f(x)  dx
$$

que se puede reescribir como:

$$
\text{Var}(X) = E[(X - E[X])^2]= E[(X - \mu_X)^2]
$$

A efectos prácticos y aplicando las relaciones entre momenttos, suele calcularse con la siguiente fórmula:

$$
\text{Var}(X) = E[X^2] - (E[X])^2=E[X^2] - \mu_X^2
$$

donde $E[X^2]$ para el caso continuo es igual a:

$$
E[X^2] = \int_{-\infty}^{\infty} x^2 \cdot f(x)dx
$$

A continuación se presentan las definiciones y fórmulas para variables aleatorias discretas y continuas. Notar, que la definición de estos momentos poblacionales es análoga a la de momentos muestrales (y sus propiedades son las mismas), pero en vez de emplear frecuencias (relativas o absolutas) se emplean probabilidades o densidades.

**Interpretación**

-   La **esperanza** representa la media de la variable aleatoria e indica el “centro de gravedad” de la distribución.
-   La **varianza** mide la **dispersión** alrededor de ese centro.
-   Cuanto mayor es la varianza, más alejados están, en promedio, los valores posibles de la media.

**Ejemplo en R (variable discreta)**:


```r
# Valores y probabilidades
x <- 0:4
p <- c(0.1, 0.3, 0.4, 0.15, 0.05)

# Esperanza
esperanza <- sum(x * p)

# Varianza
varianza <- sum((x - esperanza)^2 * p)
varianza_momentos <- sum(x^2 * p) - esperanza^2

c(Esperanza = esperanza, Varianza = varianza, Varianza_mom = varianza_momentos)
```

```
##    Esperanza     Varianza Varianza_mom 
##       1.7500       0.9875       0.9875
```

**Ejemplo en R (variable continua)**:


```r
# Normal estándar: media 0, varianza 1
esperanza <- integrate(function(x) x * dnorm(x), -Inf, Inf)$value
varianza <- integrate(function(x) (x - esperanza)^2 * dnorm(x), -Inf, Inf)$value

c(Esperanza = esperanza, Varianza = varianza)
```

```
## Esperanza  Varianza 
##         0         1
```

### Propiedades de la esperanza y la varianza

Las propiedades algebraicas de la esperanza y la varianza permiten simplificar muchos cálculos y analizar el comportamiento de las variables aleatorias cuando se transforman o combinan.

#### Propiedades de la esperanza matemática

1.  **Esperanza de una constante**\
    Si $c$ es una constante:

    $$
    \mathbb{E}[c] = c
    $$

2.  **Cambio de origen**

Si $X$ es una variable aleatoria y $a$ es una constante, entonces:

$$
E[X + a] = E[X] + a
$$

Sumar una constante $a$ a una variable aleatoria **desplaza su esperanza** en esa misma cantidad. La forma de la distribución no cambia, solo se traslada a la derecha o a la izquierda.

3.  **Cambio de escala**

Si $X$ es una variable aleatoria y $b$ es una constante, entonces:

$$
E[bX] = b \cdot E[X]
$$

Multiplicar una variable aleatoria por una constante **escala su esperanza** por ese mismo valor. Esta propiedad es un caso particular de la linealidad de la esperanza cuando no hay término independiente.

4.  **Linealidad de la esperanza**

Para cualquier variable aleatoria $X$ y constantes $a$, $b$:

$$
   E[bX + a] = b \cdot E[X] + a
$$

La esperanza se comporta como una media: escalar por $b$ escala la media, y sumar $a$ la desplaza.

5.  **Esperanza de la suma o diferencia de variables aleatorias**\
    Si $X$ y $Y$ son variables aleatorias (independientes o no):

    $$
    E[X + Y] = E[X] + E[Y]
    $$

    Y en general, para $X_1, X_2, \dots, X_n$:

    $$
    E\left[\sum_{i=1}^n X_i\right] = \sum_{i=1}^n E[X_i]
    $$ y lo mismo para $$
     E[X-Y]=E[X]-E[Y]
     $$

6.  **Esperanza del producto de dos variables aleatorias**

Si $X$ y $Y$ son dos variables aleatorias, en general:

$$
E[XY] \neq E[X] \cdot E[Y]
$$

Sin embargo, **si** $X$ y $Y$ son independientes, entonces:

$$
E[XY] = E[X] \cdot E[Y]
$$

Esta propiedad es muy útil cuando se trabaja con productos de variables aleatorias independientes, ya que permite descomponer la esperanza del producto como el producto de las esperanzas.

**Importante**:\
La **independencia** es una condición **necesaria** para que la igualdad se cumpla. Si $X$ y $Y$ no son independientes, la relación **no** es válida en general.

#### Propiedades de la varianza

1.  **No negatividad de la varianza**

Para cualquier variable aleatoria $X$:

$$
\text{Var}(X) \geq 0
$$

La varianza **nunca puede ser negativa**, ya que está definida como la esperanza de un cuadrado:

$$
\text{Var}(X) = E\left[(X - E[X])^2\right]
$$

Dado que los cuadrados son siempre mayores o iguales que cero, su media también lo es.

La varianza es cero **solo cuando** $X$ toma siempre el mismo valor (es decir, es una constante).

2.  **Varianza de una constante**

    Si $c$ es una constante:

    $$
    \text{Var}(c) = 0
    $$

    No hay variabilidad si el valor es constante, ya que siempre toma el mismo valor.

3.  **Cambio de origen**\
    Si $X$ es una variable aleatoria y $a$ una constante:

    $$
    \text{Var}(X + a) = \text{Var}(X)
    $$

    Sumar una constante a una variable aleatoria **no cambia su dispersión**, solo traslada la distribución horizontalmente. Por tanto, la varianza permanece inalterada.

4.  **Cambio de escala**\
    Si $X$ es una variable aleatoria y $b$ una constante:

    $$
    \text{Var}(bX) = b^2 \cdot \text{Var}(X)
    $$

    Multiplicar una variable aleatoria por una constante **escala su varianza al cuadrado de esa constante**. La dispersión se amplifica o reduce según el valor de $b$.

5.  **Combinación lineal con cambio de origen y escala**

    Si $X$ es una variable aleatoria y $a$, $b$ constantes:

    $$
    \text{Var}(a + bX) = b^2 \cdot \text{Var}(X)
    $$

    La varianza **no se ve afectada** por el término constante $a$, y **se escala al cuadrado** con $b$.

6.  **Varianza de la suma de variables aleatorias independientes**

    Si $X$ y $Y$ son **independientes**:

    $$
    \text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y)
    $$

    Y más generalmente, si $X_1, X_2, \dots, X_n$ son independientes:

    $$
    \text{Var}\left(\sum_{i=1}^n X_i\right) = \sum_{i=1}^n \text{Var}(X_i)
    $$

    La **dispersión total** es la suma de las dispersiónes individuales si las variables son independientes.

7.  **Varianza de la diferencia de variables aleatorias independientes**

    Si $X$ y $Y$ son **independientes**:

    $$
    \text{Var}(X - Y) = \text{Var}(X) + \text{Var}(Y)
    $$

    Aunque se trata de una resta, las dispersiónes **se suman** si las variables son independientes, ya que la varianza mide magnitud, no dirección.

8.  **Varianza de la suma si las variables NO son independientes**

    En el caso general, si $X$ y $Y$ **no son independientes**, entonces:

    $$
    \text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2 \cdot \text{Cov}(X, Y)
    $$

    La covarianza introduce un ajuste que depende de cómo se relacionan las variables. Si la covarianza es positiva, aumenta la varianza total; si es negativa, la reduce.

9.  **Varianza de la diferencia de variables aleatorias NO independientes**

Si $X$ y $Y$ son variables aleatorias **no independientes**, entonces:

$$
\text{Var}(X - Y) = \text{Var}(X) + \text{Var}(Y) - 2 \cdot \text{Cov}(X, Y)
$$

Cuando las variables **no son independientes**, la covarianza entre ellas afecta a la dispersión total.

-   Si $\text{Cov}(X, Y) > 0$ (tienden a variar en la misma dirección), la varianza de la diferencia **disminuye**.
-   Si $\text{Cov}(X, Y) < 0$ (tienden a variar en direcciones opuestas), la varianza de la diferencia **aumenta**.

Esta propiedad es útil cuando se analizan diferencias entre medidas correlacionadas, como por ejemplo antes y después de una intervención.

10. **Varianza del producto de una constante y una suma de variables**

Si $X_1, \dots, X_n$ son variables aleatorias y $b$ una constante:

$$
\text{Var}\left(b \cdot \sum_{i=1}^n X_i\right) = b^2 \cdot \text{Var}\left(\sum_{i=1}^n X_i\right)
$$

Este resultado utiliza la propiedad de cambio de escala. No se requiere independencia entre las variables.

Si, además, las variables $X_i$ son **independientes**, entonces:

$$
\text{Var}\left(b \cdot \sum_{i=1}^n X_i\right) = b^2 \cdot \sum_{i=1}^n \text{Var}(X_i)
$$

## Variables aleatorias Bidimensionales

En muchos problemas de probabilidad y estadística nos interesa estudiar simultáneamente dos variables aleatorias que pueden estar relacionadas. Por ejemplo, el número de productos vendidos y el beneficio obtenido, o el tiempo de servicio y el coste asociado. En estos casos hablamos de **variables aleatorias bidimensionales** o **pares de variables aleatorias**.

### Variables aleatorias bidimensionales discretas

**Definición:** Un par de variables aleatorias discretas es una función que asigna a cada resultado del espacio muestral un par ordenado de números reales. Sus valores posibles son combinaciones finitas o numerables de valores discretos.

#### Función de masa de probabilidad conjunta

La función de masa de probabilidad conjunta se define como:

$$
p(x_i, y_j) = P(X = x_i, \, Y = y_j)=f(x,y)
$$

Esta función da la probabilidad de que $X$ tome el valor $x_i$ e $Y$ tome el valor $y_j$ simultáneamente.

Para que la función de probabilidad conjunta sea tal, deben cumplirse las siguientes propiedades:

1.  Las probabilidades deben ser siempre nulas o positivas:

$$
p(x_i, y_j) \ge 0
$$

2.  La masa de probabilidad conjunta debe ser igual a la unidad:

$$
\sum_i \sum_j p(x_i, y_j) = 1
$$

#### Funciones marginales

Las funciones marginales de probabilidad de cada variable se obtienen sumando sobre los posibles valores de la otra variable:

-   **Función marginal de X:**

$$
p_X(x_i) = \sum_j p(x_i, y_j)
$$

-   **Función marginal de Y:**

$$
p_Y(y_j) = \sum_i p(x_i, y_j)
$$

Nótese, que para obtener la distribución marginal de una variable, se agregan todos los posibles valores de la otra, obteniéndose valores que dependen exclusivamente de la variable para la que se calcula la marginal. Con un ejemplo se entenderá mejor.

#### Funciones de probabilidad condicionada

Sea $(X,Y)$ una variable aleatoria bidimensional con función de probabilidad conjunta . Una de las formas de estudiar la relación entre ambas variables es a través de las probabilidades condicionadas.

Si $(X,Y)$ es discreta, la probabilidad condicionada de que $X = x_i$ dado que $Y = y_j$ es:

$$
P(X = x_i \mid Y = y_j) = \frac{P(X = x_i,\, Y = y_j)}{P(Y = y_j)} = \frac{p_{ij}}{p_{\cdot j}},
$$

donde:

-   $p_{ij}$ es la probabilidad conjunta $P(X = x_i,\, Y = y_j)$.
-   $p_{\cdot j} = \sum_i p_{ij}$ es la probabilidad marginal de $Y = y_j$.

De manera análoga:

$$
P(Y = y_j \mid X = x_i) = \frac{P(X = x_i,\, Y = y_j)}{P(X = x_i)} = \frac{p_{ij}}{p_{i \cdot}}.
$$

Estas probabilidades forman las distribuciones condicionadas de una variable dado el valor de la otra.

**Ejemplo de variables aleatorias discretas**

Imaginemos que tenemos dos variables aleatorias discretas:

-   $X =$ número de reclamaciones en el turno de mañana (puede ser 0 o 1).
-   $Y =$ número de reclamaciones en el turno de tarde (puede ser 0, 1 o 2).

La función de masa conjunta (obtenida como frecuencias relativas o probabilidades) es:

|          | $Y=0$ | $Y=1$ | $Y=2$ | $p_X(x)$ |
|----------|-------|-------|-------|----------|
| $X=0$    | 0.10  | 0.15  | 0.05  | 0.30     |
| $X=1$    | 0.20  | 0.30  | 0.20  | 0.70     |
| $p_Y(y)$ | 0.30  | 0.45  | 0.25  | 1.00     |

**Interpretación de la tabla:**

-   Cada celda o intersección muestra la probabilidad conjunta $P(X = x_i, Y = y_j)$.
-   Las sumas por filas dan las **probabilidades marginales de X**, es decir, es como si sólo se tuviera una única variable X que no depende de Y.
-   Las sumas por columnas dan las **probabilidades marginales de Y**, es decir, es como si sólo se tuviera una variable Y que no depende de X.
-   La suma total es 1, es decir, el conjunto de todas las probabilidades es igual a 1.

**Cálculo de las marginales:**

-   **Marginal de X:** Para el cálculo de la marginal de X, se suma para cada uno de los valores posibles (0, 1), los datos de Y.

$$
p_X(0) = 0.10 + 0.15 + 0.05 = 0.30
$$

$$
p_X(1) = 0.20 + 0.30 + 0.20 = 0.70
$$

-   **Marginal de Y:** Igual que X, pero en ese caso para Y.

$$
p_Y(0) = 0.10 + 0.20 = 0.30
$$

$$
p_Y(1) = 0.15 + 0.30 = 0.45
$$

$$
p_Y(2) = 0.05 + 0.20 = 0.25
$$

**Comprobación:** La suma de todas las probabilidades es igual a la unidad. Esto se puede obtener o sumando cada una de las marginales o sumando el conjunto de probabilidades conjuntas.

$$
\sum_x \sum_y p(x,y) = 1.00
$$

La **probabilidad condicionada** de un valor de $X$ dado un valor de $Y$ se calcula como:

$$
P(X = x_i \mid Y = y_j) = \frac{P(X = x_i, Y = y_j)}{P(Y = y_j)}.
$$

Por ejemplo:

-   Probabilidad de que haya una reclamación en la mañana ($X=1$), sabiendo que en la tarde hubo exactamente una reclamación ($Y=1$):

$$
P(X=1 \mid Y=1) = \frac{P(X=1, Y=1)}{P(Y=1)} = \frac{0.30}{0.45} = 0.6667.
$$

-   Probabilidad de que en la tarde haya dos reclamaciones ($Y=2$), sabiendo que en la mañana hubo una reclamación ($X=1$):

$$
P(Y=2 \mid X=1) = \frac{P(X=1, Y=2)}{P(X=1)} = \frac{0.20}{0.70} \approx 0.2857.
$$

Estas probabilidades muestran cómo el conocimiento de un suceso afecta la distribución de la otra variable.

### Variables aleatorias bidimensionales continuas

**Definición:** Un par de variables aleatorias continuas es aquel cuyas probabilidades se describen mediante una **función de densidad conjunta**.

#### Función de densidad conjunta

La función de densidad conjunta $f(x,y)$, al igual que en el caso discreto, satisface las siguientes propiedades:

$$
f(x,y) \ge 0
$$

$$
\iint_{-\infty}^{\infty} f(x,y) \, dx \, dy = 1
$$

La probabilidad de que $(X,Y)$ tome valores dentro de un conjunto $A$ es:

$$
P\bigl((X,Y) \in A\bigr) = \iint_A f(x,y)\, dx\, dy
$$

#### Funciones marginales

Las densidades marginales se obtienen integrando la densidad conjunta respecto de la otra variable:

-   **Densidad marginal de X:** Para obtener la marginal de X se integra respecto de Y.

$$
f_X(x) = \int_{-\infty}^{\infty} f(x,y) \, dy
$$

-   **Densidad marginal de Y:** Para obtener la marginal de Y se integra respecto de X.

$$
f_Y(y) = \int_{-\infty}^{\infty} f(x,y) \, dx
$$

#### Funciones de probabilidad condicionadas

Si $(X,Y)$ es continua con función de densidad conjunta $f_{X,Y}(x,y)$, la **densidad condicionada de** $X$ dado $Y=y$ es:

$$
f_{X \mid Y}(x \mid y) = \frac{f_{X,Y}(x,y)}{f_Y(y)},
$$

donde:

$$
f_Y(y) = \int_{-\infty}^{\infty} f_{X,Y}(x,y)\,dx
$$

es la densidad marginal de $Y$.

De forma simétrica:

$$
f_{Y \mid X}(y \mid x) = \frac{f_{X,Y}(x,y)}{f_X(x)}.
$$

Estas densidades permiten calcular probabilidades y esperanzas condicionadas, y son la base para el estudio de la dependencia entre variables.

**Ejemplo de variables aleatorias bidimensionales continuas**

Consideremos el par de variables aleatorias continuas $(X,Y)$ con la siguiente función de densidad conjunta:

$$
f(x,y) = 
\begin{cases}
4xy, & 0 \le x \le 1,\; 0 \le y \le 1 \\
0, & \text{en otro caso}
\end{cases}
$$

**Verificación de que es una densidad** (para verificarlo hay que comprobar que el conjunto de la masa de probabilidad sea igual a 1):

$$
\int_{0}^{1}\int_{0}^{1}4xy\,dx\,dy = 4 \left(\frac{1}{2}\right)\left(\frac{1}{2}\right) = 1.
$$

Por tanto, es válida.

**Densidad marginal de X:**

$$
f_X(x) = \int_0^1 4xy\,dy = 4x \left[\frac{y^2}{2}\right]_0^1 = 4x \cdot \frac{1}{2} = 2x.
$$

**Densidad marginal de Y:**

$$
f_Y(y) = \int_0^1 4xy\,dx = 4y \left[\frac{x^2}{2}\right]_0^1 = 4y \cdot \frac{1}{2} = 2y.
$$

La **densidad condicionada de X dado que** $Y=y$ se define como:

$$
f_{X \mid Y}(x \mid y) = \frac{f(x,y)}{f_Y(y)}.
$$

Sustituimos:

$$
f_{X \mid Y}(x \mid y) = \frac{4xy}{2y} = \frac{4x}{2} = 2x.
$$

**Interpretación:**\
Para cada valor fijo $y$ entre 0 y 1, la distribución de $X$ dado $Y=y$ sigue una densidad **independiente de y**:

$$
f_{X \mid Y}(x \mid y) = 2x, \quad 0 \le x \le 1.
$$

La **densidad condicionada de Y dado que** $X=x$ es:

$$
f_{Y \mid X}(y \mid x) = \frac{f(x,y)}{f_X(x)}.
$$

Sustituyendo:

$$
f_{Y \mid X}(y \mid x) = \frac{4xy}{2x} = \frac{4y}{2} = 2y.
$$

**Interpretación:** Para cada valor fijo $x$ entre 0 y 1, la distribución de $Y$ dado $X=x$ también es independiente de $x$:

$$
f_{Y \mid X}(y \mid x) = 2y, \quad 0 \le y \le 1.
$$

Vamos a representar gráficamente el soporte y las marginales.

<img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-7-1.png" width="576" />

<img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-8-1.png" width="672" />

<img src="03-variables-aleatorias_files/figure-html/unnamed-chunk-9-1.png" width="672" />

Vamos a calcular la propabilidad de que $X \le 0.5$ y $Y \le 0.5$:

Queremos calcular:

$$
P(X \le 0.5, \, Y \le 0.5) = \int_{0}^{0.5}\int_{0}^{0.5}4xy\,dx\,dy.
$$

Caclulamos paso a paso:

1.  Primero integramos respecto a $x$:

$$
\int_0^{0.5} 4y \left[ \frac{x^2}{2} \right]_0^{0.5} dy = \int_0^{0.5} 4y \cdot \frac{(0.5)^2}{2} \,dy.
$$

2.  Recalculamos dentro de la integral:

$$
\frac{(0.5)^2}{2} = \frac{0.25}{2} = 0.125.
$$

Por tanto:

$$
\int_0^{0.5} 4y \cdot 0.125 \,dy = \int_0^{0.5} 0.5y \,dy.
$$

3.  Integramos respecto a $y$:

$$
0.5 \left[ \frac{y^2}{2} \right]_0^{0.5} = 0.5 \cdot \frac{(0.5)^2}{2} = 0.5 \cdot \frac{0.25}{2} = 0.5 \times 0.125 = 0.0625.
$$

Por lo que

$$
P(X \le 0.5, \, Y \le 0.5) = 0.0625.
$$

### Independencia de variables aleatorias bidimensionales

Dos variables aleatorias $X$ y $Y$ son **independientes** si conocer el valor de una de ellas **no aporta ninguna información** sobre la distribución de la otra.

En términos de las funciones de probabilidad condicionada, esto significa que, para todo $x$ y $y$:

$$
P(X = x \mid Y = y) = P(X = x)
$$

$$
P(Y = y \mid X = x) = P(Y = y)
$$

Es decir, la probabilidad de que $X$ tome el valor $x$ **no depende** del valor que tome $Y$, y viceversa.

**Definición formal:**

-   **Variables discretas:**

$X$ y $Y$ son independientes si, para todos los valores posibles $x_i$ y $y_j$, se cumple:

$$
P(X = x_i,\, Y = y_j) = P(X = x_i)P(Y = y_j)
$$

Es decir, la probabilidad conjunta es igual al producto de las marginales.

-   **Variables continuas:**

$X$ y $Y$ son independientes si, para todo par $(x,y)$, se cumple:

$$
f(x,y) = f_X(x)\,f_Y(y),
$$

donde:

-   $f(x,y)$ es la densidad conjunta.
-   $f_X(x)$ y $f_Y(y)$ son las densidades marginales.

En este sentido, las consecuencias de la independencia son:

-   La **distribución condicionada** de una variable dado un valor de la otra coincide con su distribución marginal. Por ejemplo:

$$
P(X = x_i \mid Y = y_j) = P(X = x_i).
$$

o, en el caso continuo:

$$
f_{X \mid Y}(x \mid y) = f_X(x).
$$

-   Las variables no presentan ninguna forma de dependencia estadística.

Por tanto, si $X$ y $Y$ son independientes, conocer $Y$ no cambia la probabilidad ni la densidad de $X$, y viceversa.

## Momentos de variables aleatorias bidimensionales

Los **momentos bidimensionales** permiten describir características de la distribución conjunta de dos variables aleatorias continuas o discretas $(X, Y)$. Al igual que en el caso unidimensional, son herramientas fundamentales para calcular medias, varianzas, covarianza y otras medidas.

Con caracter general, los momestos respecto del origen y la media se definen como:

***Momentos respecto del origen***: $\alpha_{rs} = E\bigl(X^r \, Y^s\bigr)$,

***Momentos respecto de la media***: $\mu_{rs} = E\Bigl[(X - \alpha_{10})^r \,(Y - \alpha_{01})^s\Bigr]$

### Momentos respecto al origen

**Momentos respecto al origen para distribuciones discretas:**

El momento de orden $(r,s)$ respecto al origen es:

$$
\alpha_{rs} = \sum_i \sum_j x_i^r \, y_j^s \, p_{ij},
$$

donde $p_{ij}$ es la probabilidad conjunta $P(X = x_i, Y = y_j)$.

**Momentos respecto al origen para distribuciones continuas:**

$$
\alpha_{rs} = \iint_{-\infty}^{\infty} x^r \, y^s \, f(x,y) \, dx \, dy,
$$

donde $f(x,y)$ es la densidad conjunta.

Los momentos más habituales son:

-   **De primer orden:**
    -   $\alpha_{10} = E(X)$ (media de $X$)
    -   $\alpha_{01} = E(Y)$ (media de $Y$)
-   **De segundo orden:**
    -   $\alpha_{20} = E(X^2)$
    -   $\alpha_{02} = E(Y^2)$
    -   $\alpha_{11} = E(X \, Y)$

### Momentos respecto a la media

Los **momentos centrales** o momentos respecto a la media permiten medir la variabilidad y la relación entre $X$ y $Y$.

**Momentos respecto a la media para distribuciones discretas:**

$$
\mu_{rs} = \sum_i \sum_j \bigl(x_i - \alpha_{10}\bigr)^r \,\bigl(y_j - \alpha_{01}\bigr)^s \,p_{ij}
$$

**Momentos respecto a la media para distribuciones continuas:**

$$
\mu_{rs} = \iint_{-\infty}^{\infty}\bigl(x - \alpha_{10}\bigr)^r \,\bigl(y - \alpha_{01}\bigr)^s \,f(x,y)\, dx\, dy
$$

Los momentos respecto a la media más frecuentes son:

-   **De primer orden:**
    -   $\mu_{10}=0$
    -   $\mu_{01}=0$
-   **De segundo orden:**
    -   $\mu_{20} = Var(X) = \sigma_X^2$
    -   $\mu_{02} = Var(Y) = \sigma_Y^2$
    -   $\mu_{11} = Cov(X,Y)=\sigma_{XY}$

**Cálculo de varianzas y covarianza a partir de los momentos respecto al origen**

Las varianzas marginales de $X$ y $Y$ se obtienen como:

$$
\sigma_X^2 = Var(X) = E(X^2) - \bigl[E(X)\bigr]^2 = \alpha_{20} - \alpha_{10}^2
$$

$$
\sigma_Y^2 = Var(Y) = E(Y^2) - \bigl[E(Y)\bigr]^2 = \alpha_{02} - \alpha_{01}^2
$$

La covarianza puede calcularse a partir de:

$$
\sigma_{XY} = Cov(X,Y) = E(X\,Y) - E(X)\,E(Y) = \alpha_{11} - \alpha_{10}\,\alpha_{01}
$$
