
= 二次式

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof

== 二次形式

== 二次式と平方完成

#theorem([平方完成])[
$A$を$N$次対称正則行列、$bold(b), bold(x)$を$N$次ベクトル、$c$をスカラーとする時、
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
= (u_1-u_2)^2+(u_2-u_3)^2+(u_3-u_1)^2
= 2 u_1^2+2 u_2^2+2 u_3^2-2 u_1 u_2-2 u_2 u_3-2 u_3 u_1
$
とおく、このとき6つの実数$u_1, u_2, u_3, v_1, v_2, v_3$に対して、
$
E(u_1, v_2, v_3)+E(v_1, u_2, v_3)+E(v_1, v_2, u_3) >= 3/5 E(u_1, u_2, u_3) $
が成り立つことを示す。

左辺を$E$とおいて$v_1, v_2, v_3$についての二次式とみなすことで
$
E = vec(v_1, v_2, v_3)^T mat(4, -1, -1; -1, 4, -1; -1, -1, 4) vec(v_1, v_2, v_3)-2 vec(u_2+u_3, u_3+u_1, u_1+u_2)^T vec(v_1, v_2, v_3)+2(u_1^2+u_2^2+u_3^2).
$
ここで$A = mat(4, -1, -1; -1, 4, -1; -1, -1, 4)$の逆行列の計算が必要になり、掃き出し法を実行してもよいが、ここでは以下のように考えてみよう。
つまり、$X = mat(1, 1, 1; 1, 1, 1; 1, 1, 1)$とおくと、$A = 5 I-X$で$X^2 = 3 X$なので$A^2-7 A+10 I = O$、つまり
$ A^(-1) =-1/10 (A-7 I) = 1/10 (2 I+X) $ がわかる。
また、$A$は正定値であることに注意する。
ここで$bold(u) = vec(u_1, u_2, u_3)$, $bold(v) = vec(v_1, v_2, v_3)$とおくと、
$
E = A bold(v) dot bold(v)-2(X-I)bold(u) dot bold(v)+2 norm(bold(u))^2.
$
平方完成して$A$は正定値であることから、
$
E >= 2 norm(bold(u))^2-A^(-1) (X-I)bold(u) dot (X-I)bold(u).
$
ここで
$
(X-I) A^(-1) (X-I) = 1/10 (X-I)(2 I+X)(X-I) = 1/5 (3 X+I)
$
なので、
$
E = E(u_1, v_2, v_3)+E(v_1, u_2, v_3)+E(v_1, v_2, u_3)
>= 1/5 (9 I-3 X) bold(u) dot bold(u)
= 3/5 E(u_1, u_2, u_3)
$
である。
]
