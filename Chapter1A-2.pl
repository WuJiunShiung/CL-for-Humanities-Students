% Chapter1 A-2.pl
% a list of family relationship
% father(x, y) means x is y's father
/* brother(x, y) means x and y are
brothers */

:- encoding(utf8).

father(老強, 大華).
father(老強, 大明).
father(老強, 大相).
father(老強, 大藍).
father(老強, 大布).
father(大華, 小華).
father(大華, 小小華).
father(大明, 小明).
father(大明, 小小明).
father(大相, 小相).
father(大布, 小布).
	
grandfather(X, Y) :-
	father(X, Z),
	father(Z, Y).
	
brother(Y, Z) :-
	father(X, Y),
	father(X, Z).
