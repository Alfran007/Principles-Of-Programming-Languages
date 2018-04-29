%take(N,W) :-
%	N>0,
%	X is N div 100,
%	temp is N - (100*X),
%	Y is temp div 10,
%	Z is temp -(10*Y),
%	arm(X,Y,Z)

%army(X,Y,Z) :-
%	X>0,
%	Y>0,
%	Z>0,
%	X*X*X + Y*Y*Y + Z*Z*Z =:= X + Y + Z,
%	write('Number is Armstrong Number')
	
armst(X) :-
    N is X,
    R is X mod 10,
    S is 0,
    arm(N,R,S,X).
arm(N,R,S,X):-
    N > 0,
    S1 is S+R*R*R,
    N1 is N div 10,
    R1 is N mod 10,
    arm(N1,R1,S1,X).
%arm(N,_,S,X):-
    %N = 0,
    %S\=X,
   % write("Armstrong").
arm(N,_,S,X):-
    N = 0,
    S\=X,
    write("Not Armstrong").
	

