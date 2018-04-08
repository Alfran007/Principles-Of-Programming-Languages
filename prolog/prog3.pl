move(A,B) :-
	nl, write('Move topmost disc from'),
	write(A),write(' to '),write(B).
transfer(1,A,B,I) :- move(A,B).
transfer(N,A,B,I) :-
	M is N-1,
	transfer(M,A,I,B),
	move(A,B),
	transfer(M,I,B,A).