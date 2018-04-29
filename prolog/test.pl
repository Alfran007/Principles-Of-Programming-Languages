even_odd(List, Even, Odd) :- 
    % First position is odd
    even_odd_odd(List, Even, Odd).

% We handle the odd position, the next is even
even_odd_odd([H|T], Even, [H|Odd]) :- 
    even_odd_even(T, Even, Odd).
even_odd_odd([], [], []).

% We handle the even position; the next is odd
even_odd_even([H|T], [H|Even], Odd) :- 
    even_odd_odd(T, Even, Odd).
even_odd_even([], [], []).