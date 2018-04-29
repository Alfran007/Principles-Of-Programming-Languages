:- use_module(library(clpfd)). 

color(red).
color(blue).
color(green).

vertex(a).
vertex(b).
vertex(c).
vertex(d).
vertex(e).

edge(a,b).
edge(a,c).
edge(b,c).
edge(b,d).
edge(c,d).


colorGraph(ColorList) :- 
  findall((X, Y), edge(X, Y), Edges),
  findall(X, vertex(X), Vertexes),
  findall(hasColor(X, _), member(X, Vertexes), ColorList),
  createConstraint(Edges,ColorList),
  colorNodes(ColorList).

createConstraint([],_).
createConstraint([(V1,V2)|RL],ColorList):-
  member(hasColor(V1,C1),ColorList),
  member(hasColor(V2,C2),ColorList),
  dif(C1,C2),
  createConstraint(RL,ColorList).

colorNodes([]).
colorNodes([hasColor(_,C)|Nodes]) :-
  color(C),
  colorNodes(Nodes).