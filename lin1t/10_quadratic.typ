
= 二次式

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": super-T-as-transpose
#show: super-T-as-transpose

== 二次式と二次形式

一変数の二次式といえば$a x^2+b x+c$の形をした式である。
ただし、$b/2$を$b$で置き直して、一次の項に係数$2$をつけた$a x^2+2 b x+c$の形で考えることも多い。

$N$変数$bold(x) = vec(x_1, dots.v, x_N)$の_二次式_は$N$次正方行列$A$と$N$次ベクトル$bold(b)$、スカラー$c$を用いてスカラー積$dot$により
$
A bold(x) dot bold(x)+2 bold(b) dot bold(x)+c
$
の形で表される式である。
ここで$i, j = 1, dots, N$に対して$x_i x_j = x_j x_i$であることから
$
A bold(x) dot bold(x)+2 bold(b) dot bold(x)+c
= (A+A^T)/2 bold(x) dot bold(x)+2 bold(b) dot bold(x)+c
$
とできるため、$A$は対称行列であると考えても差し支えない。

さらに二次式の中でも一次の部分$2 bold(b) dot bold(x)$と定数項$c$がないものを二次形式と呼ぶ。
つまり、$N$変数$bold(x) = vec(x_1, dots.v, x_N)$の_二次形式_は$N$次対称行列$A$を用いて
$
A bold(x) dot bold(x)
$
の形で表される式である。

== 二次式と平方完成

平方完成とは一変数の場合には$a eq.not 0$の時に
$
a x^2+2 b x+c
= a(x+b/a)^2+c-b^2/a
$
と変形することをいう。
二次式の場合には以下の定理が成り立つ。

#theorem([平方完成])[
$A$を$N$次対称正則行列で$bold(b), bold(x)$を$N$次ベクトル、$c$をスカラーとする時、
$
A bold(x) dot bold(x)+2 bold(b) dot bold(x)+c
= A(bold(x)+A^(-1) bold(b)) dot (bold(x)+A^(-1) bold(b))+c-A^(-1) bold(b) dot bold(b)
$
が成り立つ。
]

#example[
3つの実数$u_1, u_2, u_3$に対して
$
E(u_1, u_2, u_3)
&= (u_1-u_2)^2+(u_2-u_3)^2+(u_3-u_1)^2 \
&= 2 u_1^2+2 u_2^2+2 u_3^2-2 u_1 u_2-2 u_2 u_3-2 u_3 u_1
$
とおく、このとき6つの実数$u_1, u_2, u_3, v_1, v_2, v_3$に対して、
$
E(u_1, v_2, v_3)+E(v_1, u_2, v_3)+E(v_1, v_2, u_3) >= 3/5 E(u_1, u_2, u_3) $
が成り立つことを示す。

左辺を$E$とおいて$v_1, v_2, v_3$についての二次式とみなすことで
$
E = mat(4, -1, -1; -1, 4, -1; -1, -1, 4) vec(v_1, v_2, v_3) dot vec(v_1, v_2, v_3)-2 vec(u_2+u_3, u_3+u_1, u_1+u_2) dot vec(v_1, v_2, v_3)+2(u_1^2+u_2^2+u_3^2).
$
ここで$A = mat(4, -1, -1; -1, 4, -1; -1, -1, 4)$の逆行列の計算が必要になり、掃き出し法を実行してもよいが、ここでは以下のように考えてみよう。
つまり、$X = mat(1, 1, 1; 1, 1, 1; 1, 1, 1)$とおくと、$A = 5 I-X$で$X^2 = 3 X$なので$A^2-7 A+10 I = O$、つまり
$
A^(-1) =-1/10 (A-7 I) = 1/10 (2 I+X)
$
がわかる。
また、$A$は正定値であることに注意する。
ここで$bold(u) = vec(u_1, u_2, u_3)$, $bold(v) = vec(v_1, v_2, v_3)$とおくと、
$
E = A bold(v) dot bold(v)-2(X-I)bold(u) dot bold(v)+2 norm(bold(u))^2.
$
平方完成して、$A$は正定値であることから
$
E >= 2 norm(bold(u))^2-A^(-1) (X-I)bold(u) dot (X-I)bold(u)
$
である。
ここで
$
(X-I) A^(-1) (X-I) = 1/10 (X-I)(2 I+X)(X-I) = 1/5 (3 X+I)
$
なので、
$
E
&= E(u_1, v_2, v_3)+E(v_1, u_2, v_3)+E(v_1, v_2, u_3) \
&>= 1/5 (9 I-3 X) bold(u) dot bold(u)
= 3/5 E(u_1, u_2, u_3)
$
が得られる。
]
