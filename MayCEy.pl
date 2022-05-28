run():- dataBase(DB), runaux([], 0, DB).
dataBase(DB):- append([], [[]], D0), append(D0, [[]], D1), append(D1, [[]], D2), append(D2, [[]], DB).
runaux(C, Emer, DB):- read(X),split_string(X," ","",S), append(C, S, Conv), bnf(S,[], DB, Conv, Emer),identificarPC(Conv, Emer, DB).

runaux(C, Emer, DB):- fraseSiNoEntendio(C, Emer, DB).


%bnf
bnf(S0,_, _, _,_):- S0 = ["EXIT"], abort.
bnf(S0,_, DB, _,_):- S0 = ["MuchasGracias"], write("De nada \n"), runaux([], 0, DB).
bnf(S0,_, DB, _,_):- S0 = ["CambioYFuera"], runaux([], 0, DB).
bnf(S0,_, DB,_,_):- S0 = ["Gracias"], write("De nada \n"), runaux([], 0, DB).
bnf(S0,_, DB, Conv, Emer):- S0 = ["DB"], write("Aqui esta la base de datos: "), write(DB), write("\n"), runaux(Conv, Emer, DB).
bnf(S0,S, _, _, _):- oracion(S0, S).
bnf(S0,S, DB, Conv, Emer):- oracion(S0, S1), bnf(S1, S, DB, Conv, Emer).

%Sintagmas de las oraciones
oracion(S0,S):- sintagma_nominal(S0,S1),sintagma_verbal(S1,S).
oracion(S0,S):- sintagma_saludo(S0,S).
oracion(S0,S):- sintagma_verbal(S0,S).
oracion(S0,S):- sintagma_verbal(S0,S1),preposicion(S1,S2),sintagma_verbal(S2,S).
oracion(S0,S):- sintagma_verbal(S0,S1),preposicion(S1,S2),sintagma_nominal(S2,S).
oracion(S0,S):- sintagma_saludo(S0,S1),adverbio(S1,S).
oracion(S0,S):- sintagma_identificacion(S0,S).
oracion(S0,S):- nombreA(S0, S).
oracion(S0,S):- hora(S0, S).
oracion(S0,S):- sintagma_caracteristica(S0, S).
oracion(S0,S):- emergencia(S0, S).



%Sintagma nomminal
sintagma_nominal(S0,S):- determinante(S0,S1),nombreA(S1,S).
sintagma_nominal(S0,S):- determinante(S0,S1),sustantivo(S1,S).
sintagma_nominal(S0,S):- sustantivo(S0,S).

%Sintagma verbal
sintagma_verbal(S0,S):- verbo(S0,S).
sintagma_verbal(S0,S):- verbo(S0,S1),verbo(S1,S).
sintagma_verbal(S0,S):- verbo(S0,S1),sintagma_nominal(S1,S).

%Sintagma identificaion
sintagma_identificacion(S0,S):- identificador(S0,S).
sintagma_identificacion(S0,S):- identificador(S0,S1),coma(S1,S2),sintagma_identificacion(S2,S).

%Signos de puntuacion
coma([","|S],S).
punto(["."|S],S).

%Datos del avion
identificador(S0,S):- vuelo(S0,S1),numero(S1,S).
identificador(S0,S):- aerolinea(S0,S1),compania(S1,S).
identificador(S0,S):- matricula(S0,S1),alfabeto_aeronautico(S1,S).

%Caracteristicas fisicas del vuelo del avion
sintagma_caracteristica(S0,S):- caracteristica(S0,S).
sintagma_caracteristica(S0,S):- caracteristica(S0,S1),coma(S1,S2),sintagma_caracteristica(S2,S).
caracteristica(S0, S):- direccion(S0, S1), cardinal(S1,S).
caracteristica(S0, S):- velocidad(S0, S1), rapidez(S1, S).
caracteristica(S0, S):- distancia(S0, S1), kilometros(S1, S).


%Numero de vuelo
vuelo(["vuelo:"|S],S).
numero(["400"|S],S).
numero(["401"|S],S).
numero(["402"|S],S).
numero(["403"|S],S).
numero(["404"|S],S).
numero(["405"|S],S).
numero(["406"|S],S).
numero(["407"|S],S).
numero(["408"|S],S).
numero(["409"|S],S).
numero(["410"|S],S).
numero(["411"|S],S).
numero(["412"|S],S).
numero(["413"|S],S).
numero(["414"|S],S).
numero(["415"|S],S).
numero(["416"|S],S).
numero(["417"|S],S).
numero(["418"|S],S).
numero(["419"|S],S).
numero(["420"|S],S).

%Aerolineas
aerolinea(["aerolinea:"|S],S).
compania(["TEC-Airlines"|S],S).
compania(["American-Airlines"|S],S).

%Matricluas y alfabeto aeronautico
matricula(["matricula:"|S],S).
alfabeto_aeronautico(S0,S):- letra_aa(S0,S1), letra_aa(S1,S2), letra_aa(S2,S3), letra_aa(S3,S).

letra_aa(["Alfa"|S],S).
letra_aa(["Bravo"|S],S).
letra_aa(["Charlie"|S],S).
letra_aa(["Delta"|S],S).
letra_aa(["Echo"|S],S).
letra_aa(["Fox"|S],S).
letra_aa(["Golfo"|S],S).
letra_aa(["Hotel"|S],S).
letra_aa(["India"|S],S).
letra_aa(["Julieta"|S],S).
letra_aa(["Kilo"|S],S).
letra_aa(["Lima"|S],S).
letra_aa(["Metro"|S],S).
letra_aa(["Nectar"|S],S).
letra_aa(["Oscar"|S],S).
letra_aa(["Papa"|S],S).
letra_aa(["Quebec"|S],S).
letra_aa(["Romeo"|S],S).
letra_aa(["Sierra"|S],S).
letra_aa(["Tango"|S],S).
letra_aa(["Unico"|S],S).
letra_aa(["Victor"|S],S).
letra_aa(["Whiskey"|S],S).
letra_aa(["Extra"|S],S).
letra_aa(["Yankee"|S],S).
letra_aa(["Zulu"|S],S).

%Determinantes o articulos
determinante(["el"|S],S).
determinante(["la"|S],S).
determinante(["un"|S],S).
determinante(["una"|S],S).

%Nombres de aviones
nombreA(["Cessna"|S],S).
nombreA(["Beechcraft"|S],S).
nombreA(["Embraer-Phenom"|S],S).
nombreA(["Boing-717"|S],S).
nombreA(["Embraer-190"|S],S).
nombreA(["Airbus-A220"|S],S).
nombreA(["Boing-747"|S],S).
nombreA(["Airbus-A340"|S],S).
nombreA(["Airbus-A380"|S],S).

%Horas a asignar
hora(["00:00"|S],S).
hora(["01:00"|S],S).
hora(["01:30"|S],S).
hora(["02:00"|S],S).
hora(["02:30"|S],S).
hora(["03:00"|S],S).
hora(["03:30"|S],S).
hora(["04:00"|S],S).
hora(["04:30"|S],S).
hora(["05:00"|S],S).
hora(["05:30"|S],S).
hora(["06:00"|S],S).
hora(["06:30"|S],S).
hora(["07:00"|S],S).
hora(["07:30"|S],S).
hora(["08:00"|S],S).
hora(["08:30"|S],S).
hora(["09:00"|S],S).
hora(["09:30"|S],S).
hora(["10:00"|S],S).
hora(["10:30"|S],S).
hora(["11:00"|S],S).
hora(["11:30"|S],S).
hora(["12:00"|S],S).
hora(["12:30"|S],S).
hora(["13:00"|S],S).
hora(["13:00"|S],S).
hora(["14:30"|S],S).
hora(["14:00"|S],S).
hora(["15:30"|S],S).
hora(["15:00"|S],S).
hora(["16:30"|S],S).
hora(["16:00"|S],S).
hora(["16:30"|S],S).
hora(["17:00"|S],S).
hora(["17:30"|S],S).
hora(["18:00"|S],S).
hora(["19:30"|S],S).
hora(["20:00"|S],S).
hora(["20:30"|S],S).
hora(["21:00"|S],S).
hora(["21:30"|S],S).
hora(["22:00"|S],S).
hora(["22:30"|S],S).
hora(["23:00"|S],S).
hora(["23:30"|S],S).

%Velocidades de vuelo
velocidad(["velocidad:"|S],S).
rapidez(["200km/h"|S],S).
rapidez(["250km/h"|S],S).
rapidez(["300km/h"|S],S).
rapidez(["350km/h"|S],S).
rapidez(["400km/h"|S],S).
rapidez(["450km/h"|S],S).
rapidez(["500km/h"|S],S).

%Distancias de la pista
distancia(["distancia:"|S],S).
kilometros(["100km"|S],S).
kilometros(["150km"|S],S).
kilometros(["200km"|S],S).
kilometros(["250km"|S],S).
kilometros(["300km"|S],S).
kilometros(["350km"|S],S).
kilometros(["400km"|S],S).

%Direcciones de vuelo
direccion(["direccion:"|S],S).
cardinal(["Este-Oeste"|S],S).
cardinal(["Oeste-Este"|S],S).

%Verbos a utilizar
verbo(["Solicito"|S],S).
verbo(["Quiero"|S],S).
verbo(["aterrizar"|S],S).
verbo(["despegar"|S],S).
verbo(["Perdi"|S],S).
verbo(["Parto"|S],S).
verbo(["Paro"|S],S).
verbo(["es"|S],S).

%Casos de emergencia
emergencia(["Mayday-Mayday"|S],S).
emergencia(["Emergencia-7500"|S],S).
emergencia(["Secuestro"|S],S).

%Preposiciones
preposicion(["para"|S],S).
preposicion(["a"|S],S).
preposicion(["de"|S],S).
preposicion(["en"|S],S).

%Sustantivos
sustantivo(["permiso"|S],S).
sustantivo(["motor"|S],S).
sustantivo(["medio-vuelo"|S],S).
sustantivo(["cardiaco"|S],S).
sustantivo(["pasajero"|S],S).

%Adverbios
adverbio(["MayCEy"|S],S).
adverbio(["companero"|S],S).
adverbio(["torre de control"|S],S).

%Saludos
sintagma_saludo(S0,S):- saludo(S0,S).
sintagma_saludo(S0,S):- saludo(S0,S1),tiempo(S1,S).

saludo(["Hola"|S],S).
saludo(["Buenos"|S],S).
saludo(["Buenas"|S],S).

tiempo(["dias"|S],S).
tiempo(["tardes"|S],S).
tiempo(["noches"|S],S).

%Elije una frase por si lo escrito por el ususario no se llega a comprender
fraseSiNoEntendio(C, Emer, DB):- random(0, 4, R), nth0(R,
                       ["Disculpe, pordria repetir lo que dijo. \n",
                       "No se le pudo comprender, por favor repitase. \n",
                       "Estamos teniendo problemas con la senal de radio, repita lo dicho. \n",
                       "Comuniquese nuevamente, no se le logro entender. \n"], Phrase) ,
                       write(Phrase), runaux(C,Emer, DB).

identificarPC(S, Emer, DB):- identificarSaludo(S, Conv), responderSaludo(P), write(P), runaux(Conv, Emer, DB).
identificarPC(S, _, DB):- identificarEmergencia(S, Conv), write("Buenas, indique cual es su emergencia \n"), runaux(Conv, 1, DB).

identificarPC(S, Emer, DB):- identificarSolicitud(S, Soli, Emer) ,identificarVuelo(S, [], SpecsD0), identificarAerolinea(S, SpecsD0, SpecsD1),
                        identificarMatricula(S, SpecsD1, SpecsD2), identificarAeronave(S, SpecsD2, SpecsD3), identificarHora(S, Soli, Emer, DB, SpecsD3, SpecsD4),
                        identificarVelocidad(S, Soli, Emer, DB, SpecsD4, SpecsD5), identificarDistancia(S, Soli, Emer, DB, SpecsD5, SpecsD6),
                        identificarDireccion(S, Emer, SpecsD6, SpecsD7), agendarEspacio(Emer, DB, SpecsD7).


identificarPC(S, Emer, DB):- not(identificarSolicitud(S, _, Emer)), pedirSolicitud(P), write(P), runaux(S, Emer, DB).
identificarPC(S, Emer, DB):- not(identificarVuelo(S, [], _)), pedirIdentificacion(P), write(P), runaux(S, Emer, DB).
identificarPC(S, Emer, DB):- not(identificarAerolinea(S, [],_)), pedirIdentificacion(P), write(P), runaux(S, Emer, DB).
identificarPC(S, Emer, DB):- not(identificarMatricula(S,[],_)), pedirIdentificacion(P), write(P), runaux(S, Emer, DB).
identificarPC(S, Emer, DB):- not(identificarAeronave(S,[],_)), pedirAeronave(P), write(P), runaux(S, Emer, DB).
identificarPC(S, Emer, DB):- not(identificarHora(S, 0, Emer, DB,[], _)), pedirHora(P), write(P), runaux(S, Emer, DB).
identificarPC(S, Emer, DB):- not(identificarVelocidad(S, 0, Emer, DB, [], _)), pedirVelocidad(P), write(P), runaux(S, Emer, DB).
identificarPC(S, Emer, DB):- not(identificarDistancia(S, 0, Emer, DB,[],_)), pedirDistancia(P), write(P), runaux(S, Emer, DB).
identificarPC(S, Emer, DB):- not(identificarDireccion(S, Emer,[],_)), pedirDireccion(P), write(P), runaux(S, Emer, DB).

indexOf(V, [H|T], A, I):- V = H, A = I, !;
                          ANew is A + 1,indexOf(V, T, ANew, I).
indexOf(Value, List, Index) :-indexOf(Value, List, 0, Index).

miembro(X,[X|_]).
miembro(X,[_|Ys]):- miembro(X,Ys).

my_remove_element(_, [], []).

my_remove_element(Y, [Y|Xs], Zs):-
          my_remove_element(Y, Xs, Zs), !.

my_remove_element(X, [Y|Xs], [Y|Zs]):-
          my_remove_element(X, Xs, Zs).

my_length([], 0).

my_length([_|Xs], L):-
          my_length(Xs, L2),
          L is L2 + 1.


identificarSaludo(S, Conv):- miembro("Hola", S), my_remove_element("Hola", S, Conv).
identificarSaludo(S, Conv):- miembro("Buenos", S), my_remove_element("Buenos", S, Conv).
identificarSaludo(S, Conv):- miembro("Buenas", S), my_remove_element("Buenas", S, Conv).
responderSaludo(P):- random(0, 2, R), nth0(R,
                                            ["Hola. En que lo puedo ayudar? \n",
                                            "Buen dia, en que le puedo servir \n",
                                            "Torre de control reportandose. Que necesita? \n"], P).

identificarEmergencia(S, Conv):- miembro("Mayday-Mayday", S), my_remove_element("Mayday-Mayday", S, Conv).

identificarSolicitud(_, Soli, Emer):- Emer = 1, Soli is 2.
identificarSolicitud(S, Soli, _):- miembro("despegar", S), Soli is 1.
identificarSolicitud(S, Soli, _):- miembro("aterrizar", S), Soli is 2.

pedirSolicitud(P):-random(0, 1, R), nth0(R,
                                           ["Por favor indiqueme en que le puedo ayudar primero, aterrizaje o despegue \n",
                                           "Primero hagame saber si desea aterrizar o despegar \n"], P).

identificarVuelo(S, SpecsA, SpecsD):- miembro("vuelo:", S), indexOf("vuelo:", S, Index), IndexV is Index+1,nth0(IndexV, S, Vuelo), append(SpecsA, [Vuelo], SpecsD).
identificarAerolinea(S, SpecsA, SpecsD):- miembro("aerolinea:", S), indexOf("aerolinea:", S, Index), IndexL is Index+1,nth0(IndexL, S, Linea), append(SpecsA, [Linea], SpecsD).
identificarMatricula(S, SpecsA, SpecsD):- miembro("matricula:", S), indexOf("matricula:", S, Index),
                                                                                                     IndexM0 is Index+1,nth0(IndexM0, S, M0),
                                                                                                     IndexM1 is Index+2,nth0(IndexM1, S, M1),
                                                                                                     IndexM2 is Index+3,nth0(IndexM2, S, M2),
                                                                                                     IndexM3 is Index+4,nth0(IndexM3, S, M3),
                                                                                                     append([M0], [M1], M01), append(M01, [M2], M012), append(M012, [M3], Matricula),
                                                                                                     append(SpecsA, [Matricula], SpecsD).
pedirIdentificacion(P):-random(0, 1, R), nth0(R,
                                       ["Por favor identifiquese completamente \n",
                                       "Identifiquese con toda la informacion necesaria \n"], P).

identificarAeronave(S, SpecsA, SpecsD):- miembro("Cessna", S), append(SpecsA, ["Peq"], SpecsD);
                         miembro("Beechcraft", S), append(SpecsA, ["Peq"], SpecsD);
                         miembro("Embraer-Phenom", S), append(SpecsA, ["Peq"], SpecsD);
                         miembro("Boing-717", S), append(SpecsA, ["Med"], SpecsD);
                         miembro("Embraer-190", S), append(SpecsA, ["Med"], SpecsD);
                         miembro("Airbus-A220", S), append(SpecsA, ["Med"], SpecsD);
                         miembro("Boing-747", S), append(SpecsA, ["Gran"], SpecsD);
                         miembro("Airbus-A340", S), append(SpecsA, ["Gran"], SpecsD);
                         miembro("Airbus-A380", S), append(SpecsA, ["Gran"], SpecsD).
pedirAeronave(P):-random(0, 1, R), nth0(R,
                                       ["Me indica el tipo de aeronave \n",
                                       "Que tipo de aeronave es? \n"], P).

identificarHora(_, _, Emer, _, SpecsA, SpecsD):- Emer = 1, append(SpecsA, ["00:01"], SpecsD).
identificarHora(S, Soli, Emer, DB,_,_):- Soli = 2, append(S, ["00:01"], Conv), not(identificarVelocidad(Conv, 0, Emer, DB, [], _)), pedirVelocidad(P), write(P), runaux(Conv, Emer, DB).
identificarHora(S, _, _, _, SpecsA, SpecsD):- miembro("00:01",S), append(SpecsA, ["00:01"], SpecsD);
miembro("00:00",S), append(SpecsA, ["00:00"], SpecsD); miembro("00:30",S), append(SpecsA, ["00:30"], SpecsD);
miembro("01:00",S), append(SpecsA, ["01:00"], SpecsD); miembro("01:30",S), append(SpecsA, ["01:30"], SpecsD);
miembro("02:00",S), append(SpecsA, ["02:00"], SpecsD); miembro("02:30",S), append(SpecsA, ["02:30"], SpecsD);
miembro("03:00",S), append(SpecsA, ["03:00"], SpecsD); miembro("03:30",S), append(SpecsA, ["03:30"], SpecsD);
miembro("04:00",S), append(SpecsA, ["04:00"], SpecsD); miembro("04:30",S), append(SpecsA, ["04:30"], SpecsD);
miembro("05:00",S), append(SpecsA, ["05:00"], SpecsD); miembro("05:30",S), append(SpecsA, ["05:30"], SpecsD);
miembro("06:00",S), append(SpecsA, ["06:00"], SpecsD); miembro("06:30",S), append(SpecsA, ["06:30"], SpecsD);
miembro("07:00",S), append(SpecsA, ["07:00"], SpecsD); miembro("07:30",S), append(SpecsA, ["07:30"], SpecsD);
miembro("08:00",S), append(SpecsA, ["08:00"], SpecsD); miembro("08:30",S), append(SpecsA, ["08:30"], SpecsD);
miembro("09:00",S), append(SpecsA, ["09:00"], SpecsD); miembro("09:30",S), append(SpecsA, ["09:30"], SpecsD);
miembro("10:00",S), append(SpecsA, ["10:00"], SpecsD); miembro("10:30",S), append(SpecsA, ["10:30"], SpecsD);
miembro("11:00",S), append(SpecsA, ["11:00"], SpecsD); miembro("11:30",S), append(SpecsA, ["11:30"], SpecsD);
miembro("12:00",S), append(SpecsA, ["12:00"], SpecsD); miembro("12:30",S), append(SpecsA, ["12:30"], SpecsD);
miembro("13:00",S), append(SpecsA, ["13:00"], SpecsD); miembro("13:30",S), append(SpecsA, ["13:30"], SpecsD);
miembro("14:00",S), append(SpecsA, ["14:00"], SpecsD); miembro("14:30",S), append(SpecsA, ["14:30"], SpecsD);
miembro("15:00",S), append(SpecsA, ["15:00"], SpecsD); miembro("15:30",S), append(SpecsA, ["15:30"], SpecsD);
miembro("16:00",S), append(SpecsA, ["16:00"], SpecsD); miembro("16:30",S), append(SpecsA, ["16:30"], SpecsD);
miembro("17:00",S), append(SpecsA, ["17:00"], SpecsD); miembro("17:30",S), append(SpecsA, ["17:30"], SpecsD);
miembro("18:00",S), append(SpecsA, ["18:00"], SpecsD); miembro("18:30",S), append(SpecsA, ["18:30"], SpecsD);
miembro("19:00",S), append(SpecsA, ["19:00"], SpecsD); miembro("19:30",S), append(SpecsA, ["19:30"], SpecsD);
miembro("20:00",S), append(SpecsA, ["20:00"], SpecsD); miembro("20:30",S), append(SpecsA, ["20:30"], SpecsD);
miembro("21:00",S), append(SpecsA, ["21:00"], SpecsD); miembro("21:30",S), append(SpecsA, ["21:30"], SpecsD);
miembro("22:00",S), append(SpecsA, ["22:00"], SpecsD); miembro("22:30",S), append(SpecsA, ["22:30"], SpecsD);
miembro("23:00",S), append(SpecsA, ["23:00"], SpecsD); miembro("23:30",S), append(SpecsA, ["23:30"], SpecsD).

pedirHora(P):-random(0, 1, R), nth0(R,
                                       ["Indique la hora de salida \n",
                                       "A que hora desea despegar? \n"], P).

identificarVelocidad(_, _, Emer, _, SpecsA, SpecsD):- Emer = 1, append(SpecsA, ["0km/h"], SpecsD).
identificarVelocidad(S, Soli, Emer, DB, _, _):- Soli = 1, append(S, ["distancia:", "0km", "velocidad:", "0km/h"], Conv), not(identificarDireccion(S, Emer, [],_)), pedirDireccion(P), write(P), runaux(Conv, Emer, DB).
identificarVelocidad(S, _, _, _, SpecsA, SpecsD):- miembro("velocidad:", S), indexOf("velocidad:", S, Index), IndexV is Index+1,nth0(IndexV, S, Velocidad), append(SpecsA, [Velocidad], SpecsD).

pedirVelocidad(P):-random(0, 1, R), nth0(R,
                                       ["Indiqueme su velocidad, distancia a la pista y direccion\n",
                                       "Hagame saber sus caracteristicas fisicas de movimiento \n"], P).

identificarDistancia(_, _, Emer, _, SpecsA, SpecsD):- Emer = 1, append(SpecsA, ["0km"], SpecsD).
identificarDistancia(S, Soli, Emer, DB,_,_):- Soli = 1, append(S, ["distancia:", "0km", "velocidad:", "0km/h"], Conv), not(identificarDireccion(S, Emer, [], _)), pedirDireccion(P), write(P), runaux(Conv, Emer, DB).
identificarDistancia(S, _, _, _, SpecsA, SpecsD):- miembro("distancia:", S), indexOf("distancia:", S, Index), IndexD is Index+1,nth0(IndexD, S, Distancia), append(SpecsA, [Distancia], SpecsD).

pedirDistancia(P):-random(0, 1, R), nth0(R,
                                       ["Indiqueme su velocidad, distancia a la pista y direccion\n",
                                       "Hagame saber sus caracteristicas fisicas de movimiento \n"], P).

identificarDireccion(_, Emer, SpecsA, SpecsD):- Emer = 1, append(SpecsA, ["0"], SpecsD).
identificarDireccion(S, _, SpecsA, SpecsD):- miembro("direccion:", S), indexOf("direccion:", S, Index), IndexD is Index+1,nth0(IndexD, S, Direccion), append(SpecsA, [Direccion], SpecsD).
pedirDireccion(P):-random(0, 1, R), nth0(R,
                                       ["Indiqueme su direccion\n",
                                       "Hagame saber su direccion\n"], P).

agendarEspacio(Emer, DB, Specs):- revisarEspacios(DB, Specs, NewDB, Espacio, false),nth0(0, Espacio, Pista), nth0(1, Espacio, Hora),
respuestaAlGuardarEspacio(Pista, Hora, Specs, Emer), runaux([], 0, NewDB).

respuestaAlGuardarEspacio(Pista, Hora, _, Emer):- Emer = 1, write("Por favor mantenga la calma, se estan alistando la brigada de emergencia para asitir su vuelo, a usted se le asigno la "),
write(Pista), write("\n").

respuestaAlGuardarEspacio(Pista, Hora, Specs, _):- nth0(5, Specs, Velocidad), Velocidad = "0km/h",
write("A usted se le ha sido asignado a la "), write(Pista),write(" a las "), write(Hora), write("\n").
respuestaAlGuardarEspacio(Pista, Hora, Specs, _):- nth0(5, Specs, Velocidad), Velocidad = "200km/h",
write("A usted se le ha sido asignado a la "), write(Pista),write(" a las "), write(Hora), write("\n").
respuestaAlGuardarEspacio(Pista, Hora, Specs, _):- nth0(5, Specs, Velocidad), Velocidad = "250km/h",
write("A usted se le ha sido asignado a la "), write(Pista),write(" a las "), write(Hora), write("\n").
respuestaAlGuardarEspacio(Pista, Hora, Specs, _):- nth0(5, Specs, Velocidad), Velocidad = "300km/h",
write("A usted se le ha sido asignado a la "), write(Pista),write(" a las "), write(Hora), write("\n").
respuestaAlGuardarEspacio(Pista, Hora, _, _):- write("Por favor disminuya su velocidad a 300km/h como minimo,
a usted se le asigno la "), write(Pista),write(" a las "), write(Hora), write("\n").

revisarEspacios(DB, Specs, NewDB, Espacio, NoVacio):- nth0(3, Specs, Nave), Nave = "Peq", revisarEspaciosaux(0, DB, Specs, NewDB, Espacio, NoVacio).
revisarEspacios(DB, Specs, NewDB, Espacio, NoVacio):- nth0(3, Specs, Nave), Nave = "Med", revisarEspaciosaux(1, DB, Specs, NewDB, Espacio, NoVacio).
revisarEspacios(DB, Specs, NewDB, Espacio, NoVacio):- nth0(3, Specs, Nave), Nave = "Gran", revisarEspaciosaux(3, DB, Specs, NewDB, Espacio, NoVacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 0, nth0(Index, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      nth0(4, Specs, Hora), miembro(Hora, LisHoras), my_length(LisHoras, L), Largo is L-1,
                                                                      nth0(Largo, LisHoras, UltHora),
                                                                      cambiarHora(UltHora, HoraCambiada), nth0(0, HoraCambiada, HoraC) ,replace(Specs, 4, HoraC, SpecsH),
                                                                      anadirP1(DB,SpecsH,NewDB),
                                                                      append(["Pista 1"],HoraCambiada, Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 0,nth0(Index, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      nth0(4, Specs, Hora), not(miembro(Hora, LisHoras)),Hora \="00:01",
                                                                       anadirP1(DB,Specs,NewDB),
                                                                      append(["Pista 1"],[Hora], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 0, nth0(Index, DB, PisAsig),
                                                                      nth0(4, Specs, Hora), Hora = "00:01", crearListaHoras(PisAsig, LisHoras),
                                                                      my_length(LisHoras, L), Largo is L-1,
                                                                      nth0(Largo, LisHoras, UltHora),
                                                                      cambiarHora(UltHora, HoraCambiada), nth0(0, HoraCambiada, HoraC) ,replace(Specs, 4, HoraC, SpecsH),
                                                                      anadirP1(DB,SpecsH,NewDB),
                                                                      append(["Pista 1"],HoraCambiada, Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 1,nth0(Index, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      nth0(4, Specs, Hora), miembro(Hora, LisHoras), my_length(LisHoras, L), Largo is L-1,
                                                                      nth0(Largo, LisHoras, UltHora),
                                                                      cambiarHora(UltHora, HoraCambiada), nth0(0, HoraCambiada, HoraC) ,replace(Specs, 4, HoraC, SpecsH),
                                                                      nth0(6, Specs, Direccion),
                                                                      Direccion = "Este-Oeste", anadirP21(DB,SpecsH,NewDB),
                                                                      append(["Pista 2-1"],HoraCambiada, Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 1,nth0(6, Specs, Direccion),
                                                                      Direccion = "Este-Oeste",nth0(Index, DB, PisAsig),
                                                                      crearListaHoras(PisAsig, LisHoras),
                                                                      nth0(4, Specs, Hora), not(miembro(Hora, LisHoras)),Hora \="00:01",
                                                                      anadirP21(DB,Specs,NewDB),
                                                                      append(["Pista 2-1"],[Hora], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 1,nth0(6, Specs, Direccion),
                                                                    Direccion = "Este-Oeste",nth0(Index, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                    nth0(4, Specs, Hora), Hora = "00:01", my_length(LisHoras, L), Largo is L-1,
                                                                    nth0(Largo, LisHoras, UltHora),
                                                                    cambiarHora(UltHora, HoraCambiada),nth0(0, HoraCambiada, HoraC) ,replace(Specs, 4, HoraC, SpecsH),
                                                                    anadirP21(DB,SpecsH,NewDB),
                                                                    append(["Pista 2-1"],HoraCambiada, Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 1,nth0(2, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      nth0(4, Specs, Hora), miembro(Hora, LisHoras), my_length(LisHoras, L), Largo is L-1,
                                                                      nth0(Largo, LisHoras, UltHora),
                                                                      cambiarHora(UltHora, HoraCambiada), nth0(0, HoraCambiada, HoraC) ,replace(Specs, 4, HoraC, SpecsH),
                                                                      anadirP22(DB,SpecsH,NewDB),
                                                                      append(["Pista 2-2"],HoraCambiada, Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 1,nth0(2, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      nth0(4, Specs, Hora), not(miembro(Hora, LisHoras)),Hora \="00:01",
                                                                      anadirP22(DB,Specs,NewDB),
                                                                      append(["Pista 2-2"],[Hora], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 1,
                                                                      nth0(4, Specs, Hora), Hora = "00:01", nth0(2, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      my_length(LisHoras, L), Largo is L-1,
                                                                      nth0(Largo, LisHoras, UltHora),
                                                                      write(UltHora), cambiarHora(UltHora, HoraCambiada), write("a"), nth0(0, HoraCambiada, HoraC) , write("b"),replace(Specs, 4, HoraC, SpecsH),
                                                                      anadirP22(DB,SpecsH,NewDB),
                                                                       append(["Pista 2-2"],HoraCambiada, Espacio).


revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 3,nth0(Index, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      nth0(4, Specs, Hora), miembro(Hora, LisHoras), my_length(LisHoras, L), Largo is L-1,
                                                                      nth0(Largo, LisHoras, UltHora),
                                                                      cambiarHora(UltHora, HoraCambiada),nth0(0, HoraCambiada, HoraC) ,replace(Specs, 4, HoraC, SpecsH),
                                                                      anadirP3(DB,SpecsH,NewDB),
                                                                      append(["Pista 3"],HoraCambiada, Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 3,nth0(Index, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      nth0(4, Specs, Hora), not(miembro(Hora, LisHoras)),Hora \="00:01",
                                                                       anadirP3(DB,Specs,NewDB),
                                                                      append(["Pista 3"],[Hora], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, NoVacio):- NoVacio,Index = 3,
                                                                      nth0(4, Specs, Hora), Hora = "00:01", nth0(Index, DB, PisAsig), crearListaHoras(PisAsig, LisHoras),
                                                                      my_length(LisHoras, L), Largo is L-1,
                                                                      nth0(Largo, LisHoras, UltHora),
                                                                      cambiarHora(UltHora, HoraCambiada), nth0(0, HoraCambiada, HoraC) ,replace(Specs, 4, HoraC, SpecsH),
                                                                      anadirP3(DB,SpecsH,NewDB),
                                                                      append(["Pista 3"],HoraCambiada, Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):-nth0(Index, DB, PisAsig), PisAsig = [], Index = 0,
                                                        nth0(4, Specs, Hora), Hora \= "00:01",anadirP1(DB,Specs,NewDB),
                                                        append(["Pista 1"],[Hora], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):-nth0(Index, DB, PisAsig), PisAsig = [], Index = 0,
                                                        nth0(4, Specs, Hora), Hora = "00:01", replace(Specs, 4, "05:00", SpecsH),
                                                        anadirP1(DB,SpecsH,NewDB),
                                                        append(["Pista 1"],["05:00"], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):- nth0(Index, DB, PisAsig), PisAsig = [], Index = 1, nth0(6, Specs, Direccion),
                                                        Direccion = "Este-Oeste", nth0(4, Specs, Hora), Hora \= "00:01",anadirP21(DB,Specs,NewDB),
                                                        append(["Pista 2-1"],[Hora], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):-nth0(Index, DB, PisAsig), PisAsig = [], Index = 1, nth0(6, Specs, Direccion),
                                                        Direccion = "Este-Oeste",nth0(4, Specs, Hora), Hora = "00:01", replace(Specs, 4, "05:00", SpecsH),
                                                        anadirP21(DB,SpecsH,NewDB),
                                                        append(["Pista 2-1"],["05:00"], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):- nth0(Index, DB, PisAsig), PisAsig = [], Index = 2,
                                                        anadirP22(DB,Specs,NewDB),nth0(4, Specs, Hora), Hora \= "00:01",
                                                        append(["Pista 2-2"],[Hora], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):-nth0(Index, DB, PisAsig), PisAsig = [], Index = 2,
                                                        nth0(4, Specs, Hora), Hora = "00:01",replace(Specs, 4, "05:00", SpecsH),
                                                        anadirP22(DB,SpecsH,NewDB),
                                                        append(["Pista 2-2"],["05:00"], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):- nth0(Index, DB, PisAsig), PisAsig = [], Index = 3,
                                                        nth0(4, Specs, Hora), Hora \= "00:01", anadirP3(DB,Specs,NewDB),
                                                        append(["Pista 3"],[Hora], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):-nth0(Index, DB, PisAsig), PisAsig = [], Index = 3,
                                                        nth0(4, Specs, Hora), Hora = "00:01", replace(Specs, 4, "05:00", SpecsH),
                                                        anadirP3(DB,SpecsH,NewDB),
                                                        append(["Pista 3"],["05:00"], Espacio).

revisarEspaciosaux(Index, DB, Specs, NewDB, Espacio, _):- Index < 3 ,Index1 is Index+1,
                                                        revisarEspaciosaux(Index1, DB, Specs, NewDB, Espacio, false).

revisarEspaciosaux(_, DB, Specs, NewDB, Espacio, _):- revisarEspacios(DB, Specs, NewDB, Espacio, true).


%[vuelo, aerolinea, matricula, aeronave, hora, velocidad, direccion]



anadirP1(DB, Specs, NewDB):- nth0(0, DB, P1), nth0(1, DB, P21), nth0(2, DB, P22),nth0(3, DB, P3),
           append(P1, [Specs], P1D), append([], [P1D], D0), append(D0, [P21], D1),
           append(D1, [P22], D2), append(D2, [P3], NewDB).

anadirP21(DB, Specs, NewDB):- nth0(0, DB, P1), nth0(1, DB, P21), nth0(2, DB, P22),nth0(3, DB, P3),
           append(P21, [Specs], P21D), append([], [P1], D0), append(D0, [P21D], D1),
           append(D1, [P22], D2), append(D2, [P3], NewDB).

anadirP22(DB, Specs, NewDB):- nth0(0, DB, P1), nth0(1, DB, P21), nth0(2, DB, P22),nth0(3, DB, P3),
           append(P22, [Specs], P22D), append([], [P1], D0), append(D0, [P21], D1),
           append(D1, [P22D], D2), append(D2, [P3], NewDB).

anadirP3(DB, Specs, NewDB):- nth0(0, DB, P1), nth0(1, DB, P21), nth0(2, DB, P22),nth0(3, DB, P3),
           append(P3, [Specs], P3D), append([], [P1], D0), append(D0, [P21], D1),
           append(D1, [P22], D2), append(D2, [P3D], NewDB).


crearListaHoras(PistAsig, LisHorasAux, LisHoras):-PistAsig = [], LisHorasAux = LisHoras.
crearListaHoras([H|T], LisHorasAux ,LisHoras):- nth0(4, H, Hora),append(LisHorasAux, [Hora], LisHorasAuxNew),
crearListaHoras(T, LisHorasAuxNew, LisHoras).
crearListaHoras(PisAsig, LisHoras):- crearListaHoras(PisAsig, [] ,LisHoras).

replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).

cambiarHora(UltHora, HoraCambiada):- UltHora = "00:00", append([], ["00:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "00:30", append([], ["01:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "01:00", append([], ["01:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "01:30", append([], ["02:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "02:00", append([], ["02:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "02:30", append([], ["03:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "03:00", append([], ["03:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "03:30", append([], ["04:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "04:00", append([], ["04:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "04:30", append([], ["05:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "05:00", append([], ["05:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "05:30", append([], ["06:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "06:00", append([], ["06:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "06:30", append([], ["07:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "07:00", append([], ["07:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "07:30", append([], ["08:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "08:00", append([], ["08:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "08:30", append([], ["09:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "09:00", append([], ["09:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "09:30", append([], ["10:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "10:00", append([], ["10:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "10:30", append([], ["11:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "11:00", append([], ["11:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "11:30", append([], ["12:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "12:00", append([], ["12:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "12:30", append([], ["13:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "13:00", append([], ["13:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "13:30", append([], ["14:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "14:00", append([], ["14:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "14:30", append([], ["15:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "15:00", append([], ["15:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "15:30", append([], ["16:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "16:00", append([], ["16:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "16:30", append([], ["17:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "17:00", append([], ["17:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "17:30", append([], ["18:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "18:00", append([], ["18:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "18:30", append([], ["19:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "19:00", append([], ["19:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "19:30", append([], ["20:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "20:00", append([], ["20:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "20:30", append([], ["21:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "21:00", append([], ["21:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "21:30", append([], ["22:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "22:00", append([], ["22:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "22:30", append([], ["23:00"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "23:00", append([], ["23:30"], HoraCambiada).
cambiarHora(UltHora, HoraCambiada):- UltHora = "23:30", append([], ["00:00"], HoraCambiada).
