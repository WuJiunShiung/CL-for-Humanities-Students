% Chapter4A.pl

% 阿拉伯數字及中文數字轉換
% transducer(ArabicNumberList, ChineseCharacterNumberList).

:- op(400, xfx, :).
:- encoding(utf8).

start(0).
final(1).
final(2).
final(3).
final(4).

arc(0, 1:壹, 1).
arc(0, 2:貳, 1).
arc(0, 3:參, 1).
arc(0, 4:肆, 1).
arc(0, 5:伍, 1).
arc(0, 6:陸, 1).
arc(0, 7:柒, 1).
arc(0, 8:捌, 1).
arc(0, 9:玖, 1).
arc(0, 10:拾, 2).
arc(0, 20:貳拾, 2).
arc(0, 30:參拾, 2).
arc(0, 40:肆拾, 2).
arc(0, 50:伍拾, 2).
arc(0, 60:陸拾, 2).
arc(0, 70:柒拾, 2).
arc(0, 80:捌拾, 2).
arc(0, 90:玖拾, 2).
arc(0, 100:壹佰, 3).
arc(0, 200:貳佰, 3).
arc(0, 300:參佰, 3).
arc(0, 400:肆佰, 3).
arc(0, 500:伍佰, 3).
arc(0, 600:陸佰, 3).
arc(0, 700:柒佰, 3).
arc(0, 800:捌佰, 3).
arc(0, 900:玖佰, 3).
arc(0, 1000:壹仟, 4).
arc(2, 1:壹, 1).
arc(2, 2:貳, 1).
arc(2, 3:參, 1).
arc(2, 4:肆, 1).
arc(2, 5:伍, 1).
arc(2, 6:陸, 1).
arc(2, 7:柒, 1).
arc(2, 8:捌, 1).
arc(2, 9:玖, 1).
% arc(2, '#':'#', 0).
arc(3, 10:壹拾, 2).
arc(3, 20:貳拾, 2).
arc(3, 30:參拾, 2).
arc(3, 40:肆拾, 2).
arc(3, 50:伍拾, 2).
arc(3, 60:陸拾, 2).
arc(3, 70:柒拾, 2).
arc(3, 80:捌拾, 2).
arc(3, 90:玖拾, 2).
arc(3, 0:零, 5).
arc(5, 1:壹, 1).
arc(5, 2:貳, 1).
arc(5, 3:參, 1).
arc(5, 4:肆, 1).
arc(5, 5:伍, 1).
arc(5, 6:陸, 1).
arc(5, 7:柒, 1).
arc(5, 8:捌, 1).
arc(5, 9:玖, 1).
arc(5, 10:拾, 2).




transduce(Node, [], []) :-
	final(Node).

transduce(Node1, Tape1, Tape2) :-
	arc(Node1, Label1, Node2),
	traverse(Label1, Tape1, NewTape1, Tape2, NewTape2),
	transduce(Node2, NewTape1, NewTape2).

traverse('#':'#', Tape1, Tape1, Tape2, Tape2).
traverse('#':L2, Tape1, Tape1, [L2|RestTape2], RestTape2).
traverse(L1:'#', [L1|RestTape1], RestTape1, Tape2, Tape2).
traverse(L1:L2, [L1|RestTape1], RestTape1, [L2|RestTape2], RestTape2).

transducer(String1, String2) :-
	start(Node),
	transduce(Node, String1, String2).
