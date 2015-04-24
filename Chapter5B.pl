% Chapter5B.pl

:-encoding(utf8).

vj --> [受到].
vhc --> [增強].
vc --> [影響].
vh --> [轉涼].

na --> [東北風].
na --> [天氣].
ncd --> [東北部].


s(anaphora: zero) --> vp.
s(anaphora: yes) --> np, vp.


np --> n.
np --> specifier, n.

n --> na.

vp --> vj, s(anaphora:yes).
vp --> vBar.

vBar --> adjunct, vBar.
vBar --> vc.
vBar --> vh.

specifier --> ncd.

adjunct --> vhc.
