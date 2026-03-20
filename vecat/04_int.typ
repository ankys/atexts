
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": grad, div, curl, laplacian, dd, dv
#let opgrad = $op("grad")$
#let opdiv = $op("div")$
#let opcurl = $op("curl")$
#let oprot = $op("rot")$
#let hesse = $op("H")$

= 積分

== 場の積分

ベクトル解析における積分の基礎はスカラー場つまり点集合からスカラー値の関数の積分であり、
積分領域が有界開集合の閉包の場合、その定義は多変数関数の重積分と同じである。
正確な定義は@r_cal3t を参照するとして、積分領域を$X$、スカラー場$f = f(x)$に対して積分
$
integral_X f(x) dd(x)
$
が定義され、
微分積分学の基本定理や線形性、単調性、置換積分や変数変換の公式、累次積分や極限と積分の交換など十分よい性質を満たしているとする。

この積分をベクトル場のようにベクトル値や行列値の関数に拡張することは容易である。
つまり各成分ごとに積分を実行すれば良い。
つまり$N$次元ベクトル値の関数$bold(f)(x) = vec(f_1 (x), dots.v, f_N (x))$に対して積分は
$
integral_X bold(f)(x) dd(x) = vec(integral_X f_1 (x) dd(x), dots.v, integral_X f_N (x) dd(x))
$
と、$M times N$行列値の関数$F(x) = mat(f_(1 1) (x), dots.c, f_(1 N) (x); dots.v, dots.down, dots.v; f_(M 1) (x), dots.c, f_(M N) (x))$に対しては
$
integral_X F(x) dd(x)
= mat(
	integral_X f_(1 1) (x) dd(x), dots.c, integral_X f_(1 N) (x) dd(x);
	dots.v, dots.down, dots.v;
	integral_X f_(M 1) (x) dd(x), dots.c, integral_X f_(M N) (x) dd(x);
)
$
と定義される。

その一方でやっかいなのが積分領域$X$の扱いである。
上述の通り積分領域が有界開集合の閉包のような、関数の定義域の次元と等しい次元の場合は重積分が採用されるが、
その境界$partial X$では一般に被積分関数の値が無視されて重積分の値は常に$0$となる。

しかしながら、この境界上の積分にも何らかの意味を持たせて積分値を定義したい。
というのも微分積分学の基本定理の拡張としてスカラー場の勾配やベクトル場の発散の重積分を境界上の積分に落とし込みたいためである。
このような境界上の積分を総称して本テキストでは_境界積分_と呼ぶことにする。

注意しなければならないのは一口に境界と言ってもその実態はさまざまで、球に対して球面のように明らかに次元が一つ下がるものもあれば、コッホ曲線のようなフラクタルなどと呼ばれる図形が現れる場合もある。
本テキストではフラクタルは除いて$N$次元空間の中で$N-1$個のパラメータで定義されるような曲面を積分領域にするような面積分と、
$1$個のパラメータで定義される曲線を積分領域にするような線積分を中心に扱う。
これらに加えて有界開集合の閉包のような$N$個のパラメータで定義される場合を体積分、
有限個の点を積分領域にするような場合を点積分と呼ぶことにする。
つまり体積分、面積分、線積分、点積分はそれぞれ次元$N$、$N-1$、$1$、$0$の積分である。
それぞれ
$
integral_X f(x) dd(V(x)),
quad integral_X f(x) dd(S(x)),
quad integral_X f(x) dd(l(x)),
quad integral_X f(x) dd(c(x))
$
などと表現され、
$V, S, l, c$はそれぞれ体素、面素、線素、点素と呼ばれるが、
$X$を見ればそれがそれがどの積分か判定できるので、$V, S, l, c$は省略されうる。
また、積分する変数$x$もわかる場合には$dd(x)$は省略されることに注意する。

== 線積分

線積分は$N$次元空間の中で$1$個のパラメータで定義される曲線を積分領域にするような積分である。
特にスカラー場の線積分は曲線のグラフがなすカーテン状の領域の面積を求めるような積分である。
$N$次元空間上の曲線を$c(t)$ ($t in [a, b]$)とする。

$N$次元スカラー場$f$に対する線積分は次のように定義される。
$
integral_c f
= integral_a^b f(c(t)) abs(dot(c)(t)) dd(t).
$

この積分は曲線のパラメータの取り方によらない。
#proposition([スカラー場に対する線積分のパラメータの独立性])[
$phi = phi(tau): [alpha, beta] |-> [a, b]$, $phi(alpha) = a$, $phi(beta) = b$をパラメータの取り替えとすると、
$
integral_(c compose phi) f = integral_c f
$
が成り立つ。
]
#proof[
計算すると合成関数の微分法$dv(, tau)(c compose phi)(tau) = dot(c)(phi(tau))dot(phi)(tau)$と置換積分$t = phi(tau)$より
$
integral_(c compose phi) f
= integral_alpha^beta f(c(phi(tau))) abs(dot(c)(phi(tau))) dot(phi)(tau) dd(tau)
= integral_a^b f(c(t)) abs(dot(c)(t)) dd(t)
= integral_c f
$
である。
]

そのため点集合としての曲線$C$を与えるとその上の線積分が一意に定義され、
$
integral_C f = integral_c f
$
と表記される。
具体的な値を求める場合には曲線$C$のパラメータ表示$c(t)$を与えて計算すればよい。

$N$次元ベクトル場$bold(f)$に対する線積分は次のように定義される。
$
integral_c bold(f)
= integral_a^b bold(f)(c(t)) dot dot(c)(t) dd(t).
$

この積分も曲線のパラメータの取り方によらない。
#proposition([ベクトル場に対する線積分のパラメータの独立性])[
$phi = phi(tau): [alpha, beta] |-> [a, b]$, $phi(alpha) = a$, $phi(beta) = b$をパラメータの取り替えとすると、
$
integral_(c compose phi) bold(f) = integral_c bold(f)
$
が成り立つ。
]
#proof[
計算すると合成関数の微分法$dv(, tau)(c compose phi)(tau) = dot(c)(phi(tau))dot(phi)(tau)$と置換積分$t = phi(tau)$より
$
integral_(c compose phi) bold(f)
= integral_alpha^beta bold(f)(c(phi(tau))) dot dot(c)(phi(tau)) dot(phi)(tau) dd(tau)
= integral_a^b bold(f)(c(t)) dot dot(c)(t) dd(t)
= integral_c bold(f)
$
である。
]

こちらも点集合としての曲線$C$（と始点・終点）を与えるとその上の線積分が一意に定義され、
$
integral_C bold(f) = integral_c bold(f)
$
と表記される。
具体的な値を求める場合には曲線$C$のパラメータ表示$c(t)$を与えて計算すればよい。

曲線の始点と終点が同じである閉曲線の場合、つまり$c(a) = c(b)$の場合は線積分は_周回積分_と呼ばれ、
$
integral.cont_C f,
quad integral.cont_C bold(f)
$
と表す。

== 面積分
