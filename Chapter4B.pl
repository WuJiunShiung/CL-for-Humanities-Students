% Chapter4B.pl

% 第一部份，可以把有ed結尾的各種情況
% 拆成詞幹+ed。
% 不規則過去式不拆解。
% 主要是要避免droped這種不正確的詞

initial01(0).
final01(6).
final01(7).
final01(10).
final01(13).
final01(17).

arc01(0, b:b, 0).
arc01(0, c:c, 0).
arc01(0, d:d, 0).
arc01(0, f:f, 0).
arc01(0, g:g, 0).
arc01(0, h:h, 0).
arc01(0, j:j, 0).
arc01(0, k:k, 0).
arc01(0, l:l, 0).
arc01(0, m:m, 0).
arc01(0, n:n, 0).
arc01(0, p:p, 0).
arc01(0, q:q, 0).
arc01(0, r:r, 0).
arc01(0, s:s, 0).
arc01(0, t:t, 0).
arc01(0, v:v, 0).
arc01(0, w:w, 0).
arc01(0, x:x, 0).
arc01(0, y:y, 0).
arc01(0, z:z, 0).
arc01(0, a:a, 1).
arc01(0, e:e, 1).
arc01(0, i:i, 1).
arc01(0, o:o, 1).
arc01(0, u:u, 1).
arc01(1, p:p, 2).
arc01(2, p:'#', 3).
arc01(3, '#':'+', 4).
arc01(4, e:e, 5).
arc01(5, d:d, 6).
arc01(1, g:g, 21).
arc01(21, g:'#', 3).
arc01(2, a:a, 7).
arc01(2, b:b, 7).
arc01(2, c:c, 7).
arc01(2, d:d, 7).
arc01(2, e:e, 7).
arc01(2, f:f, 7).
arc01(2, g:g, 7).
arc01(2, h:h, 7).
arc01(2, i:i, 7).
arc01(2, j:j, 7).
arc01(2, k:k, 7).
arc01(2, l:l, 7).
arc01(2, m:m, 7).
arc01(2, n:n, 7).
arc01(2, o:o, 7).
arc01(2, q:q, 7).
arc01(2, r:r, 7).
arc01(2, s:s, 7).
arc01(2, t:t, 7).
arc01(2, u:u, 7).
arc01(2, v:v, 7).
arc01(2, w:w, 7).
arc01(2, x:x, 7).
arc01(2, y:y, 7).
arc01(2, z:z, 7).
arc01(21, a:a, 7).
arc01(21, b:b, 7).
arc01(21, c:c, 7).
arc01(21, d:d, 7).
arc01(21, e:e, 7).
arc01(21, f:f, 7).
arc01(21, 0:0, 7).
arc01(21, h:h, 7).
arc01(21, i:i, 7).
arc01(21, j:j, 7).
arc01(21, k:k, 7).
arc01(21, l:l, 7).
arc01(21, m:m, 7).
arc01(21, n:n, 7).
arc01(21, o:o, 7).
arc01(21, q:q, 7).
arc01(21, r:r, 7).
arc01(21, s:s, 7).
arc01(21, t:t, 7).
arc01(21, u:u, 7).
arc01(21, v:v, 7).
arc01(21, w:w, 7).
arc01(21, x:x, 7).
arc01(21, y:y, 7).
arc01(21, z:z, 7).
arc01(7, a:a, 7).
arc01(7, b:b, 7).
arc01(7, c:c, 7).
arc01(7, d:d, 7).
arc01(7, e:e, 7).
arc01(7, f:f, 7).
arc01(7, g:g, 7).
arc01(7, h:h, 7).
arc01(7, i:i, 7).
arc01(7, j:j, 7).
arc01(7, k:k, 7).
arc01(7, l:l, 7).
arc01(7, m:m, 7).
arc01(7, n:n, 7).
arc01(7, o:o, 7).
arc01(7, p:p, 7).
arc01(7, q:q, 7).
arc01(7, r:r, 7).
arc01(7, s:s, 7).
arc01(7, t:t, 7).
arc01(7, u:u, 7).
arc01(7, v:v, 7).
arc01(7, w:w, 7).
arc01(7, x:x, 7).
arc01(7, y:y, 7).
arc01(7, z:z, 7).
arc01(7, '#':'+', 8).
arc01(8, e:e, 9).
arc01(9, d:d, 10).
arc01(7, e:e, 11).
arc01(11, '#':'+', 12).
arc01(12, d:d, 13).
arc01(11, '#':'#', 7).
arc01(7, i:y, 14).
arc01(14, '#':'+', 15).
arc01(15, e:e, 16).
arc01(16, d:d, 17).
arc01(14, '#':'#', 7).



transduce01(Node, [], []) :-
	final01(Node).

transduce01(Node1, Tape1, Tape2) :-
	arc01(Node1, Label1, Node2),
	traverse01(Label1, Tape1, NewTape1, Tape2, NewTape2),
	transduce01(Node2, NewTape1, NewTape2).

traverse01('#':'#', Tape1, Tape1, Tape2, Tape2).
traverse01('#':L2, Tape1, Tape1, [L2|RestTape2], RestTape2).
traverse01(L1:'#', [L1|RestTape1], RestTape1, Tape2, Tape2).
traverse01(L1:L2, [L1|RestTape1], RestTape1, [L2|RestTape2], RestTape2).

transducer01(String1, String2) :-
	initial01(Node),
	transduce01(Node, String1, String2).
	
% 第二部份檢查拼字及詞彙結構剖析

initial02(0).
final02(5).

% asked

arc02(0, a:a, a1).
arc02(a1, s:s, a2).
arc02(a2, k:k, 1).

% called

arc02(0, c:c, c1).
arc02(c1, a:a, c2).
arc02(c2, l:l, c3).
arc02(c3, l:l, 1).

% moved

arc02(0, m:m, m1).
arc02(m1, o:o, m2).
arc02(m2, v:v, m3).
arc02(m3, e:e, 1).

% closed

arc02(c1, l:l, c4).
arc02(c4, o:o, c5).
arc02(c5, s:s, c6).
arc02(c6, e:e, 1).

% flied

arc02(0, f:f, f1).
arc02(f1, l:l, f2).
arc02(f2, y:y, 1).

% studied

arc02(0, s:s, s1).
arc02(s1, t:t, s2).
arc02(s2, u:u, s3).
arc02(s3, d:d, s4).
arc02(s4, y:y, 1).

% jogged

arc02(0, j:j, j1).
arc02(j1, o:o, j2).
arc02(j2, g:g, 1).

% stepped

arc02(s2, e:e, s5).
arc02(s5, p:p, 1).

% ran

arc02(0, r:r, r1).
arc02(r1, a:u, r2).
arc02(r2, n:n, 6).

% made

arc02(m1, a:a, m4).
arc02(m4, d:k, m5).
arc02(m5, e:e, 6).

% thought

arc02(0, t:t, t1).
arc02(t1, h:h, t2).
arc02(t2, o:i, t3).
arc02(t3, u:n, t4).
arc02(t4, g:'#', t5).
arc02(t5, h:'#', t6).
arc02(t6, k:k, 6).

% 以下給規則動詞過去式用

arc02(1, '#':'V', 2).
arc02(2, '+':'#', 3).
arc02(3, e:'#', 4).
arc02(4, d:'Past', 5).

% 給不規則動詞過去式用

arc02(6, '#':'V', 7).
arc02(7, '#':'Past', 5).


transduce02(Node, [], []) :-
	final02(Node).

transduce02(Node1, Tape1, Tape2) :-
	arc02(Node1, Label1, Node2),
	traverse02(Label1, Tape1, NewTape1, Tape2, NewTape2),
	transduce02(Node2, NewTape1, NewTape2).

traverse02('#':'#', Tape1, Tape1, Tape2, Tape2).
traverse02('#':L2, Tape1, Tape1, [L2|RestTape2], RestTape2).
traverse02(L1:'#', [L1|RestTape1], RestTape1, Tape2, Tape2).
traverse02(L1:L2, [L1|RestTape1], RestTape1, [L2|RestTape2], RestTape2).

transducer02(String1, String2) :-
	initial02(Node),
	transduce02(Node, String1, String2).
	
past_tense_parsing(Input, Output) :-
	transducer01(Input, IntermediateForm),
	transducer02(IntermediateForm, Output).
