
= 積分

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": dd, dv, evaluated
#let arsinh = $op("arsinh")$
#let arcosh = $op("arcosh")$
#let artanh = $op("artanh")$

== 積分の導入

有界閉区間$[a, b]$上の関数$f(x)$が与えられたときに、特に$f(x)$が常に正のとき、$x$軸と$y = f(x)$それと$x = a$および$x = b$で囲まれた部分の「面積」を計算するにはどうすればよいだろうか。
この疑問から出発する数学の理論が_積分_である。
もし$f$が定数関数ならば囲まれた部分は長方形になるので「たてかけるよこ」で面積が計算できる。
$f$が一次関数の場合は囲まれた部分は台形になるので台形の面積の公式が使えるだろう。
しかしながらより一般の関数の場合はたとえ二次関数であっても一筋縄ではいかないことがわかる。
これは面積（積分）を考える際にどうしても無限や極限の概念が必要になるためである。
以下で展開するのはこの問題に解決の方法を与えた理論で発案者の名を取ってリーマン積分と呼ばれる。
ちなみに積分の理論はリーマン積分の他に積分の定義の仕方によってルベーグ積分などいろいろあるが、ここでは歴史上最初の積分の厳密な定式化であるリーマン積分について紹介する。

面積を計算する時の基礎は先ほど述べた長方形の面積の公式「たてかけるよこ」であり、
これは$f$が定数関数の$f(x) = c$である場合$x$軸と$y = c$および$x = a$と$x = b$で囲まれた部分（長方形）の「面積」が$c(b-a)$で計算できることに対応する。
ここで、$c$が負の場合も$c(b-a)$は負の値として定義できることに注意する。

ここから一気に一般の関数$f(x)$を考える。
リーマン積分の基礎的な考え方は区間$[a, b]$を細かい区間に分割することである。

そのためにまず、区間$[a, b]$の分割を定式化する。
区間$[a, b]$の_分割_$P$とは
$
a = p_0 <= p_1 <= p_2 <= p_3 <= dots <= p_N = b
$
を満たす点の並び$p_0, p_1, p_2, p_3, dots, p_N$のことである($N = 1, 2, 3, dots$)。
つまり、区間$[a, b]$を_小区間_$[p_0, p_1], [p_1, p_2], [p_2, p_3], dots, [p_(N-1), p_N]$に分割している。
また、_分割の大きさ_を小区間の大きさの中で最も大きいもの、つまり
$
abs(P) = max{ p_n-p_(n-1) mid(|) n = 1, 2, 3, dots, N }
$
とする。

ここで小区間$[p_(n-1), p_n]$ ($n = 1, 2, 3, dots, N$)において$x$軸と$y = f(x)$および$x = p_(n-1)$と$x = p_n$で囲まれた部分を考えると一般には長方形とは限らないが、分割の大きさが小さいと長方形とみなしても全体の面積を計算するのには差し支えないと考える。
そこで点$t_n in [p_(n-1), p_n]$をとりあえずは好きにとって、長方形の「たて」に相当する量として$f(t_n)$を採用し、（たてに細長の）長方形の面積を$f(t_n)(p_n-p_(n-1))$とする。
この時の$t_n$を小区間$[p_(n-1), p_n]$の_代表点_という。
これらの面積を足し合わせて得られる全体の面積
$
sum_(n = 1)^N f(t_n)(p_n-p_(n-1))
$
を$f$の区間$[a, b]$の分割$p_0, p_1, p_2, p_3, dots, p_N$と代表点$t_1, t_2, t_3, dots, t_N$の_リーマン和_という。

_リーマン積分_はリーマン和の分割の大きさを$0$に近づけるときの極限として定義する。
より詳しくは分割$P$や代表点$t_n$の取り方によらず$abs(P) -> 0$となるように分割の個数を$N -> oo$とするときにリーマン和がある実数$l$に収束するならば関数$f$は区間$[a, b]$上で_リーマン積分可能_といいその$l$を関数$f$の区間$[a, b]$上の_定積分_といい
$
integral_a^b f(x) dd(x)
$
と表す。
また、この時の関数$f$を_被積分関数_という。
ただし、この表現だと「分割や代表点の取り方によらず」というあいまいな部分があり、上限・下限を用いたより正確で洗練された定義を後で導入する。

ひとまずはこれを定積分の定義として簡単な関数の積分を求めてみよう。
最初に考えるのは基礎的な関数である定数関数$f(x) = c$である。
この時、分割と代表点に対してリーマン和は
$
sum_(n = 1)^N f(t_n)(p_n-p_(n-1))
= sum_(n = 1)^N c(p_n-p_(n-1))
= c sum_(n = 1)^N (p_n-p_(n-1))
= c(p_N-p_0)
= c(b-a)
$
となり、分割や代表点の取り方によらない値になっているので、定積分は
$
integral_a^b c dd(x) = c(b-a)
$
となり、長方形の面積の公式と等価である。

次に$f$が一次関数$f(x) = k x+m$のとき、いきなり一般の分割と代表点を考えるのは難しいので、
特殊な分割として区間$[a, b]$の$N = 1, 2, 3, dots$等分つまり$p_n = a+n/N (b-a)$ ($n = 0, 1, 2, 3, dots, N$)を代表点として小区間の右端点$t_n = p_n$ ($n = 1, 2, 3, dots, N$)をそれぞれ感がることにしよう。
この時、リーマン和は
$
sum_(n = 1)^N f(t_n)(p_n-p_(n-1))
&= 1/N (b-a) sum_(n = 1)^N f(a+n/N (b-a))
= 1/N (b-a) sum_(n = 1)^N k(a+n/N (b-a))+m \
// = 1/N (b-a) sum_(n = 1)^N (k a+m+1/N k(b-a)n) \
&= 1/N (b-a)((k a+m)N+1/N k(b-a) 1/2 N(N+1)) \
&= (b-a)((k a+m)+1/2 k(1+N^(-1))(b-a))
$
となり、$N -> oo$つまり分割を細かくすることを考えると、このリーマン和は
$
sum_(n = 1)^N f(t_n)(p_n-p_(n-1))
-> (b-a)((k a+m)+1/2 k(b-a))
= 1/2 ((k a+m)+(k b+m))(b-a)
$
に収束し、これは台形の面積の公式と等価である。
ただし、これはあくまで特殊な分割と代表点に対してしか示していないので、まだこれが定積分とは言えない。
しかしながらリーマン積分可能である十分条件を後でいくつか紹介し、それによれば一次関数は常にリーマン積分可能で上記の値が定積分である。
また、上記の計算方法は一般のリーマン積分可能な関数に適用でき、特殊な分割や代表点の取り方にもとづいて定積分を計算することを_区分求積法_という。
例えば、
$
integral_a^b f(x) dd(x)
= lim_(N -> oo) (b-a)/N sum_(n = 1)^N f(a+n (b-a)/N)
$
とする計算法である。

二次関数や$n$次関数に対しても区分求積法により定積分が計算できるが、リーマン和を計算する段階で式が複雑になりがちである。
そこで定積分の計算を微分とのかねあいで容易に計算する手法が知られていて、これによれば積分の計算は被積分関数の原始関数や不定積分と呼ばれる関数を見つけることに帰着される。
この時に原理的な役割を果たすのが微分積分学の基本定理と呼ばれる定理になる。
この計算方法は非常に強力で様々な関数の定積分が計算できるようになる。
そのため区分求積法を反対に使って今までの知識では扱えなかった極限の問題を積分の問題に帰着させることもできたりする。

また、これまで定積分は定義の都合上有界閉区間上の有界関数、例えば連続関数を主に考えていたが、
応用上重要なガンマ関数やベータ関数を定義するには開区間や有界でない区間で定積分を考える必要がある。
つまり端点までは連続でなく発散している場合や無限遠方を考えたい場合などがある。
このような要求に対する積分の理論が広義積分であり、定積分が定義される関数の範囲の拡張を試みる。

この章では以上の流れで説明を進めていく。

== 上積分下積分と定積分

$f(x)$を有界閉区間$[a, b]$ ($a < b$)上の有界な関数とする。
区間$[a, b]$の分割$P$を$a = p_0 < p_1 < p_2 < p_3 < dots < p_N = b$とする。
この時、リーマン和の代わりに次の_上リーマン和_と_下リーマン和_を考える。
$
overline(S)(f, P) = sum_(n = 1)^N sup_(x in [p_(n-1), p_n]) f(x)(p_n-p_(n-1)),
quad underline(S)(f, P) = sum_(n = 1)^N inf_(x in [p_(n-1), p_n]) f(x)(p_n-p_(n-1)).
$
$f$を有界な関数としているので、$overline(S)(f, P)$, $underline(S)(f, P)$は無限大にならず実数値になることに注意する。

#proposition[
任意の分割$P$に対して
$
inf_(x in [a, b]) f(x)(b-a) <= underline(S)(f, P) <= overline(S)(f, P) <= sup_(x in [a, b]) f(x)(b-a)
$
が成り立つ。
]

#proof[
これは
$
inf_(x in [a, b]) f(x) <= inf_(x in [p_(n-1), p_n]) f(x) <= sup_(x in [p_(n-1), p_n]) f(x) <= sup_(x in [a, b]) f(x)
$
から自然に示される。
]

ここから分割$P$を細かくすることを考える。
分割$P'$を$a = p'_0 < p'_1 < p'_2 < p'_3 < dots < p'_M = b$として、
$
{ p_0, p_1, p_2, p_3, dots, p_N } subset { p'_0, p'_1, p'_2, p'_3, dots, p'_M }
$
となっている時、分割$P'$は分割$P$の_細分_という。

#proposition[
任意の分割$P$とその細分$P'$に対して、
$
overline(S)(f, P') <= overline(S)(f, P),
quad underline(S)(f, P) <= underline(S)(f, P')
$
が成り立つ。
]

#proof[
まず$P = { [a, b] }$の時、
$
overline(S)(f, P') <= sup_(x in [a, b]) f(x)(b-a),
quad inf_(x in [a, b]) f(x)(b-a) <= underline(S)(f, P')
$
から、$P$が区間を複数に分けないような分割の時に成り立っていることに注意する。
一般の場合では細分は小区間ごとに分割したものをまとめていることからそれらを足し合わせると主張が成り立つことがわかる。
]

#proposition[
任意の分割$overline(P)$と$underline(P)$に対して、
$
underline(S)(f, underline(P)) <= overline(S)(f, overline(P))
$
が成り立つ。
]

#proof[
これは分割$overline(P)$と$underline(P)$の点をまとめて並び替えなおして得られる分割を$P'$とすると、$P'$は$overline(P)$と$underline(P)$の細分になることから、
今までに示した二つの命題より
$
underline(S)(f, underline(P))
<= underline(S)(f, P')
<= overline(S)(f, P')
<= overline(S)(f, overline(P))
$
が得られる。
]

ここから$overline(P)$を固定したまま$underline(P)$についての上限を取ったのち$overline(P)$についての下限を取ることを考える。
積分の候補として次の_上積分_と_下積分_
$
overline(S)(f) = inf_P overline(S)(f, P),
quad underline(S)(f) = sup_P underline(S)(f, P)
$
を導入すると以上の議論から
$
underline(S)(f) <= overline(S)(f)
$
を得る。

#definition([定積分])[
$f(x)$を有界閉区間$[a, b]$ ($a < b$)上の有界な関数とする。
$f$が$[a, b]$で_積分可能_あるいは_可積分_であるとは上記の式において等号が成り立つ場合をいう。
その時の等しい値$underline(S)(f) = overline(S)(f)$を関数$f$の区間$[a, b]$上の_定積分_といい、
$
integral_a^b f(x) dd(x)
$
で表す。
また$a = b$の時は
$
integral_a^a f(x) dd(x) = 0
$
と定義し、
$a > b$に対しては
$
integral_a^b f(x) dd(x) = -integral_b^a f(x) dd(x)
$
と定義する。
]

#remark[
最初に示した命題より
$
inf_(x in [a, b]) f(x)(b-a) <= integral_a^b f(x) dd(x) <= sup_(x in [a, b]) f(x)(b-a)
$
なので、
$integral_a^a f(x) dd(x) = 0$とするのは自然である。
]

#example[
導入でも触れた通り定数関数$f(x) = c$は任意の有界閉区間で積分可能で
$
integral_a^b c dd(x) = c(b-a)
$
が成り立つ。
]

#example[
有界な関数$f(x)$を$x in [0, 1]$に対して$x$が有理数のとき$f(x) = 1$で$x$が無理数のとき$f(x) = 0$と定義する。
この時、任意の小区間$[p, q]$ ($p < q$)に対して間に有理数と無理数が存在するので、$overline(S)(f, P) = 1$と$underline(S)(f, P) = 0$が成り立ち、この関数$f$は積分可能でない。
]

以下では積分可能であることの十分条件として主に単調関数と連続関数を紹介する。
まず、準備として次を示す。

#proposition[
$f$を有界閉区間$[a, b]$上の有界な関数とする。
この時、$f$が$[a, b]$上で積分可能であることの必要十分条件は、
分割の列$(P_n)$であって$abs(P_n) -> 0$かつ
$
overline(S)(f, P_n)-underline(S)(f, P_n) -> 0
$
を満たすものが存在することである。
]

#proof[
まず、上積分下積分が下限上限で定義されていることから分割の列$(overline(P)_n)$と$(underline(P)_n)$であって$overline(S)(f, overline(P)_n) -> overline(S)(f)$と$underline(S)(f, underline(P)_n) -> underline(S)(f)$を満たすものが存在することに注意する。
ここで各$n$に対して$overline(P)_n$と$underline(P)_n$をまとめて並び替えなおして必要があれば分割をさらに細かくすることで$abs(P_n) -> 0$となる分割の列$(P_n)$を作る。
この時$P_n$は$overline(P)_n$と$underline(P)_n$の細分になっているので、
$
overline(S)(f, P_n)-underline(S)(f, P_n)
<= overline(S)(f, overline(P)_n)-underline(S)(f, underline(P)_n)
-> overline(S)(f)-underline(S)(f)
$
が成り立つ。
よって、$f$が積分可能であるときほしかった分割の列が得られた。

逆に$P_n$が存在するとき、
$
overline(S)(f)-underline(S)(f)
<= overline(S)(f, P_n)-underline(S)(f, P_n)
-> 0
$
となっていることから、$f$は積分可能である。
]

#theorem([単調関数の可積分性])[
$f$を有界閉区間$[a, b]$上の広義単調増加または広義単調減少な関数とする。
この時、$f$は$[a, b]$上で積分可能である。
]

#proof[
議論はほぼ同じなので、広義単調増加の場合のみ示す。
関数の単調性から$f$の小区間$[p_(n-1), p_n]$での上限と下限は端点で達成するので、上リーマン和と下リーマン和は
$
overline(S)(f, P) = sum_(n = 1)^N f(p_n)(p_n-p_(n-1)),
quad underline(S)(f, P) = sum_(n = 1)^N f(p_(n-1))(p_n-p_(n-1))
$
となりその差は
$
overline(S)(f, P)-underline(S)(f, P)
= sum_(n = 1)^N (f(p_n)-f(p_(n-1)))(p_n-p_(n-1))
$
となる。
これを評価すると
$
overline(S)(f, P)-underline(S)(f, P)
<= sum_(n = 1)^N (f(p_n)-f(p_(n-1)))abs(P)
= (f(b)-f(a))abs(P)
$
であり、分割を細かくすると右辺はいくらでも小さくできるので、最終的に$f$が可積分であることがわかる。
]

#theorem([連続関数の可積分性])[
$f$を有界閉区間$[a, b]$上の連続関数とする。
この時、$f$は$[a, b]$上で積分可能である。
]

// 証明のためには有界閉区間上の連続関数は一様連続に更新できることを思い出す（@t_unif_conti）。
証明のためには有界閉区間上の連続関数は一様連続に更新できることを思い出す。
また、ここでは度合い関数を使って一様連続性を書き下している。

#proof[
// $f$は有界閉区間$[a, b]$上の連続関数なので、@t_unif_conti より$f$は$[a, b]$上の一様連続関数、つまり度合い関数$omega$が存在し任意の$x, y in [a, b]$に対して$abs(f(x)-f(y)) < omega(abs(x-y))$が成り立つ。
$f$は$[a, b]$上の一様連続関数、つまり度合い関数$omega$が存在し任意の$x, y in [a, b]$に対して$abs(f(x)-f(y)) < omega(abs(x-y))$が成り立つ。
ここから小区間$[p, q] subset [a, b]$に対して、$[p, q]$上の連続関数$f$の最大点$macron(x)$と最小点$macron(y)$を取ると、
$
sup_(x in [p, q]) f(x)-inf_(x in [p, q]) f(x)
= f(macron(x))-f(macron(y))
<= omega(abs(macron(x)-macron(y)))
<= omega(q-p)
$
である。
これを踏まえると上リーマン和と下リーマン和の差は
$
overline(S)(f, P)-underline(S)(f, P)
<= sum_(n = 1)^N omega(p_n-p_(n-1))(p_n-p_(n-1))
<= sum_(n = 1)^N omega(abs(P))(p_n-p_(n-1))
= omega(abs(P))(b-a)
$
となる。
よって、分割を細かくすると右辺は$0$に収束するので、最終的に$f$が可積分であることがわかる。
]

以降では定積分の性質をいくつか述べる。

#proposition([和と定数倍の積分])[
関数$f(x)$, $g(x)$が区間$[a, b]$上で積分可能として、$c$を実数の定数とする。
この時、和$f(x)+g(x)$と定数倍$c f(x)$も積分可能で、
$
integral_a^b (f(x)+g(x)) dd(x) = integral_a^b f(x) dd(x)+integral_a^b g(x) dd(x),
quad integral_a^b c f(x) dd(x) = c integral_a^b f(x) dd(x)
$
が成り立つ。
]

このことを積分の線形性という。

#proof[
和の上限はそれぞれの上限を取ったものの和で上から抑えられることから、
$
overline(S)(f+g, P)
= sum_(n = 1)^N sup_(x in [p_(n-1), p_n])(f(x)+g(x))(p_n-p_(n-1))
<= overline(S)(f, P)+overline(S)(g, P).
$
同様にして
$
underline(S)(f+g, P)
= sum_(n = 1)^N inf_(x in [p_(n-1), p_n])(f(x)+g(x))(p_n-p_(n-1))
>= underline(S)(f, P)+underline(S)(g, P).
$
したがって
$
underline(S)(f, P)+underline(S)(g, P)
<= underline(S)(f+g, P)
<= overline(S)(f+g, P)
<= overline(S)(f, P)+overline(S)(g, P)
$
であり、$underline(S)(f)+underline(S)(g) <= underline(S)(f+g) <= overline(S)(f+g) <= overline(S)(f)+overline(S)(g)$が言える。
ここで、$f$と$g$が積分可能であることから$f+g$も積分可能でほしい式が成り立つことがわかる。
もう一つの定数倍の式は簡単に示されるので詳細は省略する。
]

この命題では和と定数倍またそれを組み合わせて差の積分の公式が得られるが、関数の積や商については一般に定積分の公式はない。
代わりに後に述べる部分積分を用いて積分を計算することになる。

#proposition([積分の大小関係])[
区間$[a, b]$ ($a < b$)上で積分可能な関数$f$, $g$が各$x in [a, b]$に対して$f(x) <= g(x)$を満たすとき、
$
integral_a^b f(x) dd(x) <= integral_a^b g(x) dd(x)
$
が成り立つ。
特に区間$[a, b]$上で積分可能な関数$f$に対して、
$
abs(integral_a^b f(x) dd(x)) <= integral_a^b abs(f(x)) dd(x)
$
が成り立つ。
] <t_int_order>

積分とは和のようなものだと思えば、和を取って絶対値を取るよりも絶対値の和を考えた方が大きいということで、自然に受け入れられるはずである。

#proof[
下限や上限は大小関係を保つことから、$overline(S)(f, P) <= overline(S)(g, P)$が成り立ち、ここから$overline(S)(f) <= overline(S)(g)$なので、求めたい不等式が得られる。
また、$-abs(f(x)) <= f(x) <= abs(f(x))$なので、もう一つの不等式もいえる。
]

#proposition([積分の区間分割])[
$a < c < b$として、関数$f$は区間$[a, c]$と区間$[c, b]$上で積分可能とする。
このとき、$f$は$[a, b]$上で積分可能で
$
integral_a^b f(x) dd(x) = integral_a^c f(x) dd(x)+integral_c^b f(x) dd(x)
$
が成り立つ。
] <t_int_interval>

#proof[
区間$[a, c]$の分割$P_1$と区間$[c, b]$の分割$P_2$を任意にとって、それらを合わせて得られる区間$[a, b]$の分割を$P$とおく。
この時、
$
overline(S)(f, P) = overline(S)(f, P_1)+overline(S)(f, P_2),
quad underline(S)(f, P) = underline(S)(f, P_1)+underline(S)(f, P_2)
$
が成り立つ。 ここで$P_1$, $P_2$は任意の分割で$P$は特殊な分割なので、
$
overline(S)(f) <= integral_a^c f(x) dd(x)+integral_c^b f(x) dd(x),
quad underline(S)(f) >= integral_a^c f(x) dd(x)+integral_c^b f(x) dd(x)
$
となるからほしかった等式が得られる。
]

#remark[
この命題の等式は$c$が$a$と$b$の間の点でなくても一般に成り立つ。
例えば$a < b < c$の時でも$f$が$[a, c]$上で積分可能であれば
$
integral_a^c f(x) dd(x)
= integral_a^b f(x) dd(x)+integral_b^c f(x) dd(x)
= integral_a^b f(x) dd(x)-integral_c^b f(x) dd(x)
$
なので、整理してほしい等式が得られる。
]

#proposition([積分の区間についての連続性])[
実数列$a_n -> a$と$b_n -> b$に対して、有界な関数$f$が区間$[a, b]$と各$n$に対して区間$[a_n, b_n]$上で積分可能であるとする。
この時、
$
integral_(a_n)^(b_n) f(x) dd(x) -> integral_a^b f(x) dd(x)
$
が成り立つ。
]

#proof[
積分区間について先ほどの命題とその注意より
$
integral_(a_n)^(b_n) f(x) dd(x)
= integral_a^b f(x) dd(x)+integral_(a_n)^a f(x) dd(x)+integral_b^(b_n) f(x) dd(x)
$
と分割される。
ここで$f$は有界なので、
$
abs(integral_(a_n)^(b_n) f(x) dd(x)-integral_a^b f(x) dd(x))
<= abs(integral_(a_n)^a f(x) dd(x))+abs(integral_b^(b_n) f(x) dd(x))
<= sup f abs(a_n-a)+sup f abs(b_n-b)
$
となり、極限を取ると最右辺は$0$に収束するので、ほしかった式が得られる。
]

#proposition([積分の端点修正])[
区間$[a, b]$上の関数$f$に対して、区間$[a, b]$上で積分可能な関数$tilde(f)$であって各$x in (a, b)$で$f(x) = tilde(f)(x)$が成り立つものが存在したとするとき、
$f$も積分可能で
$
integral_a^b f(x) dd(x) = integral_a^b tilde(f)(x) dd(x)
$
が成り立つ。
]

#proof[
$n = 2, 3, dots$に対して$a_n = a+2^(-n) (b-a)$と$b_n = b-2^(-n) (b-a)$とおけば、
$a < a_n < b_n < b$であり、$a_n -> a$, $b_n -> b$である。
ここで$f$と$tilde(f)$は区間$[a_n, b_n]$上で等しいので、
$
integral_(a_n)^(b_n) f(x) dd(x) = integral_(a_n)^(b_n) tilde(f)(x) dd(x)
$
が成り立つ。
ここで前の命題を使うと、ほしかった式が得られる。
]

#remark[
以上の定理、命題をまとめると、
関数$f$の区間を有限個に分割してどの小区間でも積分可能であれば全体で積分可能である。
つまり、小区間で（端点で修正して）連続または単調になっていればよい。
]

== 微分積分学の基本定理

微分と積分の間の関係性を示すのが微分積分学の基本定理である。
その表現のために必要になる概念が原始関数と不定積分である。
高校数学ではこの二つは同じようなものであったが、微分の理論で生じるのが原始関数で積分の理論で生じるのが不定積分であるという違いがある。

つまり、微分して目的の関数になるものが原始関数である。

#definition([原始関数])[
$f(x)$を開区間$I$上の関数とする。
$I$上の微分可能な関数$F(x)$であって各$x in I$に対して
$
F'(x) = f(x)
$ <e_prim>
が成り立つとき、$F$を$f$の_原始関数_という。
]

これに対して、定積分の端点を変数にして得られる関数が不定積分である。

#definition([不定積分])[
$f(x)$を区間$I$上の任意の有界閉区間で積分可能な関数として、$a in I$とする。
ここで$x in I$に対して
$
F(x) = integral_a^x f(t) dd(t)
$ <e_indef_int>
とすることで定義される$I$上の関数$F$を$f$の_不定積分_という。
]

_微分積分学の基本定理_は連続関数の不定積分はその関数の原始関数であることを主張する。

#theorem([微分積分学の基本定理])[
$f$を開区間$I$上の連続関数とする。

+ このとき$a in I$に対して@e_indef_int で定まる不定積分$F(x)$は$f(x)$の原始関数である、つまり@e_prim が成り立つ。
+ $F$を$f$の原始関数の一つとすると、任意の$a, b in I$に対して
  $
  integral_a^b f(x) dd(x) = F(b)-F(a)
  $
  が成り立つ。
]

#proof[
+ $x in I$に対して$F'(x)$を書き下すと@t_int_interval を使って、
  $
  F'(x)
  = lim_(h -> 0) (F(x+h)-F(x))/h
  = lim_(h -> 0) 1/h (integral_a^(x+h) f(t) dd(t)-integral_a^x f(t) dd(t))
  = lim_(h -> 0) 1/h integral_x^(x+h) f(t) dd(t)
  $
  となり、$f$の$x$での連続性の度合い関数$omega$を取ることで、
  $
  abs(1/h integral_x^(x+h) f(t) dd(t)-f(x))
  = abs(1/h integral_x^(x+h) (f(t)-f(x)) dd(t))
  <= 1/h integral_x^(x+h) abs(f(t)-f(x)) dd(t)
  <= 1/h integral_x^(x+h) omega(h) dd(t)
  = omega(h).
  $
  右辺は$h -> 0$で$0$に収束するので、結論として$F'(x) = f(x)$がわかる。
+ $f$の不定積分を$G$とおく、つまり
  $
  G(x) = integral_a^x f(t) dd(t)
  $
  とすると(1)より$G$は$f$の原始関数である。
  したがって$G(x)-F(x)$は、微分導関数が$f(x)-f(x) = 0$より、定数関数なので、
  $
  F(b)-F(a) = G(b)-G(a)
  = integral_a^b f(x) dd(x)-integral_a^a f(x) dd(x)
  = integral_a^b f(x) dd(x)
  $
  である。
]

この微分積分学の基本定理を用いれば定積分を計算することは原始関数を一つ見つけることに帰着される。
また、$F(b)-F(a)$のことを
$
evaluated(F)_a^b,
quad evaluated(F(x))_(x = a)^b,
quad evaluated(F(x))_a^b
$
などと略記する。

#example[
一次関数$f(x) = k x+m$に対して、二次関数$f(x) = k/2 x^2+m x$は$f(x)$の原始関数であることがすぐわかるので、
$
integral_a^b (k x+m) dd(x)
= evaluated([k/2 x^2+m x])_(x = a)^b
= (k/2 b^2+m b)-(k/2 a^2+m a)
$
と（区分求積法より）簡単に計算できる。
]

ここでは連続関数$f(x)$が与えられたときに$f$のすべての原始関数、つまり$f$の原始関数全体の集合について考えよう。
この集合を
$
integral f(x) dd(x)
$
と書くことにする。
$F$, $G$を$f$の原始関数とすると、$G(x)-F(x)$は、微分導関数が$f(x)-f(x) = 0$より、定数関数になる。
つまり、$f$の原始関数$F$を一つ見つけたら原始関数全体の集合は
$
integral f(x) dd(x) = { F(x)+C mid(|) C in RR }
$
とでき、この時の$C$を積分定数という。 上の記述はしばしば
$
integral f(x) dd(x) = f(x)+C
$
と略記される。
積分定数もしばしば省略されるが、微分方程式の理論では積分定数は省略されないので、このテキストでは省略せずに書くことにする。

以下では微分の公式から直ちに得られる積分の公式を列挙する。
一部被積分関数が連続である範囲が実数全体でない場合もあるので注意する。

#proposition([種々の関数の積分１])[
$
integral x^n dd(x) = 1/(n+1) x^(n+1)+C quad (n = 0, 1, 2, 3, dots),
quad integral x^n dd(x) = 1/(n+1) x^(n+1)+C quad (n =-2,-3, dots, x eq.not 0),
$
$
integral abs(x)^a dd(x) = 1/(a+1) x abs(x)^a+C quad (a eq.not-1, x eq.not 0).
$
$
integral e^x dd(x) = e^x+C,
quad integral a^x dd(x) = 1/(log a) a^x+C quad (a > 0, a eq.not 1).
$
$
integral 1/x dd(x) = log abs(x)+C quad (x eq.not 0),
$
$
integral sin x dd(x) = -cos x+C,
quad integral cos x dd(x) = sin x+C,
quad integral 1/(cos^2 x) dd(x) = tan x+C quad (x eq.not pi/2+n pi, n in bb(Z)).
$
$
integral 1/sqrt(1-x^2) dd(x) = arcsin x+C quad (-1 < x < +1),
quad integral 1/(1+x^2) dd(x) = arctan x+C.
$
$
integral sinh x dd(x) = cosh x+C,
quad integral cosh x dd(x) = sinh x+C,
quad integral 1/(cosh^2 x) dd(x) = tanh x+C.
$
$
integral 1/sqrt(1+x^2) dd(x) = arsinh x+C,
quad integral 1/(1-x^2) dd(x) = 1/2 log abs((1+x)/(1-x))+C quad (x eq.not plus.minus 1).
$
]

#remark[
上記では細かく書いたが、いくつかは簡単に
$
integral x^a dd(x) = cases(
  1/(a+1) x^(a+1)+C & (a eq.not -1)",",
  log abs(x)+C & (a = -1)
)
$
と覚えておけばよい。
]

また、被積分関数が単純な関数についての積分として次が挙げられる。

#proposition([種々の関数の積分２])[
$
integral log abs(x) dd(x) = x log abs(x)-x+C quad (x eq.not 0).
$
$
integral tan x dd(x) = -log abs(cos x)+C quad (x eq.not pi/2+n pi, n in bb(Z)).
$
$
integral tanh x dd(x) = log(cosh x)+C.
$
]

#proof[
証明は右辺を微分することで確かめられるので省略する。
]

== 部分積分と置換積分

まず、次が成り立つことに注意する。

#proposition[
連続関数$f$, $g$に対して、
$
integral (f(x)+g(x)) dd(x) = integral f(x) dd(x)+integral g(x) dd(x)
$
が成り立つ。
]

積の微分や合成関数の微分に対応する積分の計算法が部分積分と置換積分である。

#theorem([部分積分])[
$f(x)$, $g(x)$を$C^1$級関数とするとき、
$
integral f(x)g'(x) dd(x) = f(x)g(x)-integral f'(x)g(x) dd(x)
$
が成り立つ。
]

#proof[
$F(x) = f(x)g(x)$とおくと積の微分より
$
F'(x) = f'(x)g(x)+f(x)g'(x).
$
つまり$f(x)g(x)$は$f'(x)g(x)+f(x)g'(x)$の原始関数より
$
integral f'(x)g(x)+f(x)g'(x) dd(x) = f(x)g(x)+C.
$
よって整理して示すべき式を得る。
]

#example[
部分積分により
$
integral x e^x dd(x)
= integral x (e^x)' dd(x)
= x e^x-integral (x)' e^x dd(x)
= x e^x-integral e^x dd(x)
= (x-1)e^x+C.
$
]

#example[
部分積分により
$
integral log x dd(x)
= integral (x)' log x dd(x)
= x log x-integral x (log x)' dd(x)
= x log x-integral dd(x)
= x log x-x+C.
$
]

#theorem([置換積分])[
$f(x)$を連続関数、$phi(t)$を$C^1$級関数とするとき、$x = phi(t)$とおくと、
$
integral f(phi(t))phi'(t) dd(t) = integral f(x) dd(x)
$
が成り立つ。
]

#remark[
置換積分は$dv(x, t)dd(t) = dd(x)$と考えると覚えやすい。
]

#proof[
$F$を連続関数$f(x)$の原始関数（の一つ）とおくと合成関数の微分より
$
dv(, t)(F(phi(t))) = F'(phi(t))phi'(t) = f(phi(t))phi'(t).
$
つまり$F(phi(t))$は$f(phi(t))phi'(t)$の原始関数より、$x = phi(t)$と置換することで
$
integral f(phi(t))phi'(t) dd(t)
= F(phi(t))+C
= F(x)+C
= integral f(x) dd(x)
$
である。
]

#example[
置換積分により$y = x^2$とおくと
$
integral x e^(x^2) dd(x)
= integral 1/2 (x^2)' e^(x^2) dd(x)
= integral 1/2 e^y dd(y)
= 1/2 e^y+C
= 1/2 e^(x^2)+C.
$
]

部分積分と置換積分を定積分に適用するとき、部分積分はそのままだが置換積分は積分範囲に注意が必要である。

#theorem([定積分の部分積分])[
$f(x)$, $g(x)$を有界閉区間$[a, b]$を含む開区間で$C^1$級関数とするとき、
$
integral_a^b f(x)g'(x) dd(x) = evaluated([f(x)g(x)])_a^b-integral_a^b f'(x)g(x) dd(x)
$
が成り立つ。
]

#theorem([定積分の置換積分])[
$[alpha, beta]$を$t$の有界閉区間、$I$を$x$の区間とし、$f$を$I$上の連続関数、$x = phi(t)$を$[alpha, beta]$を含む開区間で$C^1$級関数であって値域が$I$に入っているとする。
ここで$phi(alpha) = a$, $phi(beta) = b$とするとき、
$
integral_alpha^beta f(phi(t))phi'(t) dd(t) = integral_a^b f(x) dd(x)
$
が成り立つ。
]

部分積分と置換積分の応用として逆関数の積分がある。

#theorem([逆関数の積分])[
$f$を連続関数として、$F$を$f$の原始関数の一つとする。
$f$が逆関数$f^(-1)$を持つとすると、
$
integral f^(-1)(x) dd(x) = x f^(-1)(x)-F(f^(-1)(x))+C
$
が成り立つ。
]

#proof[
$y = f^(-1)(x)$と置換すると、$x = f(y)$より
$
integral f^(-1)(x) dd(x) = integral y f'(y) dd(y).
$
部分積分より
$
integral f^(-1)(x) dd(x) = y f(y)-integral f(y) dd(y) = y f(y)-F(y)+C.
$
よって、$f(f^(-1)(x)) = x$に注意して$x$で書き直せばほしかった式が得られる。
]

#example[
$f(x) = exp x = e^x$を考えると原始関数は$F(x) = e^x = f(x)$、逆関数は$f^(-1)(x) = log x$より
$
integral log x dd(x)
= integral f^(-1)(x) dd(x)
= x f^(-1)(x)-F(f^(-1)(x))+C
= x log x-x+C
$
である。
]

== 種々の積分の計算

この章では積分を計算する系統だった技法をいくつか紹介することで様々な関数の積分が計算できるようにする。

実数係数の有理式つまり実数係数の多項式$p(x) eq.not 0$と実数係数の多項式$q(x)$の分数の形$(q(x))/(p(x))$になっている関数は積分が計算できる。
これは部分分数分解によりどの有理式も次の形の有理式の和として表されることによる。

- 単項式$a x^n$ ($a in RR$, $n = 0, 1, 2, 3, dots$)。
- 一次式の累乗$a/(x-b)^n$ ($a, b in RR$, $n = 1, 2, 3, dots$)。
- 判別式が負な二次式の累乗で次の形$(2 a (x-b))/(((x-b)^2+c^2)^n)$ ($a, b, c in RR$, $n = 1, 2, 3, dots$)。
- 判別式が負な二次式の累乗$a/((x-b)^2+c^2)^n$ ($a, b, c in RR$, $c eq.not 0$, $n = 1, 2, 3, dots$)。

これらのうち(i)と(ii)は$x^n$, $x^(-n)$の積分をそれぞれ使えばよく、
(iii)は$y = (x-b)^2+c^2$と置換することで$y^(-n)$の積分に帰着される。
(iv)は置換$y = (x-b)/c$により、
$
I_n = integral 1/(x^2+1)^n dd(x)
$
の計算に帰着され、部分積分
$
I_n
= integral ((x)')/(x^2+1)^n dd(x)
= x/(x^2+1)^n+integral (2 n x^2)/(x^2+1)^(n+1) dd(x)
= x/(x^2+1)^n+2 n(I_n-I_(n+1))
$
からこの$I_n$が満たす漸化式
$
I_(n+1) = x/(2 n (x^2+1)^n)+(2 n-1)/(2 n) I_n, quad I_1 = arctan x+C
$
により計算できる（一般項は難しいが与えれた$n$に対する$I_n$は計算できる）。
いくつか計算してみると
$
& integral 1/(x^2+1) dd(x) = arctan x+C, \
& integral 1/(x^2+1)^2 dd(x) = 1/2 x/(x^2+1)+1/2 arctan x+C, \
& integral 1/(x^2+1)^3 dd(x) = 1/4 x/(x^2+1)^2+3/8 x/(x^2+1)+3/8 arctan x+C
$
などとなる。

#example[
部分分数分解
$
x^2/(x^2-1)
= 1+1/(x^2-1)
= 1+1/((x-1)(x+1))
= 1+(1/2)/(x-1)-(1/2)/(x+1)
$
により
$
integral x^2/(x^2-1) dd(x)
&= integral dd(x)+1/2 integral 1/(x-1) dd(x)-1/2 integral 1/(x+1) dd(x) \
&= x+1/2 log abs(x-1)-1/2 log abs(x+1)+C
$
と計算される($x eq.not plus.minus 1$)。
]

根号を含む関数$R(x, root(n, (a x+b)/(c x+d)))$（$R$は実数係数の有理式、$a, b, c, d in RR$, $a d-b c eq.not 0$, $n = 1, 2, 3, dots$）も積分が計算できる。
これは$y = root(n, (a x+b)/(c x+d))$と置換することで$y$についての有理式の積分に帰着されることによる。

#example[
]

別の形の根号を含む関数$R(x, sqrt(a x^2+b x+c))$も積分が計算できる。

#example[
]

さらに$sin x$, $cos x$を含む関数$R(sin x, cos x)$（$R$は実数係数の有理式）は$t = tan x/2$という置換により$t$についての有理式の積分に帰着される。

#example[
]

特に$R(sin^2 x, cos^2 x)$（$R$は実数係数の有理式）の形の関数の場合は$t = tan x$という置換によりさらに簡単に積分が求められる。

#example[
]

== 積分の漸化式

この節では被積分関数に自然数の定数$n$があるような積分を考える。
もちろん
$
integral x^n dd(x) = 1/(n+1) x^(n+1)+C
$
のような簡単な例もあるが、一般項が簡単には求まらないことが普通である。
例えば前節で紹介した
$
integral 1/(x^2+1)^n dd(x)
$
がそれにあたる。
そこで部分積分や置換積分を使って漸化式を立てて目的の積分を計算するという技法が取られる。

#example([ウォリス積分])[
$n = 0, 1, 2, 3, dots$に対して積分
$
integral sin^n x dd(x)
$
を考える。
この積分は部分積分を使うことにより$n >= 2$に対して、
$
integral sin^n x dd(x)
&= integral (-cos x)' sin^(n-1) x dd(x)
= -cos x sin^(n-1) x+integral (n-1) cos^2 x sin^(n-2) x cos x dd(x) \
&= -cos x sin^(n-1) x+(n-1) integral sin^(n-2) x dd(x)-(n-1) integral sin^n x dd(x)
$
となるので、積分の漸化式
$
integral sin^n x dd(x) = -1/n cos x sin^(n-1) x+(n-1)/n integral sin^(n-2) x dd(x)
$
を得る。 最初の$n = 0, 1$の場合だけ積分を計算したらこの漸化式から
$
& integral sin^0 x dd(x) = x+C, \
& integral sin^1 x dd(x) = -cos x+C, \
& integral sin^2 x dd(x) = -1/2 cos x sin x+1/2 x+C, \
& integral sin^3 x dd(x) = -1/3 cos x sin^2 x-2/3 cos x+C
$
などと順に計算することができる。

また、定積分
$
I_n = integral_0^(pi/2) sin^n x dd(x) = integral_0^(pi/2) cos^n x dd(x)
$ <e_wallis_int>
を考えよう。
なお、$sin$の定積分と$cos$の定積分が等しいことは$x$を$pi/2-x$と置換すればわかる。
この積分$I_n$を_ウォリス積分_という。
不定積分が得られているので定積分に対する漸化式は
$
I_n = (n-1)/n I_(n-2) quad (n >= 2),
quad I_0 = pi/2,
quad I_1 = 1
$
となる。
]

#theorem([ウォリスの公式])[
ウォリス積分@e_wallis_int で定まる数列$(I_n)_(n = 0)^oo$は
$
lim_(n -> oo) sqrt(n) I_n = sqrt(pi/2)
$
を満たす。
] <t_wallis_limit>

#proof[
ウォリス積分の漸化式より
$
(n+1) I_(n+1) I_n = n I_n I_(n-1)
$
なので、数列$(n I_n I_(n-1))_n$は定数列であり、
$
n I_n I_(n-1) = I_1 I_0 = pi/2
$
がわかる。

ここで、$0 <= x <= pi/2$で$sin^(n+1) x <= sin^n x <= sin^(n-1) x$より
$
I_(n+1) <= I_n <= I_(n-1)
$
であり、$n I_n >= 0$をかけて
$
n I_(n+1) I_n = n/(n+1) pi/2 <= n I_n^2 <= n I_n I_(n-1) = pi/2
$
を得る。
したがってはさみうちの原理より結論の式を得る。
]

== 積分の不等式

この節では積分を含んだいくつかの有名な不等式を紹介し、応用として（本来の応用先ではないが）様々な積分や式に対して評価を与える。

#proposition([連続関数に対する積分の大小関係])[
$f(x)$, $g(x)$を有界閉区間$[a, b]$上の連続関数とする。
各$x in [a, b]$に対して$f(x) <= g(x)$を満たすとき、
$
integral_a^b f(x) dd(x) <= integral_a^b g(x) dd(x)
$
が成り立つ。
等号成立条件は任意の$x in [a, b]$に対して$f(x) = g(x)$が成り立つことである。
]

#proof[
]

#example[
区間$[0, 1]$上の連続関数$f(x) = (x^4 (1-x)^4)/(1+x^2)$を考えると、$f(x)$は非負値で$0 < x < 1$では正なので、
$
integral_0^1 (x^4 (1-x)^4)/(1+x^2) dd(x) > 0
$
が成り立つ。
積分を計算すると、
$
integral_0^1 (x^4 (1-x)^4)/(1+x^2) dd(x)
&= integral_0^1 (x^4-4 x^5+6 x^6-4 x^7+x^8)/(1+x^2) dd(x) \
&= integral_0^1 (x^6-4 x^5+5 x^4-4 x^2+4-4/(1+x^2)) dd(x) \
&= 1/7-2/3+1-4/3+2-pi
= 22/7-pi
$
であるから、
円周率$pi$が$22/7 = 3.142857142857143 dots$より小さいことがわかる。

さらに評価を精密化すると$0 <= x <= 1$で
$
1/2 x^4 (1-x)^4 <= f(x) <= x^4 (1-x)^4
$
が成り立つので、
$
integral_0^1 x^4 (1-x)^4 dd(x)
= integral_0^1 (x^4-4 x^5+6 x^6-4 x^7+x^8) dd(x)
= 1/5-2/3+6/7-1/2+1/9
= 1/630
$
より、
$
22/7-1/630 = 3.141269841269841 dots
< pi <
22/7-1/1260 = 3.142063492063492 dots
$
という評価が得られる。
]

#proposition([単調関数の積分])[
$f(x)$を有界閉区間$[a, b]$上の広義単調増加または広義単調減少な関数とする。
- $f$が広義単調増加であるとき、
  $
  f(a)(b-a) <= integral_a^b f(x) dd(x) <= f(b)(b-a)
  $
  が成り立つ。
- $f$が広義単調減少であるとき、
  $
  f(b)(b-a) <= integral_a^b f(x) dd(x) <= f(a)(b-a)
  $
  が成り立つ。
]

#proof[
$f$が広義単調増加の場合を示す。
各$x in [a, b]$に対して$f(a) <= f(x) <= f(b)$なので、積分して
$
f(a)(b-a) <= integral_a^b f(x) dd(x) <= f(b)(b-a)
$
を得る。
同様にして$f$が広義単調減少の場合も示される（詳細省略）。
]

#proposition([凸関数・凹関数の積分])[
$f(x)$を有界閉区間$[a, b]$上の連続関数とする。
- $f$が凸関数であるとき、
  $
  f((a+b)/2) (b-a) <= integral_a^b f(x) dd(x) <= (f(a)+f(b))/2 (b-a)
  $
  が成り立つ。
- $f$が凹関数であるとき、
  $
  (f(a)+f(b))/2 (b-a) <= integral_a^b f(x) dd(x) <= f((a+b)/2) (b-a)
  $
  が成り立つ。
]

#proof[
$f$が凸関数の場合を示す。
このとき$y = f(x)$のグラフより、二点$(a, f(a))$と$(b, f(b))$を結ぶ線分の方が上に位置して、$x = (a+b)/2$での接線の方が下に位置する、
つまり接線の傾きを$p$とすれば$x in [a, b]$に対して
$
p(x-(a+b)/2)+f((a+b)/2) <= f(x) <= (f(b)-f(a))/(b-a) (x-a)+f(a)
$
が成り立つ。
これを積分すれば示すべき不等式が得られる。
$f$が凹関数の場合も同様に示される（詳細省略）。
]

#example[
@t_ratio_mean_ineq において微分を使って示した不等式@e_ratio_mean_ineq や@e_ratio_mean_ineq2 は積分を用いて示すことができる。
実際、$k >= 1$に対して関数$f(x) = x^k$は凸なので、
$
integral_a^b x^k dd(x) = (b^(k+1)-a^(k+1))/(k+1) <= (a^k+b^k)/2 (b-a)
$
を得る。
]

#theorem([コーシー・シュワルツの不等式])[
$f(x)$, $g(x)$を有界閉区間$[a, b]$上の連続関数とする。 このとき不等式
$
(integral_a^b f(x)g(x) dd(x))^2
<= (integral_a^b f(x)^2 dd(x))(integral_a^b g(x)^2 dd(x))
$
が成り立つ。
]

#proof[
任意の実数$t$に対して
$
integral_a^b (f(x)t+g(x))^2 dd(x)
= (integral_a^b f(x)^2 dd(x))t^2+2(integral_a^b f(x)g(x) dd(x))t+(integral_a^b g(x)^2 dd(x))
>= 0
$
に注意する。
これは$t$についての二次不等式なので判別式が非正であり、ほしかった不等式を得る。
]

#example[
$[a, b] = [0, 1]$, $f(x) = sqrt(1-x^4)$, $g(x) = 1$としてコーシー・シュワルツの不等式を用いれば、
$
integral_0^1 sqrt(1-x^4) dd(x)
<= sqrt(integral_0^1 (1-x^4) dd(x))
= 2/sqrt(5)
$
を得る。
]

#theorem([ヘルダーの不等式])[
$f(x)$, $g(x)$を有界閉区間$[a, b]$上の連続関数として、$p$, $q$を@e_holder_conj を満たす実数とする。
このとき不等式
$
integral_a^b abs(f(x)g(x)) dd(x)
<= (integral_a^b abs(f(x))^p dd(x))^(1/p) (integral_a^b abs(g(x))^q dd(x))^(1/q)
$
が成り立つ。
]

#proof[
$
A = (integral_a^b abs(f(x))^p dd(x))^(1/p),
quad B = (integral_a^b abs(g(x))^q dd(x))^(1/q)
$
とおく。
$A = 0$のときは$f(x) = 0$、$B = 0$のときは$g(x) = 0$となり不等式は成立するので、$A > 0$かつ$B > 0$の場合を考える。
各$x in [a, b]$に対してヤングの不等式（@t_young_ineq）より
$
abs(f(x)/A) abs(g(x)/B)
<= 1/p abs(f(x)/A)^p+1/q abs(g(x)/B)^q
$
なので、積分して
$
integral_a^b abs(f(x)/A) abs(g(x)/B) dd(x)
<= 1/p integral_a^b abs(f(x)/A)^p dd(x)+1/q integral_a^b abs(g(x)/B)^q dd(x)
= 1/p+1/q = 1.
$
よってほしかった不等式が得られる。
]

#remark[
$p = 2$, $q = 2$の場合のヘルダーの不等式はコーシー・シュワルツの不等式に他ならない。
]

#remark[
$p = 1$に対応する場合は$q = oo$となり、そのままでは考えられないが、
$
integral_a^b abs(f(x)g(x)) dd(x)
<= (integral_a^b abs(f(x)) dd(x)) max_(x in [a, b]) abs(g(x))
$
が対応する不等式と考えることができる。
]

#theorem([ミンコフスキーの不等式])[
$f(x)$, $g(x)$を有界閉区間$[a, b]$上の連続関数として、$p$を$1$以上の実数とする。
このとき不等式
$
(integral_a^b abs(f(x)+g(x))^p dd(x))^(1/p)
<= (integral_a^b abs(f(x))^p dd(x))^(1/p)+(integral_a^b abs(g(x))^p dd(x))^(1/p)
$
が成り立つ。
]

#proof[
途中で三角不等式を一回使うことで
$
integral_a^b abs(f(x)+g(x))^p dd(x)
&= integral_a^b abs(f(x)+g(x)) abs(f(x)+g(x))^(p-1) dd(x) \
&<= integral_a^b abs(f(x))abs(f(x)+g(x))^(p-1) dd(x)+integral_a^b abs(g(x))abs(f(x)+g(x))^(p-1) dd(x)
$
を得る。
$p = 1$のときはすでに結論を得ていることに注意して、以降では$p > 1$の場合を考える。
ここで、
$
A = (integral_a^b abs(f(x))^p dd(x))^(1/p),
quad B = (integral_a^b abs(g(x))^p dd(x))^(1/p)
$
とおき、
$q$を@e_holder_conj を満たす実数つまり$q = p/(p-1)$として取ると、ヘルダーの不等式から
$
integral_a^b abs(f(x)+g(x))^p dd(x)
&<= A(integral_a^b abs(f(x)+g(x))^((p-1)q) dd(x))^(1/q)+B(integral_a^b abs(f(x)+g(x))^((p-1)q) dd(x))^(1/q) \
&= (A+B)(integral_a^b abs(f(x)+g(x))^p dd(x))^((p-1)/p)
$
よってほしかった不等式が得られる。
]

#theorem([イェンセンの不等式])[
$x(t)$, $p(t)$を有界閉区間$I$上の連続関数で任意の$t in [a, b]$に対して$p(t) >= 0$と$integral_I p(t) dd(t) = 1$を満たし、$f$を$[inf x, sup x]$上の連続関数とする。

- $f$が凸関数のとき、
  $
  f(integral_I p(t)x(t) dd(t)) <= integral_I p(t)f(x(t)) dd(t)
  $
  が成り立つ。
- $f$が凹関数のとき、
  $
  f(integral_I p(t)x(t) dd(t)) >= integral_I p(t)f(x(t)) dd(t)
  $
  が成り立つ。
]

#proof[
凸関数の方について示す。
@t_convex_supp より$f(x) >= f(a)+k (x-a)$を満たす実数$k$が存在する。
ここで$a = integral_I p(t)x(t) dd(t)$、$x = x(t)$ ($t in I$)として$p(t)$倍して積分すると、$integral_I p(t) dd(t) = 1$に注意して、
$
integral_I p(t)f(x(t)) dd(t)
>= integral_I p(t)(f(a)+k(x(t)-a)) dd(t)
= f(a)+k (integral_I p(t)x(t) dd(t)-a)
= f(a).
$
よってほしかった不等式を得る。

凹関数の方は同様なので詳細は省略する。
]

== 高階微分と積分

関数の値を高階の微分係数で評価する方法としてテイラーの定理を学んだが、
実は剰余項の表現の一つとして高階微分の積分がある。

#theorem([テイラーの定理（ベルヌーイの剰余項）])[
$N = 0, 1, 2, 3, dots$として$I$を開区間とし、$f$を$I$上の$C^(N+1)$級関数とする。
このとき、任意の点$a, x in I$に対して
$
f(x) = sum_(n = 0)^N frac(f^((n)) (a), n!) (x-a)^n+integral_a^x frac(f^((N+1)) (t), N!) (x-t)^N dd(t)
$
が成り立つ。
]

この時の剰余項の表現$R_N (x) = integral_a^x frac(f^((N+1)) (t), N!) (x-t)^N dd(t)$を_ベルヌーイの剰余項_という。
この定理はペアノの剰余項やラグランジュの剰余項よりも仮定は強いが、剰余項に$omega$や$c$のような計算が難しいものが入らないので、剰余項の評価がしやすい。
それでいて証明は積分の部分に部分積分を繰り返すだけで簡単である。

ここでは被積分関数を導出するためにいったん抽象化した次の補題を示す。

#lemma([ダルブーの公式])[
$N = 0, 1, 2, 3, dots$として$f, g$を有界閉区間$[a, b]$を含む開区間上の$C^(N+1)$級関数とする。
このとき、
$
integral_a^b p(x) f^((N+1)) (x) dd(x)
= evaluated(sum_(n = 0)^N (-1)^n p^((n)) (x) f^((N-n)) (x))_(x = a)^b+(-1)^(N+1) integral_a^b p^((N+1)) (x) f(x) dd(x)
$
]

#proof[
部分積分を繰り返すことで、
$
integral_a^b p(x) f^((N+1)) (x) dd(x)
&= evaluated([p(x) f^((N)) (x)])_a^b-integral_a^b p'(x) f^((N)) (x) dd(x) \
&= evaluated([p(x) f^((N)) (x)-p'(x) f^((N-1)) (x)])_a^b+integral_a^b p''(x) f^((N-1)) (x) dd(x) \
&= dots \
&= evaluated(sum_(n = 0)^N (-1)^n p^((n)) (x) f^((N-n)) (x))_(x = a)^b+(-1)^(N+1) integral_a^b p^((N+1)) (x) f(x) dd(x)
$
が得られる。
]

この補題で$p(x) = 1/(N!) (b-x)^N$としてとることでテイラーの定理（ベルヌーイの剰余項）が得られる（ただし$b$を$x$に$x$を$t$に変更している）わけだが、
この$p$は次のようにして発見される。
つまり、ダルブーの公式とテイラーの定理（ベルヌーイの剰余項）の目標の式
$
f(b) = sum_(n = 0)^N frac(f^((n)) (a), n!) (b-a)^n+integral_a^b p(x) f^((N+1)) (x) dd(x)
$
を比較することを考える。
するとまず$f(x)$の積分の項がないので、$p^((N+1)) (x) = 0$が必要である。
また、$f^((N-n)) (x)$の係数が$n = N$の時だけ$1$でそれ以外の時は$0$なので、
$
p(b) = dots = p^((N-1)) (b) = 0, quad (-1)^N p^((N)) (b) = 1
$
がわかる。
これらを満たす$p$は$N$次の多項式であり、
$
p(x) = (-1)^N 1/(N!) (x-b)^N = 1/(N!) (b-x)^N
$
であることがわかる。

#proof([テイラーの定理（ベルヌーイの剰余項）の証明])[
ダルブーの定理で$p(x) = (-1)^N 1/(N!) (x-b)^N$とおくと、
$
p^((n)) (a) = (-1)^N 1/((N-n)!) (a-b)^(N-n),
quad p^((n)) (b) = cases(0 &quad (n = 0, dots, N-1), (-1)^N &quad (n = N)),
quad p^((N+1)) (x) = 0
$
なので、
$
integral_a^b p(x) f^((N+1)) (x) dd(x)
// = integral_a^b frac(f^((N+1)) (x), N!) (b-x)^N dd(x)
&= evaluated(sum_(n = 0)^N (-1)^n p^((n)) (x) f^((N-n)) (x))_(x = a)^b \
&= f(b)-sum_(n = 0)^N (-1)^(N+n) 1/((N-n)!) (a-b)^(N-n) f^((N-n)) (a) \
&= f(b)-sum_(n = 0)^N 1/(n!) (b-a)^n f^((n)) (a)
$
となり、整理してほしかった式
$
f(b) = sum_(n = 0)^N frac(f^((n)) (a), n!) (b-a)^n+integral_a^b frac(f^((N+1)) (x), N!) (b-x)^N dd(x)
$
を得る。
]

テイラーの定理は関数の値$f(x)$を表現する方法だったが、
積分$integral_a^b f(x) dd(x)$を高階微分を使って表現することもできる。
そのためには$p^((N+1)) (x) = 1$つまり$p$は$N+1$次の多項式とすればよい。
ここではさらに条件
$
N = 1,
quad p(a) = p(b) = 0,
quad p'(a)+p'(b) = 0
$
を満たすものとする。
この条件は
$
integral_a^b f(x) dd(x)
= c_0 [f(a)+f(b)]+integral_a^b p(x) f''(x) dd(x)
$
を導く。
この形は、$[a, b] = [n, n+1]$として整数$n$についての和を取った時に、
後々$f(n)$の和を積分で近似する公式の元になる。
なお、似たようなアイデアで$p(x)$をベルヌーイ多項式と呼ばれる多項式にすればより高精度の公式が得られるが、ここでは扱わない。

#theorem([台形公式])[
$I$を開区間として、$a, b in I$, $a < b$とする。
1. $f$を$I$上の$C^1$級関数とすると、
  $
  integral_a^b f(x) dd(x)
  = (f(a)+f(b))/2 (b-a)-integral_a^b (x-(a+b)/2) f'(x) dd(x)
  $
  が成り立つ。
2. $f$を$I$上の$C^2$級関数とすると、
  $
  integral_a^b f(x) dd(x)
  = (f(a)+f(b))/2 (b-a)+1/2 integral_a^b (x-a)(x-b) f''(x) dd(x)
  $
  が成り立つ。
]

#remark[
二つ目の公式において、$x in [a, b]$で
$
-1/4 (b-a)^2 <= (x-a)(x-b) <= 0
$
である。
]

#proof[
右辺の積分を部分積分する。
一つ目の主張は
$
integral_a^b (x-(a+b)/2) f'(x) dd(x)
= evaluated([(x-(a+b)/2) f(x)])_a^b-integral_a^b f(x) dd(x)
= (f(a)+f(b))/2 (b-a)-integral_a^b f(x) dd(x)
$
より示される。
二つ目の主張は
$
integral_a^b (x-a)(x-b) f'' (x) dd(x)
&= evaluated([(x-a)(x-b) f' (x)])_a^b-integral_a^b [(x-a)(x-b)]' f'(x) dd(x) \
&= -integral_a^b [2 x-(a+b)] f'(x) dd(x)
$
より一つ目に帰着される。
]

== 区分求積法の応用

区分求積法とはこの章の導入のところで紹介したとおり、定積分をリーマン積分の定義に基づいて和の極限として表現する方法である。

#proposition([区分求積法])[
$f(x)$を有界閉区間$[a, b]$上のリーマン積分可能な関数とする。
このとき、
$
integral_a^b f(x) dd(x)
= lim_(N -> oo) (b-a)/N sum_(n = 1)^N f(a+n (b-a)/N)
$
が成り立つ。
特に$[a, b] = [0, 1]$の時、
$
integral_0^1 f(x) dd(x)
= lim_(N -> oo) 1/N sum_(n = 1)^N f(n/N)
$
が成り立つ。
]

#proof[
右辺は特殊な分割
$
P_N = { a, a+1 (b-a)/N, a+2 (b-a)/N, a+3 (b-a)/N, dots, a+(N-1) (b-a)/N, b}
$
に対するリーマン和の極限なので、
$
underline(S)(f, P_N) <= (b-a)/N sum_(n = 1)^N f(a+n (b-a)/N) <= overline(S)(f, P_N)
$
より、$N -> oo$の極限を取ればリーマン積分の定義から結論が得られる。
]

区分求積法は積分の計算法というより、右辺の和の極限を計算する方法として有用である。

#example[
$p > 0$に対して、
$
lim_(N -> oo) 1/N^(p+1) sum_(n = 1)^N n^p
= lim_(N -> oo) 1/N sum_(n = 1)^N (n/N)^p
= integral_0^1 x^p dd(x)
= 1/(p+1)
$
と計算される。
]

== 和と積分の関係

数の和の問題はしばしば積分の問題に帰着される。
まずは覚えやすく簡便な方法として単調関数に対する和の評価を示す。

#proposition([単調な和の評価])[
$M, N$を$M < N$を満たす整数とし、$f(x)$を区間$[M, N]$上の広義単調増加または広義単調減少な関数とする。
- $f$が広義単調増加であるとき、
  $
  integral_M^N f(x) dd(x)+f(M) <= sum_(n = M)^N f(n) <= integral_M^N f(x) dd(x)+f(N)
  $
  が成り立つ。
- $f$が広義単調減少であるとき、
  $
  integral_M^N f(x) dd(x)+f(N) <= sum_(n = M)^N f(n) <= integral_M^N f(x) dd(x)+f(M)
  $
  が成り立つ。
] <t_sum_int_monotone>

この話題は和と積分が表す面積の関係に基づいていて、一般的には積分区間を$[M-1, N]$や$[M, N+1]$にすることが多いが、どちらが小さくどちらが大きいか迷いがちである。
しかしながらこの方法であれば、和の$M, N$をそのまま積分区間にして、和は$N-M+1$項なのに積分区間の長さは$N-M$であるので端点$f(M), f(N)$をその大小に応じて足せばよく、わかりやすい。
（そもそも今回の命題の設定では$[M, N]$の外では$f$はどうなっているのかわからないのでこのような形にならざるを得ない。）

#proof[
$f$が広義単調増加の場合を示す。
積分区間を分割すると
$
integral_M^N f(x) dd(x)
= sum_(n = M)^(N-1) integral_n^(n+1) f(x) dd(x).
$
ここで$f(x)$の単調性より
$
sum_(n = M)^(N-1) f(n)
<= integral_M^N f(x) dd(x)
<= sum_(n = M)^(N-1) f(n+1).
$
よって
$
sum_(n = M)^N f(n)-f(N)
<= integral_M^N f(x) dd(x)
<= sum_(n = M)^N f(n)-f(M)
$
なので、整理してほしかった不等式を得る。

$f$が広義単調減少の場合も同様に示される（詳細省略）。
]

#example([調和数の漸近近似])[
調和数とは正の整数の逆数の和のことをいい、$n = 1, 2, 3, dots$項の和
$
H_n = sum_(k = 1)^n 1/k = 1+1/2+1/3+dots+1/n
$
を考える。
逆数関数$1/x$は$(0, oo)$上で狭義単調減少なので、上の命題より
$
integral_1^n 1/x dd(x)+1/n <= H_n <= integral_1^n 1/x dd(x)+1
$
が成り立つ。
積分を計算すると
$
integral_1^n 1/x dd(x) = evaluated([log x])_1^n = log n
$
であるから、
$
log n+1/n <= H_n <= log n+1
$
である。
ここから例えば$log n$で割れば$n -> oo$で$H_n/(log n) -> 1$が得られて、
調和数$H_n$は$log n$で漸近近似されると表現される。
]

#remark([オイラーの定数])[
調和数$H_n = sum_(k = 1)^n 1/k$とその漸近近似$log n = integral_1^n 1/x dd(x)$の差$H_n-log n$について、
$
(H_(n+1)-log(n+1))-(H_n-log n)
= 1/(n+1)-integral_n^(n+1) 1/x dd(x)
<= 0
$
より、$H_n-log n$は単調減少である。
上の評価から$0 < 1/n <= H_n-log n <= 1$であるので有界であり、したがって収束する。
この極限を_オイラーの定数_といい、$gamma = lim_(n -> oo) (H_n-log n)$と表される。
数値的には$gamma = 0.577215664901532 dots$であるが、他の有名な定数$e$や$pi$との関係性などわかっていないことが多い。
]

#example([階乗の対数漸近近似])[
$n = 1, 2, 3, dots$の階乗$n!$を階乗を用いない形で評価することを考える。
そのために対数を取った$log n! = sum_(k = 1)^n log k$を評価する。
対数関数$log$は$(0, oo)$上で狭義単調増加なので、上の命題より
$
integral_1^n log x dd(x)+log 1 <= sum_(k = 1)^n log k <= integral_1^n log x dd(x)+log n
$
が成り立つ。
積分を計算すると
$
integral_1^n log x dd(x) = evaluated([x log x-x])_1^n = n log n-n+1
$
であるから、
$
n log n-n+1 <= log n! <= n log n-n+1+log n
$
である。
ここから例えば$n log n-n+1$で割れば$n -> oo$で
$
1 <= (log n!)/(n log n-n+1) <= 1+(log n)/(n log n-n+1) -> 1
$
となっている。
このため$log n!$は$n log n-n+1$で漸近近似されるというが、
階乗に直すと$n!$と$e (n/e)^n$で、その比は、$log n$のために、$1$以上$n$以下しかわからず漸近近似とは言いがたい。
そのため、今回の評価では$n!$は$e (n/e)^n$で対数漸近近似されるという。
]

より精密な和と積分の関係を得るために、台形公式を用いる。

#theorem([台形和公式])[
$M, N$を$M < N$を満たす整数とし、$f(x)$を区間$[M, N]$を含む開区間上の$C^2$級関数とする。
このとき、
$
sum_(n = M)^N f(n)
= integral_M^N f(x) dd(x)
  +(f(M)+f(N))/2
  -1/2 integral_M^N (x-floor(x))(x-floor(x)-1) f''(x) dd(x)
$
が成り立つ。
特に
$
abs(sum_(n = M)^N f(n)-integral_M^N f(x) dd(x)-(f(M)+f(N))/2)
<= 1/8 integral_M^N abs(f''(x)) dd(x)
$
が成り立つ。
]

#proof[
積分区間を分割して
$
integral_M^N f(x) dd(x)
= sum_(n = M)^(N-1) integral_n^(n+1) f(x) dd(x).
$
台形公式から
$
integral_n^(n+1) f(x) dd(x)
= (f(n)+f(n+1))/2
  +1/2 integral_n^(n+1) (x-n)(x-n-1) f''(x) dd(x).
$
ここで
$
sum_(n = M)^(N-1) (f(n)+f(n+1))/2
= sum_(n = M)^N f(n)-(f(M)+f(N))/2
$
に注意して、足し合わせるとほしかった式を得る。
]

#remark[
$f$が凸関数（または凹関数）の場合、$f''(x) >= 0$であり$(x-floor(x))(x-floor(x)-1) <= 0$なので、台形和公式の一番最後の項は非負である。
このことはより弱い仮定のもとで次のように表現される。
]

#proposition([凸な和の評価])[
$M, N$を$M < N$を満たす整数とし、$f(x)$を区間$[M, N]$上の連続関数とする。
- $f$が凸関数であるとき、
  $
  integral_M^N f(x) dd(x)+(f(M)+f(N))/2
  <= sum_(n = M)^N f(n) <=
  integral_(M+1/2)^(N-1/2) f(x) dd(x)+(f(M)+f(N))
  $
  が成り立つ。
- $f$が凹関数であるとき、
  $
  integral_(M+1/2)^(N-1/2) f(x) dd(x)+(f(M)+f(N))
  <= sum_(n = M)^N f(n) <=
  integral_M^N f(x) dd(x)+(f(M)+f(N))/2
  $
  が成り立つ。
]


#proof[
$f$が凸関数の場合を示す。
積分の上からの評価は積分区間を普通に分割して
$
integral_M^N f(x) dd(x)
= sum_(n = M)^(N-1) integral_n^(n+1) f(x) dd(x)
<= sum_(n = M)^(N-1) (f(n)+f(n+1))/2
= sum_(n = M)^N f(n)-(f(M)+f(N))/2.
$
積分の下からの評価は中点が整数値になるように積分区間を$1/2$ずらして分割して
$
integral_(M+1/2)^(N-1/2) f(x) dd(x)
= sum_(n = M+1)^(N-1) integral_(n-1/2)^(n+1/2) f(x) dd(x)
>= sum_(n = M+1)^(N-1) f(n)
= sum_(n = M)^N f(n)-(f(M)+f(N)).
$
よって整理してほしかった不等式を得る。

$f$が凹関数の場合も同様に示される（詳細省略）。
]

#example([階乗の漸近近似])[
階乗を台形和公式で評価する。
つまり$f(x) = log x$、$M = 1$、$N = n$とする。
出現する項は
$
integral_1^n log x dd(x) = n log n-n+1,
quad (log 1+log n)/2 = 1/2 log n,
quad integral_1^n 1/x^2 dd(x) = 1-1/n
$
である。
したがって、$f$は凹関数であることに注意すれば、
$
-1/8 (1-1/n) <= log n!-(n log n-n+1+1/2 log n) <= 0
$
が成り立つ。
ここから$log n!$の漸近近似として$n log n-n+1/2 log n$が得られて、
階乗に直すと$n!$と$sqrt(n) (n/e)^n$でその比は
$
exp(1-1/8 (1-1/n))
<= (n!)/(sqrt(n) (n/e)^n) <=
e
$
を満たし、有界な範囲に留まるので、
$n!$はだいたい$sqrt(n) (n/e)^n$と同じ速さで漸近近似される。
]

== 広義積分

有界閉区間とは限らない区間上の連続関数あるいは単調関数（広義単調増加関数と広義単調減少関数）に対する定積分である広義積分は区間を有界閉区間で近似することで定義される。
このとき、極限の有無によって広義積分での積分可能性が分かれることに注意する。

#definition([広義積分])[
$f$を開区間$(a, b)$ ($-oo <= a < b <= +oo$)上の関数であって、$(a, b)$内の任意の有界閉集合で積分可能とする。
ここで$a < c < b$に対して極限
$
lim_(t -> a+) integral_t^c f(x) dd(x),
quad lim_(t -> b-) integral_c^t f(x) dd(x)
$
の両方が存在するとき$f$は$(a, b)$上で_広義積分可能_であるまたは_広義積分が収束する_という。
また、その時の二つの極限の和を$f$の$(a, b)$上の_広義積分_といい、通常の定積分と同様に
$
integral_a^b f(x) dd(x)
$
で表す。
]

#remark[
1. 開区間$(a, b)$において、広義積分可能かどうかや広義積分の値は$c$の取り方によらない。
2. $f$が有界閉区間$[a, b]$で積分可能な場合は広義積分可能でもあり、その広義積分の値は通常の定積分の値と一致する。
  また、片方の端点で連続などである場合たとえば$[a, b)$で連続な場合は広義積分の極限は$t -> b-$のみ考慮すればよい。
]

次の命題は具体的な広義積分として重要であり、指数が$a = -1$のところで切り替わることは記憶するに値する。

#proposition[
$a$を実数とするとき、
$
integral_1^oo x^a dd(x)
= cases(
  +oo & (a >= -1)",",
  1/(-a-1) & (a < -1)","
)
quad
integral_0^1 x^a dd(x)
= cases(
  1/(a+1) & (a > -1)",",
  +oo & (a <= -1)
)
$
が成り立つ。
]

#proof[
前半は$a eq.not -1$のとき$t -> oo$で、
$
integral_1^t x^a dd(x)
= evaluated(1/(a+1) x^(a+1))_1^t
= 1/(a+1) t^(a+1)-1/(a+1)
-> cases(
  +oo & (a > -1)",",
  1/(-a-1) & (a < -1)"."
)
$
また、$a =-1$のときは
$
integral_1^t x^(-1) dd(x)
= evaluated(log x)_1^t
= log t
-> + oo.
$
後半は$a eq.not -1$のとき$t -> 0+$で、
$
integral_t^1 x^a dd(x)
= evaluated(1/(a+1) x^(a+1))_t^1
= 1/(a+1)-1/(a+1) t^(a+1)
-> cases(
  1/(a+1) & (a > -1)",",
  +oo & (a < -1)"."
)
$
また、$a = -1$のときは
$
integral_t^1 x^(-1) dd(x)
= evaluated(log x)_t^1
= -log t
-> +oo.
$
以上より示された。
]

以下では広義積分の値を追求するよりも収束するかどうかについて議論する。

#definition([広義積分の絶対収束])[
開区間$(a, b)$ ($-oo <= a < b <= +oo$)上の関数$f$に対して広義積分
$
integral_a^b abs(f(x)) dd(x)
$
が収束する時、$f$は$(a, b)$上で_絶対広義積分可能_または広義積分が_絶対収束_するという。
]

#remark[
広義積分が絶対収束する場合
$
integral_a^b abs(f(x)) dd(x) < oo
$
と表し、
絶対収束しない場合
$
integral_a^b abs(f(x)) dd(x) = oo
$
と表す。
]

#proposition[
$f$を開区間$(a, b)$上の関数として$(a, b)$上の有界閉区間で積分可能とする。
ここで$f$の広義積分が絶対収束するならばそれは収束している。
]

#proof[
$a < c < t < b$として、$t -> b$を考える。
ここで
$
F(t) = integral_c^t f(x) dd(x),
quad macron(F)(t) = integral_c^t abs(f(x)) dd(x)
$
とおくと、$c < s < b$に対して
$
F(t)-F(s)
= integral_s^t f(x) dd(x)
<= abs(integral_s^t abs(f(x)) dd(x))
= abs(macron(F)(t)-macron(F)(s)).
$
よって、$t$について上極限を$s$について下極限をそれぞれ取ると$macron(F)(s)$と$macron(F)(t)$は仮定より収束することに注意して、
$
limsup_(t -> b-) F(t)-liminf_(t -> b-) F(t)
<= lim_(t -> b-) macron(F)(t)-lim_(t -> b-) macron(F)(t)
= 0.
$
したがって上極限と下極限が一致するので$F(t)$さらには広義積分は収束する。
]

#proposition([広義積分の比較判定法])[
$f, g$を開区間$(a, b)$上の関数として$(a, b)$上の有界閉区間で積分可能とする。
さらに$g$は$(a, b)$上で非負値とする。

- 二つの条件
  $
  abs(f(x)) <= g(x) quad forall x in (a, b),
  quad integral_a^b g(x) dd(x) < oo
  $
  を満たす関数$g$が存在するならば、
  $f$の$(a, b)$上での広義積分は絶対収束し、
  $
  abs(integral_a^b f(x) dd(x))
  <= integral_a^b abs(f(x)) dd(x)
  <= integral_a^b g(x) dd(x)
  $
  が成り立つ。
- 二つの条件
  $
  abs(f(x)) >= g(x) quad forall x in (a, b),
  quad integral_a^b g(x) dd(x) = oo
  $
  を満たす関数$g$が存在するならば、
  $f$の$(a, b)$上での広義積分は絶対収束せず、
  $
  integral_a^b abs(f(x)) dd(x) = oo
  $
  である。
]

#remark[
この時の非負値関数$g$を$f$の_優関数_という。
]

#proof[
$a < s < c < t < b$として、$s -> a$と$t -> b$を考える。
$abs(f(x)) >= 0$より$integral_s^c abs(f(x)) dd(x)$は$s$について単調減少で$integral_c^t abs(f(x)) dd(x)$は$t$について単調増加であることに注意する。
- $abs(f(x)) <= g(x)$の場合は
  $
  integral_s^c abs(f(x)) dd(x)+integral_c^t abs(f(x)) dd(x)
  <= integral_s^t g(x) dd(x)
  <= integral_a^b g(x) dd(x) < oo
  $
  であるから、単調収束定理より最左辺の二項の極限が存在し、絶対収束とほしい不等式が得られる。
- $abs(f(x)) >= g(x)$の場合は、$integral_a^b g(x) dd(x) = oo$であり$integral_s^c g(x) dd(x) -> oo$または$integral_c^t g(x) dd(x) -> oo$なので、
  $
  integral_s^c abs(f(x)) dd(x)+integral_c^t abs(f(x)) dd(x)
  >= integral_s^t g(x) dd(x)
  -> oo
  $
  であり、絶対収束しないことがわかる。
]

#example[
広義積分
$
integral_(-oo)^(+oo) e^(-x^2) dd(x)
$
は絶対収束する。
実際
$
e^(-x^2) <= min { 1/(e x^2), 1 }
$
であることから従う（$e^(-x^2) <= e^(-1) x^(-2)$については@t_gauss_est 参照）。
]

#example[
広義積分
$
integral_0^oo (sin x)/x dd(x)
$
は収束するが、絶対収束しない。
このことについてはシンク関数の節を参照すること。
]
