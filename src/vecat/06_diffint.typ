
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

== ライプニッツの積分法則

積分領域が微分する変数に依存する場合はライプニッツの積分法則と呼ばれ、
微分と積分が交換されるだけでなく積分領域の変化に伴う境界積分型の項も現れる。

それを見るためにまずは$x$について一次元で積分区間が$t$に依存する$[a(t), b(t)]$として$f$が$t$によらない場合を考え、次の微分を計算する。
$
dv(, t) integral_(a(t))^(b(t)) f(x) dd(x).
$
$f$の原始関数の存在を仮定して$F$を$f$の原始関数とすると、上の式は
$
dv(, t) integral_(a(t))^(b(t)) f(x) dd(x)
&= dv(, t) (F(b(t))-F(a(t))) \
&= F'(b(t))b'(t)-F'(a(t))a'(t)
= f(b(t))b'(t)-f(a(t))a'(t)
$
と計算される。

以下ではこの結果を$x$が高次元空間にある場合に拡張する。

#theorem([ライプニッツの積分法則])[
$f(x, t)$を$C^1$級の二変数関数とし、$X(t)$を$t$に依存する$C^1$級な境界を持つ有界開集合とする。
このとき、$v(x, t)$を境界の点$x$における境界の法線方向速度として
$
dv(, t) integral_(X(t)) f(x, t) dd(x)
= integral_(X(t)) f_t (x, t) dd(x)+integral_(partial X(t)) f(x, t)v(x, t) dd(S(x))
$
が成り立つ。
より正確にはパラメータ付き$C^1$級座標変換$Phi(t)$と$C^1$級な境界を持つ有界開集合$U$を用いて$X(t) = Phi(t)(U)$と表すと、上の式は
$
dv(, t) integral_(X(t)) f(x, t) dd(x)
= integral_(X(t)) f_t (x, t) dd(x)+integral_(partial X(t)) f(x, t) Phi_t (t)(Phi(t)^(-1)(x)) dot bold(n)(t)(x) dd(S(x))
$
と表される。
]
