% Chapter3A-3.pl

verb(kicked).
verb(loved).
verb(liked).


verb_final(Sentence, [mary, said, that|Result]) :-
	deal_verb(Sentence, Verb, SentenceNoVerb),
	append(SentenceNoVerb, [Verb], Result).
	
deal_verb([Word|Tail], Word, Tail) :-
	verb(Word).

deal_verb([Word|Tail], Verb, [Word|Tail2]) :-
	deal_verb(Tail, Verb, Tail2).
