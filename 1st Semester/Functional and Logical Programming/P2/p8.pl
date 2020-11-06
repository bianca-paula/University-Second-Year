%a
%Determine the successor of a number represented as digits in a list

% appendToList(L:list, E:number, R:list)
% flow model: appendToList(i, i, o)
appendToList([], E, [E]).
appendToList([H|T], E, [H|R]) :-
    appendToList(T, E, R).

% get_length(L:list, R:number)
% flow model: get_length(i, o)
get_length([], 0).
get_length([_|T], R) :-
    get_length(T, RC),
    R is RC + 1.

% reverse_list(L:list, R:list)
% flow model: reverse_list(i, o)
reverse_list([], []).
reverse_list([H|T], R) :-
    reverse_list(T, RI),
    appendToList(RI, H, R).



% addToListsSum(A:list, B:list, C:number, R:list)
% flow model: addToListsSum((i, i, i, o)
addToListsSum([], [], 0, []).
addToListsSum([], [], 1, [1]).
addToListsSum([], [HB|TB], C, [HBC|R]) :-
    HBC is (HB + C) mod 10,
    HBC - HB - C =:= 0,
    addToListsSum([], TB, 0, R).
addToListsSum([], [HB|TB], C, [HBC|R]) :-
    HBC is (HB + C) mod 10,
    HBC - HB - C =\= 0,
    addToListsSum([], TB, 1, R).
addToListsSum([HA|TA], [HB|TB], C, [HR|R]) :-
    HR is (HA + HB + C) mod 10,
    HR - HA - HB - C =:= 0,
    addToListsSum(TA, TB, 0, R).
addToListsSum([HA|TA], [HB|TB], C, [HR|R]) :-
    HR is (HA + HB + C) mod 10,
    HR - HA - HB - C =\= 0,
    addToListsSum(TA, TB, 1, R).


% sum_lists(A:list, B:list, R:list)
% flow model: sum_lists(i, i, o)
sum_lists(A, [], A).
sum_lists([], B, B).
sum_lists(A, B, R) :-
    get_length(A, LA),
    get_length(B, LB),
    LA =< LB, !,
    reverse_list(A, RA),
    reverse_list(B, RB),
    addToListsSum(RA, RB, 0, RS),
    reverse_list(RS, R).
sum_lists(A, B, R) :-
    reverse_list(A, RA),
    reverse_list(B, RB),
    addToListsSum(RB, RA, 0, RS),
    reverse_list(RS, R).

% succesor(L:list, R:list)
% succesor(i, o)
succesor(L, R) :- sum_lists([1], L, R).

%b
% For a heterogeneous list, formed from integer numbers and list of
% numbers, determine the successor of a sublist considered as a number.

% sublistSuccessor(L:list, R:list)
% flow model: sublistSuccessor(i, o)
sublistSuccessor([], []).
sublistSuccessor([H|T], [HR|R]) :- is_list(H), !,
    succesor(H, HR),
    sublistSuccessor(T, R).
sublistSuccessor([H|T], [H|R]) :-
    sublistSuccessor(T, R).
