% EJERCICIO 3: DUEÑOS ÚNICOS

% LISTA: 

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

% DEFINICION Y SETOF

% Utilicé: Mascota^ para que el programa ignorara las mascotas y se centrara en las Personas que tienen gatos como condición, para que de esta manera no se repitiera el nombre de Luis por tener 2 gatos.

duenos_unicos_de_gato(Personas) :-
    setof(Personas, Mascota^(dueno(Personas, Mascota), gato(Mascota)), Personas).

