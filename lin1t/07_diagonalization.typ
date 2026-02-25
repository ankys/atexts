
= 対角化

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": Set, braket
#let Span = $op("Span")$
#let Re = $op("Re")$

== 共役と内積

この章では対角化の十分条件などを与えるために線形空間に内積の構造を（入れられる場合に）入れる。
また、複素数体上の線形空間に内積を入れるために共役の概念も合わせて導入する。

#definition([共役と内積])[
$V$を$K$上の線形空間とする。
次を満たす対応$overline(dot): K -> K$と$braket(dot, dot): V times V -> K$をそれぞれ$K$上の_共役_と$V$上の_内積_といい、$V$を_内積空間_という。

+ （第二変数に関する線形性）任意の$c, d in K$と$bold(u), bold(v), bold(w) in V$に対して、$braket(bold(u), c bold(v)+d bold(w)) = c braket(bold(u), bold(v))+d braket(bold(u), bold(w))$が成り立つ。
+ （非退化性）$bold(v) in V$が$braket(bold(v), bold(v)) = 0$を満たすならば$bold(v) = bold(0)$である。
+ （共役対称性）任意の$bold(u), bold(v) in V$に対して、$braket(bold(v), bold(u)) = overline(braket(bold(u), bold(v)))$が成り立つ。
+ （加法の共役）任意の$a, b in K$に対して、$overline(a+b) = overline(a)+overline(b)$が成り立つ。
+ （乗法の共役）任意の$a, b in K$に対して、$overline(a dot b) = overline(a) dot overline(b)$が成り立つ。
]

本テキストでは執筆上の都合で内積のみブラケット記法$braket(bold(u), bold(v))$を用いる。

#remark[
内積の第一変数に関する線形性について
$
braket(c bold(v)+d bold(w), bold(u))
= overline(braket(bold(u), c bold(v)+d bold(w)))
= overline(c braket(bold(u), bold(v))+d braket(bold(u), bold(w)))
= overline(c)overline(braket(bold(u), bold(v)))+overline(d)overline(braket(bold(u), bold(w)))
= overline(c)braket(bold(v), bold(u))+overline(d)braket(bold(w), bold(u))
$
が成り立ち、共役線形性などと呼ばれる。
]

#remark[
共役について、$overline(0) = 0$と$overline(1)^2 = overline(1)$がわかる。
$overline(1) = 0$だとすると、任意の$a in K$に対して$overline(a) = 0 dot overline(a) = 0$で、
共役対称性から$braket(bold(v), bold(u)) = 0$で非退化性から$V = O$以外あり得ない。
なので$V$が自明な線形空間でない時は$overline(1) = 1$である。
また、共役対称性より二回共役を取ると$overline(overline(braket(bold(u), bold(v)))) = braket(bold(u), bold(v))$が成り立ち、内積は全射になるので、任意の$a in K$に対して
$
overline(overline(a)) = a
$
が成り立つ。
]

スカラー$K$に共役の構造が入ったら、数ベクトル$bold(v) = (v_1, dots, v_N) in K^N$と行列$A = (a_(i j))^(i = 1, dots, M)_(j = 1, dots, N)$に対する共役を成分ごとに共役をとったもの
$
overline(bold(v)) = (overline(v_1), dots, overline(v_N)),
quad
overline(A) = mat(overline(a_(1 1)), dots.c, overline(a_(1 N)); dots.v, dots.down, dots.v; overline(a_(M 1)), dots.c, overline(a_(M N));)
$
として定められる。

数ベクトル空間$K^N$上の内積をスカラー積を使って
$
braket(bold(u), bold(v))
= overline(bold(u)) dot bold(v)
= overline(u_1) v_1+dots+overline(u_N) v_N
$
として定めたものを$K^N$の_標準内積_という。
ただし、標準内積がちゃんと内積になっているかは非退化性の条件が成り立っているかどうか確認する必要がある。

#definition([非退化な体])[
共役が定義される体$K$が_非退化_であるとは、任意の$n = 1, 2, 3, dots$と任意の$n$個のスカラー$c_1, dots, c_n in K$について
$
overline(c_1) c_1+dots+overline(c_n) c_n = 0
$
ならば、$c_1 = dots = c_n = 0$が成り立つことをいう。
]

非退化な体$K$上では任意の$N = 1, 2, 3, dots$に対して数ベクトル空間$K^N$は標準内積について内積空間になる。

#example[
実数体$RR$上の共役を$overline(a) = a$で定めるとこれは非退化である。
]

#example[
複素数体$CC$上の共役を_複素共役_$overline(a+b i) = a-b i$で定めるとこれは非退化である。
]

#example[
一般の非退化とは限らない体$K$上の共役を$overline(a) = a$で定め、$K$を$K$上の線形空間として見た時内積を単なる積$braket(u, v) = u v$で定めると$K$は内積空間になる。
つまり、$N = 1$の時$CC^N$は二通りの内積の入れ方があることになる。
]

== シュミットの直交化

内積空間$V$上の二つのベクトル$bold(u)$と$bold(v)$が_直交する_とは
$
braket(bold(u), bold(v)) = 0
$
が成り立つことをいう。
定義上は$bold(u) = bold(0)$または$bold(v) = bold(0)$が成り立っていたら$bold(u)$と$bold(v)$は必ず直交している。
また、ベクトル$bold(v)$が_単位ベクトル_とは
$
braket(bold(v), bold(v)) = 1
$
が成り立つことをいう。

$V$の基底$bold(v)_1, dots, bold(v)_N$が各$i eq.not j$, $i, j = 1, dots, N$に対して$bold(v)_i$と$bold(v)_j$が直交することを満たす時、_直交基底_であるという。
直交基底がさらに各$i = 1, dots, N$に対して$bold(v)_i$が単位ベクトルである時、_正規直交基底_であるという。

本節の目標は$V$の基底が与えられた時に直交基底あるいは正規直交基底に取り替えることである。
そのことを表現するために$V$の$N = 1, dots$個の零ベクトルでないベクトル$bold(v)_1, dots, bold(v)_N$が各$i eq.not j$, $i, j = 1, dots, N$に対して$bold(v)_i$と$bold(v)_j$が直交することを満たす時、$V$の_直交系_であるということにする。
また、各$bold(v)_i$が単位ベクトルである時、$V$の_正規直交系_であるという。

#proposition([直交系と線形独立])[
$bold(v)_1, dots, bold(v)_N$を$K$上の内積空間$V$の直交系とする時、それらは線形独立である。
]

#proof[
スカラー$c_1, dots, c_N in K$に対して
$
c_1 bold(v)_1+dots+c_N bold(v)_N = bold(0)
$
が成り立ったとする時、各$i = 1, dots, N$に対して、$bold(v)_i$との内積を取って
$
braket(bold(v)_i, c_1 bold(v)_1+dots+c_N bold(v)_N)
= c_i braket(bold(v)_i, bold(v)_i)
= 0.
$
よって$c_i = 0$なので、$bold(v)_1, dots, bold(v)_N$は線形独立である。
]

この命題とその証明から内積空間$V$の直交系$bold(v)_1, dots, bold(v)_N$が与えられるとそれは線形独立で$V$の線形部分空間$W = Span(bold(v)_1, dots, bold(v)_N)$が得られる。
そのベクトル$bold(v) = c_1 bold(v)_1+dots+c_N bold(v)_N in W$と$i = 1, dots, N$に対して、$bold(v)_i$との内積を取ると$braket(bold(v)_i, bold(v)) = c_i braket(bold(v)_i, bold(v)_i)$でありこのスカラー値$c_i$のことを$bold(v)$の$bold(v)_i$_成分_と呼ぶ。

逆に線形独立なベクトルが与えられたときに成分を引くことで直交系を構成するというのがシュミットの直交化である。

#theorem([シュミットの直交化])[
$V$を内積空間として$bold(v)_1, dots, bold(v)_N$を線形独立なベクトルとして、次の方法によって$V$の新しいベクトル$bold(u)_1, dots, bold(u)_N$を構成する。
$
&
bold(u)_1 = bold(v)_1,
quad
bold(u)_2 = bold(v)_2-braket(bold(u)_1, bold(v)_2)/braket(bold(u)_1, bold(u)_1) bold(u)_1,
quad
bold(u)_3 = bold(v)_3-braket(bold(u)_1, bold(v)_3)/braket(bold(u)_1, bold(u)_1) bold(u)_1-braket(bold(u)_2, bold(v)_3)/braket(bold(u)_2, bold(u)_2) bold(u)_2, \
&quad dots,
quad
bold(u)_N = bold(v)_N-braket(bold(u)_1, bold(v)_N)/braket(bold(u)_1, bold(u)_1) bold(u)_1-dots-braket(bold(u)_(N-1), bold(v)_N)/braket(bold(u)_(N-1), bold(u)_(N-1)) bold(u)_(N-1).
$
このとき$bold(u)_1, dots, bold(u)_N$は$V$の直交系であり、$Span(bold(u)_1, dots, bold(u)_N) = Span(bold(v)_1, dots, bold(v)_N)$が成り立つ。
]

#proof[
$N$についての数学的帰納法による。
$N = 1$の時、$bold(u)_1 = bold(v)_1 eq.not bold(0)$より成立する。
$N$個で成立した時、$N+1$個目のベクトルを
$
bold(u)_(N+1) = bold(v)_(N+1)-braket(bold(u)_1, bold(v)_(N+1))/braket(bold(u)_1, bold(u)_1) bold(u)_1-dots-braket(bold(u)_N, bold(v)_(N+1))/braket(bold(u)_N, bold(u)_N) bold(u)_N
$
で定めると、数学的帰納法の仮定から$bold(u)_1, dots, bold(u)_N$は$V$の直交系より、各$i = 1, dots, N$に対して$bold(u)_i$との内積を取って、
$
braket(bold(u)_i, bold(u)_(N+1))
= braket(bold(u)_i, bold(v)_(N+1))-braket(bold(u)_i, bold(v)_(N+1))/braket(bold(u)_i, bold(u)_i) braket(bold(u)_i, bold(u)_i) = 0.
$
また、$bold(u)_(N+1) = bold(0)$とすると
$
bold(v)_(N+1)
= braket(bold(u)_1, bold(v)_(N+1))/braket(bold(u)_1, bold(u)_1) bold(u)_1+dots+braket(bold(u)_N, bold(v)_(N+1))/braket(bold(u)_N, bold(u)_N) bold(u)_N
in Span(bold(u)_1, dots, bold(u)_N)
= Span(bold(v)_1, dots, bold(v)_N)
$
となるが、これは$bold(v)_1, dots, bold(v)_N, bold(v)_{N+1}$が線形独立であるという仮定に反する。
よって、$bold(u)_1, dots, bold(u)_N, bold(u)_{N+1}$は$V$の直交系である。
他の部分の証明も容易であり、定理の主張を得る。
]

#remark[
$bold(u)_1, dots, bold(u)_N$の構成方法から
$
mat(bold(v)_1, dots, bold(v)_N) = mat(bold(u)_1, dots, bold(u)_N) mat(1, dots.c, \*; , dots.down, dots.v; , , 1)
$
と表示できる。
]

#corollary[
任意の有限次元内積空間$V$には直交基底が存在する。
]

正規化のためには平方根を導入する必要がある。

#definition([正規化可能])[
$K$を非退化な体として、その_正値の部分_を
$
K_+ = Set(overline(c_1) c_1+dots+overline(c_n) c_n; n = 1, 2, 3, dots, c_1, dots, c_n in K)
$
とする。
ここで正値$c in K_+$に対して、
$
overline(x) x = c
$
を満たす正値$x in K_+$が一意に存在する時、$x$を$c$の_正の平方根_といい$sqrt(c)$と表す。
さらに任意の$c in K_+$に対して正の平方根$sqrt(c)$が存在する時、$K$は_正規化可能_と呼ぶ。
]

#remark[
$0$は$0$の正の平方根であり、$1$は$1$の正の平方根である。
$overline(x) x = c$と書いたが、正値$x in K_+$の共役は
$
overline(x)
= overline(overline(c_1) c_1+dots+overline(c_n) c_n)
= c_1 overline(c_1)+dots+c_n overline(c_n)
= x
$
なので、通常の意味での平方根$x^2 = x x = c$と認識したのでよい。
]

#example[
実数体$RR$の正値の部分は非負の実数全体である。
非負の実数には正の平方根が存在するので、$RR$は正規化可能な体である。
同様にして、複素共役の入った複素数体$CC$の正値の部分は非負の実数全体なので、$CC$は正規化可能な体である。
しかしながら、非負の有理数$2 = overline(1) dot 1+overline(1) dot 1$に対して、$sqrt(2)$は無理数なので、$QQ$は正規化可能でない。
]

#example[
複素共役の入った代数的数の体$macron(QQ)$の正値の部分は非負の代数的数であり、非負の代数的数$c$を多項式$f(x)$の零点とすると多項式$f(x^2)$の零点を考えることで、$macron(QQ)$は正規化可能な体であることが結論づけられる。
]

#proposition([正規化])[
正規化可能な体_K_上の数ベクトル$bold(v)$に対して、$braket(bold(v), bold(v))$は$K_+$の元である。
さらにその正の平方根を$norm(bold(v)) = sqrt(braket(bold(v), bold(v))) in K_+$とおく。
ここで、$bold(v) eq.not bold(0)$に対して
$
tilde(bold(v)) = norm(bold(v))^(-1) bold(v)
$
とおくとこれは単位ベクトルになっている。
]

このときの$norm(bold(v))$をベクトル$bold(v)$の_ノルム_または_大きさ_あるいは_長さ_という。

正規化を各ベクトルに実施することにより直交基底から正規直交基底を作ることができる。

== 随伴行列

標準内積の入った数ベクトル空間$K^N$を考える。
$N$次正方行列$A$に対して、
$
braket(A^\* bold(u), bold(v)) = braket(bold(u), A bold(v))
$
が任意の$bold(u), bold(v) in K^N$に対して成り立つような$N$次正方行列$A^\*$のことを$A$の_随伴行列_という。
すぐ後でわかる通り随伴行列は$A$の共役転置行列で実現される。
$M times N$型の行列$A$の_共役転置行列_は
$
overline(A)^T
= mat(overline(a_(1 1)), dots.c, overline(a_(M 1)); dots.v, dots.down, dots.v; overline(a_(1 N)), dots.c, overline(a_(M N)))
$
として定義される。

#proposition([随伴行列])[
$N$次正方行列$A$の随伴行列は$A^\* = overline(A)^T$で与えられる。
]

#proof[
標準内積を行列の積で書くことにより、
$
braket(bold(u), A bold(v))
= overline(bold(u))^T A bold(v)
= overline(overline(A)^T bold(u))^T bold(v)
= braket(overline(A)^T bold(u), bold(v)).
$
よって、$A^\* = overline(A)^T$である。
]

ここからいくつかの行列の種類を導入する。

#definition([エルミート行列])[
$N$次正方行列$A$が
$
A^\* = A
$
を満たす時、$A$は_エルミート行列_という。
]

#definition([ユニタリ行列])[
$N$次正方行列$A$が
$
A^\* A = A A^\*
$
であってそれらが正則な対角行列である時、$A$は_直交行列_という。
さらに
$
A^\* A = A A^\* = I_N
$
を満たす時、$A$は_正規直交行列_または_ユニタリ行列_という。
]

#remark[
$A = mat(bold(a)_1, dots.c, bold(a)_N)$と区分けすると、
$A$が直交行列であることと$bold(a)_1, dots, bold(a)_N$が直交基底であることは同値であり、
$A$が正規直交行列であることと$bold(a)_1, dots, bold(a)_N$が正規直交基底であることは同値であり、
TODO
]

一般的な用語としては直交行列は実数上のユニタリ行列のことを指すが、本テキストでは直交基底という用語との兼ね合いでこのように定義する。

直交行列と正規直交行列の違いは正規化されているかどうかだが、
正規直交行列$A$の逆行列は計算するまでもなく直ちに随伴$A^\*$であることがわかる。

#definition([正規行列])[
$N$次正方行列$A$が
$
A^\* A = A A^\*
$
を満たす時、$A$は_正規行列_という。
]

#remark[
エルミート行列やユニタリ行列は正規行列であり、正規行列は非常に広い行列の種類である。
]

== 正規行列の対角化

対角化の結果に行く前に内積空間において三角化の結果を精密化する。

#lemma([直交行列での三角化])[
数ベクトル空間$K^N$が内積空間になっているとする。
$N$次正方行列$A$に対して、固有多項式が@e_eigenfactor と因数分解されたとすると、$A$は直交行列$P$を使って@e_tri と三角化される。
さらに$K$が正規化可能な場合は$P$は正規直交行列として取れる。
]

#proof[
@t_tri より正則行列$P$を使って@e_tri と三角化される。
$P = mat(bold(v)_1, dots.c, bold(v)_N)$と区分けすると$bold(v)_1, dots, bold(v)_N$は$K^N$の基底になっており、
この基底をシュミットの直交化して直交基底$bold(u)_1, dots, bold(u)_N$を得ると、
直交行列$macron(P) = mat(bold(u)_1, dots.c, bold(u)_N)$により、
$
A = macron(P) mat(1, dots.c, \*; , dots.down, dots.v; , , 1) mat(c_1, dots.c, \*; , dots.down, dots.v; , , c_N) mat(1, dots.c, \*; , dots.down, dots.v; , , 1)^(-1) macron(P)^(-1)
$
となる。
よって、右上三角行列の積は右上三角行列であることに注意して、
$
A = macron(P) mat(c_1, dots.c, \*; , dots.down, dots.v; , , c_N) macron(P)^(-1)
$
とできる。
さらに正規化して正規直交行列
$
tilde(P)
= mat(norm(bold(u)_1)^(-1) bold(u)_1, dots.c, norm(bold(u)_N)^(-1) bold(u)_N)
= macron(P) mat(norm(bold(u)_1)^(-1), , ; , dots.down, ; , , norm(bold(u)_N)^(-1))
$
を定めると、
$
A
= tilde(P) mat(norm(bold(u)_1), , ; , dots.down, ; , , norm(bold(u)_N)) mat(c_1, dots.c, \*; , dots.down, dots.v; , , c_N) mat(norm(bold(u)_1)^(-1), , ; , dots.down, ; , , norm(bold(u)_N)^(-1)) tilde(P)^(-1)
= tilde(P) mat(c_1, dots.c, \*; , dots.down, dots.v; , , c_N) tilde(P)^(-1)
$
とできる。
]

#theorem([正規行列の対角化])[
体$K$を非退化とする。
$N$次正規行列$A$に対して、固有多項式が@e_eigenfactor と因数分解されたとすると、$A$は直交行列$P$を使って
$
A = P mat(c_1, , ; , dots.down, ; , , c_N) P^(-1)
$
と対角化される。
さらに$K$が正規化可能な場合は$P$は正規直交行列として取れる。
]

証明の流れは上の補題で$A$を三角行列$T$に三角化したとすると、
$A$の正規性を継承して$T$も正規になり、正規な三角行列は対角行列しかないことを示す。
$A$が正規直交行列（ユニタリ行列）で三角化していたらこれでいいが、今回は少し違うので修正が必要である。

#proof[
$A$は直交行列$P = mat(bold(v)_1, dots.c, bold(v)_N)$と三角行列$T = (c_(i j))^(i = 1, dots, N)_(j = 1, dots, N)$を使って$A = P T P^(-1)$と表されて、このとき$T$は対角行列であることを示す。
ここで、$A^\* A = (P^(-1))^\* T^\* P^\* P T P^(-1)$と$A A^\* = P T P^(-1) (P^(-1))^\* T^\* P^\*$で$A$は正規なのでこの二つが等しいので、
$
T^\* P^\* P T (P^\* P)^(-1) = P^\* P T (P^\* P)^(-1) T^\*.
$
ここで、$P$は直交行列より$P^\* P$は対角行列
$
D = P^\* P = mat(braket(bold(v)_1, bold(v)_1), , ; , dots.down, ; , , braket(bold(v)_N, bold(v)_N))
$
なので対角成分を$d_1, dots, d_N$とおくと、
$
D T D^(-1) = (d_i c_(i j) d_j^(-1))
$ である。
よって、$T^\* D T D^(-1) = D T D^(-1) T^\*$から、各$i, j = 1, dots, N$に対して
$
sum_(k = 1)^N overline(c_(k i)) d_k c_(k j) d_j^(-1)
= sum_(k = 1)^N d_i c_(i k) d_k^(-1) overline(c_(j k)).
$
これを対角成分で$i = j$が大きい方から考えると、$T$は三角行列であることに注意して$i = j = N$の時、
$
overline(c_(1 N)) d_1 c_(1 N) d_N^(-1)+dots+overline(c_(N N)) d_N c_(N N) d_N^(-1)
= d_N c_(N N) d_N^(-1) overline(c_(N N)).
$
つまり
$
overline(c_(1 N)) c_(1 N) d_1+dots+overline(c_(N-1 N)) c_(N-1 N) d_(N-1) = 0
$
で、$K$が非退化である条件が使える状況になっていて、$c_(1 N) = dots = c_(N-1 N)$がわかる。
これを繰り返していけば$T$は対角行列にならざるを得ないことがわかり、定理の証明が完成する。
]

== 実対称行列の対角化

まず、エルミート行列の固有値について調べる。

#theorem([エルミート行列の固有値])[
エルミート行列$A$の全ての固有値$c$は
$
overline(c) = c
$
を満たす。
]

#proof[
固有ベクトルの一つを$bold(v) eq.not bold(0)$とおくと$A bold(v) = c bold(v)$なので、
標準内積について
$
braket(bold(v), A bold(v))
= braket(bold(v), c bold(v))
= c braket(bold(v), bold(v)).
$
また、$A$はエルミート行列より随伴行列$A^\*$は$A$自身なので、
$
braket(bold(v), A bold(v))
= braket(A bold(v), bold(v))
= braket(c bold(v), bold(v))
= overline(c) braket(bold(v), bold(v)).
$
以上のことと$bold(v) eq.not bold(0)$より$overline(c) = c$である。
]

この定理で出てくるスカラーの範囲を考える。
非退化な体$K$に対して
$
Re(K) = Set(a in K; overline(a) = a)
$
とおき、$K$の_実部_と呼ぶ。
$Re(K)$は$K$の加法と乗法で閉じていて、$K$のいわゆる部分体になっている。
