
run(C):- read(X),split_string(X," ","",S), bnf(S,[]), append(C, S, Conv),identificarPC(Conv).

run(C):- fraseSiNoEntendio(C).


%bnf
bnf(S0,S):- S0 = ["EXIT"], abort.
bnf(S0,S):- oracion(S0, S).
bnf(S0,S):- oracion(S0, S1), bnf(S1, S).

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
oracion(S0,S):- agradecimiento(S0, S).
oracion(S0,S):- despedida(S0, S).
oracion(S0,S):- emergencia(S0, S).



%Sintagma nomminal
sintagma_nominal(S0,S):- determinante(S0,S1),nombreA(S1,S).
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


%Agradecimientos
agradecimiento(["Gracias"|S],S).
agradecimiento(["MuchasGracias"|S],S).
%Finalizar conversacion (Despedida)
despedida(["CambioYFuera"|S],S).

%Numero de vuelo
vuelo(["Vuelo:"|S],S).
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
aerolinea(["Aerolinea:"|S],S).
compania(["TEC-Airlines"|S],S).
compania(["American-Airlines"|S],S).

%Matricluas y alfabeto aeronautico
matricula(["Matricula:"|S],S).
alfabeto_aeronautico(S0,S):- letra_aa(S0,S).
alfabeto_aeronautico(S0,S):- letra_aa(S0,S1),alfabeto_aeronautico(S1,S).

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
fraseSiNoEntendio(C):- random(0, 4, R), nth0(R,
                       ["Disculpe, pordria repetir lo que dijo. \n",
                       "No se le pudo comprender, por favor repitase. \n",
                       "Estamos teniendo problemas con la senal de radio, repita lo dicho. \n",
                       "Comuniquese nuevamente, no se le logro entender. \n"], Phrase) ,
                       write(Phrase), run(C).

identificarPC(S):- identificarSaludo(S, Conv), responderSaludo(P), write(P), run(Conv).
identificarPC(S):- identificarEmergencia(S, Conv), write("Buenas, indique cual es su emergencia"), run(Conv).

%identificarPC(S):- identificarSolicitud(Soli) ,identificarVuelo(), identificarAereolinea(),
 %                      identificarMatricula(), identificarAereonave(), identificarHora(S, Soli, Conv),
                        %identificarDireccion(Conv),
  %                     Soli = "despegar",identificarAgradecimiento() ,identificarDespedida().

%identificarPC(S):- identificarSolicitud(Soli) ,identificarVuelo(), identificarAereolinea(),
 %                      identificarMatricula(), identificarAereonave(), identificarHora(), Soli = "aterrizar",
  %                     identificarVelocidad(), identificarDistancia() ,identificarDireccion().

identificarPC(S):- not(identificarSolicitud(S, Soli)), pedirSolicitud(P), write(P), run(S).
identificarPC(S):- not(identificarVuelo(S)), pedirIdentificacion(P), write(P), run(S).
identificarPC(S):- not(identificarAerolinea(S)), pedirIdentificacion(P), write(P), run(S).
identificarPC(S):- not(identificarMatricula(S)), pedirIdentificacion(P), write(P), run(S).
identificarPC(S):- not(identificarAeronave(S)), pedirAeronave(P), write(P), run(S).
identificarPC(S):- not(identificarHora(S, 0, [])), pedirHora(P), write(P), run(S).
identificarPC(S):- not(identificarVelocidad(S, 0, [])), pedirVelocidad(P), write(P), run(S).
identificarPC(S):- not(identificarDistancia(S, 0, [])), pedirDistancia(P), write(P), run(S).
identificarPC(S):- not(identificarDireccion(S)), pedirDireccion(P), write(P), run(S).




miembro(X,[X|_]).
miembro(X,[_|Ys]):- miembro(X,Ys).

my_remove_element(_, [], []).

my_remove_element(Y, [Y|Xs], Zs):-
          my_remove_element(Y, Xs, Zs), !.

my_remove_element(X, [Y|Xs], [Y|Zs]):-
          my_remove_element(X, Xs, Zs).


identificarSaludo(S, Conv):- miembro("Hola", S), my_remove_element("Hola", S, Conv).
identificarSaludo(S, Conv):- miembro("Buenos", S), my_remove_element("Buenos", S, Conv).
identificarSaludo(S, Conv):- miembro("Buenas", S), my_remove_element("Buenas", S, Conv).
responderSaludo(P):- random(0, 2, R), nth0(R,
                                            ["Hola. En que lo puedo ayudar? \n",
                                            "Buen dia, en que le puedo servir \n",
                                            "Torre de control reportandose. Que necesita? \n"], P).

identificarEmergencia(S, Conv):- miembro("Mayday-Mayday", S), my_remove_element("Mayday-Mayday", S, Conv).

identificarSolicitud(S, Soli):- miembro("despegar", S), Soli is 1.
identificarSolicitud(S, Soli):- miembro("aterrizar", S), Soli is 2.

pedirSolicitud(P):-random(0, 1, R), nth0(R,
                                           ["Por favor indiqueme en que le puedo ayudar primero, aterrizaje o despegue \n",
                                           "Primero hagame saber si desea aterrizar o despegar \n"], P).

identificarVuelo(S):- miembro("Vuelo:", S).
identificarAerolinea(S):- miembro("Aerolinea:", S).
identificarMatricula(S):- miembro("Matricula:", S).
pedirIdentificacion(P):-random(0, 1, R), nth0(R,
                                       ["Por favor identifiquese completamente \n",
                                       "Identifiquese con toda la informacion necesaria \n"], P).

identificarAeronave(S):- miembro("Cessna", S); miembro("Beechcraft", S); miembro("Embraer-Phenom", S);
miembro("Boing-717", S); miembro("Embraer-190", S); miembro("Airbus-A220", S); miembro("Boing-747", S);
miembro("Airbus-A340", S); miembro("Airbus-A380", S).
pedirAeronave(P):-random(0, 1, R), nth0(R,
                                       ["Me indica el tipo de aeronave \n",
                                       "Que tipo de aeronave es? \n"], P).

identificarHora(S, Soli, Conv):- Soli = 2, append(S, ["00:00"], Conv).
identificarHora(S, Soli, Conv):- miembro("00:00", S); miembro("01:00",S); miembro("01:30",S); miembro("02:00",S);
miembro("02:30",S); miembro("03:00",S); miembro("03:30",S); miembro("04:00",S); miembro("04:30",S);
miembro("05:00",S); miembro("05:30",S); miembro("06:00",S); miembro("06:30",S); miembro("07:00",S);
miembro("07:30",S); miembro("08:00",S); miembro("08:30",S); miembro("09:00",S); miembro("09:30",S);
miembro("10:00",S); miembro("10:30",S); miembro("11:00",S); miembro("11:30",S); miembro("12:00",S);
miembro("12:30",S); miembro("13:00",S); miembro("13:30",S); miembro("14:30",S); miembro("14:00",S);
miembro("15:30",S); miembro("15:00",S); miembro("16:30",S); miembro("16:00",S); miembro("18:30",S);
miembro("17:00",S); miembro("17:30",S); miembro("18:00",S); miembro("19:30",S); miembro("20:00",S);
miembro("20:30",S); miembro("21:00",S); miembro("21:30",S); miembro("22:00",S); miembro("22:30",S);
miembro("23:00",S); miembro("23:30",S); miembro("19:00",S).

pedirHora(P):-random(0, 1, R), nth0(R,
                                       ["Indique la hora de salida \n",
                                       "A que hora desea despegar? \n"], P).


identificarVelocidad(S, Soli, Conv):- Soli = 1, append(S, ["velocidad:"], Conv).
identificarVelocidad(S, Soli, Conv):- miembro("velocidad:", S).

pedirVelocidad(P):-random(0, 1, R), nth0(R,
                                       ["Indiqueme su velocidad, distancia a la pista y direccion\n",
                                       "Hagame saber sus caracteristicas fisicas de movimiento \n"], P).

identificarDistancia(S, Soli, Conv):- Soli = 1, append(S, ["distancia:"], Conv).
identificarDistancia(S, Soli, Conv):- miembro("distancia:", S).

pedirDistancia(P):-random(0, 1, R), nth0(R,
                                       ["Indiqueme su velocidad, distancia a la pista y direccion\n",
                                       "Hagame saber sus caracteristicas fisicas de movimiento \n"], P).

identificarDireccion(S):- miembro("direccion:", S).
pedirDireccion(P):-random(0, 1, R), nth0(R,
                                       ["Indiqueme su direccion\n",
                                       "Hagame saber su direccion\n"], P).