run():- read(X),split_string(X," ","",S),write(S),oracion(S,[]).


oracion(S0,S):- sintagma_nominal(S0,S1),sintagma_verbal(S1,S).
oracion(S0,S):- sintagma_saludo(S0,S).
oracion(S0,S):- sintagma_verbal(S0,S).
oracion(S0,S):- sintagma_verbal(S0,S1),preposicion(S1,S2),sintagma_verbal(S2,S).
oracion(S0,S):- sintagma_saludo(S0,S1),adverbio(S1,S).
oracion(S0,S):- sintagma_identificacion(S0,S).


sintagma_nominal(S0,S):- determinante(S0,S1),nombre(S1,S).
sintagma_nominal(S0,S):- sustantivo(S0,S).

sintagma_verbal(S0,S):- verbo(S0,S).
sintagma_verbal(S0,S):- verbo(S0,S1),verbo(S1,S).
sintagma_verbal(S0,S):- verbo(S0,S1),sintagma_nominal(S1,S).

sintagma_identificacion(S0,S):- identificador(S0,S).
sintagma_identificacion(S0,S):- identificador(S0,S1),coma(S1,S2),sintagma_identificacion(S2,S).

coma([","|S],S).

identificador(S0,S):- vuelo(S0,S1),numero(S1,S).
identificador(S0,S):- aerolinea(S0,S1),compania(S1,S).
identificador(S0,S):- matricula(S0,S1),alfabeto_aeronautico(S1,S).

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


aerolinea(["Aerolinea:"|S],S).
compania(["TEC-Airlines"|S],S).
compania(["American-Airlines"|S],S).

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

determinante([el|S],S).
determinante([la|S],S).

nombre([hombre|S],S).
nombre([manzana|S],S).

verbo(["Solicito"|S],S).
verbo(["Quiero"|S],S).
verbo(["aterrizar"|S],S).
verbo(["despegar"|S],S).



preposicion(["para"|S],S).

sustantivo(["permiso"|S],S).

adverbio(["MayCEy"|S],S).
adverbio(["companero"|S],S).
adverbio(["torre de control"|S],S).

sintagma_saludo(S0,S):- saludo(S0,S).
sintagma_saludo(S0,S):- saludo(S0,S1),tiempo(S1,S).

saludo(["Hola"|S],S).
saludo(["Buenos"|S],S).
saludo(["Buenas"|S],S).

tiempo(["dias"|S],S).
tiempo(["tardes"|S],S).
tiempo(["noches"|S],S).







