% Chapter3A-1.pl


del_item(Text, Original, Result) :-
	del_all(Text, Original, Result),
	Original == Result, nl, nl,
	write('This item is not in the list').
	
del_item(Text, Original, Result) :-
	del_all(Text, Original, Result).
	
del_all(_, [], []).

del_all(Term, [Head|Tail], Tail2) :-
	Term == Head,
	del_all(Term, Tail, Tail2).
	
del_all(Term, [Head|Tail], [Head|Tail2]) :-
	\+ Term == Head,
	del_all(Term, Tail, Tail2).
