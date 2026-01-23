
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#let proj = $op("proj")$

= 組

== 組と直積

$N$個の集合$X_1, dots, X_N$を考える($N = 1, 2, 3, dots$)。
それぞれの集合から元$x_1 in X_1, dots, x_N in X_N$を取り出し、この順に並べた$(x_1, dots, x_N)$を$x_1, dots, x_N$の順序組あるいは単に_組_という。
特に$N = 2$のときは組の代わりに_対_と呼ぶことがある。

二つの組$(x_1, dots, x_N)$と$(y_1, dots, y_N)$が等しいのは$x_1 = y_1$から$x_N = y_N$のすべてが成り立つ場合である。
ここに順序を無視する集合の外延記法${ x_1, dots, x_N }$と組$(x_1, dots, x_N)$の大きな違いがある。
一方で数列の記法$(x_n)_n$も組$(x_1, dots, x_N)$と同様に順序を持つので同じ丸かっこを使って表現されるが、数列の各元は同一の集合の元であるのに対して、組の集合は$X_1$から$X_N$の中で異なるものがあっても許されているという違いがある。

組$(x_1, dots, x_N)$全体からなる集合を$X_1, dots, X_N$の_直積_といい$X_1 times dots times X_N$と表す。
「積」と呼ばれるのは元の個数を考えると、$X_1, dots, X_N$が有限集合でそれぞれ$m_1, dots, m_N$個の元からなる場合$X_1 times dots times X_N$も有限集合で元の個数は積$m_1 times dots times m_N$になることによる。

各集合$X_1, dots, X_N$が同一の集合$X$であるとき、それらの直積$X_1 times dots times X_N = X times dots times X$を簡単に$X^N$と表すことにする。
また、$N = 1$のときの$X^1$は$X$と同一視する。

== 多変数写像

$X_1, dots, X_N, Y$を集合として、元$x_1 in X_1, dots, x_N in X_N$に対して$Y$の一つの元$y$が対応する場合、この対応（写像）のことを多変数写像という。
多変数写像を
$
F: X_1 times dots times X_N -> Y
$
や
$
F: x_1 in X_1, dots, x_N in X_N |-> y in Y
$
と表す。
また、組$(x_1, dots, x_N)$に対して対応する$y$のことを$F(x_1, dots, x_N)$と書き、多変数写像$F$のことを$F(x_1, dots, x_N)$や$y = F(x_1, dots, x_N)$などと書くこともある。
このように多変数写像は直積や組の概念と密接な関係を持つ。
より一般に直積$X_1 times dots times X_N$の部分集合$U$の元から$Y$の元への対応も多変数写像といい、
$
F: U -> Y
$
や
$
F: (x_1, dots, x_N) in U |-> y in Y
$
などと表す。

#example([射影])[
単純だが基礎的な多変数写像は_射影_であり、
$i = 1, dots, N$に対して
$
proj_i: x_1 in X_1, dots, x_N in X_N |-> x_i in X_i.
$
として定義される。
]

写像の行き先$Y$が$RR$のような数の集合の場合、写像$F$は_多変数関数_と呼ばれる。
その中でも$N = 2$の二変数関数の典型例は加減乗除のような演算子である。
つまり以下は二変数関数とみなすことができる。

+ $+ : x in RR, y in RR |-> x+y in RR$.
+ $- : x in RR, y in RR |-> x-y in RR$.
+ $times : x in RR, y in RR |-> x y in RR$.
+ $div: x in RR, y in RR\\{0} |-> x/y in RR$.
+ $max: x in RR, y in RR |-> max{ x, y } in RR$.
+ $min: x in RR, y in RR |-> min{ x, y } in RR$.

== 変換

写像$F$の中でも定義域と行き先が同じ集合$X$であるものを$X$上の_変換_という。

#example([極座標変換])[
平面（後で導入する）上の変換$(x, y) = F (r, theta)$を
$
x = a+r cos theta, quad y = b+r sin theta
$
で定めると、
これはしばしば点$(a, b)$を中心とする_極座標変換_と呼ばれる。
]
