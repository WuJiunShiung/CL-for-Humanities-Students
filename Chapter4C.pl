% Chapter4C.pl

start05(0).
final05(14).

arc05(0, det, 1).
arc05(0, '#', 1).
arc05(0, conj, 0).
arc05(1, adj, 1).
arc05(1, n, 2).
arc05(1, prep, 30).
arc05(2, '#', 3).
arc05(2, conj, 15).
arc05(2, adv, 5).
arc05(2, n, 2).
arc05(2, '#', 7).
arc05(2, '#', 6).
arc05(2, adj, 14).
arc05(2, conj, 1).
arc05(15, '#', 3).
arc05(3, prep, 4).
arc05(3, '#', 4).
arc05(4, det, 5).
arc05(4, '#', 5).
arc05(5, adj, 5).
arc05(5, adv, 24).
arc05(5, n, 6).
arc05(5, '#', 6).
arc05(6, n, 6).
arc05(6, adv, 6).
arc05(6, vt, 7).
arc05(6, '#', 7).
arc05(7, det, 8).
arc05(7, '#', 8).
arc05(7, aux, 16).
arc05(7, adv, 7).
arc05(7, '#', 17).
arc05(16, vt, 17).
arc05(17, n, 18).
arc05(17, prep, 19).
arc05(17, adj, 17).
arc05(17, '#', 14).
arc05(18, adv, 18).
arc05(18, '#', 14).
arc05(18, '#', 17).
arc05(19, det, 20).
arc05(19, '#', 20).
arc05(19, vt, 22).
arc05(20, adj, 20).
arc05(20, n, 23).
arc05(23, n, 23).
arc05(23, '#', 17).
arc05(23, '#', 10).
arc05(23, conj, 10).
arc05(23, adv, 0).
arc05(8, adj, 8).
arc05(8, n, 9).
arc05(9, '#', 10).
arc05(9, vt, 12).
arc05(9, conj, 16).
arc05(9, '#', 14).
arc05(10, prep, 11).
arc05(11, det, 12).
arc05(11, '#', 12).
arc05(11, conj, 25).
arc05(12, adj, 12).
arc05(12, n, 14).
arc05(14, n, 14).
arc05(14, '#', 10).
arc05(14, '#', 0).
arc05(14, conj, 21).
arc05(14, vt, 26).
arc05(21, '#', 14).
arc05(14, conj, 0).
arc05(22, '#', 17).
arc05(24, '#', 5).
arc05(25, '#', 11).
arc05(26, prep, 27).
arc05(26, '#', 28).
arc05(27, det, 28).
arc05(27, '#', 28).
arc05(28, adj, 28).
arc05(28, n, 29).
arc05(29, n, 29).
arc05(29, '#', 14).
arc05(29, '#', 10).
arc05(30, '#', 1).







word(det, a).
word(det, the).
word(adj, new).
word(adj, grim).
word(adj, united).
word(adj, most).
word(adj, young).
word(adj, north).
word(adj, acute).
word(adj, no).
word(adj, good).
word(adj, many).
word(adj, 140).
word(adj, their).
word(adj, migrant).
word(adj, some).
word(adj, gaping).
word(adj, federal).
word(adj, any).
word(adj, just).
word(adj, school).
word(adj, hazardous).
word(adj, far).
word(adj, stricter).
word(adj, retail).
word(n, report).
word(n, human).
word(n, rights).
word(n, watch).
word(n, picture).
word(n, child).
word(n, labor).
word(n, states).
word(n, something).
word(n, americans).
word(n, years).
word(n, children).
word(n, 7).
word(n, tobacco).
word(n, farms).
word(n, carolina).
word(n, kentucky).
word(n, tennessee).
word(n, virginia).
word(n, many).
word(n, symptoms).
word(n, nicotine).
word(n, poisoning).
word(n, there).
word(n, estimates).
word(n, youngsters).
word(n, it).
word(n, whom).
word(n, parents).
word(n, farmworkers).
word(n, summer).
word(n, weekends).
word(n, stories).
word(n, video).
word(n, flaws).
word(n, america).
word(n, farms).
word(n, laws).
word(n, regulations).
word(n, farm).
word(n, those).
word(n, families).
word(n, hours).
word(n, conditions).
word(n, them).
word(n, restrictions).
word(n, they).
word(n, contrast).
word(n, government).
word(n, rules).
word(n, teenagers).
word(n, stores).
word(n, restaurants).
word(prep, from).
word(prep, of).
word(prep, in).
word(prep, on).
word(prep, to).
word(prep, during).
word(prep, under).
word(prep, by).
word(prep, outside).
word(prep, for).
word(conj, that).
word(conj, and).
word(conj, but).
word(conj, who).
word(conj, how).
word(conj, 'if').
word(vt, paints).
word(vt, believe).
word(vt, banned).
word(vt, working).
word(vt, said).
word(vt, suffer).
word(vt, are).
word(vt, work).
word(vt, interviewed).
word(vt, 'recorded').
word(vt, highlight).
word(vt, regulates).
word(vt, owned).
word(vt, let).
word(vt, has).
word(aux, was).
word(aux, are).
word(aux, can).
word(adv, probably).
word(adv, ago).
word(adv, as).
word(adv, alongside).
word(adv, 'not').

recognize05(State, []) :-
	final05(State).

recognize05(State, String) :-
	arc05(State, Item, State2),
	traverse05(Item, String, NewString),
	recognize05(State2, NewString).

traverse05(Cat, [Word|NewString], NewString) :-
	word(Cat, Word).

traverse05(#, String, String).

recognize05(String) :-
	start05(State),
	recognize05(State, String).
