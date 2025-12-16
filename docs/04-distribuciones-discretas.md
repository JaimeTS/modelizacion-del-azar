# Modelos de probabilidad discretos {#discr}

Uno de los principales objetivos del Cálculo de Probabilidades es construir modelos teóricos que representen de forma adecuada el comportamiento de fenómenos aleatorios observables en la realidad. Estos modelos permiten al científico simular situaciones, analizar comportamientos complejos y formular predicciones que, de otro modo, serían difíciles o imposibles de estudiar directamente. Modelizar lo observable no solo responde a una necesidad científica básica, sino que constituye una herramienta fundamental para entender y explicar el entorno que nos rodea, aunque ello implique necesariamente una simplificación de la realidad.

En este tema nos centraremos en el estudio de los modelos de probabilidad discretos, es decir, aquellos que describen situaciones en las que las variables aleatorias solo pueden tomar un número finito o numerable de valores posibles.

Comprender estos modelos es esencial porque proporcionan una base sólida para analizar fenómenos tan variados como el número de llamadas que recibe un centro de atención, el resultado de experimentos repetidos o los patrones de demanda en un sistema económico. Estudiar sus propiedades, estructura y aplicaciones nos permitirá no solo interpretar correctamente situaciones aleatorias, sino también tomar decisiones informadas en contextos reales basados en incertidumbre.

Este documento desarrolla los casos prácticos de cada distribución discreta, con teoría, ejemplos aplicados al ámbito económico-empresarial y ejercicios resueltos, acompañados de código en R. El objetivo es proporcionar una herramienta completa que permita al alumno no solo comprender los fundamentos teóricos de cada modelo, sino también aplicarlos a problemas reales que surgen en el análisis de datos económicos, financieros o empresariales.

## Distribución uniforme discreta $(U_d)$

Una variable aleatoria discreta sigue una **distribución uniforme discreta** cuando puede tomar un número finito de valores distintos, todos ellos con **la misma probabilidad**. Es decir, cada uno de los posibles valores es **equiprobable**. Esta distribución representa situaciones en las que no existe preferencia por ningún resultado en particular, y todos los resultados posibles son igualmente probables.

**¿Para qué sirve?** Se utiliza cuando todos los resultados son igualmente probables. En el contexto de empresa, sirve para modelar sorteos, selección aleatoria de clientes, o cualquier proceso donde no hay sesgo hacia ningún resultado.

**Teoría:** Sea $X$ una variable aleatoria discreta que toma $n$ valores distintos: {$x_1, x_2, ..., x_n$} con igual probabilidad.

Se denota que la variable aleatoria $X$ sigue una distribución uniforme de la siguiente manera 
$$
X \sim \mathcal{U}\_d(x_1, x_2, \dots, x_n)
$$
o bien, si los valores son enteros consecutivos entre dos extremos: 
$$
X \sim \mathcal{U}_d(a, b)
$$
donde $a$ y $b$ son enteros, y $X$ puede tomar cualquier valor en el conjunto $\{a, a+1, \dots, b\}$ con igual probabilidad.

En esta caso, su **función de cuantía** será:
$$
P(X = x_i) = \frac{1}{n}, \\ i = 1, 2, ..., n.
$$

y su **función de distribución** (que representa la probabilidad acumulada) es:

$$
F(x_k) = P(X \leq x_k) = \sum_{i=1}^{k} \frac{1}{n} = \frac{k}{n}
$$

Esto da lugar a una función escalonada, que puede expresarse como:

$$
F(x) =
\begin{cases}
0 & \text{si } x < x_1 \\\\
\frac{1}{n} & \text{si } x_1 \leq x < x_2 \\\\
\frac{2}{n} & \text{si } x_2 \leq x < x_3 \\\\
\vdots & \vdots \\\\
\frac{k}{n} & \text{si } x_k \leq x < x_{k+1} \\\\
\vdots & \vdots \\\\
1 & \text{si } x \geq x_n
\end{cases}
$$

**Parámetros fundamentales:**

\- $n$: número de posibles valores de la variable (positivo y entero).

**Momentos:**

\- Media: $E(X) = \frac{n + 1}{2}$

\- Varianza: $Var(X) = \frac{n^2 - 1}{12}$

**Ejercicio:** Se lanza un dado de 8 caras. ¿Cuál es la probabilidad de que salga un número menor o igual a 3? Calcula su media y su varianza.

*Solución:*

*- Probabilidad de obtener un número menor o igual a 3*

Hay 3 resultados favorables: $\{1, 2, 3\}$, de un total de 8 posibles. Por tanto:

$$
P(X \leq 3) = \frac{3}{8} = 0{,}375
$$

*- Esperanza matemática*

La esperanza de una distribución uniforme discreta sobre $n$ valores es:

$$
E(X) = \frac{n + 1}{2} = \frac{8 + 1}{2} = \frac{9}{2} = 4{,}5
$$

*- Varianza*

La varianza se calcula con la fórmula:

$$
V(X) = \frac{n^2 - 1}{12} = \frac{8^2 - 1}{12} = \frac{63}{12} = 5{,}25
$$

**Ejemplo en *R*:**

Consideremos un dado *perfecto* o *justo*, en el que la probabilidad de que salga cualquiera de sus caras es igual a $\frac{1}{6}$. Determínese la esperanza y la varianza de los posibles resultados que se pueden obtener.

La variable aleatoria $X$ puede tomar los valores $\{1, 2, 3, 4, 5, 6\}$, todos ellos con probabilidad $\frac{1}{6}$. Por tanto, puede modelizarse mediante una distribución uniforme discreta.

Resolución:


```r
# Probabilidad de obtener más de 4
n_caras <- 6
prob_mayor_4 <- length(5:6) / n_caras
prob_mayor_4
```

```
## [1] 0.3333333
```

```r
# Media y varianza
media <- (n_caras + 1) / 2
varianza <- (n_caras^2 - 1) / 12
media
```

```
## [1] 3.5
```

```r
varianza
```

```
## [1] 2.916667
```

## Distribución Bernoulli $(B(1, p))$

Una variable aleatoria discreta sigue una **distribución de Bernoulli**, es decir, $\text{Binomial}(1, p)$, cuando modela una situación en la que se realiza un único experimento aleatorio con dos posibles resultados complementarios, a los que comúnmente se denomina **éxito** y **fracaso**,.

**¿Para qué sirve?** Es muy habitual encontrar situaciones en las que se encuentre esta distribución ya que modela experimentos de tipo éxito/fracaso. Ejemplos típicos en empresa serían si un cliente hace o no una compra, si una campaña publicitaria logra o no un clic, si una pieza sale defectuosa o no, etc.

**Teoría:** Una variable aleatoria discreta $X$ sigue una **distribución de Bernoulli** de parámetro $p$, con $0 < p < 1$, si toma únicamente los valores 0 y 1, que representan dos resultados complementarios de un único experimento aleatorio $$
X = \begin{cases} 1 & \text{con probabilidad } p \\ 0 & \text{con probabilidad } 1 - p \end{cases}
$$

Se denota como: $$
X \sim \text{Bernoulli}(p) \quad \text{o bien} \quad X \sim \text{Binomial}(1, p)
$$

Resumiendo la información

| Valor de $X$ | Probabilidad |
|--------------|--------------|
| $0$          | $1 - p$      |
| $1$          | $p$          |

De este modo, la **función de cuantía** o de probabilidad de $X$ es:

$$
f(x) = P(X = x) =
\begin{cases}
p & \text{si } x = 1 \\\\
1 - p & \text{si } x = 0 \\\\
0 & \text{en otro caso}
\end{cases}
$$

También puede escribirse de forma compacta como:

$$
f(x)=P(X = x) = p^x (1 - p)^{1 - x}, \quad \text{para } x \in \{0, 1\}
$$

Y la **Función de Distribución** o probabilidad acumulada $F(x) = P(X \leq x)$ es:

$$
F(x) =
\begin{cases}
0 & \text{si } x < 0 \\\\
1 - p & \text{si } 0 \leq x < 1 \\\\
1 & \text{si } x \geq 1
\end{cases}
$$

**Parámetros fundamentales:**

-   $p \in [0,1]$: probabilidad de éxito.

\- $q = 1 - p$: probabilidad de fracaso.

**Momentos:**

\- Media: $E(X) = p$

\- Varianza: $Var(X) = p(1 - p)$

**Ejercicio:** La probabilidad de que un cliente compre un producto tras recibir una oferta comercial es 0,3.

Determínese la media y la varianza de esta variable, y la probabilidad de que el cliente no realice la compra.

Dado que el fenómeno presenta dos posibles resultados —**compra (C)** o **no compra (NC)**—, se puede modelizar mediante una distribución binomial de un solo ensayo, es decir, $B(1; 0,3)$, donde:

$$
P(C) = P(X = 1) = p = 0{,}3 \\
P(NC) = P(X = 0) = q = 1 - p = 0{,}7
$$

La esperanza y la varianza de esta variable son:

$$
E(X) = p = 0{,}3 \\
V(X) = p \cdot q = 0{,}3 \cdot 0{,}7 = 0{,}21
$$

**Ejemplo en *R*: Simulación**

Supongamos que la probabilidad de que un usuario haga clic en un anuncio es del 15 % (es decir, $p = 0{,}15$). Esta situación se puede modelizar con una variable aleatoria de Bernoulli, donde el valor 1 (*éxito*) representa que el usuario hace clic y el valor 0 (*fracaso*) que no lo hace. Vamos a simular el comportamiento de 10 individuos y posteriormente compararlo con el valor teórico o esperado.

Para realizar esa simulación del comportamiento de 10 usuarios utilizamos la función `rbinom()` de R, y comparamos los resultados empíricos (media y varianza observadas) con los valores teóricos esperados:


```r
set.seed(123)
resultados <- rbinom(10, size = 1, prob = 0.15)
resultados
```

```
##  [1] 0 0 0 1 1 0 0 1 0 0
```

```r
# Media y varianza empíricas
media_empirica <- mean(resultados); media_empirica
```

```
## [1] 0.3
```

```r
var_empirica <- var(resultados); var_empirica
```

```
## [1] 0.2333333
```

```r
# Valores teóricos
p <- 0.15
media_teorica <- p
var_teorica <- p * (1 - p)
media_teorica
```

```
## [1] 0.15
```

```r
var_teorica
```

```
## [1] 0.1275
```

```r
dif_media <- media_empirica-media_teorica; dif_media
```

```
## [1] 0.15
```

```r
dif_var <- var_empirica-var_teorica; dif_var
```

```
## [1] 0.1058333
```

## Distribución binomial $(B(n, p))$

Una variable aleatoria $X$ sigue una **distribución binomial** con parámetros $n$ y $p$, que se denota como $X \sim B(n; p)$, cuando puede expresarse como la suma de $n$ variables aleatorias independientes e idénticamente distribuidas según una distribución de Bernoulli $B(1, p)$, es decir:

$$
X = X_1 + X_2 + \cdots + X_n \quad \text{con} \quad X_i \overset{\text{iid}}{\sim} B(1; p)
$$

Desde un punto de vista conceptual, la distribución $B(n; p)$ modeliza situaciones en las que un mismo experimento aleatorio dicotómico (con dos posibles resultados: éxito o fracaso) se repite $n$ veces bajo condiciones de independencia entre ensayos.

Dado que cada variable $X_i$ puede tomar solo los valores 0 o 1, la variable total $X$, que cuenta cuántos éxitos se han producido, puede tomar cualquier valor entero desde 0 (si todos los ensayos resultan en fracaso) hasta $n$ (si todos los ensayos resultan en éxito). Por tanto, el rango de $X$ es:

$$
X \in \{0, 1, 2, \dots, n\}
$$

Al codificar el resultado "éxito" como 1 y "fracaso" como 0, si la variable aleatoria $X$ toma el valor 3, significa que en las $n$ repeticiones se ha producido el suceso de interés 3 veces y su complementario $n - 3$ veces. De este modo, $X$ funciona como una **variable contadora del número de éxitos** obtenidos en $n$ ensayos independientes, cada uno con probabilidad de éxito $p$.

**¿Para qué sirve?**

La distribución binomial es una herramienta fundamental en la modelización de fenómenos aleatorios dicotómicos, es decir, aquellos en los que solo pueden ocurrir dos resultados mutuamente excluyentes (por ejemplo, éxito o fracaso, compra o no compra, impago o pago, etc.).

Su principal uso es contar el número de veces que ocurre un determinado resultado (denominado éxito) en un número fijo de repeticiones independientes de un mismo experimento aleatorio, cuando la probabilidad de éxito se mantiene constante en cada ensayo.

En el ámbito económico y de la empresa, la distribución binomial es especialmente útil para modelar situaciones como:

-   **Análisis de campañas de marketing**, donde se cuenta cuántos clientes responden positivamente a una promoción, sabiendo que cada uno tiene una probabilidad conocida de hacerlo.
-   **Control de calidad**, para calcular la probabilidad de que un lote contenga un cierto número de productos defectuosos.
-   **Estudios de mercado**, donde se estima el número de consumidores que prefieren una marca entre varios entrevistados.
-   **Gestión del riesgo financiero**, al modelar el número de impagos entre una cartera de créditos, cuando la probabilidad de impago es conocida y constante.
-   **Evaluación del rendimiento de ventas**, como el número de cierres exitosos entre un número determinado de visitas comerciales.
-   **Toma de decisiones con incertidumbre**, al predecir resultados binarios en contextos repetidos como la aceptación/rechazo de propuestas o la ocurrencia de eventos adversos.

Su simplicidad, interpretabilidad y aplicabilidad la convierten en una de las distribuciones más utilizadas en análisis de datos y en procesos de toma de decisiones bajo incertidumbre.

**Teoría:**

Una variable aleatoria discreta $X$ se dice que sigue una **distribución binomial** con parámetros $n$ y $p$ si representa el número de éxitos obtenidos en $n$ ensayos independientes, cada uno con probabilidad de éxito $p$. Se denota:

$$
X \sim B(n, p)
$$

donde:

-   $n \in \mathbb{N}$ es el número de ensayos (experimentos independientes),
-   $p \in (0,1)$ es la probabilidad de éxito en cada ensayo,
-   $X \in \{0, 1, 2, \dots, n\}$ representa el número total de éxitos.

La **función de cuantía** o función de probabilidad de la distribución binomial está dada por:

$$
P(X = x) = \binom{n}{x} p^x (1 - p)^{n - x}, \quad \text{para } x = 0, 1, 2, \dots, n
$$

donde:

-   $\binom{n}{x}$ es el coeficiente binomial, que cuenta el número de formas de obtener $x$ éxitos en $n$ ensayos,
-   $p^k$ representa la probabilidad de obtener $k$ éxitos,
-   $(1 - p)^{n - x}$ representa la probabilidad de obtener $n - x$ fracasos.

Esta fórmula permite calcular la probabilidad exacta de observar $x$ éxitos en una secuencia de $n$ ensayos independientes con igual probabilidad de éxito.

¿Cómo se llega a esta función de cuantía?

La **función de cuantía** de una variable aleatoria binomial permite calcular la probabilidad de obtener exactamente $x$ éxitos en $n$ ensayos independientes, cada uno con probabilidad de éxito $p$ y de fracaso $q = 1 - p$.

Supongamos que realizamos $n$ repeticiones de un experimento aleatorio. Si en $x$ de esas repeticiones se obtiene el resultado deseado (éxito), y en las $n - x$ restantes se obtiene el complementario (fracaso), la probabilidad de esa secuencia concreta es:

$$
\underbrace{p \cdot p \cdot \dots \cdot p}_{x \text{ veces}} \cdot \underbrace{q \cdot q \cdot \dots \cdot q}_{n - x \text{ veces}} = p^x q^{n - x}
$$

Pero esa es solo una de muchas formas posibles de obtener $x$ éxitos y $n - x$ fracasos. Como el orden no importa, debemos contar cuántas disposiciones distintas pueden formarse con $x$ éxitos y $n - x$ fracasos. Esa cantidad viene dada por el **coeficiente binomial**:

$$
\binom{n}{x} = \frac{n!}{x!(n - x)!}
$$

Esto representa el número de formas distintas en que podemos elegir $x$ posiciones para los éxitos (valor 1) entre los $n$ ensayos.

De este modo, la probabilidad total de obtener exactamente $x$ éxitos en $n$ ensayos es la función de cuantía previa.

**Parámetros fundamentales:**

\- $n$: número de ensayos.

\- $p$: probabilidad de éxito.

**Momentos:**

\- Media: $E(X) = n p$

\- Varianza: $Var(X) = n p (1 - p)$

**Propiedad aditiva o reproductiva de la distribución binomial**

La distribución binomial es reproductiva respecto al parámetro $n$. Esta propiedad establece que la suma de variables aleatorias independientes, cada una con distribución binomial y el mismo parámetro de éxito $p$, también sigue una distribución binomial.

Formalmente, si:

$$
X \sim B(n_1, p), \quad Y \sim B(n_2, p), \quad \text{y} \quad X \perp Y
$$

entonces:

$$
X + Y \sim B(n_1 + n_2, p)
$$

Esta propiedad puede generalizarse a un número finito de variables binomiales independientes que compartan el mismo parámetro de probabilidad $p$.

La explicación de esta propiedad se encuentra en la definición estructural de la binomial: una variable aleatoria $X \sim B(n, p)$ puede construirse como la suma de$n$ variables aleatorias independientes e idénticamente distribuidas según una distribución de Bernoulli$B(1, p)$:

$$
X = \sum_{i=1}^{n} \xi_i, \quad \text{con } \xi_i \overset{\text{iid}}{\sim} B(1, p)
$$

Dado que la suma de variables Bernoulli independientes con parámetro $p$ genera una binomial, resulta inmediato que la suma de dos (o más) variables binomiales independientes, cada una como suma de variables Bernoulli independientes, también sigue una distribución binomial, con número total de ensayos igual a la suma de los ensayos de las variables originales.

**Ejercicios resueltos:**

**Ejercicio 1: Inspección de productos**

Un inspector revisa 12 productos. La probabilidad de que un producto sea defectuoso es $p = 0.1$.

Se pide:

a\. Calcular la probabilidad de que exactamente 2 productos sean defectuosos.

b\. Determinar la media y la varianza del número de productos defectuosos.

*Solución:*

La variable aleatoria que cuenta el número de defectuosos se modeliza como:

$$
X \sim B(12, 0.1)
$$

a)  Probabilidad de que$X = 2$:

$$
P(X = 2) = \binom{12}{2} \cdot 0.1^2 \cdot 0.9^{10} = 66 \cdot 0.01 \cdot 0.3487 \approx 0.2301
$$

b)  Media y varianza:

$$
\mathbb{E}(X) = 12 \cdot 0.1 = 1.2 \\
\operatorname{Var}(X) = 12 \cdot 0.1 \cdot 0.9 = 1.08
$$

**Ejercicio 2: Campaña de ventas en dos regiones**

Una empresa lanza una campaña de ventas en dos regiones. En la **Región A**, se contacta a 10 clientes potenciales; en la **Región B**, a 15 clientes. La probabilidad de que un cliente realice una compra tras el contacto es $p = 0.4$, y se asume que las decisiones de los clientes son independientes.

Se pide:

a\. Determinar la distribución del número total de compras realizadas en ambas regiones.

b\. Calcular la esperanza y la varianza del número total de compras.

*Solución:*

Sea:

$$
X \sim B(10, 0.4), \quad Y \sim B(15, 0.4)
$$

el número de compras en cada región. Como las variables son independientes y tienen el mismo valor de $p$, por la propiedad de **reproductividad** de la binomial, se tiene que:

$$
Z = X + Y \sim B(25, 0.4)
$$

a)  Esperanza:

$$
E(Z) = 25 \cdot 0.4 = 10
$$

b)  Varianza:

$$
\operatorname{Var}(Z) = 25 \cdot 0.4 \cdot 0.6 = 6
$$

Esto significa que, en promedio, se esperan 10 compras en total, con una variabilidad medida por la varianza de 6 (una variabilidad baja).

**Ejercicio en R: Inspección de productos con defectos**

Se inspeccionan 15 productos y la probabilidad de que un producto sea defectuoso es del 5 % ($p = 0.05$).

Vamos a calcular:

-   La probabilidad de que haya exactamente 3 productos defectuosos.
-   La probabilidad de que haya **más de 4** productos defectuosos.
-   La media y la varianza de la variable aleatoria $X \sim B(15, 0.05)$, que cuenta el número de defectuosos.


```r
# Parámetros
n <- 15
p <- 0.05

# a) Probabilidad de que haya exactamente 3 defectuosos
prob_3_defectuosos <- dbinom(3, size = n, prob = p)
prob_3_defectuosos
```

```
## [1] 0.03073298
```

```r
# b) Probabilidad de que haya más de 4 defectuosos: P(X > 4) = 1 - P(X <= 4)
prob_mas_4_defectuosos <- 1 - pbinom(4, size = n, prob = p)
prob_mas_4_defectuosos
```

```
## [1] 0.0006146829
```

```r
# c) Media y varianza
media <- n * p
varianza <- n * p * (1 - p)
media
```

```
## [1] 0.75
```

```r
varianza
```

```
## [1] 0.7125
```



## Distribución binomial negativa $(BN(r, p))$

Supongamos que realizamos un experimento de Bernoulli (con dos posibles resultados: éxito o fracaso) de forma repetida hasta alcanzar un número fijo de éxitos, denotado por $r$.

Definimos la variable aleatoria $X$ como el **número de fracasos que se producen antes de lograr el éxito número** $r$. En este contexto, decimos que:

$$
X \sim \operatorname{BN}(r, p)
$$

donde:

-   $r \in \mathbb{N}$ es el número de éxitos deseados,
-   $p \in (0,1)$ es la probabilidad de éxito en cada ensayo,
-   $X \in \{0, 1, 2, \dots\}$ representa el número de fracasos antes de lograr el $r$-ésimo éxito.

Esta distribución modeliza procesos donde el experimento se repite hasta alcanzar $r$ éxitos, y nos interesa contar **cuántos fracasos ocurren hasta ese momento (alcanzar el éxito)**.

**¿Para qué sirve?**

La distribución binomial negativa se emplea cuando se desea modelar el número de **fracasos necesarios para alcanzar un número fijo de éxitos** en experimentos de Bernoulli independientes, donde la probabilidad de éxito se mantiene constante.

A diferencia de la distribución binomial clásica, donde se fija el número de ensayos y se cuenta cuántos éxitos se obtienen, en la binomial negativa se fija el número de éxitos y se deja que el número de ensayos (y por tanto de fracasos) varíe.

Esta distribución resulta útil en distintos contextos, como por ejemplo:

-   **Marketing y ventas:** número de contactos fallidos hasta lograr un número determinado de ventas.
-   **Atención al cliente:** número de intentos fallidos antes de resolver satisfactoriamente $r$ casos.
-   **Recursos humanos:** número de entrevistas no satisfactorias antes de contratar a $r$ personas adecuadas.
-   **Control de calidad:** número de piezas defectuosas producidas antes de encontrar $r$ unidades sin defecto.
-   **Finanzas y riesgo:** número de inversiones fallidas antes de lograr 𝑟 operaciones rentables.

En todos estos casos, el interés está en **cuántos intentos fallidos** ocurren antes de conseguir **un número de éxitos definidos**, lo cual es clave en análisis de costos, eficiencia y planificación.

**Teoría:**

En este caso, la **función de cuantía** (función de probabilidad) es:

$$
P(X = x) = \binom{x + r - 1}{x} \cdot p^r \cdot (1 - p)^x, \quad x = 0, 1, 2, \dots
$$

Esta fórmula representa la probabilidad de que se observen exactamente $x$ fracasos antes de que ocurra el éxito número $r$, sin importar el orden en que ocurren los fracasos y los éxitos intermedios.

**¿Cómo se construye la función de cuantía?**

Suponiendo que denotamos a $A$ como éxito y $A^*$ fracaso. Queremos calcular la probabilidad de que ocurran exactamente $x$ fracasos antes de que se produzca el éxito número $r$.

El suceso que describe la variable aleatoria $X$ se puede descomponer de la siguiente forma:

-   Se producen $r - 1$ éxitos en algún orden, $A, A, \dots, A$
-   Seguidos de $x$ fracasos, $A^*, A^*, \dots, A^*$
-   Y finalmente el éxito número $r$, que cierra el experimento, $A$.

Este patrón se representa como:

$$
\underbrace{A, A, \dots, A}_{r-1 \text{ veces}}, \quad \underbrace{A^*, A^*, \dots, A^*}_{x \text{ veces}}, \quad A
$$

La probabilidad de esta **secuencia concreta** (un único orden específico) es:

$$
P(A, A, \dots, A, A^*, A^*, \dots, A^*, A) = p^{r-1} \cdot q^x \cdot p = p^r \cdot q^x
$$

Sin embargo, los $r - 1$ éxitos y los $x$ fracasos pueden ocurrir **en cualquier orden** antes del último éxito. Por tanto, necesitamos contar cuántas disposiciones distintas de esos $r - 1$ éxitos y $x$ fracasos existen en $x + r - 1$ posiciones.

Este número de disposiciones se calcula mediante **permutaciones con repetición**, que dan lugar al **coeficiente binomial**:

$$
\binom{x + r - 1}{x} = \frac{(x + r - 1)!}{x! \cdot (r - 1)!}
$$

Finalmente, multiplicamos este número de disposiciones por la probabilidad de cada una, obteniendo así la **función de cuantía** de la distribución binomial negativa:

$$
P(X = x) = \binom{x + r - 1}{x} \cdot p^r \cdot q^x, \quad \text{para } x = 0, 1, 2, \dots
$$

**Parámetros fundamentales:**

\- $r$: número de éxitos deseados.

\- $p$: probabilidad de éxito.

**Momentos:**

\- Media: $E(X) = r\frac{q}{p}$

\- Varianza: $Var(X) = r\frac{(1 - p)}{p^2}$

**Ejercicio resuelto:**

Un operador comercial realiza llamadas a clientes. La probabilidad de que una llamada termine en una venta es $p = 0.2$. Se pide:

a\. Calcular la probabilidad de que el operador haga exactamente 4 llamadas sin éxito antes de conseguir su tercera venta.

b\. Calcular la esperanza y la varianza del número de fracasos antes de alcanzar 3 éxitos.

*Solución:*

Sea $X \sim \operatorname{BN}(r = 3, p = 0.2)$.\
a. Queremos calcular $P(X = 4)$.

La función de cuantía es:

$$
P(X = x) = \binom{x + r - 1}{x} \cdot p^r \cdot (1 - p)^x
$$

Sustituyendo los valores:

$$
P(X = 4) = \binom{6}{4} \cdot (0.2)^3 \cdot (0.8)^4 = 15 \cdot 0.008 \cdot 0.4096 \approx 0.0492
$$

La probabilidad de que el operador realice exactamente 4 llamadas fallidas antes de conseguir su tercera venta es aproximadamente 0,0492, es decir, un 4,92 %

b\. Esperanza y varianza:

Para una binomial negativa:

\- Esperanza:

$$
\mathbb{E}(X) = \frac{r(1 - p)}{p} = \frac{3 \cdot 0.8}{0.2} = 12
$$

Si este experimento se repitiera muchas veces (es decir, muchos operadores realizando llamadas en condiciones similares), el número medio de llamadas sin éxito antes de alcanzar la tercera venta tendería a ser 12.

\- Varianza:

$$
\operatorname{Var}(X) = \frac{r(1 - p)}{p^2} = \frac{3 \cdot 0.8}{0.04} = 60
$$

**Ejercicio con R: Distribución binomial negativa**

Una empresa realiza encuestas telefónicas. La probabilidad de que una persona acepte responder la encuesta es $p = 0.25$.\

a.  ¿Cuál es la probabilidad de que se necesiten exactamente 5 rechazos antes de obtener la cuarta respuesta afirmativa?

b.  Calcula la esperanza y la varianza teóricas.

c.  Simula 10,000 repeticiones del experimento y compara los resultados empíricos.

La variable aleatoria que cuenta el número de rechazos (fracasos) antes de obtener 4 éxitos se modeliza como:

$$
X \sim \operatorname{BN}(r = 4, p = 0.25)
$$


```r
# Parámetros
r <- 4         # número de éxitos deseados
p <- 0.25      # probabilidad de éxito
x <- 5         # número de fracasos

#a. Probabilidad puntual
prob_5_fallos <- dnbinom(x, size = r, prob = p)
prob_5_fallos
```

```
## [1] 0.0519104
```

```r
#b. Esperanza y Varianza
esperanza <- r * (1 - p) / p
varianza <- r * (1 - p) / p^2
esperanza
```

```
## [1] 12
```

```r
varianza
```

```
## [1] 48
```

```r
#c. Simulación de 10,000 repeticiones
set.seed(123)
simulaciones <- rnbinom(10000, size = r, prob = p)

# Media y varianza empíricas
mean(simulaciones)
```

```
## [1] 11.8066
```

```r
var(simulaciones)
```

```
## [1] 46.39244
```


## Distribución Poisson $(\text{Poisson}(\lambda))$

Una variable aleatoria $X$ sigue una **distribución de Poisson** con parámetro $\lambda > 0$, que se denota como:

$$
X \sim \text{Poisson}(\lambda)
$$

cuando modeliza el número de veces que ocurre un determinado suceso en un intervalo fijo de tiempo o espacio, siempre que:

-   Los sucesos ocurren de forma independiente,
-   La tasa media de ocurrencia $\lambda$ es constante en el tiempo o el espacio,
-   No hay ocurrencias simultáneas (la probabilidad de más de un suceso en un instante infinitesimal es despreciable).

Desde un punto de vista conceptual, la distribución de Poisson **cuenta la cantidad de sucesos RAROS, discretos y aleatorios que ocurren en un intervalo determinado**.

Aunque, en teoría, una variable aleatoria con distribución de Poisson puede tomar cualquier valor natural, en la práctica las probabilidades de que adopte valores grandes disminuyen rápidamente a medida que estos crecen. Esto significa que, para un valor dado de $\lambda$, la mayor parte de la probabilidad se concentra en torno a unos pocos valores cercanos a la media, haciendo que tomar valores mucho mayores sea altamente improbable. Como consecuencia, la distribución de Poisson resulta especialmente útil para describir sucesos que, aunque posibles, tienen una baja probabilidad de ocurrencia en gran número dentro de un intervalo. Por este motivo, a la distribución de Poisson también se la conoce como la ***distribución de los sucesos raros***.

El valor de $\lambda$ representa tanto la media como la varianza del número de sucesos esperados en ese intervalo.

El soporte de la variable aleatoria es:

$$
X \in \{0, 1, 2, \dots\}
$$

**¿Para qué sirve?**

La distribución de Poisson es muy útil en la modelización de sucesos que:

-   Ocurren de forma aleatoria en el tiempo o en el espacio,
-   Son poco frecuentes o esporádicos, pero cuantificables.

Las aplicaciones más habituales en economía y empresa

-   Número de llamadas recibidas en un centro de atención por hora.
-   Llegada de clientes a una tienda o entidad financiera.
-   Número de errores de producción por lote o unidad de tiempo.
-   Incidencias logísticas, como retrasos en entregas o fallos técnicos por día.
-   Peticiones de préstamos o reclamaciones recibidas en un periodo fijo.

Dado que solo requiere un parámetro $\lambda$, es una distribución muy versátil, especialmente útil cuando el número de oportunidades de que ocurra el suceso no está bien definido, pero sí su frecuencia media.

**Teoría**

Una variable aleatoria discreta $X$ se dice que sigue una distribución de Poisson con parámetro $\lambda > 0$ si:

$$
X \sim \text{Poisson}(\lambda)
$$

donde:

-   $\lambda$: número medio de sucesos que se espera que ocurran en un intervalo de tiempo (o espacio),
-   $X \in \{0, 1, 2, \dots\}$: número de ocurrencias observadas.

**Función de cuantía**

La función de cuantía de la distribución de Poisson es:

$$
P(X = x) = \frac{\lambda^x e^{-\lambda}}{x!}, \quad x = 0, 1, 2, \dots
$$

Esta fórmula representa la probabilidad de que ocurran exactamente $x$ sucesos en un intervalo dado, cuando el número medio de ocurrencias es $\lambda$.

**Parámetros fundamentales**

\- $\lambda$: número medio de ocurrencias del suceso en un intervalo (es la media y la varianza)

**Momentos**

-   Media: $E(X) = \lambda$

-   Varianza: $\operatorname{Var}(X) = \lambda$

**Propiedad aditiva o reproductiva de la *Poisson***

Sean las variables aleatorias independientes $( X_1, X_2, \dots, X_n )$, tales que cada $( X_j )$ sigue una distribución de Poisson con parámetro $( \lambda_j )$, es decir:

$$
X_j \sim \text{Poisson}(\lambda_j)
$$

Entonces, la **suma** de estas variables también sigue una distribución de Poisson.

Definimos:

$$
Y = X_1 + X_2 + \cdots + X_n
$$

Por tanto, la variable $Y$ también sigue una distribución de Poisson, con parámetro:

$$
\lambda = \sum_{j=1}^{n} \lambda_j
$$

y se concluye que:

$$
Y \sim \text{Poisson} \left( \sum_{j=1}^{n} \lambda_j \right)
$$

Esta propiedad confirma que la **distribución de Poisson es aditiva**: la suma de variables independientes que siguen Poisson también es Poisson, siempre que los parámetros se sumen.

*Ejemplo de la propiedad aditiva de la Poisson*

Supongamos que en una empresa:

-   El departamento A recibe, en promedio, 2 correos electrónicos por hora.
-   El departamento B recibe, en promedio, 3 correos electrónicos por hora.

Ambos procesos son independientes y se pueden modelar con variables aleatorias:

$$
X_1 \sim \text{Poisson}(2), \quad X_2 \sim \text{Poisson}(3)
$$

La variable $Y=X_1 + X_2$ representa el número total de correos recibidos por ambos departamentos en una hora.

¿Cuál es la distribución de $X_1 + X_2$? Por la propiedad aditiva de la distribución de Poisson:

$$
Y=X_1 + X_2 \sim \text{Poisson}(2 + 3) = \text{Poisson}(5)
$$

**Ejercicios resueltos: Distribución de Poisson**

**Ejercicio 1: Número de reclamaciones**

Una aseguradora recibe, en promedio, 3 reclamaciones por día. ¿Cuál es la probabilidad de que en un día se reciban exactamente 5 reclamaciones?

*Solución:*

Modelamos la variable aleatoria con:

$$
X \sim \text{Poisson}(3)
$$

La probabilidad de que se reciban exactamente 5 reclamaciones, utulizando la función de cuantía de la Poisson es:

$$
P(X = 5) = \frac{3^5 \cdot e^{-3}}{5!} = \frac{243 \cdot e^{-3}}{120} \approx 0.1008
$$

En R:


```r
dpois(5, lambda = 3)
```

```
## [1] 0.1008188
```

**Ejercicio 2: Probabilidad de más de 6 llamadas**

En una centralita telefónica se reciben, de media, 4 llamadas por hora. ¿Cuál es la probabilidad de que en una hora se reciban más de 6 llamadas?

*Solución:*

La variable aleatoria que representa el número de llamadas por hora se modeliza como:

$$
X \sim \text{Poisson}(4)
$$

Queremos calcular:

$$
P(X > 6) = 1 - P(X \leq 6)
$$

Primero calculamos $P(X \leq 6)$ sumando las probabilidades desde 0 hasta 6:

$$
P(X \leq 6) = \sum_{x = 0}^{6} \frac{4^x e^{-4}}{x!}
$$

Calculamos cada término (aproximado):

$$
\begin{align*}
P(X = 0) &= \frac{4^0 e^{-4}}{0!} = e^{-4} \approx 0.0183 \\
P(X = 1) &= \frac{4^1 e^{-4}}{1!} = 4e^{-4} \approx 0.0733 \\
P(X = 2) &= \frac{4^2 e^{-4}}{2!} = 8e^{-4} \approx 0.1465 \\
P(X = 3) &= \frac{4^3 e^{-4}}{3!} = \frac{64e^{-4}}{6} \approx 0.1953 \\
P(X = 4) &= \frac{256e^{-4}}{24} \approx 0.1953 \\
P(X = 5) &= \frac{1024e^{-4}}{120} \approx 0.1563 \\
P(X = 6) &= \frac{4096e^{-4}}{720} \approx 0.1042 \\
\end{align*}
$$

Sumamos:

$$
P(X \leq 6) \approx 0.0183 + 0.0733 + 0.1465 + 0.1953 + 0.1953 + 0.1563 + 0.1042 = 0.8892
$$

Entonces:

$$
P(X > 6) = 1 - 0.8892 = 0.1108
$$

*Resolución en R:*


```r
# Parámetro de la Poisson

lambda <- 4

# Probabilidad de más de 6 llamadas

prob_mas_6 <- ppois(6, lambda = lambda, lower.tail = FALSE); prob_mas_6
```

```
## [1] 0.110674
```

**Ejercicio con R: Gestión de solicitudes de préstamos**

Un banco recibe, en promedio, 6 solicitudes de préstamo por hora a través de su plataforma online. Este número puede variar de hora en hora, pero se asume que las solicitudes llegan de forma independiente y a una tasa constante a lo largo del día. Por tanto, el número de solicitudes por hora se modeliza mediante una distribución de Poisson:

$$
X \sim \text{Poisson}(\lambda = 6)
$$

Se pide resolver con R las siguientes cuestiones:

1.  Calcular la probabilidad de que se reciban exactamente 8 solicitudes en una hora.\
2.  Calcular la probabilidad de que se reciban como máximo 4 solicitudes en una hora.\
3.  Calcular la probabilidad de que se reciban más de 10 solicitudes en una hora.\
4.  Simular lo que ocurriría durante una jornada laboral de 7 horas. ¿Cuántas solicitudes se reciben en total?\
5.  Simular 10.000 jornadas laborales para estimar:
    -   La media y la varianza empírica del número total de solicitudes por jornada,
    -   La proporción de jornadas en las que se reciben más de 50 solicitudes, lo que se considera un nivel de saturación operativa.


```r
# Parámetro por hora
lambda <- 6

#1. probabilidad de que se reciban exactamente 8 solicitudes en una hora
prob_8 <- dpois(8, lambda = lambda)
prob_8
```

```
## [1] 0.1032577
```

```r
#2. probabilidad de que se reciban como máximo 4 solicitudes en una hora.  

prob_4_o_menos <- ppois(4, lambda = lambda)
prob_4_o_menos
```

```
## [1] 0.2850565
```

```r
#3. probabilidad de que se reciban más de 10 solicitudes en una hora.  

prob_mas_10 <- 1 - ppois(10, lambda = lambda)
prob_mas_10
```

```
## [1] 0.04262092
```

```r
#4.  Simular lo que ocurriría durante una jornada laboral de 7 horas. ¿Cuántas solicitudes se reciben en total?  
set.seed(123)  # para reproducibilidad
jornada <- sum(rpois(7, lambda = lambda))
jornada
```

```
## [1] 45
```

```r
#5  Simular 10.000 jornadas laborales para estimar:

sim_jornadas <- replicate(10000, sum(rpois(7, lambda = lambda)))

#5.1 La media y la varianza empírica del número total de solicitudes por jornada,
   
# Media empírica
mean(sim_jornadas)
```

```
## [1] 41.8975
```

```r
# Varianza empírica
var(sim_jornadas)
```

```
## [1] 41.86078
```

```r
#5.2 La proporción de jornadas en las que se reciben más de 50 solicitudes, lo que se considera un nivel de saturación operativa.

mean(sim_jornadas > 50)
```

```
## [1] 0.0946
```

## Distribución geométrica $(G(p))$

Una variable aleatoria $X$ sigue una distribución geométrica con parámetro $p$, que se denota como:

$$
X \sim G(p)
$$

cuando representa el número de **ensayos necesarios hasta la obtención del primer éxito** en una secuencia de ensayos de Bernoulli independientes, cada uno con probabilidad de éxito $p$ y fracaso $q = 1 - p$.

Desde un punto de vista conceptual, la distribución geométrica modeliza situaciones en las que se repite un mismo experimento aleatorio dicotómico hasta que se produce el primer éxito.

En este contexto, $X$ toma valores en el conjunto:

$$
X \in \{1, 2, 3, \dots\}
$$

Su interpretación es clara: si $X = 4$, significa que han sido necesarios cuatro intentos para obtener el primer éxito, y que los tres primeros intentos fueron fracasos.

**¿Para qué sirve?**

La distribución geométrica es útil en contextos donde se desea modelar el número de intentos necesarios hasta obtener un resultado positivo. Algunas aplicaciones en economía y empresa son:

-   **Tiempos de espera en servicios**: número de clientes atendidos hasta lograr una venta.
-   **Modelos de respuesta de clientes**: número de llamadas o correos hasta obtener respuesta.
-   **Gestión de inventarios**: número de periodos sin ventas hasta que se produce una compra.
-   **Riesgo crediticio**: número de créditos concedidos hasta observar el primer impago.

Su interpretación intuitiva y su estructura simple la hacen muy útil en modelos probabilísticos básicos y en simulaciones.

**Teoría**

Una variable aleatoria discreta $X$ se distribuye geométricamente con parámetro $p \in (0,1)$ si modeliza el número de intentos necesarios hasta obtener el primer éxito. Se denota:

$$
X \sim G(p)
$$

donde:

-   $p$ es la probabilidad de éxito en cada ensayo.
-   $q = 1 - p$ es la probabilidad de fracaso.
-   $X \in \{1, 2, 3, \dots\}$

**Función de cuantía**

La función de cuantía (función de probabilidad) de la distribución geométrica es:

$$
P(X = x) = q^{x - 1} \cdot p, \quad \text{para } x = 1, 2, 3, \dots
$$

Esta fórmula representa la probabilidad de que se produzcan $x - 1$ fracasos seguidos antes de obtener el primer éxito.

**Parámetros fundamentales**

-   Media: $E(X) = \frac{1}{p}$

-   Varianza:$\text{Var}(X) = \frac{1 - p}{p^2}$

**Ejercicios resueltos: Distribución Geomñetrica**

**Ejercicio 1**

Un agente comercial realiza llamadas a posibles clientes. La probabilidad de que una llamada termine en una venta es $p = 0.2$ ¿Cuál es la probabilidad de que la primera venta se consiga en el cuarto intento?

Solución:

Sea $X \sim G(0.2)$, donde $X$ representa el número de llamadas hasta la primera venta.

Queremos calcular:

$$
P(X = 4) = q^{4 - 1} \cdot p = (1 - 0.2)^3 \cdot 0.2 = 0.8^3 \cdot 0.2 = 0.512 \cdot 0.2 = 0.1024
$$

Interpretación: Existe aproximadamente un 10,24% de probabilidad de que el agente realice tres llamadas fallidas y consiga una venta en el cuarto intento.

**Ejercicio 2: Resolución con R**

Supón ahora que la probabilidad de éxito es $p = 0.1$. Se pide:

1.  Calcular la probabilidad de que la primera venta se logre en el sexto intento.\
2.  Calcular la probabilidad de que se logre en 6 o menos intentos.\
3.  Calcular la media y la varianza de la distribución.\
4.  Simular 10.000 experimentos y estimar la media empírica.



```r
# Parámetro
p <- 0.1

# 1. P(X = 6)
prob_6 <- dgeom(6 - 1, prob = p)  # en R, la geométrica cuenta fracasos antes del primer éxito
prob_6
```

```
## [1] 0.059049
```

```r
# 2. P(X <= 6)
prob_acum_6 <- pgeom(6 - 1, prob = p)
prob_acum_6
```

```
## [1] 0.468559
```

```r
# 3. Media y varianza teóricas
media <- 1 / p
varianza <- (1 - p) / (p^2)
media
```

```
## [1] 10
```

```r
varianza
```

```
## [1] 90
```

```r
# 4. Simulación de 10.000 experimentos
set.seed(123)
sim <- rgeom(10000, prob = p) + 1  # sumamos 1 porque R devuelve fracasos
mean(sim)
```

```
## [1] 9.8619
```

## Distribución hipergeométrica $(H(N, K, n))$

Una variable aleatoria discreta $X$ sigue una **distribución hipergeométrica** cuando representa el número de éxitos obtenidos al seleccionar una muestra aleatoria **sin reemplazo** de una población finita que contiene un número determinado de elementos exitosos y no exitosos.

Se denota como:

$$
X \sim H(N, K, n)
$$

donde:

-   $N$: tamaño total de la población,
-   $K$: número total de elementos exitosos en la población,
-   $n$: tamaño de la muestra extraída sin reemplazo,
-   $X$: número de éxitos en la muestra.

El soporte de $X$ está dado por los valores enteros que cumplen:

$$
\max(0, n - (N - K)) \leq X \leq \min(n, K)
$$

**¿Para qué sirve?**

La distribución hipergeométrica es útil para modelar situaciones de muestreo **sin reemplazo**, muy habituales en contextos reales donde la proporción de éxitos cambia con cada extracción.

**Aplicaciones en economía y empresa:**

-   **Control de calidad**: extraer productos sin reemplazo para evaluar cuántos son defectuosos.
-   **Auditorías**: verificar cuántas facturas con errores hay en una muestra de registros contables.
-   **Inspección de lotes en inventarios**.
-   **Selección de consumidores** para una campaña donde algunos ya han sido contactados.
-   **Evaluación del fraude** o incumplimiento en una muestra finita de expedientes.

**Teoría**

Sea una población de tamaño $N$, con $K$ elementos exitosos y $N - K$ fracasos. Si se extrae una muestra aleatoria de tamaño $n$, sin reemplazo, la variable aleatoria $X$ que representa el número de éxitos en la muestra se distribuye como:

$$
X \sim H(N, K, n)
$$

**Función de cuantía**

La función de cuantía (función de probabilidad) de la distribución hipergeométrica es:

$$
P(X = x) = \frac{\binom{K}{x} \binom{N - K}{n - x}}{\binom{N}{n}}, \quad \text{para } x = \max(0, n - (N - K)), \dots, \min(n, K)
$$

Esta fórmula expresa el cociente entre:

-   El número de formas de seleccionar $x$ éxitos entre los $K$ existentes y $n - x$ fracasos entre los $N - K$ restantes,
-   y el número total de formas de seleccionar $n$ elementos de entre los $N$.

**Parámetros fundamentales**

-   $N$: tamaño de la población,
-   $K$: número total de éxitos en la población,
-   $n$: tamaño de la muestra.

**Momentos**

**- Media:** $E(X) = n \cdot \frac{K}{N}$

**- Varianza**:

$\text{Var}(X) = n \cdot \frac{K}{N} \cdot \frac{N - K}{N} \cdot \frac{N - n}{N - 1}$

**Ejercicios**

**Ejercicio 1:** Un lote contiene 20 productos, de los cuales 6 son defectuosos. Se selecciona una muestra aleatoria de 5 productos sin reemplazo. ¿Cuál es la probabilidad de que haya exactamente 2 productos defectuosos en la muestra?

*Solución:*

Sea $X \sim H(20, 6, 5)$, y queremos calcular $P(X = 2)$. Aplicamos la función de cuantía:

$$
P(X = 2) = \frac{\binom{6}{2} \binom{14}{3}}{\binom{20}{5}} = \frac{15 \cdot 364}{15504} \approx 0.352
$$

*Interpretación:*\
Existe un 35.2 % de probabilidad de que exactamente 2 de los 5 productos seleccionados sean defectuosos.

**Ejercicio 2 en R.**

Supongamos que se tiene una población de 50 elementos, de los cuales 12 son considerados "éxito". Se toma una muestra de tamaño 10 sin reemplazo. Se pide:

1.  Calcular la probabilidad de obtener exactamente 3 éxitos.
2.  Calcular la probabilidad de obtener 3 o menos éxitos.
3.  Calcular la esperanza y la varianza teóricas.


```r
# Parámetros
N <- 50   # población total
K <- 12   # número de éxitos en la población
n <- 10   # tamaño de la muestra
x <- 3

# 1. Probabilidad de obtener exactamente 3 éxitos
dhyper(x, m = K, n = N - K, k = n)
```

```
## [1] 0.2702863
```

```r
# 2. Probabilidad de obtener 3 o menos éxitos
phyper(x, m = K, n = N - K, k = n)
```

```
## [1] 0.8209435
```

```r
# 3. Media y varianza teóricas
media <- n * K / N
varianza <- n * (K / N) * ((N - K) / N) * ((N - n) / (N - 1))
media
```

```
## [1] 2.4
```

```r
varianza
```

```
## [1] 1.48898
```

## Distribución multinomial $(M(n; {p_i}))$

La distribución multinomial generaliza la distribución binomial a más de dos categorías posibles. Una variable aleatoria $\boldsymbol{X} = (X_1, X_2, \dots, X_k)$ sigue una **distribución multinomial** cuando describe el número de veces que ocurren $k$ posibles resultados mutuamente excluyentes tras realizar $n$ ensayos independientes, cada uno con las mismas probabilidades.

Se denota como:

$$
(X_1, X_2, \dots, X_k) \sim \text{Multinomial}(n; p_1, p_2, \dots, p_k)
$$

o

$$
(X_1, X_2, \dots, X_k) \sim M(n; p_1, p_2, \dots, p_k)
$$

donde $n$ es el número total de repeticiones y $p_j$ son las probabilidades de que ocurra cada una de las posibles categorías o clases.

**¿Para qué sirve?**

La distribución multinomial resulta especialmente útil cuando se desea modelar situaciones en las que un experimento puede arrojar **más de dos posibles resultados excluyentes** y se repite un número fijo de veces bajo condiciones de independencia. A diferencia de la binomial, que solo contempla dos categorías (éxito/fracaso), la multinomial permite trabajar con **tres o más categorías**

En el ámbito económico y empresarial, su utilidad es muy amplia. Por ejemplo:

-   **Investigación de mercados**: permite modelar cómo se distribuyen las preferencias de los consumidores entre distintas marcas, productos o servicios. Si una empresa desea saber cómo se reparte el mercado entre varias marcas competidoras, la distribución multinomial ofrece una base probabilística sólida para estimarlo.

-   **Análisis de comportamiento del consumidor**: se puede emplear para estudiar la distribución de respuestas en una encuesta donde los participantes deben elegir una sola opción entre varias (por ejemplo, tipo de transporte utilizado, canal de compra preferido, nivel de satisfacción, etc.).

-   **Gestión de inventarios o logística**: es útil para modelar cómo se reparte la demanda entre distintas categorías de productos en una tienda o cómo se distribuyen los envíos entre diferentes zonas geográficas.

-   **Evaluación de riesgos financieros o crediticios**: permite estudiar cómo se clasifican los clientes en diferentes niveles de solvencia o riesgo.

**Teoría**

Supongamos un experimento con $k$ resultados posibles mutuamente excluyentes: $X_1, X_2, \dots, X_k$, con:

$$
P(X_j) = p_j \quad \text{para todo } j = 1, \dots, k, \quad \text{y } \sum_{j=1}^{k} p_j = 1
$$

Si se repite el experimento $n$ veces de forma independiente, y se observa $x_j$ veces el resultado $X_j$, el vector aleatorio:

$$
(x_1, x_2, \dots, x_k)
$$

sigue una distribución multinomial.

**Función de cuantía**

La función de probabilidad conjunta es:

$$
P(X_1 = x_1, X_2 = x_2, \dots, X_k = x_k) = \frac{n!}{x_1! \cdot x_2! \cdots x_k!} \cdot p_1^{x_1} \cdot p_2^{x_2} \cdots p_k^{x_k}
$$

para todo $x_1 + x_2 + \cdots + x_k = n$.

donde:

-   $n$: número total de repeticiones del experimento aleatorio,
-   $p_j \in (0,1)$: probabilidad de que ocurra el resultado $X_j$,
-   $\sum_{j=1}^{k} p_j = 1$,
-   $x_j$: número de veces que se observa el resultado $X_j$,
-   $\sum_{j=1}^{k} x_j = n$.

**Parámetros fundamentales**

-   $n \in \mathbb{N}$: número de ensayos.
-   $p_1, p_2, \dots, p_k \in (0, 1)$ tales que $\sum_{j=1}^k p_j = 1$

**Momentos**

-   $E(X_j) = n \cdot p_j$
-   $\text{Var}(X_j) = n \cdot p_j (1 - p_j)$
-   $\text{Cov}(X_i, X_j) = -n \cdot p_i \cdot p_j \quad \text{para } i \neq j$

**Ejercicio**

En una encuesta, se pregunta a 10 personas por su preferencia entre tres marcas de teléfono: A, B y C. Las probabilidades de preferencia son $p_A = 0.5$, $p_B = 0.3$ y $p_C = 0.2$ ¿Cuál es la probabilidad de que exactamente 4 personas prefieran A, 3 prefieran B y 3 prefieran C?

*Solución:*

Aplicamos la función de cuantía:

$$
P(X_A = 4, X_B = 3, X_C = 3) = \frac{10!}{4! \cdot 3! \cdot 3!} \cdot 0.5^4 \cdot 0.3^3 \cdot 0.2^3
$$

Calculamos paso a paso:

$$
\frac{10!}{4!3!3!} = \frac{3628800}{24 \cdot 6 \cdot 6} = \frac{3628800}{864} = 4200
$$

$$
P = 4200 \cdot 0.0625 \cdot 0.027 \cdot 0.008 = 4200 \cdot 0.0000135 \approx 0.0567
$$

**Ejemplo en R**

Vamos a calcular la probabilidad anterior usando R.


```r
# Carga de paquete necesario
#install.packages("gtools") # si no lo tienes instalado
library(gtools)
```

```
## Warning: package 'gtools' was built under R version 4.3.3
```

```r
# Parámetros
n <- 10
x <- c(4, 3, 3)
p <- c(0.5, 0.3, 0.2)

# Probabilidad multinomial
dmultinom(x, prob = p)
```

```
## [1] 0.0567
```

## Resumen de las distribuciones discretas

| Distribución | Variable | Parámetros | Espacio muestral | Función de cuantía | Media | Varianza |
|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
| **Binomial** | Número de éxitos en $n$ ensayos | $n \in \mathbb{N},\ p \in (0,1)$ | $\{0, 1, \dots, n\}$ | $P(X = x) = \binom{n}{x} p^x (1 - p)^{n - x}$ | $np$ | $np(1 - p)$ |
| **Bernoulli** | Éxito o fracaso (1 experimento) | $p \in (0,1)$ | $\{0, 1\}$ | $P(X = x) = p^x (1 - p)^{1 - x}$ | $p$ | $p(1 - p)$ |
| **Poisson** | Número de eventos en un intervalo | $\lambda > 0$ | $\mathbb{N}_0$ | $P(X = x) = \dfrac{\lambda^x e^{-\lambda}}{x!}$ | $\lambda$ | $\lambda$ |
| **Geométrica** | Ensayos hasta el 1er éxito | $p \in (0,1)$ | $\{1, 2, 3, \dots\}$ | $P(X = x) = (1 - p)^{x - 1} p$ | $\frac{1}{p}$ | $\frac{1 - p}{p^2}$ |
| **Binomial negativa** | Ensayos hasta $r$-ésimo éxito | $r \in \mathbb{N},\ p \in (0,1)$ | $\{r, r + 1, \dots\}$ | $P(X = x) = \binom{x - 1}{r - 1} p^r (1 - p)^{x - r}$ | $\frac{r}{p}$ | $\frac{r(1 - p)}{p^2}$ |
| **Hipergeométrica** | Éxitos en muestra sin reemplazo | $N,\ K,\ n \in \mathbb{N}$ | $\max(0, n - (N - K)) \leq x \leq \min(n, K)$ | $P(X = x) = \dfrac{\binom{K}{x} \binom{N - K}{n - x}}{\binom{N}{n}}$ | $n \cdot \frac{K}{N}$ | $n \cdot \frac{K}{N} \cdot \frac{N - K}{N} \cdot \frac{N - n}{N - 1}$ |
| **Multinomial** | Recuento de $k$ categorías en $n$ ensayos | $n \in \mathbb{N},\ p_1 + \cdots + p_k = 1$ | $\{(x_1, \dots, x_k): \sum x_j = n\}$ | $P(X_1 = x_1, \dots, X_k = x_k) = \dfrac{n!}{x_1!\cdots x_k!} p_1^{x_1} \cdots p_k^{x_k}$ | $\mathbb{E}(X_j) = np_j$ | $\text{Var}(X_j) = np_j(1 - p_j)$, $\text{Cov}(X_i, X_j) = -np_i p_j$ |

Notas:

-   $\mathbb{N}$ denota los enteros positivos, y $\mathbb{N}_0 = \{0, 1, 2, \dots\}$.
-   La **multinomial** se interpreta como la generalización de la binomial para más de dos categorías.

## Funciones disponibles en R para funciones discretas

Para cada distribución discreta se tienen 4 funciones, a continuación el listado de funciones y su utilidad.


```r
dxxx(x, ...)  # Función de masa de probabilidad, f(x)
pxxx(q, ...)  # Función de distribución acumulada hasta q, F(x)
qxxx(p, ...)  # Cuantil para el cual P(X <= q) = p
rxxx(n, ...)  # Generador de números aleatorios.
```

En el lugar de las letras `xxx` se de debe colocar el nombre de la distribución en R, a continuación el listado de nombres disponibles para las 6 distribuciones discretas básicas.


```r
binom     # Binomial
geo       # Geométrica
nbinom    # Binomial negativa
hyper     # Hipergeométrica
pois      # Poisson
multinom  # Multinomial
```

Combinando las funciones y los nombres se tiene un total de 24 funciones, por ejemplo, para obtener la función de masa de probabilidad $f(x)$ de una binomial se usa la función `dbinom( )` y para obtener la función acumulada $F(x)$ de una Poisson se usa la función `ppois( )`.
