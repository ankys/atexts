
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": grad, div, curl, laplacian, dd, dv
#let opgrad = $op("grad")$
#let opdiv = $op("div")$
#let opcurl = $op("curl")$
#let oprot = $op("rot")$
#let hesse = $op("H")$

= 微分の積分

== 勾配定理

勾配定理はスカラー場の勾配ベクトル場の線積分をそのスカラー場の値の差に帰着させる定理である。

#theorem([勾配定理])[
$f$を$C^1$級の$N$次元スカラー場として、$C$を$N$次元空間上の曲線で始点を$P$、終点を$Q$とするものとする。
このとき、
$
integral_C grad f = f(Q)-f(P)
$
が成り立つ。
]

#proof[
$C$のパラメータ表示を$c(t)$ ($c(a) = P$, $c(b) = Q$)とすると、合成関数の微分法$dv(, t)(f compose c)(t) = grad f(c(t)) dot dot(c)(t)$と一変数関数に対する微分積分学の基本定理より
$
integral_C grad f
= integral_a^b grad f(c(t)) dot dot(c)(t) dd(t)
= integral_a^b dv(, t)(f compose c)(t) dd(t)
= (f compose c)(b)-(f compose c)(a)
= f(Q)-f(P)
$
である。
]

== ガウス・グリーンの定理

ガウス・グリーンの定理はスカラー場の勾配ベクトル場の体積分をその境界上の面積分に帰着させる定理であり、
微分積分学の基本定理の多次元への直接の拡張といえる。

#theorem([ガウス・グリーンの定理])[
$f$を$C^1$級の$N$次元スカラー場として、$X$を$C^1$級な境界を持つ有界開集合とする。
このとき、$i = 1, dots, N$に対して各成分ごとに
$
integral_X f_(x_i) = integral_(partial X) f n_i
$
が成り立つ。
まとめると
$
integral_X grad f = integral_(partial X) f bold(n)
$
である。
]

== ガウスの発散定理

ガウスの発散定理はベクトル場の発散の体積分をその境界上の面積分に帰着させる定理である。

#theorem([ガウスの発散定理])[
$bold(f)$を$C^1$級の$N$次元ベクトル場として、$X$を$C^1$級な境界を持つ有界開集合とする。
このとき、
$
integral_X div bold(f) = integral_(partial X) bold(f) dot bold(n)
$
が成り立つ。
]

#proof[
ガウス・グリーンの定理を用いることで$bold(f) = vec(f^1, dots.v, f^N)$として
$
integral_X div bold(f)
= sum_i integral_X f^i_(x_i)
= sum_i integral_(partial X) f^i n_i
= integral_(partial X) bold(f) dot bold(n)
$
である。
]
