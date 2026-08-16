
#metadata((
  title: "三角化",
  label: <h_lin1t_triangularization>,
)) <frontmatter>

#import "/deps/jtemplate.typ": jtemplate
#show: jtemplate

#import "/deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, remark, proof
#import "/deps/physics.typ": Set
#let Ker = $op("Ker")$

== フロベニウスの定理とケイリー・ハミルトンの定理

#theorem([フロベニウスの定理])[
$A$を$K$上の$N$次正方行列、$f(x)$を$K$上の多項式とする。
このとき、$A$の固有値$c in K$に対して、$f(c)$は$f(A)$の固有値である。
より詳しくは$A$の固有多項式が$c_1, dots, c_N in K$を使って@e_eigenfactor と因数分解されるならば、
$f(A)$の固有多項式は
$
det(x I-f(A)) = (x-f(c_1)) dots (x-f(c_N))
$
と因数分解される。
]

#proof[
$c$を$A$の固有値とするとき、$A bold(v) = c bold(v)$となるベクトル$bold(v) eq.not bold(0)$が取れる。
$n = 0, 1, 2, 3, dots$に対して、
$
A^n bold(v) = c^n bold(v)
$
であるからスカラー倍して和を取ることで、
$
f(A) bold(v) = f(c) bold(v)
$
である。
よって、$f(c)$は$f(A)$の固有値である。

$A$の固有多項式が@e_eigenfactor と因数分解されるとき、@t_tri より@e_tri と三角化される。
$n = 0, 1, 2, 3, dots$に対して、
$
A^n
= P mat(c_1, dots.c, *; , dots.down, dots.v; , , c_N)^n P^(-1)
= P mat(c_1^n, dots.c, *; , dots.down, dots.v; , , c_N^n) P^(-1)
$
であるからスカラー倍して和を取ることで、
$
f(A)
= P mat(f(c_1), dots.c, *; , dots.down, dots.v; , , f(c_N)) P^(-1)
$
である。
よって、@t_eigenfactor より、この定理の結論が従う。
]

#theorem([ケイリー・ハミルトンの定理])[
$A$を$K$上の$N$次正方行列として、固有多項式$f_A (x) = det(x I-A)$が@e_eigenfactor と因数分解されたとする。
このとき、$f_A (A) = O$が成り立つ。
]

#remark[
この定理は$det(x I-A)$の$x$に$A$を代入できると拡大解釈すれば$det(A I-A) = det O = 0$となり正しそうであるが、
実際の証明はしっかり$f_A (A)$の定義に則って行う必要がある。
]

#proof[
まず$A$が右上三角行列
$
T
= mat(c_1, dots.c, *; , dots.down, dots.v; , , c_N)
$
の場合に示す。 このとき固有多項式は
$
f_T (x) = (x-c_1) dots (x-c_N) $ であり、
$
f_T (T) = (T-c_1 I_N) dots (T-c_N I_N)
$
が成り立つ。
あとはこれが零行列であることを$N$についての数学的帰納法で示す。
$N = 1$の時は$T = mat(c_1)$なので$T-c_1 I_1 = O_1$である。
$N-1$で成立する時、
$
(T-c_1 I_N) dots (T-c_(N-1) I_N) = mat(O_(N-1), *; bold(0)_(N-1), *),
quad (T-c_N I_N) = mat(*, *; bold(0)_(N-1), 0)
$
なので、積を取ると零行列になる。
以上より$f_T (T) = O$である。
一般の$A$に対しては@t_tri より、$A$は@e_tri と三角化されて右上三角行列を$T$とおくと、
$f_A (x) = f_T (x) = (x-c_1) dots (x-c_N)$で
$
f_A (A) = P f_A (T) P^(- 1)
$
より、$f_A (A) = O$がわかる。
]

以上の二つの定理を使えば例えば以下のことがわかる。

#proposition([べき零行列])[
代数的閉体$K$上の$N$次正方行列$A$がある$n = 1, 2, 3, dots$で
$
A^n = O
$
を満たす時、$A^N = O$が成り立つ。
]

このような行列のことを#emph[べき零行列]という。

#proof[
$f(x) = x^n$とおいてフロベニウスの定理を用いると、$A$の固有値を$c in K$とおくと$f(c) = c^n$は$f(A) = A^n$の固有値である。
ここで$A^n = O$の固有値は$0$しかないので、$c^n = 0$がわかり$A$の固有値は全て$0$であることがわかる。
よって、$A$の固有多項式は$f_A (x) = x^N$であり、ケイリー・ハミルトンの定理より$f_A (A) = A^N = O$が従う。
]

べき零行列の重要な例は三角行列であって対角成分もすべて零であるような行列である。

#proposition([べき零行列の例])[
$T$を$K$上の$N$次正方行列であって対角成分がすべて零であるような右上三角行列とする。
つまり
$
T = mat(0, dots.c, *; , dots.down, dots.v; , , 0)
$
とするとき、$T^N = O$が成り立つ。
]

#proof[
$T$の固有多項式を計算すると$f_T (x) = x^N$であるから、ケイリー・ハミルトンの定理より$f_T (T) = T^N = O$が従う。
]

なお、実はべき零行列は三角化したら対角成分がすべて零になるような行列である。

== 広義固有空間

固有多項式の零点の重複度（代数的重複度）と固有空間の次数（幾何学的重複度）には差がある可能性があるのであった。
その差を埋めるにはどうすればいいだろうか。
そのためのアイデアが固有空間を拡張した広義固有空間である。

#definition([広義固有空間])[
$A$を$K$上の$N$次正方行列として、$x in K$と$n = 0, 1, 2, 3, dots$に対して
$
W^n (x) = Ker (x I-A)^n = Set(bold(v) in K^N; (x I-A)^n bold(v) = bold(0))
$
と定める。
固有値$x = c$に対して$W^n (c)$をまとめて$A$の固有値$c$に対する_広義固有空間_という。
]

$W^n (x)$は$n$が大きくなるにつれて大きくなる$K^N$の部分空間であり、
$
W^0 (x) = O_(K^N) subset W^1 (x) = W(x) subset W^2 (x) subset W^3 (x) subset dots subset K^N
$
が成り立つ。

#theorem([広義固有空間分解])[
$A$を$K$上の$N$次元正方行列として、$c_1, dots, c_L in K$を相異なる固有値とし、$A$の固有多項式が
$
det(x I-A) = (x-c_1)^(n_1) dots (x-c_L)^(n_L),
quad n_1+dots+n_L = N
$
と因数分解されるとする。
このとき各$i = 1, dots, L$に対して$dim W^(n_i) (c_i) = n_i$であり、
$
W^(n_1) (c_1) plus.o dots plus.o W^(n_L) (c_L) = K^N
$
が成り立つ。
]

#proof[
固有値$c = c_i$に対して代数的重複度を$n = n_i$とおく。
ここで@t_tri より、必要ならば行の入れ替えを行うことで$A$は対角成分がすべて$c$の$n$次三角行列$S$と対角成分がどれも$c$でない$N-n$次三角行列$T$を使って
$
A = P mat(S, *; O, T) P^(-1)
$
と三角化される。
このとき$c I-S$は対角成分がすべて$0$の$n$次三角行列であるから、
$
c I-A = P mat(c I-S, *; O, c I-T) P^(-1),
$
$
(c I-A)^n = P mat((c I-S)^n, *; O, (c I-T)^n) P^(-1) = P mat(O, *; O, (c I-T)^n) P^(-1)
$
となる。
一方で$c I-T$は可逆であるから$(c I-T)^n$も可逆であり、
$
W^(n) (c) = Ker (c I-A)^n = Set(P mat(bold(v); bold(0)); bold(v) in K^n)
$
なので$dim W^(n) (c) = n$がわかる。
]

== ジョルダン標準形
