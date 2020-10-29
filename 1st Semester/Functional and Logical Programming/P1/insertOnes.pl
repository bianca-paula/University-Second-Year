%Inserts 1 after every even value in the list
%insertOne(L-list, R-result)
%flow model: insertOne(i,o)

insertOne([],[]):-!.
insertOne([H|T],[H,1|R]):-
    H mod 2 =:= 0,!,
    insertOne(T,R).
insertOne([H|T],[H|R]):-
    insertOne(T,R).
%compute the product of all elements in a list
