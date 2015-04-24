% Chapter3C.pl

% immediate_left(A, B): A 在B的左邊

immediate_left(john, harry).
immediate_left(harry, chakotay).
immediate_left(chakotay, george).
immediate_left(george, nicholas).
immediate_left(mary, helen).
immediate_left(helen, tuvok).
immediate_left(tuvok, dianna).
immediate_left(dianna, jane).
immediate_left(susan, chris).
immediate_left(chris, janeway).
immediate_left(janeway, sophie).
immediate_left(sophie, jenny).
immediate_left(jack, kirk).
immediate_left(kirk, picard).
immediate_left(picard, worf).
immediate_left(worf, rosemary).
immediate_left(sam, spock).
immediate_left(spock, riker).
immediate_left(riker,sapir).
immediate_left(sapir, heim).

%immediate_above(A, B): A 在B的上方

immediate_above(john, mary).
immediate_above(harry, helen).
immediate_above(chakotay, tuvok).
immediate_above(george, dianna).
immediate_above(nicholas, jane).
immediate_above(mary, susan).
immediate_above(helen, chris).
immediate_above(tuvok, janeway).
immediate_above(dianna, sophie).
immediate_above(jane, jenny).
immediate_above(susan, jack).
immediate_above(chris, kirk).
immediate_above(janeway, picard).
immediate_above(sophie, worf).
immediate_above(jenny, rosemary).
immediate_above(jack, sam).
immediate_above(kirk, spock).
immediate_above(picard, riker).
immediate_above(worf, sapir).
immediate_above(rosemary, heim).

top_right(X, Y) :-
	immediate_above(Z, X),
	immediate_left(Z, Y).

bottom_left(X, Y) :-
	immediate_left(Z, X),
	immediate_above(Z, Y).
	
	
top_side(X) :-
	\+ immediate_above(_, X),
	\+ immediate_left(_, X).

top_side(X) :-
	\+ immediate_above(_, X),
	\+ immediate_left(X, _).
	
% left(A, B)

left(X, Y) :-
	immediate_left(X, Y).

left(X, Y) :-
	immediate_left(X, Z),
	left(Z, Y).

above(X, Y) :-
	immediate_above(X, Y).
	
above(X, Y) :-
	immediate_above(X, Z),
	above(Z, Y).
	
diagonal(X, Y) :-
	top_right(X, Y).
	
diagonal(X, Y) :-
	top_right(X, Z),
	diagonal(Z, Y).
	
	
