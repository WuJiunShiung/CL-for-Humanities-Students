% file: lambda_reduction02.pl
% 加了 alphaConvert 的 lambdaReduct




lambdaReduct(X, X, []) :-
	var(X).			

lambdaReduct(Expression, Result, Stack) :-
	nonvar(Expression),
	Expression = app(Functor, Argument),			
	nonvar(Functor),	
	alphaConvert(Functor, Converted),			% 與原來的lambdaReduct的差別			
	lambdaReduct(Converted, Result, [Argument|Stack]).	

lambdaReduct(Expression, Result, [X|Stack]) :-
	nonvar(Expression),
	Expression = lam(X, Formula),				
	lambdaReduct(Formula, Result, Stack).			


lambdaReduct(Expression, Result, []) :-
	nonvar(Expression),
	\+ (Expression = app(X, _), nonvar(X)),			
	comp(Expression, Functor, SubExpressions),		
	lambdaReductList(SubExpressions, ResultSubExpressions), 
	comp(Result, Functor, ResultSubExpressions).		
								

lambdaReductList([], []).

lambdaReductList([Expression|Others], [Result|Results]) :-
	lambdaReduct(Expression, Result),
	lambdaReductList(Others, Results).


comp(Term, Symbol, ArgList) :-
	Term =.. [Symbol|ArgList].


lambdaReduct(X, Y) :-
	lambdaReduct(X, Y, []).


test01 :-
	write('app(lam(X, ran(X)), mia)'),
	nl, nl,
	lambdaReduct(app(lam(X, ran(X)), mia), Result),
	write(Result).

test02 :-
	write('app(app(lam(X, lam(Y, like(Y, X))), mia), john)'),
	nl, nl,
	lambdaReduct(app(app(lam(X, lam(Y, like(Y, X))), mia), john), Result),
	write(Result).

test03 :-
	write('app(app(lam(U, lam(V, some(X, and(app(U, X)), app(V, X)))))), lam(Y, boy(Y))), lam(Z, sleep(Z)))'),
	nl, nl,
	lambdaReduct(app(app(lam(U, lam(V, some(X, and(app(U, X), app(V, X))))), lam(Y, boy(Y))), lam(Z, sleep(Z))), Result),
	write(Result).

test04 :-
	write('app(app(lam(X, lam(Y, some(Z, and(app(X, Z)), app(Y, Z)))))), lam(X, boy(X))), lam(Y, sleep(Y)))'),
	nl, nl,
	lambdaReduct(app(app(lam(X, lam(Y, some(Z, and(app(X, Z), app(Y, Z))))), lam(X, boy(X))), lam(Y, sleep(Y))), Result),
	write(Result).




alphaConvert(X, Sub, Free1-Free2, Y) :-
	var(X),
	(
	member(sub(Z, Y), Sub),
	X == Z, !,
	Free2 = Free1;
	Y = X,
	Free2 = [X|Free1]
	).

alphaConvert(Expression, Subs, Free1-Free2, some(Y, F2)) :-
	nonvar(Expression),
	Expression = some(X, F1),
	alphaConvert(F1, [sub(X, Y)|Subs], Free1-Free2, F2).

alphaConvert(Expression, Subs, Free1-Free2, all(Y, F2)) :-
	nonvar(Expression),
	Expression = all(X, F1),
	alphaConvert(F1, [sub(X, Y)|Subs], Free1-Free2, F2).

alphaConvert(Expression, Subs, Free1-Free2, lam(Y, F2)) :-
	nonvar(Expression),
	Expression = lam(X, F1),
	alphaConvert(F1, [sub(X, Y)|Subs], Free1-Free2, F2).

alphaConvert(F1, Subs, Free1-Free2, F2) :-
	nonvar(F1),
	\+ F1 = some(_, _),
	\+ F1 = all(_, _),
	\+ F1 = lam(_, _),
	comp(F1, Symbol, Args1),
	alphaConvertList(Args1, Subs, Free1-Free2, Args2),
	comp(F2, Symbol, Args2).

alphaConvertList([], _, Free-Free, []).

alphaConvertList([X|L1], Subs, Free1-Free3, [Y|L2]) :-
	alphaConvert(X, Subs, Free1-Free2, Y),
	alphaConvertList(L1, Subs, Free2-Free3, L2).

alphaConvert(Expression, Converted) :-
	alphaConvert(Expression, [], []-_, Converted).




