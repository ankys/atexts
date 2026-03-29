
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": grad, div, curl, laplacian, dd, dv
#let opgrad = $op("grad")$
#let opdiv = $op("div")$
#let opcurl = $op("curl")$
#let oprot = $op("rot")$
#let hesse = $op("H")$

= 積分の微分

== 積分記号下での微分

本章では二変数関数$f(x, t)$を片方の変数$x$に関して積分したものを、もう片方の変数$t$に関して微分することを考える。
基礎となるのは次の積分領域が固定されている場合の定理であり、その後に積分領域も変化する場合の定理を述べる。

#theorem([積分記号下での微分])[
$f(x, t)$を$C^1$級の二変数関数とし、$X$を$C^1$級な境界を持つ有界開集合とする。
このとき、
$
dv(, t) integral_X f(x, t) dd(x)
= integral_X f_t (x, t) dd(x)
$
が成り立つ。
]

すなわちこの場合は積分と微分が交換される。

#proof[
微分と積分の交換の定理が使えて示される。
]
