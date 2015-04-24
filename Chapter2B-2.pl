%Chapter2B-2.pl

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
	
menu :-
	nl, nl,
	write('I can tell you the relative positions of people in our class.'),nl,
	write('Choose what you want to know:'), nl,
	write('a. Who is on the top right of who;'), nl,
	write('b. Who is on the bottom left of who;'), nl,
	write('c. Who does not sit on either side of the top row;'), nl,
	write('d. Exit the program.'), nl, nl,
	write('Please key in your choice:'), nl,
	get(X),
	goToMenu(X).

goToMenu(97) :-			% 小寫a
	nl,
	write('Give me a name you want to know about:'), nl,
	write('Remember to put a period after the name you key in!'),nl, nl,
	read(X), 
	top_right(X, Y), nl, nl,
	write(Y), write(' is on the top right of '), write(X).

goToMenu(97) :-
	nl,
	write('Noboy is on the top right of this person!').

goToMenu(65) :-			% 大寫A
	nl,
	write('Give me a name you want to know about:'), nl,
	write('Remember to put a period after the name you key in!'),nl, nl,
	read(X), 
	top_right(X, Y), nl, nl,
	write(Y), write(' is on the top right of '), write(X).
	
goToMenu(65) :-
	nl,
	write('Nobody is on the top right of this peron!').
	
goToMenu(98) :-		%小寫b
	nl,
	write('Give me a name you want to know about:'), nl,
	write('Remember to put a period after the name you key in!'),nl, nl,
	read(X),
	bottom_left(X, Y), nl, nl,
	write(Y), write(' is on the bottom left of '), write(X).
	
goToMenu(98) :-
	write('No one is on the bottom left of this person!').

goToMenu(66) :-		%大寫B
	nl,
	write('Give me a name you want to know about:'), nl,
	write('Remember to put a period after the name you key in!'),
	read(X),
	bottom_left(X, Y), nl, nl,
	write(Y), write(' is on the bottom left of '), write(X).
	
goToMenu(66) :-
	nl,
	write('No one is on the bottom left of this person!').
	
goToMenu(99) :-		%小寫c
	nl, 
	write('Give me a name you want to know about:'), nl,
	write('Remember to put a period after the name you key in!'),nl, nl,
	read(X),
	if_top_side(X).

goToMenu(67) :-		%大寫C
	nl, 
	write('Give me a name you want to know about:'), nl,
	write('Remember to put a period after the name you key in!'),nl, nl,
	read(X),
	if_top_side(X).


goToMenu(100).	%小寫d

goToMenu(68).	%大寫D

goToMenu(_) :-
	nl, nl,
	write('Please choose a, b, c or A, B, C! Thank you!'), nl, nl,
	menu.

if_top_side(X) :-
	nl,
	\+ top_side(X),
	write(X), write(' is not on the either end of the top row.').

if_top_side(X) :-
	nl,
	write(X), write(' is on the either end of the top row.').
