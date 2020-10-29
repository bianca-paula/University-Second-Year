%Checks if an element is in a list
%findElement(E-element, L-list)
%flow model: findElement(i,i)
findElement(E, [E|_]):- !.
findElement(E, [_|T]):- findElement(E, T).

%Finds the difference of two sets
%setsDifference(L1-list,L2-list,Result-result)
%flow model: setsDifference(i,i,o)
setsDifference([], _, []):-!.
setsDifference([H|T], L, Result):-findElement(H, L),
                           setsDifference(T, L, Result), !.
setsDifference([H|T], L, [H|Result]):-setsDifference(T, L, Result).
