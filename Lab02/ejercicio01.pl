% EJERCICIO 1: LISTA DE MASCOTAS DE UNA PERSONA
% FINDALL

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

% DEFINICIÓN Y FINDALL:

mascotas(Persona, Mascotas) :-
    findall(Mascota, dueno(Persona, Mascota), Mascotas).
