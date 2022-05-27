run():- indexOf("Hola", ["asdas", "gsf","adsad" , "Hola", "fafdsad"], Index), write(Index).
indexOf(V, [H|T], A, I):-V = H, A = I, !;
                        ANew is A + 1,indexOf(V, T, ANew, I).

indexOf(Value, List, Index) :-indexOf(Value, List, 0, Index).

indexOfWithoutFailure(Value, List, Index):- indexOf(Value, List, 0, Index);
                                            Index = -1.