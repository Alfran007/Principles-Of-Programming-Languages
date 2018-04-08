fact1(0,Result) :-
    Result is 1.
fact1(N,Result) :-
    N > 0,
    N1 is N-1,
    fact1(N1,Result1),
    Result is Result1*N.