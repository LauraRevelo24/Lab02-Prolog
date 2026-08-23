# Laboratorio 02 - Busquedas en Prolog y Metapredicados 

## 📌 Descripción  
Este laboratorio tiene como objetivo que los estudiantes fortalezcan sus conocimientos relacionados a algoritmos de busqueda en **Prolog**.

El desarrollo se realizará en **[SWISH Prolog](https://swish.swi-prolog.org/)**, un entorno en línea que no requiere instalación local.  

---

## 🛠️ Instrucciones Generales  

1. **Fork del repositorio**  
   - Realice un **fork** de este repositorio en su cuenta personal de GitHub.  
   - No realice cambios directamente sobre el repositorio original.  

2. **Resolución de ejercicios**  
   - Desarrolle los programas en **SWISH Prolog**.  
   - Una vez finalizados, tome un pantallazo del codigo y las pruebas
   - Al finalizar se debe crear y agregar un documento PDF con los integrantes del grupo y los pantallazos:
     - DEBEN haber dos documentos, uno con el trabajo en clase y otro con TODOS los ejercicios realizados.  

4. **Buenas prácticas**  
   - Use **nombres de predicados claros y significativos**.
---

## 🚀 Entrega  

- **Plazo**: La entrega debe realizarse a mas tardar el proximo lunes, se habilitara una tarea en Moodle para adjuntar el link del repositorio.

---

## ✅ Criterios de Evaluación  

1. **Correctitud de las soluciones** (funcionalidad de los predicados).  
2. **Cumplimiento de la estructura solicitada** (archivos independientes en `lab01/`).  
3. **Claridad en la codificación** (nombres, comentarios y legibilidad).  
4. **Uso adecuado de variables** (incluyendo variables anónimas donde corresponda).  

---

## 💡 Recomendaciones  

- Revise la documentación oficial de Prolog: [SWI-Prolog Documentation](https://www.swi-prolog.org/pldoc/).  
- Antes de subir sus archivos, **ejecute y verifique** cada consulta en SWISH.  
- Mantenga su repositorio organizado y actualizado.

---


## Base de conocimiento

Utilice la siguiente base de conocimiento para resolver los ejercicios:

```prolog
perro(firulais).
perro(bruno).
perro(max).

gato(misu).
gato(luna).
gato(chanel).
gato(orion).

ave(piolin).

dueno(ana, firulais).
dueno(ana, misu).

dueno(luis, luna).
dueno(luis, orion).
dueno(luis, firulais).

dueno(maria, piolin).

dueno(julia, chanel).

dueno(pedro, bruno).
```

---

# Parte 1 — `findall/3`

## Ejercicio 1 — Lista de mascotas de una persona

Defina:

```prolog
mascotas(Persona, Mascotas).
```

que utilice `findall/3` para obtener todas las mascotas de una persona.

Ejemplos:

```prolog
?- mascotas(ana, M).
M = [firulais, misu].

?- mascotas(luis, M).
M = [luna, orion, firulais].

?- mascotas(maria, M).
M = [piolin].
```

### Pregunta

¿Qué debería devolver?

```prolog
?- mascotas(carlos, M).
```

---

## Ejercicio 2 — Dueños de un tipo de mascota

Defina:

```prolog
duenos_de_gato(Personas).
```

que permita obtener una lista con las personas que tienen gatos de mascota.

Debe utilizar `findall/3`.

Ejemplo:

```prolog
?- duenos_de_gato(Personas).
Personas = [ana, xxx].
```

### Reto

¿Qué problema aparece con los duplicados si una persona tiene varias mascotas del mismo tipo?

Por ejemplo, Luis tiene `luna` y `orion`, y ambas son gatos.

---

# Parte 2 — `setof/3`

## Ejercicio 3 — Dueños únicos

Modifique el ejercicio anterior utilizando `setof/3`.

Defina:

```prolog
duenos_unicos_de_gato(Personas).
```

Ejemplo:

```prolog
?- duenos_unicos_de_gato(gato, Personas).
Personas = [ana, julia, luis].
```

Observe que:

- no aparecen personas repetidas;
- la lista aparece ordenada.

### Pregunta conceptual

¿Por qué `findall/3` y `setof/3` producen resultados diferentes para este problema?

---

## Ejercicio 4 — Tipos de mascota que tiene una persona

Defina:

```prolog
tipos_mascota(Persona, Tipos).
```
Tip se debe definir una regla por cada tipo

```prolog
tipo_mascota(Mascota, perro) :- ...
...
```


Utilice `setof/3` para obtener los diferentes tipos de mascota que posee una persona.

Ejemplos:

```prolog
?- tipos_mascota(ana, Tipos).
Tipos = [gato, perro].

?- tipos_mascota(maria, Tipos).
Tipos = [ave].
```

---

# Parte 3 — `bagof/3`

## Ejercicio 5 — Agrupar mascotas por dueño

Utilice `bagof/3` para obtener las mascotas agrupadas por persona.

Realice la consulta:

```prolog
?- bagof(Mascota, dueno(Persona, Mascota), Mascotas).
```

Observe cómo Prolog genera diferentes soluciones para `Persona`.

Se esperan grupos similares a:

```text
ana   → [firulais, misu]
luis  → [luna, orion, firulais]
maria → [piolin]
julia → [chanel]
pedro → [bruno]
```

### Preguntas

1. ¿Por qué `bagof/3` genera varias soluciones?
2. ¿Qué variable está siendo utilizada para realizar la agrupación?
3. ¿Qué ocurriría si se utilizara `findall/3`?
4. ¿Qué ocurriría si se utilizara `setof/3`?

---

## Ejercicio 6 — Agrupar dueños por tipo de mascota

Utilice `bagof/3` para definir una regla que agrupe las personas según el tipo de mascota.

El objetivo es obtener grupos conceptualmente similares a:

```text
perro → [ana, luis, pedro]
gato  → [ana, julia, luis]
ave   → [maria]
```

### Preguntas
1. Realiza la consulta para obtener los dueños de un tipo especifico
2. Realiza la consulta para obtener el grupo de dueños por cada tipo
---

# Parte 4 — `forall/2`

## Ejercicio 7 — Personas con al menos una mascota

Defina:

```prolog
todos_tienen_mascota.
```

que sea verdadero si todas las personas que aparecen tienen al menos una mascota.

Debe utilizar `forall/2`.

Tip define la siguiente regla para generar dinamicamente las personas.

```prolog
persona(Persona) :-
    dueno(Persona, _).
```

### Restricción

No debe consultar personas específicas como:

```prolog
tiene_mascota(ana).
tiene_mascota(luis).
```

La regla debe funcionar independientemente de cuántos dueños existan en la base de conocimiento.

1. verifica realizando la consulta todos_tienen_mascota
---

## Ejercicio 8 — Todas las mascotas tienen un dueño

Defina:

```prolog
todas_las_mascotas_tienen_dueno.
```

que verifique que para cada mascota registrada exista una persona que sea su dueño.

Debe utilizar `forall/2`.

Tip define varias reglas para encontrar cualquier mascota

```prolog
mascota(Mascota) :- perro(Mascota).
...
```

Los tipos de mascotas disponibles son:

```prolog
perro/1
gato/1
ave/1
```

1. verifica realizando la consulta todas_las_mascotas_tienen_dueno
---


# Parte 5 — Amantes de los animales

## Ejercicio 9 — Amantes de los animales

Retome el concepto trabajado en el laboratorio anterior.

Defina:

```prolog
amante_animales(Persona).
```

Una persona es amante de los animales si tiene por lo menos un perro y por lo menos un gato.

Luego cree:

```prolog
amantes_animales(Personas).
```

que utilice un metapredicado para encontrar todos los amantes de los animales.

Resultado esperado:

```prolog
?- amantes_animales(Personas).
Personas = [ana, luis].
```

### Reto

Resuelva `amantes_animales/1` utilizando:

1. `findall/3`.
2. `setof/3`.

Compare ambas soluciones.

---

# Parte 6 — Mascotas compartidas

## Ejercicio 10 — Mascotas compartidas

Retome el predicado:

```prolog
mascota_compartida(Persona1, Persona2, Mascota).
```

Una mascota es compartida cuando pertenece a dos personas diferentes.

Posteriormente cree:

```prolog
mascotas_compartidas(Persona1, Persona2,Mascotas).
```

que encuentre todas las mascotas compartidas por dos personas utilizando `setof/3`.

### Caso adicional

Modifique la base de conocimiento agregando:

```prolog
dueno(ana,luna).
```

Ahora `luna` debe aparecer como mascota compartida.

---


## Parte 8 - Problema de la rana

Un problema bien conocido es aquel de la rana donde dados un punto de inicio junto con otros puntos que representan la ubicación de una serie de piedras se quiere determinar si una rana la cual tiene
una capacidad maxima de salto puede llegar a un punto objetivo.

Para este problema se tienen los siguientes hechos.

```
% --- HECHOS Y CAPACIDADES (PARÁMETROS DEL PROBLEMA) ---

% Coordenadas de las ubicaciones: ubicacion(ID, X, Y).
ubicacion(orilla_inicial, 0, 5).
ubicacion(piedra1, 2, 4).
ubicacion(piedra2, 5, 6).
ubicacion(piedra3, 8, 4).
ubicacion(piedra4, 5, 0).
ubicacion(orilla_final, 10, 5).

% Capacidad de la rana: distancia máxima de salto.
salto_maximo(4.0).
```

Usando el algoritmo generico de DFS visto en clase, poder determinar si la rana puede llegar de la `orilla_inicial` a la `orilla_final`.

Definir la regla `siguiente_estado/2`, que determine si es posible pasar de un estado a otro, esta puede definirse así, donde consultado `ubicacion` para `LugarActual`, se obtienen las ubicaciones.

```
siguiente_estado(pos(LugarActual), pos(LugarSiguiente))
```

Asi se puede iniciar la busqueda en el espacio de soluciones.

```
buscar_solucion(Solucion) :-
    EstadoInicial = pos(orilla_inicial),
    dfs(EstadoInicial, [EstadoInicial], Solucion). %dfs(Estado,Visitados, Solucion)
```

---

## Parte 9 - Problema de Batman vs Villanos

Se tiene un problema donde dados una lista de poderes y su respectivo daño, asi como el costo asociado a usar este, junto con una lista de villanos con sus puntos de vida, y una lista de sus debilidades a poderes.

Se quiere encontrar si batman es capaz de derrotarlos teniendo este una cantidad de energia que se agota al usar cada poder, asi como la condicion de que puede omitir el uso de un poder e intentar usar otro contra el mismo villano.

Para este problema se tienen los siguientes hechos.

Aqui se tiene por ejemplo el poder logica que hace 100 de daño, y usa 10 de energia, y se tiene el villano riddler que tiene 90 de salud y es debil a logica y sigilo.

```
power_list([
    power(logica, 100, 10),
    power(sigilo, 150, 30),
    power(fuerza, 250, 50)
]).

villain_list([
    villain(riddler, 90, [logica, sigilo]),
    villain(bane, 240, [fuerza])
]).
```

Usando el algoritmo DFS visto en clase, poder determinar si batman puede derrotar a todos los villanos con la energia disponible o no.

Asi se puede iniciar la busqueda en el espacio de soluciones.

```
batman_can_win(EnergiaMaxima) :-
    power_list(Superpoderes),
    villain_list(Villanos),
    % El estado inicial contiene todos los villanos, todos los poderes y la energía máxima.
    EstadoInicial = estado(Villanos, Superpoderes, EnergiaMaxima),
    dfs(EstadoInicial, [EstadoInicial]). %dfs(Estado,Visitados)
```
---


## Retrospectiva
1. ¿Cuál fue el tiempo total invertido en el laboratorio por cada uno de ustedes? (Horas/Hombre)
2. ¿Cuál es el estado actual del laboratorio? ¿Por qué?
3. ¿Cuál consideran fue el mayor logro? ¿Por qué?
4. ¿Cuál consideran que fue el mayor problema técnico? ¿Qué hicieron para resolverlo?
5. ¿Qué hicieron bien como equipo? ¿Qué se comprometen a hacer para mejorar los resultados?
6. ¿Qué referencias usaron? ¿Cuál fue la más útil? Incluyan citas con estándares adecuados.



