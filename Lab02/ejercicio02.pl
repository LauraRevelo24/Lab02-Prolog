% EJERCICIO 2: DUEÑOS DE UN TIPO DE MASCOTA

% LISTA

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

% DEFINICIÓN Y FINDALL:

duenos_de_gato(Persona) :-
    findall(Persona,(dueno(Persona, Mascota), gato(Mascota)), Persona).

% ¿Qué problema aparece? El problema es que findall/3 incluye todas las soluciones encontradas, aunque sean repetidas. 
En este caso, Luis aparece dos veces porque tiene dos gatos: Luna y Orión. findall/3 no elimina los duplicados.
