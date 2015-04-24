% Chapter6.pl

:- encoding(utf8).
:- ensure_loaded('lambda_reduction02.pl').
:- dynamic some/2.

propN(小紅帽) --> [小紅帽].
propN(森林) --> [森林].
propN(大野狼) --> [大野狼].
propN(婆婆) --> [婆婆].
propN(菜園) --> [菜園].
propN(蔬菜) --> [蔬菜].
propN(小男孩) --> [小男孩].
propN(家裡) --> [家裡].
propN(電腦) --> [電腦].
propN(小女孩) --> [小女孩].
propN(圖書館) --> [圖書館].
propN(書) --> [書].
propN(哥哥) --> [哥哥].
propN(廚房) --> [廚房].
propN(麵包) --> [麵包].
propN(妹妹) --> [妹妹].
propN(客廳) --> [客廳].
propN(電視) --> [電視].


vt(lam(Y, lam(X, lam(E, 種(Y, X, E))))) --> [種].
vt(lam(Y, lam(X, lam(E, 殺(Y, X, E))))) --> [殺].
vt(lam(Y, lam(X, lam(E, 用(Y, X, E))))) --> [用].
vt(lam(Y, lam(X, lam(E, 看(Y, X, E))))) --> [看].
vt(lam(Y, lam(X, lam(E, 做(Y, X, E))))) --> [做].

p(lam(X, lam(P, lam(E, and(app(P, E), 在(X, E)))))) --> [在].


s(Sem_s) --> np(Sem_np), pp(Sem_pp), vp(Sem_vp), {lambdaReduct(app(Sem_vp, Sem_np), Sem_preS), lambdaReduct(app(Sem_pp, Sem_preS), Sem_s)}.

np(Sem_propN) --> propN(Sem_propN).

vp(Sem_vBar) --> vBar(Sem_vBar).

vBar(Sem_vBar) --> vt(Sem_vt), np(Sem_np), {lambdaReduct(app(Sem_vt, Sem_np), Sem_vBar)}.

pp(Sem_pp) --> p(Sem_p), np(Sem_np), {lambdaReduct(app(Sem_p, Sem_np), Sem_pp)}.

infer(P) :-
	some(_, and(P, _)).
	
infer(P) :-
	some(_, and(_, P)).

% 以下是執行existential closure 的部份
% 只是把 lam 改成 some 而已。

exist_cl(Sem, Sem01) :-
	Sem =.. [lam, X, P],
	Sem01 =.. [some, X, P].
	
/*
exist_cl(Sem, Sem01) :-
	Sem =.. [and, P, Q],
	P =.. [lam, X, P2],
	P3 =.. [some, X, P2],
	Sem01 =.. [and, P3, Q].
*/

sem_hw01 :-
	s(Sem, [小紅帽, 在, 森林, 殺, 大野狼], []),
	exist_cl(Sem, Sem01),
	print(Sem01).
	
sem_hw02 :-
	s(Sem, [婆婆, 在, 菜園, 種, 蔬菜], []),
	exist_cl(Sem, Sem01),
	print(Sem01).
	
sem_hw03 :-
	s(Sem, [小男孩, 在, 家裡, 用, 電腦], []),
	exist_cl(Sem, Sem01),
	print(Sem01).
	
sem_hw04 :-
	s(Sem, [小女孩, 在, 圖書館, 看, 書], []),
	exist_cl(Sem, Sem01),
	print(Sem01).
	
sem_hw05 :-
	s(Sem, [哥哥, 在, 廚房, 做, 麵包], []),
	exist_cl(Sem, Sem01),
	print(Sem01).
	
sem_hw06 :-
	s(Sem, [妹妹, 在, 客廳, 看, 電視], []),
	exist_cl(Sem, Sem01),
	print(Sem01).
	
	
	
	
