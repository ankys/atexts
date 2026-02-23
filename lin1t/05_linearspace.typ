
= 線形空間

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": Set, rank
#let Span = $op("Span")$
#let Img = $op("Img")$
#let Ker = $op("Ker")$
#let Id = $op("Id")$

== 線形空間と例

今後行列の理論を展開していく上で必要になってくるのが次元の概念でそれを導入するためこの章では抽象的な線形空間の概念を導入する。
スカラーの属する体などを$K$とする。
なお、「線形」という単語は「線型」や「一次」とも書かれたりする。

#definition([線形空間])[
集合$V$に加法（$bold(u), bold(v) in V$に対して$bold(u)+bold(v) in V$）とスカラー乗法（$c in K$と$bold(v) in V$に対して$c bold(v) in V$）が入っていて次を満たす時、$V$を$K$上の_線形空間_という。

+ （加法の結合法則）任意の$bold(u), bold(v), bold(w) in V$に対して$(bold(u)+bold(v))+bold(w) = bold(u)+(bold(v)+bold(w))$が成り立つ。
+ （加法の交換法則）任意の$bold(u), bold(v) in V$に対して$bold(u)+bold(v) = bold(v)+bold(u)$が成り立つ。
+ （スカラー乗法の結合法則）任意の$c, d in K$と$bold(v) in V$に対して$(c d) bold(v) = c (d bold(v))$が成り立つ。
+ （分配法則１）任意の$c in K$と$bold(u), bold(v) in V$に対して$c (bold(u)+bold(v)) = c bold(u)+c bold(v)$が成り立つ。
+ （分配法則２）任意の$c, d in K$と$bold(v) in V$に対して$(c+d) bold(v) = c bold(v)+d bold(v)$が成り立つ。
+ （零ベクトル）$bold(0) in V$がただ一つ存在して、任意の$bold(v) in V$に対して$bold(v)+bold(0) = bold(0)+bold(v) = bold(v)$が成り立つ。
+ （反ベクトル）任意の$bold(v) in V$に対して$bold(v)+bold(x) = bold(x)+bold(v) = bold(0)$が成り立つような$bold(x) = -bold(v) in V$がただ一つ存在する。
+ （単位元）$1 in K$は任意の$bold(v) in K$に対して$1 bold(v) = bold(v)$を満たす。

線形空間$V$の元$bold(v)$を_ベクトル_と呼ぶ。
線形空間がいくつかある時$V$の零ベクトル$bold(0)$は$bold(0)_V$と表されたりする。
]

この線形空間の定義は非常に抽象度が高くてさまざまな具体例が考えられる。

#example([自明な線形空間])[
線形空間$V$は必ず零ベクトル$bold(0)$を元として含んでいるが、逆に$V$として零ベクトルのみからなる集合$O = Set(bold(0))$として加法を$bold(0)+bold(0) = bold(0)$、スカラー乗法を$c bold(0) = bold(0)$とすると$O$は線形空間である。
このような線形空間$O$を自明な線形空間という。
]

#example([スカラーの空間])[
$V$を$K$として設定し加法を$K$での加法、スカラー乗法を$K$での乗法によって定めると$V$は$K$上の線形空間である。
]

#example([数ベクトル空間])[
$N = 1, 2, 3, dots$とする。
$V$として直積$K^N$として設定するつまり$N$個の$K$の元$a_1, dots, a_N$を並べたもの$bold(v) = (a_1, dots, a_N)$の集合として、加法とスカラー乗法を
$
(a_1, dots, a_N)+(b_1, dots, b_N) = (a_1+b_1, dots, a_N+b_N),
quad c (a_1, dots, a_N) = (c a_1, dots, c a_N) $
によって定義すると$V$は$K$上の線形空間である。
この$K^N$を$K$上の$N$次元_数ベクトル空間_といい、その元を$N$次元_数ベクトル_という。
数ベクトルは縦ベクトルや横ベクトルと同一視されうる。
$N = 1$の時の$K^1$は先述の線形空間としての$K$と同一視される。
また、拡大解釈して$N = 0$の時の$K^0$が自明な線形空間$O$と見なすことができる。
]

#example([行列空間])[
同様にして$M, N = 1, 2, 3, dots$とする。
$V$として$M times N$型の$K$上の行列の集合$op("M")_(M times N) (K) = K^(M times N)$とすると$V$は$K$上の線形空間である。
]

#example([数列空間])[
$V$を$K$の元を並べた数列$(a_n)_(n in NN)$全体$V = K^(NN)$として加法とスカラー乗法を
$
(a+b)_n = a_n+b_n,
quad (c a)_n = c a_n
$
とすると$V$は$K$上の線形空間である。
]

#example([多項式空間])[
$K$の元を係数とする多項式$f(x)$の集合$V = K[x]$は加法とスカラー乗法を
$
(f+g)(x) = f(x)+g(x),
quad (c f)(x) = c f(x)
$
とすると$V$は$K$上の線形空間である。
]

#example([関数空間])[
同様にして$V$を集合$X$から$K$への関数$f(x)$全体$V = K^X$として加法とスカラー乗法を
$
(f+g)(x) = f(x)+g(x),
quad (c f)(x) = c f(x)
$
とすると$V$は$K$上の線形空間である。
]

以下は一見すると線形空間に思えないが、定義上線形空間になる例である。

#example[
実数は和と有理数倍が定義できるので、$RR$は有理数体$QQ$上の線形空間である。
]

#example[
正の実数$RR_+$の「和」を$x plus.square y = x y$で「実数$c$倍」を$c dot.square x = x^c$で定義すると、
$RR_+$は実数体$RR$上の線形空間である。
なお、この時の「零ベクトル」は$x = 1$である。
]

#definition([線形部分空間])[
$K$上の線形空間$V$に対して、その部分集合$W$であって$V$の加法とスカラー乗法について線形空間になっているものを$V$の_線形部分空間_という。
つまり、次の条件を満たせばよい。

+ 任意の$bold(v), bold(w) in W$に対して$bold(v)+bold(w) in W$が成り立つ。
+ 任意の$c in K$と$bold(v) in W$に対して$c bold(v) in W$が成り立つ。

この二つの条件はまとめて、任意の$c, d in K$と$bold(v), bold(w) in W$に対して$c bold(v)+d bold(w) in W$とも書ける。
本テキストでは$W$が$V$の線形部分空間であることを部分集合の記号を使って$W subset V$と表すことがある。
]

線形空間$V$に対して、$V$自身と零ベクトルのみからなる集合$O = O_V = Set(bold(0)_V)$はいずれも$V$の線形部分空間であり、自明な線形部分空間と呼ばれる。

#example([連立一次方程式の解空間])[
$N, M = 1, 2, 3, dots$として$A$を$M times N$型の$K$上の行列とする。
この時、斉次連立一次方程式
$
A bold(x) = bold(0)
$
の解$bold(x) in K^N$全体からなる集合は$K^N$の線形部分空間である。
]

#example([行列空間の部分空間])[
$N = 1, 2, 3, dots$次の対角行列、右上三角行列、左下三角行列、対称行列の集合はいずれも$op("M")_N (K)$の線形部分空間である。
]

#example([有限次多項式空間])[
$K$の元を係数とする$N = 0, 1, 2, 3, dots$次以下の多項式
$
f(x) = a_0+a_1 x+a_2 x^2+a_3 x^3+dots+a_N x^N,
quad a_0, a_1, a_2, a_3, dots, a_N in K
$
の集合$K^N [x]$は$K[x]$の線形部分空間である。
]

#example[
$RR$の部分集合
$
QQ[sqrt(2)] = Set(a+b sqrt(2); a, b in QQ)
$
は有理数体$QQ$上の線形空間としての$RR$の線形部分空間である。
]

一般論で重要な線形部分空間として次がある。

#definition([線形結合])[
$V$を$K$上の線形空間として、いくつかの元（ベクトル）$bold(v)_1, dots, bold(v)_N$を考える。
ここでスカラー$c_1, dots, c_N in K$を使って
$
c_1 bold(v)_1+dots+c_N bold(v)_N
$
と表される$V$の元（ベクトル）を$bold(v)_1, dots, bold(v)_N$の_線形結合_という。
また、$bold(v)_1, dots, bold(v)_N$の線形結合全体からなる集合
$
Span(bold(v)_1, dots, bold(v)_N) = Set(c_1 bold(v)_1+dots+c_N bold(v)_N; c_1, dots, c_N in K)
$
は$V$の線形部分空間であり、$bold(v)_1, dots, bold(v)_N$が_張る_または_線形生成する_線形部分空間と呼ばれる。
また、$N = 0$の時は線形結合は零ベクトルとして、張る線形部分空間は自明な$O$と考える。
]

また、線形部分空間の演算として次がある。

#definition([交わりと和])[
$U$を$K$上の線形空間として、$V, W$を$U$の部分空間とする。

- 共通部分$V inter W = Set(bold(v) in U; bold(v) in V, bold(v) in W)$は$U$の線形部分空間であり、$V$と$W$の_交空間_と呼ばれる。
- $V+W = Set(bold(v)+bold(w); bold(v) in V, bold(w) in W)$は$U$の線形部分空間であり、$V$と$W$の_和空間_と呼ばれる。
- 交空間が$V inter W = O_U$を満たす時、和空間$V+W$は$V xor W$と書かれ、$V$と$W$の_直和空間_と呼ばれる。
]

#remark[
和空間は和集合$V union W$とは違うことに注意する。
和集合$V union W$は一般に線形空間ではない。
]

次は集合でいう補集合に相当する。

#definition([線形補空間])[
$V$を$K$上の線形空間として、$W$を$V$の線形部分空間とする。
ここで$V$の線形部分空間$U$であって$W xor U = V$、つまり$W inter U = O_V$かつ$W+U = V$を満たすものを$W$の_線形補空間_という。
]

== 次元と基底

次元は線形空間を特徴づける（拡大）自然数である。

#definition([次元])[
$V$を線形空間とする。
いくつかのベクトル$bold(v)_1, dots, bold(v)_N$ ($N = 0, 1, 2, 3, dots$)が存在して
$
Span(bold(v)_1, dots, bold(v)_N) = V,
$
つまり$bold(v)_1, dots, bold(v)_N$が$V$を線形生成するとする時、$V$は_有限次元_であるという。
有限次元でない線形空間は_無限次元_であるという。

線形空間の_次元_を以下で定めて$dim V$と表す。
有限次元線形空間$V$に対して上記の$N$の最小値が存在するのでそれを$V$の次元とする。
無限次元線形空間$V$に対しては$V$の次元は$oo$とする。
]

すぐわかることとして自明な線形空間$O$の次元は$0$であり、次元が$0$の線形空間は$O$しかない。
また、後でわかることとして
$
dim K^N = N,
quad dim K^(M times N) = M N, \
dim K^(NN) = oo,
quad dim K[x] = oo,
quad dim K^X = \# X,
quad dim K^N [x] = N+1
$
である。
ただし$\# X$は集合$X$の元の個数（有限集合でない場合は$\# X = oo$）である。
$N$個のベクトル$bold(v)_1, dots, bold(v)_N in V$が$V$を線形生成する時、$N >= dim V$であることに注意する。

#definition([基底])[
$V$を有限次元線形空間として$N$をその次元とする。
ここで$N$個のベクトル$bold(v)_1, dots, bold(v)_N in V$であって
$
Span(bold(v)_1, dots, bold(v)_N) = V
$
を満たすものを$V$の_基底_という。
]

次元の定義から有限次元線形空間には基底が存在するが、無限次元線形空間には（本テキストでは）そもそも基底を導入しない。
また、有限次元線形空間の次元は一意的であるが、基底は一意ではない（例としては$K^2$に対して$(1, 0), (0, 1)$と$(1, 1), (1, -1)$はそれぞれ基底である）。

#definition([線形独立])[
$V$を$K$上の線形空間として、いくつかのベクトル$bold(v)_1, dots, bold(v)_N in V$ ($N = 1, 2, 3, dots$)を考える。
ここでスカラー$c_1, dots, c_N in K$であって
$
c_1 bold(v)_1+dots+c_N bold(v)_N = bold(0)
$
となるのは$c_1 = dots = c_N = 0$の場合のみとする時、
$bold(v)_1, dots, bold(v)_N$は_線形独立_であるという。
$N = 0$の時は$0$個のベクトルは常に線形独立していると理解する。
線形独立でない時、_線形従属_しているという。
]

#example[
$N = 0, 1, 2, 3, dots$として$1, x, x^2, x^3, dots, x^N in K[x]$は線形独立である。
]

基底と線形独立性には関係がある。

#proposition[
$K$上の線形空間$V$の基底は線形独立である。
]

#proof[
$V$の次元を$N >= 1$、基底を$bold(v)_1, dots, bold(v)_N in V$とする。
もし$bold(v)_1, dots, bold(v)_N$が線形独立でないつまり線形従属している時は、$c_1 = dots = c_N = 0$でないスカラー$c_1, dots, c_N in K$であって
$
c_1 bold(v)_1+dots+c_N bold(v)_N = bold(0)
$
となるものが存在する。
ここで$c_i eq.not 0$となる$i = 1, dots, N$が存在するが、$bold(v)_1, dots, bold(v)_N$を並べ替えて、$i = N$の場合のみ考えればよい。
この時、
$
bold(v)_N = -c_N^(-1) (c_1 bold(v)_1+dots+c_(N-1) bold(v)_(N-1))
$
となるため、$bold(v)_N$は$bold(v)_1, dots, bold(v)_(N-1)$の線形結合として書け、$bold(v)_1, dots, bold(v)_(N-1)$は$V$を線形生成する。
実際、$bold(v)_1, dots, bold(v)_N$が$V$を線形生成するため任意の$w in V$は$bold(v)_1, dots, bold(v)_N$の線形結合として書けるので、$d_1, dots, d_N in K$を使って
$
w
= d_1 bold(v)_1+dots+d_N bold(v)_N
= d_1 bold(v)_1+dots+d_(N-1) bold(v)_(N-1)-d_N c_N^(-1) (c_1 bold(v)_1+dots+c_(N-1) bold(v)_(N-1))
$
より$bold(v)_1, dots, bold(v)_(N-1)$は$V$を線形生成する。
ここで次元の定義より$N$は$V$を線形生成するベクトルの個数の最小だったが、$N-1$個でも線形生成されてしまったので矛盾である。
従って、基底$bold(v)_1, dots, bold(v)_N$は線形独立している。
]

逆に線形独立で$V$を線形生成するならばそれは$V$の基底である。
まず次を示す。

#lemma([線形独立と次元])[
$V$を$K$上の線形空間として、$N = 0, 1, 2, 3, dots$個のベクトル$bold(v)_1, dots, bold(v)_N in V$が線形独立ならば$N <= dim V$である。
]

この補題の証明のために@h_linsys で学んだ連立一次方程式の理論を用いる。

#proof[
$M = dim V$として$M, N = 1, 2, 3, dots$の場合を考えればよい。
つまり、$V$は次元が$M$の有限次元である。
そこで$V$の基底$bold(w)_1, dots, bold(w)_M$を取ってくる。
各$j = 1, dots, N$に対して$bold(v)_i in V$は$bold(w)_1, dots, bold(w)_M$の線形結合として表されるので、
$
bold(v)_j = c_(j 1) bold(w)_1+dots+c_(j M) bold(w)_M
$
となる$c_(j 1), dots, c_(j M) in K$が存在する。
ここで$bold(v)_1, dots, bold(v)_N$は線形独立なので、$d_1, dots, d_N in K$が$d_1 bold(v)_1+dots+d_N bold(v)_N = bold(0)$を満たすならば$d_1 = dots = d_N = 0$である。
$
d_1 bold(v)_1+dots+d_N bold(v)_N
&= d_1 (c_(1 1) bold(w)_1+dots+c_(1 M) bold(w)_M)+dots+d_N (c_(N 1) bold(w)_1+dots+c_(N M) bold(w)_M) \
&= (d_1 c_(1 1)+ d_N c_(N 1))bold(w)_1+dots+(d_1 c_(1 M)+ d_N c_(N M))bold(w)_M
$
なので、$bold(w)_1, dots, bold(w)_M$が線形独立であることから
$
d_1 c_(1 1)+d_N c_(N 1) = dots = d_1 c_(1 M)+d_N c_(N M) = 0
$
で、これを変形して斉次連立一次方程式
$
mat(c_(1 1), dots.c, c_(N 1); dots.v, dots.down, dots.v; c_(1 M), dots.c, c_(N M);)
vec(d_1, dots.v, d_N)
= vec(0, dots.v, 0)
$
を得る。
ここで@t_homlinsys より係数行列の階数を$R$とすると、この方程式の解が$d_1 = dots = d_N = 0$に限られる条件は$R = N$であることである。
よって、係数行列の列数は$M$であることから$N = R <= M = dim V$を得る。
]

#proposition[
$V$を線形空間として、いくつかのベクトル$bold(v)_1, dots, bold(v)_N in V$が線形独立かつ$V$を線形生成するならば、$N = dim V$であり$bold(v)_1, dots, bold(v)_N$は$V$の基底である。
]

#proof[
$bold(v)_1, dots, bold(v)_N$は線形独立なので$N <= dim V$で、
$V$を線形生成するので$N >= dim V$である。
したがって$N = dim V$であり、基底の定義から$bold(v)_1, dots, bold(v)_N$は$V$の基底である。
]

#proposition[
$V$を$K$上の有限次元線形空間とする。
このとき$V$の任意の線形部分空間$W$に対して線形補空間$U$が存在する。
] <t_complement>

証明は$W$の基底を取ってきて、そこに$V$の元をいくつか足して$V$の基底を作るという基底の延長と呼ばれる手法で行う。
そのために次の補題を用意する。

#lemma[
$K$上の線形空間$V$のいくつかのベクトル$bold(v)_1, dots, bold(v)_N in V$が線形独立で$V$を生成しないとき、
任意の$bold(w) in V\\Span(bold(v)_1, dots, bold(v)_N)$に対して$bold(v)_1, dots, bold(v)_N, bold(w)$は線形独立である。
]

#proof[
スカラー$c_1, dots, c_N, d in K$を使って$c_1 bold(v)_1+dots+c_N bold(v)_N+d bold(w) = bold(0)_V$となったとする。
ここで$d eq.not 0$とすると
$
bold(w) = -d^(-1) (c_1 bold(v)_1+dots+c_N bold(v)_N)
$
となり仮定に反する。
よって$d = 0$であり、$bold(v)_1, dots, bold(v)_N$が線形独立なので$c_1 = dots = c_N = 0$である。
以上より$bold(v)_1, dots, bold(v)_N, bold(w)$は線形独立である。
]

この補題の応用として次が示される。

#proposition[
$V$を$K$上の有限次元線形空間として、$N = dim V$とおく。
ここで$N$個のベクトル$bold(v)_1, dots, bold(v)_N in V$が線形独立なとき、それは$V$の基底である。
]

#proof[
$V$を生成しないとすると、補題より$N+1$個の線形独立なベクトルを得るが、これは補題に反する。
よって、$bold(v)_1, dots, bold(v)_N$は$V$を生成するので基底である。
]

#proof([命題の証明])[
有限次元なので$V$の次元を$N$、$W$の次元を$M$として、$W$の基底$bold(w)_1, dots, bold(w)_M$を取る。
ここで補題を$N-M$回繰り返すことで線形独立な$bold(w)_1, dots, bold(w)_M, bold(u)_(M+1), dots, bold(u)_N in V$を作ることができ（次元の関係で補題の仮定を満たし続ける）、次元の関係でこれは$V$の基底になる。
あとは$U = Span(bold(u)_(M+1), dots, bold(u)_N)$とすればよい。
]

和空間の次元について次が成り立つ。

#theorem([和空間の次元])[
$K$上の線形空間$U$の線形部分空間$V, W$について
$
dim (V+W)+dim (V inter W) = dim V+dim W
$
が成り立つ。
特に
$
dim (V xor W) = dim V+dim W
$
である。
]

#proof[
まず、定義からすぐわかることとして
$
max(dim V, dim W) <= dim (V+W) <= dim V+dim W,
quad dim (V inter W) <= min(dim V, dim W)
$
がある（詳細省略）。
これにより$V$または$W$が無限次元の時は$V+W$も無限次元となり等式は成立する。
よって、以降では$V$と$W$がともに有限次元の場合を考えればよく、$V+W$と$V inter W$も有限次元である。
$N = dim V$, $M = dim W$とおく。

定理の後半部分の内容を先に示しておく。
つまり$V inter W = O_U$の時、$V$の基底$bold(v)_1, dots, bold(v)_N$と$W$の基底$bold(w)_1, dots, bold(w)_M$を取ってくると$bold(v)_1, dots, bold(v)_N, bold(w)_1, dots, bold(w)_M$が線形独立を示せばよい。
スカラー$c_1, dots, c_N, d_1, dots, d_M$について
$
c_1 bold(v)_1+dots+c_N bold(v)_N+d_1 bold(w)_1+dots+d_M bold(w)_M = bold(0)_U
$
の時、
$
c_1 bold(v)_1+dots+c_N bold(v)_N = -d_1 bold(w)_1-dots-d_M bold(w)_M
$
であり、仮定からこれは$V inter W = O_U$の元より$bold(0)_U$に等しく、
$bold(v)_1, dots, bold(v)_N$と$bold(w)_1, dots, bold(w)_M$の線形独立性から$bold(v)_1, dots, bold(v)_N, bold(w)_1, dots, bold(w)_M$が線形独立がわかる。
よって、この場合$dim (V+W) = dim V+dim W$である。

一般の場合を示す。
$V inter W$は有限次元線形空間$W$の線形部分空間なので、@t_complement より、線形補空間が存在しそれぞれ$W'$とおく。
ここで$V+W = V xor W'$を示す。
まず$v in V inter W'$とすると特に$v in V inter W$なので$v in (V inter W) inter W' = O_U$である。
次に$v+w in V+W$とすると$w = u+w'$, $u in V inter W$,
$w' in W'$とでき、$v+w = (v+u)+w' in V+W'$である。
以上より$V+W = V xor W'$かつ$W = (V inter W) xor W'$なので、先ほど示したことから
$
dim (V+W) = dim V+dim W',
quad dim W = dim (V inter W)+dim W'.
$
よって、定理の主張を得る。
]

== 線形写像

集合に線形性が導入されるように写像にも線形性を導入する。

#definition([線形写像])[
$V$と$W$を$K$上の線形空間とする。
$V$から$W$への写像$F$であって以下を満たすものを$V$から$W$への_線形写像_という。

+ 任意の$bold(u), bold(v) in V$に対して$F(bold(u)+bold(v)) = F(bold(u))+F(bold(v))$が成り立つ。
+ 任意の$c in K$と$bold(v) in V$に対して$F(c bold(v)) = c F(bold(v))$が成り立つ。

この二つの条件はまとめて、任意の$c, d in K$と$bold(v), bold(w) in W$に対して$F(c bold(v)+d bold(w)) = c F(bold(v))+d F(bold(w))$とも書ける。
]

線形写像に対してはしばしば丸括弧を省略して$F bold(v)$と記述される。

#example[
$RR$を$RR$上の線形空間と考えて関数$f: RR -> RR$を考える。

- $f(x) = x$は線形写像である。
- $f(x) = x+1$は線形写像でない。
- $f(x) = x^2$は線形写像でない。
]

線形写像の合成は線形写像である。

#proposition([合成線形写像])[
$U, V, W$を$K$上の線形空間として、$F$を$U$から$V$への線形写像とし$G$を$V$から$W$への線形写像とする。
この時、合成写像$G F = G circle F : U -> W$を
$
G F bold(v) = G(F(bold(v)))
$
で定義する時、$G F$は$U$から$W$への線形写像である。
]

線形写像による線形部分空間の像や逆像は線形部分空間である。

#proposition([合成線形写像])[
$V, W$を$K$上の線形空間として、$F$を$V$から$W$への線形写像とする。

- $U$を$V$の線形部分空間とする時、像$F U = Set(F bold(v); bold(v) in U)$は$W$の線形部分空間である。
- $U$を$W$の線形部分空間とする時、逆像$F^(-1) U = Set(bold(v) in V; F bold(v) in U)$は$V$の線形部分空間である。
]

#proof[
一つ目について、$c, d in K$と$F bold(v), F bold(w) in F U$に対して$c F bold(v)+d F bold(w) = F(c bold(v)+d bold(w))$であり、
$U$が線形部分空間なので$c bold(v)+d bold(w) in U$より$c F bold(v)+d F bold(w) in F U$である。
よって$F U$も線形部分空間である。

二つ目について、$c, d in K$と$bold(v), bold(w) in F^(-1)  U$に対して$F bold(v), F bold(w) in U$で$F(c bold(v)+d bold(w)) = c F bold(v)+d F bold(w) in U$なので、$c bold(v)+d bold(w) in F^(-1) U$である。
よって$F^(-1) U$も線形部分空間である。
]

この性質に基づいて線形写像から定まる特徴的な線形空間を導入する。

#definition([像と逆像])[
$V, W$を$K$上の線形空間として、$F$を$V$から$W$への線形写像とする。

- $F$による$V$全体の像$F V$は$W$の線形部分空間で$F$の_像_といい$Img F$と表す。
- $F$による$O_W$の逆像$F^(-1) O_W$は$V$の線形部分空間で$F$の_核_といい$Ker F$と表す。
]

像と核はそれぞれ全射性と単射性と結びつく。

#proposition[
$V, W$を$K$上の線形空間として、$F$を$V$から$W$への線形写像とする。

- $F$が全射である、つまり任意の$bold(w) in W$に対して$bold(w) = F bold(v)$となる$bold(v) in V$が存在する、ための必要十分条件は$Img F = W$が成り立つことである。
- $F$が単射である、つまり任意の$bold(v), bold(w) in V$に対して$F bold(v) = F bold(w)$ならば$bold(v) = bold(w)$が成り立つ、ための必要十分条件は$Ker F = O_V$が成り立つことである。
]

#proposition[
$V, W$を$K$上の線形空間として、$F$を$V$から$W$への線形写像とする。
ここで$F$を全単射つまり可逆とする時、逆写像$F^(-1)$も線形写像である。
]

#proof[
$c, d in K$と$bold(v), bold(w) in W$を取る。
示すべきことは
$
F^(-1) (c bold(v)+d bold(w)) = c F^(-1) bold(v)+d F^(-1) bold(w)
$
なので、両辺に$F$を施したものを考える。
$F$の線形性より
$
F(c F^(-1) bold(v)+d F^(-1) bold(w)) = c F F^(-1) bold(v)+d F F^(-1) bold(w) = c bold(v)+d bold(w).
$
よって示すべき等式が得られて$F^(-1)$は線形写像である。
]

上記の命題の内容を踏まえて次の線形同型性を定義する。

#definition([線形同型])[
$V, W$を$K$上の線形空間とする。
$V$から$W$への線形写像$F$が可逆で逆写像$F^(-1)$も線形写像である時、$F$を_線形同型写像_という。
$V, W$に対してその間の線形同型写像が存在する時$V$と$W$は_線形同型_であるといい、$V tilde.equiv W$と表す。
]

#theorem([次元定理])[
$V, W$を$K$上の線形空間、$F$を$V$から$W$への線形写像とする。
このとき、
$
dim V = dim Img F+dim Ker F
$
が成り立つ。
]

証明を見ればわかる通りこの定理の要点は$V$から$Ker F$の部分を除くと（$U$としている）$Img F$と線形同型になっていることである。
$dim Img F$はしばしば$rank F$と表される。

#proof[
$Img F$が無限次元の時は任意の$N = 0, 1, 2, 3, dots$に対して線形独立なベクトル$bold(w)_1, dots, bold(w)_N in Img F$が存在する。
ここで各$bold(w)_i$に対して$F bold(u)_i = bold(w)_i$となる$bold(u)_i in V$が存在するので取ってくる。
この時$bold(u)_1, dots, bold(u)_N$は線形独立を示す。
スカラー$c_1, dots, c_N in K$に対して
$
c_1 bold(u)_1+dots+c_N bold(u)_N = bold(0)_V
$
となったとすると$F$で移して
$
F(c_1 bold(u)_1+dots+c_N bold(u)_N)
= c_1 F bold(u)_1+dots+c_N F bold(u)_N
= c_1 bold(w)_1+dots+c_N bold(w)_N
= F(bold(0)_V)
= bold(0)_W.
$
よって、$bold(w)_1, dots, bold(w)_N$が線形独立なので、$c_1 = dots = c_N = 0$であり、$bold(u)_1, dots, bold(u)_N$も線形独立である。
従って$dim V >= N$なので、$dim V = oo$となり定理の式を満たす。

$Img F$が有限次元の時、$N = dim Img F$として$Img F$の基底$bold(w)_1, dots, bold(w)_N$を取ってくる。
さらに先ほどと同様にして$F bold(u)_i = bold(w)_i$となる$bold(u)_1, dots, bold(u)_N in V$を取ってくるとこれは線形独立している。
よってこれらは$V$の線形部分空間$U = Span(bold(u)_1, dots, bold(u)_N)$の基底になっている。
この時、$F$は$U$から$Img F$の線形同型写像になっているので、$U tilde.equiv Img F$である。
あとは$U inter Ker F = O_V$と$U+Ker F = V$を示せばよい。
まず$bold(v) in U inter Ker F$とすると、
$
bold(v) = c_1 bold(u)_1+dots+c_N bold(u)_N
$
とでき$F$で移すと
$
F(c_1 bold(u)_1+dots+c_N bold(u)_N)
= c_1 F bold(u)_1+dots+c_N F bold(u)_N
= c_1 bold(w)_1+dots+c_N bold(w)_N
= F(bold(v))
= bold(0)_W
$
よって$c_1 = dots = c_N = 0$で$bold(v) = bold(0)_V$である。
次に$bold(v) in V$に対して、$F bold(v) in Img F$より$F bold(v) = c_1 bold(w)_1+dots+c_N bold(w)_N$とでき、
$
F(bold(v)-c_1 bold(u)_1-dots-c_N bold(u)_N)
= F bold(v)-c_1 F bold(u)_1-dots-c_N F bold(u)_N
= F bold(v)-c_1 bold(w)_1-dots-c_N bold(w)_N
= bold(0)_W.
$
よって、$bold(v)-c_1 bold(u)_1-dots-c_N bold(u)_N in Ker F$である。
以上より$U xor Ker F = V$なので、
$
dim V = dim U+dim Ker F = rank F+dim Ker F
$
が成り立つ。
]

== 数ベクトル空間

ここまで抽象的に議論していた線形空間であるが、有限次元であれば数ベクトル空間と同一視でき、線形写像も行列に帰着できる。
まず、数ベクトル空間の次元について述べる。

#proposition[
$N = 0, 1, 2, 3, dots$とする。
この時、$K$上の$N$次元数ベクトル空間$K^N$は有限次元で$dim K^N = N$であり、
$N$個のベクトル
$
bold(e)_1 = (1, 0, dots, 0),
quad dots,
quad bold(e)_N = (0, dots, 0, 1)
$
が$K^N$の基底である。
]

#proof[
$bold(e)_1, dots, bold(e)_N$が線形独立かつ$K^N$を線形生成ことを示せばよい。
線形結合はスカラー$c_1, dots, c_N in K$に対して
$
c_1 bold(e)_1+dots+c_N bold(e)_N = (c_1, dots, c_N)
$
なので、
これが零ベクトル$(0, dots, 0)$となるのは$c_1 = dots = c_N = 0$であり、
任意の$K^N$の元は上記の形に書ける。
よって証明できる。
]

この時の基底$bold(e)_1, dots, bold(e)_N$を数ベクトル空間$K^N$の_標準基底_という。

#proposition[
$V$を$K$上の有限次元線形空間として次元を$N$とおくと、$V$は$K^N$と線形同型である。
]

#proof[
$V$の基底$bold(v)_1, dots, bold(v)_N$を取ってきて、$K^N$から$V$への線形写像$F$を
$
F(c_1, dots, c_N) = c_1 bold(v)_1+dots+c_N bold(v)_N
$
で定義する。
このとき、$bold(v)_1, dots, bold(v)_N$が$V$を線形生成することから$F$は全射で、
線形独立であることから$Ker F = O_(K^N)$つまり$F$は単射である。
以上より$F$は線形同型写像であるので、$V tilde.equiv K^N$である。
]

$M, N = 1, 2, 3, dots$として$A$を$K$上の$M times N$型の行列とする。
ここで$K^N$から$K^M$への写像
$
F_A (bold(v)) = A bold(v)
$
で定めるとこれは線形写像であり、行列$A$が定める線形写像という。

これとは逆に線形写像が与えられたら対応する行列が取れる。

#definition([表現行列])[
$V$と$W$を$K$上の有限次元線形空間として、次元をそれぞれ$N$と$M$とする。
$F$を$V$から$W$への線形写像として$V$の基底$bold(v)_1, dots, bold(v)_N$と$W$の基底$bold(w)_1, dots, bold(w)_M$について、各$j = 1, dots, N$に対して
$
F(bold(v)_j) = a_(j 1) bold(w)_1+dots+a_(j M) bold(w)_M
$
となる$a_(j 1), dots, a_(j M) in K$が一意に存在して定義される$K$上の$M times N$型の行列
$
mat(a_(1 1), dots.c, a_(N 1); dots.v, dots.down, dots.v; a_(1 M), dots.c, a_(N M);)
$
を線形写像$F$の$V$の基底$bold(v)_1, dots, bold(v)_N$と$W$の基底$bold(w)_1, dots, bold(w)_M$に関する_表現行列_という。
]

表現行列は基底の取り方によって変わってしまうことに注意する。
$K$上の$M times N$型の行列$A$が定める$K^N$から$K^M$への線形変換$F_A$の$K^N$と$K^M$の標準基底に関する表現行列は$A$である。

== 線形変換

線形写像の中でも定義域の空間と行き先の空間が同じ時、線形変換といい正方行列と同様の扱いができる。

#definition([線形変換])[
$K$上の線形空間$V$からそこへの線形写像$T$を特に_線形変換_という。
]

#definition([基底の変換])[
$K$上の有限次元線形空間$V$について、$N = dim V$として$V$の基底$bold(v)_1, dots, bold(v)_N$と$bold(v)'_1, dots, bold(v)'_N$について
TODO
]

$K$上の線形空間$V$の元$bold(v)$を$bold(v)$に移す線形変換を特に_恒等変換_といい、$Id_V$あるいは単に$Id$と表す。
