% Chapter5A.pl

% English paragraphs

:- encoding(utf8).

adj --> [federal].
adj --> [gaping].
adj --> [hazardous].
adj --> [new].
adj --> [grim].
adj --> [young].
adj --> [acute].
adj --> [good].
adj --> [many].
adj --> [stricter].

n --> [7].
n --> [140].
n --> ['America'].
n --> ['Americans'].
n --> [child].
n --> [children].
n --> [conditions].
n --> [contrast].
n --> [estimates].
n --> [families].
n --> [farm].
n --> [farms].
n --> [farmworkers].
n --> [flaws].
n --> [government].
n --> [hours].
n --> [labor].
n --> [laws].
n --> [many].
n --> [migrant].
n --> [nicotine].
n --> [parents].
n --> [picture].
n --> [poisoning].
n --> [regulations].
n --> [report].
n --> [restaurants].
n --> [restrictions].
n --> [retail].
n --> [rules].
n --> [school].
n --> [some].
n --> [something].
n --> [stores].
n --> [stories].
n --> [summer].
n --> [symptoms].
n --> [teenagers].
n --> [those].
n --> [tobacco].
n --> [there].
n --> ['United States'].
n --> [video].
n --> [weekends].
n --> [youngsters].
n --> [years].

det --> [a].
det --> [any].
det --> [most].
det --> [the].
det --> [no].
det --> [their].

propN --> ['Human Rights Watch'].
propN --> ['North Carolina'].
propN --> ['Kentucky'].
propN --> ['Tennessee'].
propN --> ['Virginia'].

pron --> [it].
pron --> [them].
pron --> [they].

modal --> [can].

conj --> [and].
conj --> [but].

subord --> [if].

neg --> [not].

vt --> [highlight].
vt --> [interviewed].
vt --> [paints].
vt --> [regulates].
vt --> [let].
vt --> [has].

vi --> [suffer].
vi --> [work].

vpp --> [banned].
vpp --> [said].
vpp --> [recorded].
vpp --> [owned].

ving --> [working].

be --> [was].
be --> [are].

vcl --> [believe].
vcl --> [said].

adv --> [probably].
adv --> [ago].
adv --> [just].
adv --> [far].

p --> [alongside].
p --> [as].
p --> [by].
p --> [during].
p --> [for].
p --> [from].
p --> [in].
p --> [of].
p --> [on].
p --> [outside].
p --> [under].


relPron --> [that].
relPron --> [whom].
relPron --> [who].

infin --> [to].

wh_adv --> [how].

s(coord: no) --> pp(_), s(coord:_).
s(coord: no) --> conj, s(coord:_).
s(coord: no) --> np, vp.
s(coord: no) --> spostmod, np.
s(cooord: no)--> spostmod, adjCL.
s(coord: yes) --> s(coord:no), adjCL.
s(coord: no) --> wh_adv, np, vp.
s(coord: no) --> wh_advP, np, vp.

wh_advP --> wh_adv, nBar.

adjCL --> subord, s(_).

conjS --> s(coord:no), conjS.
conjS --> conj, s(coord:no).

spostmod --> np, vp.

np --> det, nBar.
np --> nBar.
np --> nppBar.
np --> propN.
np --> nBar, relCL.
np --> propN, coordN.				% 暫時先不處理NP的併列結構，只看propN的。
np --> adj, n, conj, n.				% NP太多了，不想都改，先這樣處理
np --> n, n, conj, n.				% 同上

coordN --> propN, coordN.
coordN --> conj, propN.

nBar --> ap, nBar.
nBar --> nppBar, pp(_).
nBar --> nppBar, relCL.
nBar --> nppBar, appositiveP.
nBar --> nppBar, vppastp.
nBar --> nppBar, neg, adv, np.
nBar --> n.
nBar --> n, n.
nBar --> pron.

nppBar --> n.
nppBar --> n, n.

appositiveP --> np, vppastp.

ap --> adj.
ap --> adv, ap.

adjP --> adj, pp(_).

pp(coord: no) --> p, np.
pp(coord: no) --> p, adjP.
pp(coord: no) --> p, s(_).
pp(coord: yes) --> pp(coord:no), conjPP.
conjPP --> pp(coord: no), conjPP.
conjPP --> conj, pp(coord:no).



relCL --> relPron, cp(gap).
relCL --> relPronP, cp(gap).

relPronP --> det, p, relPron.

cp(gap) --> np, vp(gap).
cp(gap) --> vp(gap).
vp(gap) --> adv, vBar(gap).
vp(gap) --> vcl, vBar.
vp(gap) --> vBar.
vBar(gap) --> vcl, vBar.


vp --> vBar.


vBar --> adv, vBar.
vBar --> vpostmodBar, advP.
vBar --> vpostmodBar, pp(_).
vBar --> vpostmodBar, infinP.
vBar --> modal, vBar.
vBar --> vt, np.
vBar --> vi, pp(_).
vBar --> vi.
vBar --> be, ving.
vBar --> be, vpp.
vBar --> be, np.
vBar --> vcl, s(_).

vppastp --> vpp, pp(_).

advP --> n, adv.

vpostmodBar --> be, vpp.
vpostmodBar --> vt, np.
vpostmodBar --> be, ving.
vpostmodBar --> be, np.

infinP --> infin, vBar.
