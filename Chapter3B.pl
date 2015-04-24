% Chapter3B.pl

immediately_dominate(s, np1).
immediately_dominate(np1, det1).
immediately_dominate(det1, the).
immediately_dominate(np1, n1).
immediately_dominate(n1, boy).
immediately_dominate(s, vp).
immediately_dominate(vp, v).
immediately_dominate(v, loves).
immediately_dominate(vp, np2).
immediately_dominate(np2, det2).
immediately_dominate(det2, the).
immediately_dominate(np2, n2).
immediately_dominate(n2, girl).

dominate(X, Y) :-
	immediately_dominate(X, Y).
	
dominate(X, Y) :-
	immediately_dominate(X, W),
	dominate(W, Y).
