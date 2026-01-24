
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": dd, dv, pdv, evaluated

= 偏微分

== 偏微分

多変数関数の微分の基礎は偏微分である。
つまり、他の変数は定数だと思って固定した状態である一つの変数について微分する。

#definition([偏微分])[
$f(x_1, dots, x_N)$を$RR^N$の部分集合$X$上で定義された$N$変数実数値関数、$i = 1, dots, N$とする。

$(a_1, dots, a_N)$を$X$の内点、つまり半径$r > 0$が存在して$B_r (a) subset X$が成り立つとする。
ここで他の成分は固定して第$i$成分だけ動かした時の微分係数
$
lim_(x_i -> a_i) (f(a_1, dots, a_(i-1), x_i, a_(i+1), dots, a_N)-f(a_1, dots, a_(i-1), a_i, a_(i+1), dots, a_N))/(x_i-a_i)
$
が存在するとき$f$は点$(a_1, dots, a_N)$で$x_i$について_偏微分可能_であるといい、極限を_偏微分係数_という。
関数$y = f(x_1, dots, x_N)$の点$(a_1, dots, a_N)$で$x_i$についての偏微分係数を
$
f_(x_i) (a_1, dots, a_N),
quad pdv(f, x_i) (a_1, dots, a_N),
quad evaluated(pdv(f, x_i))_((x_1, dots, x_N) = (a_1, dots, a_N)), \
evaluated((f(x_1, dots, x_N))_(x_i))_((x_1, dots, x_N) = (a_1, dots, a_N)),
quad evaluated(pdv(, x_i)(f(x_1, dots, x_N)))_((x_1, dots, x_N) = (a_1, dots, a_N)), \
evaluated(y_(x_i))_((a_1, dots, a_N)),
quad evaluated(pdv(y, x_i))_((a_1, dots, a_N))
$
などで表す。

$X$を開集合、つまり$X$の点がすべて内点である場合を考える。
$X$のすべての点で関数$f$が$x_i$について偏微分可能であるとき$f$は$X$上$x_i$について偏微分可能であるという。
この時、$(x_1, dots, x_N) in X$に対して偏微分係数$f_(x_i) (x_1, dots, x_N)$を対応させる集合$X$上の実数値関数を$f$の$x_i$についての_偏微分導関数_という。
$y = f(x_1, dots, x_N)$の$x_i$についての偏微分導関数を
$
f_(x_i),
quad pdv(f, x_i),
quad (f(x_1, dots, x_N))_(x_i),
quad pdv(, x_i)(f(x_1, dots, x_N)),
quad y_(x_i),
quad pdv(y, x_i)
$
などで表す。
]

方向$x_i$と点$(a_1, dots, a_N)$を決めるごとに偏微分係数は実数であり、
偏微分導関数は$X$上の実数値関数である。
偏微分導関数はしばしば_偏導関数_と略される。

偏微分係数および偏微分導関数は一変数の通常の微分をもとにして定義しているので、それに対する命題の類が成り立つ。
つまり、和と定数倍の微分や積の微分、商の微分、一変数関数との合成関数の微分は第$i$成分以外の変数は固定されていることに注意して行うことができる。
ただし、多変数関数との合成関数の微分は後で述べる別の扱いをする必要があることに注意する。

#example[
原点からの距離で定まる二変数関数
$
f(x, y) = sqrt(x^2+y^2)
$
の$x$偏微分を考える。
$y$を固定するごとに$x$について微分すると、$(x, y) eq.not (0, 0)$においては偏微分可能で
$
f_x (x, y) = x/sqrt(x^2+y^2)
$
となる。
$(x, y) = (0, 0)$においては$f(x, 0) = abs(x)$なので、これは$x$について偏微分可能でない。
同様にして$f(x, y)$の$y$偏微分は$(x, y) eq.not (0, 0)$においては偏微分可能で
$
f_y (x, y) = y/sqrt(x^2+y^2)
$
となり、$(x, y) = (0, 0)$においては偏微分可能でない。
]

#example[
@t_non_cont の二変数関数
$
f(x, y) = cases(
	(x y)/(x^2+y^2) & ((x, y) eq.not (0, 0))",",
	0 & ((x, y) = (0, 0)),
)
$
を考える。
この関数は少なくとも$(x, y) eq.not (0, 0)$においては偏微分可能で商の微分などから
$
f_x (x, y) = (y(y^2-x^2))/((x^2+y^2)^2),
quad f_y (x, y) = (x(x^2-y^2))/((x^2+y^2)^2)
$
がわかる。
$(x, y) = (0, 0)$においても偏微分の定義から
$
f_x (0, 0) = lim_(x -> 0) (f(x, 0)-f(0, 0))/x = 0,
quad f_y (0, 0) = lim_(y -> 0) (f(0, y)-f(0, 0))/y = 0
$
となり、偏微分可能である。
しかしながら、@t_non_cont で見た通りこの関数$f(x, y)$は$(x, y) = (0, 0)$において連続ではない。
このことは多変数関数においては偏微分可能であっても連続とは限らないことを示唆している。
] <t_pdiff_non_cont>

== 全微分

#definition([勾配])[
$N$変数関数$f(x) = f(x_1, dots, x_N)$が点$x = a$において各$x_i$ ($i = 1, dots, N$)について偏微分可能であるとするとき、
偏微分係数を順番に並べて得られる$N$次元ベクトル
$
gradient f(a) = (f_(x_1) (a), dots, f_(x_N) (a))
$
を$f(x)$の点$x = a$での_勾配_という。
]

#remark[
勾配はベクトルとして考えるのが自然であり、内積が定義できることに注意する。
]

本来勾配は次に述べる全微分可能な場合に意味をなす概念であるが、
その全微分可能性の定義でこのベクトル$gradient f(a)$を利用するため本テキストではここで勾配を導入する。

#definition([全微分])[
$f(x)$を$RR^N$の部分集合$X$上で定義された$N$変数実数値関数、$a$を$X$の内点とする。
ここで、$f(x)$が点$x = a$で各方向に偏微分可能であって、勾配を使った極限の式
$
lim_(x -> a) abs(f(x)-f(a)-gradient f(a) dot (x-a))/norm(x-a) = 0
$
が成り立つとき、関数$f(x)$は点$x = a$で_全微分可能_であるという。
]

#remark[
全微分可能の条件を度合い関数$omega_a$を使って表すと
$
abs(f(x)-f(a)-gradient f(a) dot (x-a))
<= norm(x-a)omega_a (norm(x-a))
$
がすべての$x in X$で成り立つということである（$x = a$のときは両辺ともに$0$で不等号は成立することに注意する）。
]

#remark[
テキストによっては全微分
$
dd(f) = f_(x_1) (a) dd(x_1)+dots+f_(x_N) (a) dd(x_N)
$
というものを導入することがある。
この表記は微分形式の理論で有用であるが、本テキストではそこまで必要にならない。
勾配が代わりの役割を果たす。
]

#example[
$N$次元定ベクトル$v$との内積で定まる$N$変数関数
$
f(x) = v dot x
$
を考える。 この関数は$RR^N$全体で全微分可能であり、勾配は
$
gradient f(x) = v
$
となる。
]

#example[
定点$a$からの距離の二乗で定まる$N$変数関数
$
f(x) = 1/2 norm(x-a)^2
$
を考える。
この関数は$RR^N$全体で全微分可能であり、勾配は
$
gradient f(x) = x-a
$
となる。
]

#example[
定点$a$からの距離で定まる$N$変数関数
$
f(x) = norm(x-a)
$
を考える。 この関数は$x eq.not a$で全微分可能であり、勾配は
$
gradient f(x) = (x-a)/norm(x-a)
$
となる。
]

#proposition([全微分可能性と連続性])[
$f(x)$を$RR^N$の部分集合$X$上で定義された$N$変数実数値関数、$a$を$X$の内点とする。
ここで、$f(x)$が点$x = a$で全微分可能ならば$f(x)$は$x = a$で連続である。
]

#proof[
三角不等式とコーシー・シュワルツの不等式より
$
abs(f(x)-f(a))
&<= abs(f(x)-f(a)-gradient f(a) dot (x-a))+abs(gradient f(a) dot (x-a)) \
&<= norm(x-a)omega_a (norm(x-a))+norm(gradient f(a))norm(x-a).
$
ここで$x -> a$で最右辺は$0$に収束するので、$f(x)$は$x = a$で連続である。
]

== 合成関数の微分

一変数関数$f(x), g(y)$の合成関数の微分とは
$
(g(f(x)))' = g'(f(x))f'(x)
$
であったが、この多変数関数版を考えたい。
$f(x)$が多変数関数$f(x) = f(x_1, dots, x_N)$の場合は$g(f(x))$も多変数関数で偏微分を考えると
$
(g(f(x)))_(x_i) = g'(f(x))f_(x_i) (x),
quad gradient(g(f(x))) = g'(f(x))gradient f(x)
$
となるが、
問題は$g(y)$が多変数関数$g(y) = g(y_1, dots, y_M)$の場合である。
このとき$f(x)$は$RR^M$値関数$f(x) = (f_1 (x), dots, f_M (x))$である必要があり、
$g(f(x))$は（$f(x)$が一変数関数ならば）一変数関数となるのでその微分を考える価値がある。
この関数$f(x)$が$x = a$で微分可能であるとは各$f_i (x)$ ($i = 1, dots, M$)が$x = a$で微分可能であることをいい、
$
f'(a) = (f_1 '(a), dots, f_M '(a))
$
と定義する。

#proposition([合成関数の微分])[
$RR^M$値関数$f(x) = (f_1 (x), dots, f_M (x))$が点$x = a$で微分可能で$M$変数関数$g(y) = g(y_1, dots, y_M)$が点$y = f(a)$で全微分可能とする。
この時、合成関数$f(g(x))$も$x = a$で微分可能で、
$
evaluated((g(f(x)))')_(x = a)
&= gradient g(f(a)) dot f'(a) \
&= g_(y_1)(f(a))f_1 '(a)+dots+g_(y_M)(f(a))f_M '(a)
$
が成立する。
]

#proof[
$g(y)$は$y = b := f(a)$で全微分可能なので、
$
abs(g(y)-g(b)-gradient g(b) dot (y-b))
<= norm(y-b)omega_b (norm(y-b))
$
である。 ここから$y = f(x)$, $b = f(a)$を代入し、
$
abs(g(f(x))-g(f(a))-gradient g(f(a)) dot (f(x)-f(a)))
<= norm(f(x)-f(a))omega_b (norm(f(x)-f(a))).
$
これを$abs(x-a)$で割って$x -> a$とすれば、
$
&abs((g(f(x))-g(f(a)))/(x-a)-gradient g(f(a)) dot (f(x)-f(a))/(x-a)) \
&quad <= norm((f(x)-f(a))/(x-a))omega_b (norm(f(x)-f(a)))
-> norm(f'(a)) dot 0
= 0.
$
よって、
$
lim_(x -> a) (g(f(x))-g(f(a)))/(x-a)
= lim_(x -> a) gradient g(f(a)) dot (f(x)-f(a))/(x-a)
= gradient g(f(a)) dot f'(a)
$
である。
]

#remark[
積の微分公式は多変数の合成関数の微分から導出することができる。
つまり積の関数$h(x, y) = x y$の偏微分は$h_x (x, y) = y$, $h_y (x, y) = x$なので、
$
(f(x)g(x))'
&= (h(f(x), g(x)))'
= h_x (f(x), g(x))f'(x)+h_y (f(x), g(x))g'(x) \
&= g(x)f'(x)+f(x)g'(x)
$
がわかる。
]

== 連続微分可能性

@t_pdiff_non_cont で見たように、偏微分可能と連続とは分離された概念であるが、連続（偏）微分可能ならば（全）微分可能なので連続性も従うという事実が知られている。

#definition([連続微分可能性])[
$RR^N$の開部分集合$X$上の実数値関数$f$が各変数$x_i$ ($i, 1, dots, N$)に対して偏微分可能で偏微分導関数$f_(x_i)$が$X$上の連続関数である時、$f$は$X$上_連続微分可能_であるという。
]

#remark[
各偏微分導関数$f_(x_i)$が連続関数のところは$gradient f$が連続関数と読みかえられる。
]

#proposition([連続微分可能ならば全微分可能])[
$RR^N$の開部分集合$X$上の実数値関数$f$が連続微分可能ならば、$f$は$X$上の各点で全微分可能である。
]

#proof[
証明は点$a = (a_1, dots, a_N) in X$とその近傍の点$x = (x_1, dots, x_N) in X$について、$x$から$a$へ$x_1, dots, x_N$軸に沿って近づけるという方法で行う。
そのためにまず各$x_i$に対して次の値を評価する。
$
abs(f(x_1, dots, x_i, dots, x_N)-f(x_1, dots, a_i, dots, x_N)-f_(x_i) (a_1, dots, a_i, dots, a_N)(x_i-a_i))
$
ここで$x |-> f(x_1, dots, x, dots, x_N)$に対する平均値の定理より$0 <= theta <= 1$が存在して、
$
&abs(f(x_1, dots, x_i, dots, x_N)-f(x_1, dots, a_i, dots, x_N)-f_(x_i) (a_1, dots, a_i, dots, a_N)(x_i-a_i)) \
&quad <= abs(f_(x_i) (x_1, dots, theta a_i+(1-theta)x_i, dots, x_N)-f_(x_i) (a_1, dots, a_i, dots, a_N))(x_i-a_i)).
$
したがって、$omega$を$gradient f$の連続性の度合いとして、
$
&abs(f(x_1, dots, x_i, dots, x_N)-f(x_1, dots, a_i, dots, x_N)-f_(x_i) (a_1, dots, a_i, dots, a_N)(x_i-a_i)) \
&quad <= omega(norm((x_1, dots, theta a_i+(1-theta)x_i, dots, x_N)-(a_1, dots, a_i, dots, a_N)))abs(x_i-a_i) \
&quad <= omega(norm(x-a)+abs(theta a_i+(1-theta)x_i-a_i))abs(x_i-a_i)
$
ここで$0 <= theta <= 1$なので、
$
abs(theta a_i+(1-theta)x_i-a_i)
= (1-theta)abs(x_i-a_i)
<= abs(x_i-a_i)
$
よって、
$
&abs(f(x_1, dots, x_i, dots, x_N)-f(x_1, dots, a_i, dots, x_N)-f_(x_i) (a_1, dots, a_i, dots, a_N)(x_i-a_i)) \
&quad <= omega(norm(x-a)+abs(x_i-a_i))abs(x_i-a_i)
<= omega(2 norm(x-a))norm(x-a)
$
である。
あとはこれを用いることで、
$
&abs(f(x)-f(a)-gradient f(a) dot (x-a)) \
&quad <= sum_(i = 1)^N abs(f(a_1, dots, x_i, dots, x_N)-f(a_1, dots, a_i, dots, x_N)-f_(x_i) (a_1, dots, a_i, dots, a_N)(x_i-a_i)) \
&quad <= N omega(2 norm(x-a))norm(x-a)
$
よって、$f$は全微分可能である。
]

#theorem[
弧状連結な開集合$X$上の関数$f$がすべての内点$x$で全微分可能であり$gradient f(x) = 0$を満たすならば、$f$は定数関数である。
]

#proof[
@t_pcurv より$X$の任意の二点$x, y$は$x_1, dots, x_N$軸に並行ないくつかの線分で結ばれて、それぞれの線分で偏微分が$0$なので、$f(x) = f(y)$が成り立つ。
]

#remark[
この定理の偏微分版つまり$f_(x_i) (x) = 0$ならば$f(x)$は$x_i$について定数関数は一般には成り立たない。
反例としてはコの字形の領域により与えられる。
]

== 高階の偏微分

$N$変数関数$f$の$x_i$での偏微分導関数$f_(x_i)$はやはり$N$変数関数なので引き続き$x_j$での偏微分導関数を（存在すれば）考えることができる。

#definition([高階偏微分])[
$RR^N$の開部分集合$X$上の関数$f$が変数$x_i$ ($i = 1, dots, N$)に対して偏微分可能で偏微分導関数$f_(x_i)$が変数$x_j$ ($j = 1, dots, N$)で偏微分可能である時、$f$は$X$上_二回偏微分可能_であるといい、偏微分導関数
$
f_(x_i x_j) = (f_(x_i))_(x_j),
quad pdv(f, x_j, x_i) = pdv(, x_j)(pdv(f, x_i))
$
を$f$の_二階偏微分導関数_という。
同様にして、$i_1, dots, i_n = 1, dots, N$
($n = 1, 2, 3, dots$)に対して偏微分導関数$f_(x_(i_1) dots x_(i_n))$を$f$の_$n$階偏微分導関数_という。
すべての$n$階偏微分導関数が連続の時、$f$は$X$上で_$C^n$級_であるという。
さらに$f$が$X$上ですべての$n = 1, 2, 3, dots$で$C^n$級である時、$f$は_$C^oo$級_であるという。
]

#remark[
$C^1$級であることは連続微分可能であることと同値である。
]

この定義によると$N$変数関数の$n$階偏微分導関数は$N^n$個あるが、実際にはいくつかは等しい。

#theorem([シュワルツの定理])[
$f(x, y)$を二変数関数として$(a, b)$を定義域の内点とする。
ここで$(a, b)$の近傍において$f_x$, $f_y$, $f_(x y)$が存在して$f_(x y)$が$(a, b)$で連続ならば、$f_(y x)$も存在して
$
f_(y x) (a, b) = f_(x y) (a, b)
$
が成り立つ。
]

#proof[
$h, k eq.not 0$として、平均値の定理を二回用いると
$
f(a+h, b+k)-f(a+h, b)-f(a, b+k)+f(a, b)
&= h (f_x (a+alpha h, b+k)-f_x (a+alpha h, b)) \
&= h k f_(x y) (a+alpha h, b+beta k)
$
となる$0 <= alpha, beta <= 1$が存在することがわかる。
ここで$f_(x y)$は連続より、$omega$を連続性の度合いとして
$
&abs(f(a+h, b+k)-f(a+h, b)-f(a, b+k)+f(a, b)-h k f_(x y) (a, b)) \
&quad <= abs(h k) omega(sqrt(alpha^2 h^2+beta^2 k^2))
<= abs(h k) omega(sqrt(h^2+k^2))
$
となることがわかる。
あとは先に$k$で割って極限を取ってから次いで$h$で割って極限を取ることで、
$
abs(f_y (a+h, b)-f_y (a, b)-h f_(x y) (a, b))
<= abs(h) omega(abs(h)),
$
$
lim_(h -> 0) abs((f_y (a+h, b)-f_y (a, b))/h-f_(x y) (a, b))
<= 0.
$
したがって$f_(y x) (a, b)$が存在して、その値は$f_(x y) (a, b)$に一致する。
]

この定理は$3$変数以上の多変数関数に対しても任意の二つの変数に対して適用することで偏微分の順序交換をすることができ、
$3$回以上微分可能な関数に対しても定理を繰り返し用いることで任意の偏微分の順序交換をすることができる。
例えば$C^3$級の$N$変数関数に対して、
$
f_(x_i x_j x_k) = f_(x_k x_j x_i)
$
などが成り立つ。

== ヤコビ行列とヘッセ行列

$RR^M$値関数に対して勾配ベクトルを並べて得られる行列をヤコビ行列という。

#definition([ヤコビ行列])[
$N$次元点集合上の$M$個の実数値関数$f^1 (x) = f^1 (x_1, dots, x_N), dots, f^M (x) = f^M (x_1, dots, x_N)$が内点$x = a$で偏微分可能な時、$RR^M$値関数$F(x) = (f^1 (x), dots, f^M (x))$は$x = a$で偏微分可能といい、
$M times N$型行列
$
J F(a)
= gradient F(a)
= mat(f^1_(x_1) (a), dots.c, f^1_(x_N) (a); dots.v, dots.down, dots.v; f^M_(x_1) (a), dots.c, f^M_(x_N) (a))
$
を$F(x)$の$x = a$での_ヤコビ行列_という。

特に$M = N$の場合はヤコビ行列は正方行列になり、
行列式$det J F (a)$が定義されて_ヤコビ行列式_あるいは_ヤコビアン_という。
]

#example([線形写像])[
$A$を$M times N$型行列として$N$次元ベクトル$bold(x)$を$M$次元ベクトル$A bold(x)$に移す線形写像$F(bold(x)) = A bold(x)$を考えると、
ヤコビ行列は
$
J F(bold(x)) = A
$
となる（ベクトル$bold(x)$によらない）。
特に$A$が$N$次正方行列の場合の一次変換（線形変換）$F(bold(x)) = A bold(x)$のヤコビアンは
$
det J F(bold(x)) = det A
$
である。
]

#example([極座標変換])[
極座標変換$x = r cos theta, y = r sin theta$のヤコビアンを計算すると、
$
det mat(x_r, x_theta; y_r, y_theta)
= mat(delim: "|", cos theta, -r sin theta; sin theta, r cos theta)
= r cos^2 theta+r sin^2 theta
= r
$
となる。
]

一回偏微分を並べて勾配ベクトルが得られたように二回偏微分を並べてヘッセ行列と呼ばれるものが定義される。

#definition([ヘッセ行列])[
$N$次元点集合上の実数値関数$f(x) = f(x_1, dots, x_N)$が内点$x = a$の近傍で二回偏微分可能な時、$N$次正方行列
$
H f(a)
= gradient^2 f(a)
= mat(f_(x_1 x_1) (a), dots.c, f_(x_1 x_N) (a); dots.v, dots.down, dots.v; f_(x_N x_1) (a), dots.c, f_(x_N x_N) (a))
$
を$f(x)$の$x = a$での_ヘッセ行列_あるいは_ヘシアン_という。
]

#remark[
$f$が$C^2$級関数の時、シュワルツの定理よりヘッセ行列は実対称行列である。
]

== 極値問題

点集合上の関数$f$がどのような点で最大または最小になるかという極値問題は様々な場面で現れる重要な問題である。
一変数の時と同様にこの問題に一定の指針を与えるのが次の最大値原理である。

#theorem([最大値原理])[
$N$次元点集合$X$上の関数$f$が$X$の内点$a$で最大または極大または最小または極小とする。
ここで、$f$が$a$で$x_i$について偏微分可能であるとすると、$f_(x_i) (a) = 0$が成立する。
特に$f$が$a$で全微分可能ならば$gradient f(a) = 0$が成り立つ。
] <t_maxp>

この定理により最大点や最小点では勾配が$0$である（勾配が消えているという）ものの中にあるか境界上にあることがわかる。
特に境界を持たない点集合である開集合での極値問題は勾配が消える点を調べたので十分である。

そのような勾配が消える点を停留点と呼ぶ。

#definition([停留点])[
$N$次元開集合$X$上の関数$f$が内点$a$で$gradient f(a) = 0$を満たす時、$a$を$f$の_停留点_という。
]

#example[
二次式
$
f(x, y) = a x^2+b x y+c y^2+d x+e y+f
$
は
$
f_x (x, y) = 2 a x+b y+d,
quad f_y (x, y) = b x+2 c y+e
$

より、$f$の停留点は連立方程式
$
2 a x+b y+d = 0,
quad b x+2 c y+e = 0
$
の解$(x, y)$である。
この連立一次方程式は
$
mat(2 a, b; b, 2 c) vec(x, y) = vec(-d, -e)
$
と表すことができるので、
係数行列が逆行列を持つつまり行列式が非零なので
$
mat(delim: "|", 2 a, b; b, 2 c) = 4 a c-b^2 eq.not 0
$
の時、停留点は
$
vec(x, y) = -mat(2 a, b; b, 2 c)^(-1) vec(d, e)
$
と求まる。

一般には$N$次実対称行列$A$と$N$次元実ベクトル$bold(b)$と実数$c$に対して、
二次式
$
f(bold(x)) = bold(x) dot A bold(x)+bold(b) dot bold(x)+c
$
を考えると
$
gradient f(bold(x)) = 2 A bold(x)+bold(b)
$
である。 よって、$det A eq.not 0$の時は停留点は
$
bold(x) = -1/2 A^(-1) bold(b)
$
と求まる。
]

停留点であることは極大や極小であることの必要条件であるが、逆は一般には成り立たない。

#example[
二次式
$
f_1 (x, y) = x^2+y^2,
quad f_2 (x, y) =-x^2-y^2,
quad f_3 (x, y) = x^2-y^2,
$
の停留点はいずれも原点$(0, 0)$である。
しかしながら、極大極小については分かれて、$f_1$の場合は最小、$f_2$の場合は最大、$f_3$の場合は最大でも最小でもないことになる。
$f_3$については$x$軸方向には最小で$y$軸方向には最大となっている。
]

一変数関数がそうであったように多変数関数においても二階微分つまりヘッセ行列と極値であることの関係が知られている。
つまり$f$を点$a$の近傍で$C^2$級の関数とすると、方向を表すベクトル$e$ごとに合成関数$g(t) = f(a+e t)$の一回微分と二回微分は
$
g'(t) = gradient f(a+e t) dot e,
quad g'(0) = gradient f(a) dot e,
$
$
g''(t) = e dot H f(a+e t) e,
quad g''(0) = e dot H f(a) e
$
となることに注意する。

#theorem([二階最大値原理])[
$f$を$N$次元点集合上の関数で点$a$の近傍で$C^2$級とする。

- $f$が点$a$で最大または極大となるならば、任意のベクトル$e in RR^N$に対して$gradient f(a) dot e = 0$かつ$e dot H f(a) e <= 0$が成り立つ。
- $f$が点$a$で最小または極小となるならば、任意のベクトル$e in RR^N$に対して$gradient f(a) dot e = 0$かつ$e dot H f(a) e >= 0$が成り立つ。
]

#theorem([二階微分判定法])[
$f$を$N$次元点集合上の関数で点$a$の近傍で$C^2$級とする。

- 任意の零でないベクトル$e in RR^N$に対して$gradient f(a) dot e = 0$かつ$e dot H f(a) e < 0$を満たすならば、$f$は点$a$で極大となる。
- 任意の零でないベクトル$e in RR^N$に対して$gradient f(a) dot e = 0$かつ$e dot H f(a) e > 0$を満たすならば、$f$は点$a$で極小となる。
]

#example[
]

== 陰関数定理

$x y$平面上の図形の表示方法はいろいろあるが最も表現できる対象の範囲が広いのが方程式$f(x, y) = 0$による表示である。
この図形は$x$を固定するごとに方程式を$y$について解くことで、$y = g(x)$と関数のグラフとして表示できることが期待される。
このような方程式から定まる関数のことを_陰関数_という。
例えば円の方程式$x^2+y^2 = 1$を$y$について解くことで$y = plus.minus sqrt(1-x^2)$とするということが同期である。
実際にはこの例のように陰関数は一般に複数あったり（多価という）また存在しないこともあるが、一意（正確には一価）な陰関数が存在することを保証するのが陰関数定理である。
一般的な陰関数定理の要点は以下の通りである。
つまり、$f(a, b) = 0$となるような点$(a, b)$において$y$偏微分$f_y (a, b)$が消えていない時、$(a, b)$の近くで$f(x, y) = 0$は$y = g(x)$と陰関数表示される。
また陰関数$f(x)$は$f(x, g(x)) = 0$を満たすので、$f$も$g$も$C^1$級であればこれを微分して、
$
f_x (x, g(x))+f_y (x, g(x)) g'(x) = 0,
$
つまり
$
g' (x) = -frac(f_x (x, g(x)), f_y (x, g(x)))
$
を得る。
これは$y = g(x)$と設定しているので、
$
y' = -frac(f_x (x, y), f_y (x, y))
$
とも書くことができる。

#theorem([陰関数定理１])[
二変数実数値関数$f(x, y)$を点$(a, b) in RR times RR$の近傍で定義された$C^1$級関数で$f(a, b) = 0$とする。
ここで$f_y (a, b) eq.not 0$の時、ある半径$r, R > 0$が存在して、各$x in B_r (a)$に対して$y in B_R (b)$の範囲で$f(x, y) = 0$を満たす$y$が一意に存在しそれを$g(x)$とおくと$g$は$C^1$級であり、
$
g'(x) = -frac(f_x (x, g(x)), f_y (x, g(x)))
$ <e_imdiff>
が成り立つ。
]

#proof[
$f_y (a, b) < 0$の場合も同様なので、$f_y (a, b) > 0$の場合だけ証明する。
仮定より$f_y$は連続関数なので、半径$r_1, R_2 > 0$が存在して$B_(r_1) (a) times B_(R_1) (b)$上の全ての$(x, y)$で
$
f_y (x, y) >= 1/2 f_y (a, b) > 0
$
となる。
ここで$x in B_(r_1) (a)$を固定するごとに$f(x, y)$は$y$について$[b-R_1, b+R_1]$で狭義単調増加であることに注意する。
よって
$
f(a, b-R_1) < f(a, b) = 0 < f(a, b+R_1)
$
より、$f$の連続性から$r_1$より小さい半径$r_2 > 0$が存在して任意の$x in B_(r_2) (a)$に対して
$
f(x, b-R_1) < 0 < f(x, b+R_1)
$
が成り立つ。
したがって$x in B_(r_2) (a)$ごとに中間値の定理と$f(x, y)$の$y$についての単調性より$f(x, y) = 0$となる$y$が一意に存在してこれを$g(x)$とおくと$g(a) = b$である。
以降では$g(x)$の$x in B_(r_2) (a)$での微分可能性を見る。
テイラーの定理より$h eq.not 0$に対して、$y = g(x)$,
$k = g(x+h)-g(x)$とおくと、
$
f(x+h, y+k) = f(x, y)+f_x (x+alpha h, y+beta k) h+f_y (x+alpha h, y+beta k) k
$
となる$0 <= alpha, beta < 1$が存在する。
ここで$y, k$の定め方から$f(x+h, y+k) = f(x, y) = 0$であるから、
$
k/h = (g(x+h)-g(x))/h = (f_x (x+alpha h, y+beta k))/(f_y (x+alpha h, y+beta k)).
$
ここで最右辺は$x, h$について有界なので、$h -> 0$とすると$k -> 0$であり、最右辺は収束するので最終的に
$
g'(x)
= lim_(h -> 0) (g(x+h)-g(x))/h
= -frac(f_x (x, y), f_y (x, y))
= -frac(f_x (x, g(x)), f_y (x, g(x)))
$
を得る。
よって$g$は微分可能で特に連続であり、最右辺は連続なので$g'$も連続つまり$g$は$C^1$級である。
]

そして陰関数の滑らかさは方程式の滑らかさまで上がることが知られている。

#corollary[
$f$が$C^n$級の時、陰関数$g$も$C^n$級である。
]

#proof[
$f$が$C^2$級の時、$f_x$と$f_y$は$C^1$級で定理より$g$も$C^1$級なので@e_imdiff の両辺は$C^1$級であり、$g$は$C^2$級である。
この議論を繰り返し用いることで$f$が$C^n$級ならば$g$も$C^n$級であることがわかる。
]

== ラグランジュの未定乗数法

閉集合$X$上で関数$f(x)$の最大最小を考える問題は、内部では停留点になるので、あとは境界上での最大最小の問題となり、
しばしば境界が$g(x) = 0$の形をしているときに_束縛条件_$g(x) = 0$のもとでの$f(x)$の最大最小を考えることになる。
このような問題に絶大な威力を発揮するのが（ラグランジュの）未定乗数法である。
つまり$f(x)$の停留点を考えるのではなく、未定乗数と呼ばれる新しい変数$k$を使って定義される関数
$
F(x, k) = f(x)-k g(x)
$
の停留点$(x, k) = (a, k)$を考えればよい。
つまり、
$
gradient_x F (a, k) = gradient f(a)-k gradient g(a) = 0,
quad F_k (a, k) = -g(a) = 0
$
を満たす点$x = a$が最大最小を達成する点の候補である。
実際には$gradient g(a) eq.not 0$という条件もつくことに注意する。
$f, g$を二変数関数とすると、$g(x) = 0$で一つの変数に束縛がついてそれを$f(x)$に代入すると一変数関数の最大最小を考えることにはなるが、未定乗数法ではあえて変数を増やし三変数関数$F(x, k)$を考えるという不思議な方法である。

#theorem([ラグランジュの未定乗数法])[
$f(x, y)$, $g(x, y)$を二変数$C^1$級関数として、点$(x, y)$が束縛条件$g(x, y) = 0$を満たしながら動くときに$f(x, y)$が点$(x, y) = (a, b)$で最大または極大または最小または極小とする。
このとき$gradient g(a, b) = 0$または
$
gradient f(a, b) = k gradient g(a, b)
$
となる実数$k$が存在する。
]

証明は陰関数定理を用いて一変数関数に帰着させる。

#proof[
$gradient g(a, b) eq.not 0$つまり$g_x (a, b) eq.not 0$または$g_y (a, b) eq.not 0$の時を考えて、変数$x, y$の対称性より$g_y (a, b) eq.not 0$の場合を考える。
このとき陰関数定理が使えて、点$(a, b)$の近くでは$g(x, y) = 0$を満たす点$(x, y)$は$y = y(x)$と解けて
$
y'(x) = -frac(g_x (x, y(x)), g_y (x, y(x)))
$
となるのであった。
ここで一変数関数$h(x) = f(x, y(x))$は$x = a$で最大または極大または最小または極小より
$
h'(a)
= f_x (a, y(a))+f_y (a, y(a))y'(a)
= f_x (a, b)-f_y (a, b) (g_x (a, b))/(g_y (a, b))
= 0
$
が満たされる。 したがって
$
f_x (a, b) = (f_y (a, b))/(g_y (a, b)) g_x (a, b)
$
であり、自明なこととして
$
f_y (a, b) = (f_y (a, b))/(g_y (a, b)) g_y (a, b)
$
なので、
$k = (f_y (a, b))/(g_y (a, b))$とおけば定理の結論が得られる。
$g_x (a, b) eq.not 0$の場合も全く同様である。
]

#example[
]
