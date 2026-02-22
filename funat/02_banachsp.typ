
= バナッハ空間

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof

== ノルム空間

連続関数の空間$C(X, RR)$のような関数の空間は距離構造が入るだけでなく、和やスカラー倍のような線形構造も入りより豊かな構造を持つ。
そのような線形構造に基づく距離構造を持った空間としてノルム空間を導入し、さらにノルム空間の中で完備なものをバナッハ空間と呼ぶ。

$K$を実数体$RR$または複素数体$CC$として、スカラー$c in K$に対して絶対値$abs(c) in RR_+ := [0, oo)$が定義されているとする。
_ノルム空間_はベクトル$x$に対して_ノルム_$norm(x)$が定義された$K$線形空間$X$であり、ノルムは以下の条件を満たすとする。

1. （非負値性）任意のベクトル$x in X$に対して$norm(x) in RR_+ := [0, oo)$が成り立つ。
2. （非退化性）任意のベクトル$x in X$に対して$norm(x) = 0$と$x = 0$は同値である。
3. （斉次性）任意のベクトル$x in X$とスカラー$c in K$に対して$norm(c x) = abs(c)norm(x)$が成り立つ。
4. （三角不等式）任意のベクトル$x, y in X$に対して$norm(x+y) <= norm(x)+norm(y)$が成り立つ。

このノルム構造は距離構造を導く。

#proposition([ノルムと距離])[
ノルム空間$(X, norm(dot))$に対して距離を$x, y in X$に対して
$
d(x, y) := norm(y-x)
$
で定めると、$(X, d)$は距離空間である。
]

#proof[
距離の非負値性と非退化性は自然に従う。
対称性はノルムの斉次性から
$
d(y, x) = norm(x-y) = norm(-(y-x)) = abs(-1)norm(y-x) = norm(y-x) = d(x, y)
$
であるから従う。
三角不等式はノルムの三角不等式から
$
d(x, z)
= norm(z-x)
= norm((z-y)+(y-x))
<= norm(z-y)+norm(y-x)
= d(x, y)+d(y, z)
$
なので従う。
]
