# ProyAnalizadorLexico
Proyecto del segundo parcial
Analizador Lexico Con Jflex y Maven

Este es un analizador lexico que utiliza la herramienta Jflex y Maven para un subconjunto del lenguaje Prolog. También se incluye el autónoma de los procesos. 

Σ= {Atomo, Variable, Predicado, Entero, Pto_Fijo, Pto_Float, (, ), Implica, Lista, ";" , ":" , "." , Cadena}

Dónde: Átomo se define en base a tres reglas:
→ Secuencia de uno a más símbolos tomados del conjunto
     Letras, Dígitos, y _ y también debe iniciar con letra minúscula
Ejemplo: padre, Padre o madre. Raices_reales 1

→ Secuencia de uno o más símbolos entre apostrofes.
Ejemplo: "Real Compleja", '&_' etc...

→ Secuencia de uno o más símbolos especiales
Ejemplo: +>=, &! --> etc...

Variable: Secuencia de uno o más símbolos tomados del conjunto letra, digito,       
               _ que inicia con letra mayúscula o _
Ejemplo: Luis, x, -1, Raiz_1 etc...

Pto_Fijo: Es un número real signado en notación de punto fijo
Ejemplo: -5, +3.1416, 4, +1803.10

Implica: Es la secuencia:-

Pto_Float: Es un número real signado en notación de punto flotante con el siguiente formato:

MONTO (Centro o Pto_Fijo) BASE (E o e) EXPONENTE (entero)
4E5     4E_5
4e EE
4 e E q

Cadena: Cualquier secuencia de caracteres entre comillas
Ejemplo: " “, "Hola", "$&$"

Entero: Un número entero signado
Ejemplo: 5, +5, -500, +400

Lista: Es una secuencia de cero o más (Si es más de uno se separan por comas) Símbolos entre paréntesis rectangulares
Cada símbolo puede ser: Variable, átono, Predicado, Numero o Cadena
Ejemplo: [ ], [hola, 23, "Alfa"], [a,b,c,(x), d]

Predicado: Tiene la estructura átomo (Argumento), donde Argumento es 1 o más Argumentos separados por comas
Ejemplo: --> (x, Luis), Invierte ([1, 2,3], Lisa) Concatena ("Hola", "?")


