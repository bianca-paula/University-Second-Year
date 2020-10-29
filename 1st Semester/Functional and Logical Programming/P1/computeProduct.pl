%computeProduct(L-list, product-integer
%flow model: computeProduct(i,o)
computeProduct([],0).
computeProduct([H],H).
computeProduct([H|T],Product) :-
    computeProduct(T, Product1),
    Product is H*Product1.



