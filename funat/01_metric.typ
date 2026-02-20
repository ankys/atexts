
= 完備距離空間

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof

== 距離空間

_距離空間_は二点$x, y$に対して_距離_$d(x, y)$が定義された集合$X$であり、距離は以下の条件を満たすとする。

1. （非負性と非退化性）任意の点$x, y in X$に対して$d(x, y) in [0, oo)$であり、$d(x, y) = 0$と$x = y$は同値である。
2. （対称性）任意の点$x, y in X$に対して$d(x, y) = d(y, x)$が成り立つ。
3. （三角不等式）任意の点$x, y, z in X$に対して$d(x, z) <= d(x, y)+d(y, z)$が成り立つ。

ここで$d$は実数値二変数関数$d: X times X -> RR$となっているため_距離関数_と呼ばれる。
また、距離空間$(X, d)$に対して$d$を_距離構造_と呼ぶこともある。
