% Chapter3A-2.pl


model_question(can, Original, Result) :-
	del_can(can, Original, Result01),
	append([can],Result01,Result).
	
del_can(can, [], []).

del_can(can, [can|Tail], Tail2) :-
	del_can(can, Tail, Tail2).
	
del_can(can, [Head|Tail], [Head|Tail2]) :-
	del_can(can, Tail, Tail2).
