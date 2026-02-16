
= 行列
<h_matrix>

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": super-T-as-transpose
#show: super-T-as-transpose

== 体

行列を定義する前にその構成要素である体について触れる。
_体_とは集合に四則演算（加減乗除）の構造が入ったもののことで、つまり本テキストでは集合$K$に以下を満たす加法$+$、乗法$dot$が存在するものとして話を進める。

+ （加法の結合法則）任意の$a, b, c in K$に対して$(a+b)+c = a+(b+c)$が成り立つ。
+ （加法の交換法則）任意の$a, b in K$に対して$a+b = b+a$が成り立つ。
+ （乗法の結合法則）任意の$a, b, c in K$に対して$(a dot b) dot c = a dot (b dot c)$が成り立つ。
+ （乗法の交換法則）任意の$a, b in K$に対して$a dot b = b dot a$が成り立つ。
+ （分配法則）任意の$a, b, c in K$に対して$a dot (b+c) = a dot b+a dot c$と$(a+b) dot c = a dot c+b dot c$が成り立つ。
+ （零元）$0 in K$がただ一つ存在して、任意の$a in K$に対して$a+0 = 0+a = a$と$a dot 0 = 0 dot a = 0$が成り立つ。
+ （反数）任意の$a in K$に対して$a+x = x+a = 0$が成り立つような$x = -a in K$がただ一つ存在する。
+ （単位元）$1 in K$がただ一つ存在して、任意の$a in K$に対して$a dot 1 = 1 dot a = a$が成り立つ。
+ （逆数）任意の$a in K$に対して$a eq.not 0$ならば$a dot x = x dot a = 1$が成り立つような$x = a^(-1) in K$がただ一つ存在する。

ここで$1 = 0$の時は体の元はそれのみという場合になるが、
それではいくつかの議論で不具合があるので本テキストでは厳密には$1 eq.not 0$も仮定する。

行列や線形代数の理論を展開するうえではこのような体であれば類似のものがいくつもできる。
体の典型例としては有理数や実数、複素数の集合が挙げられ、それぞれ_有理数体_$QQ$、_実数体_$RR$、_複素数体_$CC$と呼ばれる。
有理数や実数、複素数の構成は@h_set などを参照のこと。
なお、実数においては四則演算のほかに大小関係や極限操作の構造が入っているが、本テキストの範囲では四則演算のみを用いて展開できる理論のみ紹介する。
その他、体の例としては素数$p$に対して整数を$p$で割った余り$0, dots, p-1$に対して和や積を取るたびに$p$で割った余りを取れば体ができる。
このように集合としての元の個数が有限個の体を_有限体_といい、重要な例である。
また、本テキストではいくつかの命題や定理において、割り算（逆数）は必要なく、成分は整数などでもよい。
しかしながら、抽象化や一般化してもきりがないので本テキストでは基本的に体$K$上の行列や線形代数について議論する。

== 行列

$M = 1, 2, 3, dots$, $N = 1, 2, 3, dots$として、$M times N$個の体$K$の元
$
a_(1 1), a_(1 2), a_(1 3), dots, a_(1 N), a_(2 1), a_(2 2), a_(2 3), dots, a_(2 N), a_(3 1), a_(3 2), a_(3 3), dots, a_(3 N), dots, a_(M 1), a_(M 2), a_(M 3), dots, a_(M N) in K
$
を縦に$M$個、横に$N$個、長方形状にならべた
$
mat(
	a_(1 1), a_(1 2), a_(1 3), dots.c, a_(1 N);
	a_(2 1), a_(2 2), a_(2 3), dots.c, a_(2 N);
	a_(3 1), a_(3 2), a_(3 3), dots.c, a_(3 N);
	dots.v, dots.v, dots.v, dots.down, dots.v;
	a_(M 1), a_(M 2), a_(M 3), dots.c, a_(M N);
)
$
を$K$上の$M times N$型の_行列_という。
この行列は$(a_(i j))^(i = 1, dots, M)_(j = 1, dots, N)$やいくつかの部分を省略して$(a_(i j))_j^i$, $(a_(i j))$のようにも記述したりする。
行列をなす各$a_(i j)$ ($i = 1, dots, M$, $j = 1, dots, N$)は_成分_といい、上から$i$行目左から$j$行目の成分$a_(i j)$は第$(i, j)$成分と呼ばれる。

行列の例としては、
$
mat(1, 2, 3, 4, 5; 6, 7, 8, 9, 10; 11, 12, 13, 14, 15;)
$
は実数上の$3 times 5$型の行列であり（整数上でもある）、
回転行列
$
mat(cos theta, -sin theta; sin theta, cos theta) quad (theta in RR)
$
は実数上の$2 times 2$型の行列である。

本テキストでは$0$である成分はしばしば省略され、値を記入したり文字を割り当てるほどではない成分に関しては$\*$で表したりする。
つまり、
$
mat(1, 0, 0, 0; 0, 2, 0, 0; 0, 0, 3, 0; 0, 0, 0, 4;)
= mat(1, , , ; , 2, , ; , , 3, ; , , , 4;),
quad mat(1, 2, 0, 4, 5; 0, 0, 1, 9, 0; 0, 0, 0, 1, 0;)
= mat(1, \*, 0, \*, \*; , , 1, \*, 0; , , , 1, 0;)
$
などである。

二つの行列に対して、型が等しく対応する成分が全て等しい時、それらの行列は等しいという。
つまり、
$
mat(a_(1 1), dots.c, a_(1 N); dots.v, dots.down, dots.v; a_(M 1), dots.c, a_(M N);)
= mat(b_(1 1), dots.c, b_(1 N); dots.v, dots.down, dots.v; b_(M 1), dots.c, b_(M N);)
$
とは各$i = 1, dots, M$, $j = 1, dots, N$に対して
$
a_(i j) = b_(i j)
$
が成り立つことをいう。
また、全ての成分が$0$である行列は_零行列_と呼ばれる。
行列はしばしば大文字の文字が割り当てられるが、$M times N$型の零行列は$O_(M times N)$あるいは単に$O$と表される。
つまり、
$
O_(4 times 2) = mat(0, 0; 0, 0; 0, 0; 0, 0;)
$
などである。

$K$上の$M times N$型の行列全体を$upright(M)_(M times N) (K)$や$K^(M times N)$などと書く。

$M = N$のときの$M times N$型の行列を$N$次_正方行列_という。

$N$次正方行列の成分のうち、第$(i, i)$成分($i = 1, dots, N$)であるものを_対角成分_といい、それ以外を_非対角成分_という。
非対角成分が全て$0$である正方行列
$
mat(\*, , ; , dots.down, ; , , \*;)
$
は_対角行列_と呼ばれ、応用上の扱いが便利である。
対角行列の中でも対角成分が全て$1$である正方行列
$
mat(1, , ; , dots.down, ; , , 1;)
$
は_単位行列_と呼ばれ特別な扱いを受ける。
$N$次の単位行列は$I_N$あるいは$E_N$または単に$I$や$E$と表される。
また、正方行列のうち対角成分より左下または右上の成分がすべて$0$である行列
$
mat(\*, dots.c, \*; , dots.down, dots.v; , , \*;),
quad mat(\*, , ; dots.v, dots.down, ; \*, dots.c, \*;)
$
をまとめて_三角行列_という。
より詳しくは前者を_右上三角行列_、後者を_左下三角行列_という。
以上をまとめると正方行列の中に三角行列があり、さらにその中に対角行列があり、対角行列の特殊なものとして単位行列がある。

$K$上の$N$次正方行列全体を$upright(M)_N (K)$と表す。
また、零行列$O_(N times N)$である$N$次正方行列は$O_N$とも書かれる。

$N = 1$の時の$M times 1$型の行列は$M$次の_縦ベクトル_と呼ばれ、
$M = 1$の時の$1 times N$型の行列は$N$次の_横ベクトル_と呼ばれる。
縦ベクトルと横ベクトルを総称して_ベクトル_と言ったりする。

また、全ての成分が$0$であるベクトルは_零ベクトル_と呼ばれる。
ベクトルはしばしば太字の小文字（$bold(a), bold(b), bold(x)$など）が割り当てられるが、$N$次の零ベクトルは$bold(0)_N$あるいは単に$bold(0)$と表される。
つまり、
$
bold(0)_3 = vec(0, 0, 0)
$
などである。

$N$個の$N$次のベクトル$bold(e)_1, dots, bold(e)_N$を$i = 1, dots, N$に対して第$i$行が$1$でそれ以外の成分がすべて$0$であるものを$bold(e)_i$となるように定義し、しばしば_標準基底ベクトル_と呼ばれる。
つまり縦ベクトルならば、
$
bold(e)_1 = vec(1, 0, dots.v, 0),
quad dots,
quad bold(e)_N = vec(0, dots.v, 0, 1)
$
である。

$M = N = 1$の時の$1 times 1$型の行列はただ一つの成分からなり、行列を$vec(a)$とおくとこれを$a$と同一視してしまう。
このような行列に対してその成分のことや$1 times 1$型の行列のことを_スカラー_と呼ぶ。
例えば本来ならば（行列の積を取った時などに）$1 times 1$型の行列になるべきだが$K$の元として扱われることがあるので注意する。

== 行列の演算

これから行列の三つの演算、つまり和とスカラー倍と行列の積を導入する。

まず、行列の和は成分ごとの和として定義される。
ここで二つの行列の型は同じである必要がある。
つまり、$K$上の$M times N$型の行列$A = (a_(i j))$と$B = (b_(i j))$に対して、
$
A+B
= mat(a_(1 1), dots.c, a_(1 N); dots.v, dots.down, dots.v; a_(M 1), dots.c, a_(M N);)+mat(b_(1 1), dots.c, b_(1 N); dots.v, dots.down, dots.v; b_(M 1), dots.c, b_(M N);)
= mat(a_(1 1)+b_(1 1), dots.c, a_(1 N)+b_(1 N); dots.v, dots.down, dots.v; a_(M 1)+b_(M 1), dots.c, a_(M N)+b_(M N);)
$
とする。

スカラー倍とは$K$上の$M times N$型の行列$A = (a_(i j))$とスカラー$c in K$に対して定まるもので、行列の各成分を$c$倍する。
つまり、
$
c A
= c mat(a_(1 1), dots.c, a_(1 N); dots.v, dots.down, dots.v; a_(M 1), dots.c, a_(M N);)
= mat(c a_(1 1), dots.c, c a_(1 N); dots.v, dots.down, dots.v; c a_(M 1), dots.c, c a_(M N);) $
である。

この二つの演算で行列の集合$upright(M)_(M times N) (K)$は線形性と呼ばれる構造を持ち、以下の計算法則が成立する。

+ （行列加法の結合法則）任意の$A, B, C in upright(M)_(M times N) (K)$に対して$(A+B)+C = A+(B+C)$が成り立つ。
+ （行列加法の交換法則）任意の$A, B in upright(M)_(M times N) (K)$に対して$A+B = B+A$が成り立つ。
+ （行列スカラー乗法の結合法則）任意の$A in upright(M)_(M times N) (K)$と$c, d in K$に対して$c (d A) = (c d) A$が成り立つ。
+ （分配法則１）任意の$A, B in upright(M)_(M times N) (K)$と$c in K$に対して$c (A+B) = c A+c B$が成り立つ。
+ （分配法則２）任意の$A in upright(M)_(M times N) (K)$と$c, d in K$に対して$(c+d) A = c A+d A$が成り立つ。
+ （零行列）$O = O_(M times N)$は零元である。
	つまり任意の$A in upright(M)_(M times N) (K)$に対して$A+O = O+A = A$と$0 A = O$が成り立つ。
+ （反行列）任意の$A in upright(M)_(M times N) (K)$に対して$A+X = X+A = O$が成り立つような$X = -A in upright(M)_(M times N) (K)$がただ一つ存在し、それは$-A = (-1)A$である。
+ （単位数）$1$は単位数である。
	つまり任意の$A in upright(M)_(M times N) (K)$に対して$1 A = A$が成り立つ。

行列の積は行列を行列たらしめる特徴的な演算である。
$L = 1, 2, 3, dots$として、$M times L$型の行列$A = (a_(i j))$と$L times N$型の行列$B = (b_(i j))$に対して、
$
A B
= mat(a_(1 1), dots.c, a_(1 L); dots.v, dots.down, dots.v; a_(M 1), dots.c, a_(M L);) mat(b_(1 1), dots.c, b_(1 N); dots.v, dots.down, dots.v; b_(L 1), dots.c, b_(L N);)
= mat(a_(1 1) b_(1 1)+dots+a_(1 L) b_(L 1), dots.c, a_(1 1) b_(1 N)+dots+a_(1 L) b_(L N); dots.v, dots.down, dots.v; a_(M 1) b_(1 1)+dots+a_(M L) b_(L 1), dots.c, a_(M 1) b_(1 N)+dots+a_(M L) b_(L N);)
$
とする。
つまり、演算結果は$M times N$型の行列$C = A B = (c_(i j))$で
$
c_(i j) = a_(i 1) b_(1 j)+a_(i 2) b_(2 j)+a_(i 3) b_(3 j)+dots+a_(i L) b_(L j)
$
となっている。

このように一つの成分を見てもたくさんのかけ算と足し算で成り立っており一見妥当性がわからないが、
実際にはさまざまな場面でこの行列の積が現れる（@h_twodim 参照）。

+ （行列積の結合法則）任意の$A in upright(M)_(M times K) (K), B in upright(M)_(K times L) (K), C in upright(M)_(L times N) (K)$に対して$(A B) C = A (B C)$が成り立つ。
+ （分配法則１）任意の$A, B in upright(M)_(M times L) (K)$と$B in upright(M)_(L times N) (K)$に対して$(A+B) C = A C+B C$が成り立つ。
+ （分配法則２）任意の$A in upright(M)_(M times L) (K)$と$B, C in upright(M)_(L times N) (K)$に対して$A (B+C) = A B+A C$が成り立つ。
+ （零行列）任意の$A in upright(M)_(M times N) (K)$に対して$A O_(N times L) = O_(M times L)$と$O_(L times M) A = O_(L times N)$が成り立つ。
+ （単位行列）任意の$A in upright(M)_(M times N) (K)$に対して$I_M A = A I_N = A$が成り立つ。

ここで重要な注意として行列の積に対して交換法則はない。
つまり、$A B = B A$は一般には成り立たない。
ここで$A$を$M times N$型で$B$を$K times L$型とすると、積を定義して両辺の型を合わせるためには$K = L = M = N$とするしかないが、$A, B in upright(M)_N (K)$の場合でも$A B = B A$は一般には成り立たない。
実数でいうところの逆数に相当する逆行列は行列の理論の重要な論点であり次の節やその後の章で詳しく述べる。

行列$A$と$B$の積$A B$は、行列$B$に行列$A$を左からかけて得られる行列といい、同時に行列$A$に行列$B$を右からかけて得られる行列ともいう。

$N$次正方行列$A$に対しては自分自身との積$A A$が定義できこれも$N$次正方行列なのでさらに$A$をかけられる。
結合法則より左からかけても右からかけてもこの場合は同じ$A (A A) = (A A) A = A A A$が得られることに注意する。
このようにして$N$次正方行列$A$の$n = 0, 1, 2, 3, dots$乗$A^n$を単位行列$I_N$に$A$を$n$回かけたものとして定義する。

#example[
対角行列
$
A = mat(a_1, , ; , dots.down, ; , , a_N;)
$
の$n$乗は
$
A^n = mat(a_1^n, , ; , dots.down, ; , , a_N^n;)
$
である（省略されている部分は$0$であることに注意）。
]

やろうと思えば三角行列、特に後の章で出てくるジョルダン標準形と呼ばれる行列の$n$乗も比較的簡単に計算できる。
一般の行列の$n$乗を計算する時には手で計算するならば対角化または三角化して対角行列またはジョルダン標準形の$n$乗に帰着させることになるが、
他にも次のようにして計算量を削減できることが知られている。
つまり、行列$A$の$2^k$乗($k = 0, 1, 2, 3, dots$)を
$
A^1 = A,
quad A^2 = A^1 A^1,
quad A^4 = A^2 A^2,
quad A^8 = A^4 A^4,
quad dots
$
の要領であらかじめ計算して、$n$を$2$進数表示することで$A$の$2^k$乗をいくつかかけ合わせることで$A^n$を得る。
例えば、
$
A^10 = A^8 A^2
$
といった具合である。
この方法を_二進数法_という。
これを使えば$2 log_2 n$回以内の行列の積で$A^n$が計算できることになり、計算機での計算に広く使われている。

$K$上の$n = 0, 1, 2, 3, dots$次の_多項式_とはスカラー$c_0, c_1, c_2, c_3, dots, c_n in K$ ($c_n eq.not 0$)を使って
$
f(x) = c_0+c_1 x+c_2 x^2+c_3 x^3+dots+c_n x^n
$
と表される式のことであるが、
この多項式$f(x)$と$K$上の$N$次正方行列$A$に対して多項式の変数$x$に行列$A$が代入できると拡大解釈して、$N$次正方行列
$
f(A) = c_0 I_N+c_1 A+c_2 A^2+c_3 A^3+dots+c_n A^n
$
を定める。 定数項$c_0$は単位行列の項$c_0 I$になることに注意する。

一般には行列の積は交換できないが、上記の多項式は行列が$A$（と$I$）しか登場しないので以下が成り立つ。

#proposition[
多項式$f(x)$, $g(x)$と$N$次正方行列$A$に対して、
$
f(A)g(A) = g(A)f(A)
$
が成り立つ。
]

以上の内容を駆使して行列の特徴を利用すると以下のように行列の計算を簡単に行える場合がある。

#example[
$X = mat(1, 1, 1; 1, 1, 1; 1, 1, 1)$として$3$次正方行列$(X-I)(X+2 I)(X-I)$を計算する。
$X^2 = 3 X$であることに注意して、
$
(X-I)(X+2 I)(X-I)
&= (X-I)^2 (X+2 I)
= (X^2-2 X+I)(X+2 I) \
&= (X+I) (X+2 I)
= X^2+3 X+2 I \
&= 2(3 X+I).
$
よって答えは$(X-I)(X+2 I)(X-I) = mat(8, 2, 2; 2, 8, 2; 2, 2, 8)$である。
] <t_polyex>

== 逆行列

実数$a$の逆数とは$a dot x = x dot a = 1$が成り立つような実数$x$のことであった。
行列$A$に対しても同様に逆行列の概念を定義するが、定義の都合上正方行列にしか定義されないことに注意する。

#definition([逆行列])[
$A$を$K$上の$N$次正方行列とする。
等式
$
A X = X A = I_N
$
が成り立つような$K$上の$N$次正方行列$X$を$A$の_逆行列_といい（後に述べるように一意なので）$A^(-1)$と表す。
]

逆行列は存在すれば一意である。

#proposition[
$N$次正方行列$A$は逆行列を持つならば一つしかない、
つまり$N$次正方行列$X$と$Y$が$A$の逆行列ならば$X = Y$である。
]

#proof[
仮定より$A X = A Y = I_N$であり、左から$X$をかけることで$X A X = X A Y$である。
ここで$X A = I_N$なので、$X = Y$となる。
]

その一方で逆行列は常に存在するとは限らない。
例えば零行列$O$は何をかけても零行列で単位行列にはならないので逆行列を持たない。

#example[
$2$次正方行列
$
A = mat(0, 1; 0, 0)
$
は逆行列を持たない。
なぜなら
$
mat(0, 1; 0, 0)mat(\*, \*; \*, \*) = mat(\*, \*; 0, 0)
$
なので対角成分である第$(2, 2)$成分が$1$にならないためである。
]

#example[
対角成分$a_i$がいずれも$0$でない対角行列
$
A = mat(a_1, , ; , dots.down, ; , , a_N;)
$
の逆行列は
$
A^(-1) = mat(a_1^(-1), , ; , dots.down, ; , , a_N^(-1);)
$
である。
]

逆行列を持つような行列は_正則行列_または_可逆行列_と呼ばれる。
$K$上の$N$次正方行列全体$upright(M)_N (K)$のうち正則行列全体を$upright(G L)_N (K)$と表す。

すぐわかる逆行列の性質として以下がある。

+ （逆行列の逆行列）任意の$A in upright(G L)_N (K)$に対して$A^{-1} in upright(G L)_N (K)$であり$(A^(-1))^(-1) = A$が成り立つ。
+ （スカラー倍の逆行列）任意の$A in upright(G L)_N (K)$と$0$でない$c in K$に対して$c A in upright(G L)_N (K)$であり$(c A)^(-1) = c^(-1) A^(-1)$が成り立つ。
+ （積の逆行列）任意の$A, B in upright(G L)_N (K)$に対して$A B in upright(G L)_N (K)$であり$(A B)^(-1) = B^(-1) A^(-1)$が成り立つ。

三番目の性質は逆行列を取ると積の順序が逆になることに注意する。

#proposition[
正方行列$A$に対して、$1$次以上の多項式$f(x) = c_0+c_1 x+c_2 x^2+c_3 x^3+dots+c_n x^n$であって$f(A) = O$となるものが存在したとする。
ここで$c_0 eq.not 0$の時、$A$は正則であり、逆行列は
$
A^(-1) = -c_0^(-1) (c_1 I+c_2 A+c_3 A^2+dots+c_n A^(n-1))
$
で与えられる。
]

#example[
$3$次正方行列$A = mat(4, -1, -1; -1, 4, -1; -1, -1, 4)$の逆行列を計算してみよう。
次章で述べる掃き出し法を実行してもよいが、ここでは以下のように考えてみる。
つまり、$X = mat(1, 1, 1; 1, 1, 1; 1, 1, 1)$とおくと、$A = 5 I-X$で$X^2 = 3 X$なので$A^2-7 A+10 I = O$、
つまり
$
A^(-1) = -1/10 (A-7 I) = 1/10 (X+2 I).
$
よって逆行列は$A = 1/10 mat(3, 1, 1; 1, 3, 1; 1, 1, 3)$である。
]

逆行列の定義において、行列の積の交換法則がないので$A X = I_N$と$X A = I_N$の両方を要求していたが、実際には片方が成立すればもう片方も従う。
この証明には基本変形を用いる必要があるので証明は第3章で行う。

== 転置行列と対称行列

行列の行と列を入れ替える操作を転置といい、定義しておけば便利になることが多い。
例えば行列式の基本変形は行について示せば転置をして列に対しても同様のものが成り立つことがわかる。
また、スカラー積を考えるときも転置によって行列の積の話に帰着できる。

#definition([転置行列])[
$M times N$行列$A = (a_(i j))^(i = 1, dots, M)_(j = 1, dots, N)$に対して$N times M$行列
$
A^T = (a_(j i))^(i = 1, dots, N)_(j = 1, dots, M)
$
を$A$の_転置行列_という。
つまり、
$
A = mat(a_(1 1), dots.c, a_(1 N); dots.v, dots.down, dots.v; a_(M 1), dots.c, a_(M N);)
$
に対して、
$
A^T = mat(a_(1 1), dots.c, a_(M 1); dots.v, dots.down, dots.v; a_(1 N), dots.c, a_(M N);)
$
である。
]

すぐわかる転置の性質として以下がある。

+ （転置の転置）任意の$A in upright(M)_(M times N) (K)$に対して$(A^T)^T = A$が成り立つ。
+ （和の転置）任意の$A, B in upright(M)_(M times N) (K)$に対して$(A+B)^T = A^T+B^T$が成り立つ。
+ （スカラー倍の転置）任意の$A in upright(M)_(M times N) (K)$と$c in K$に対して$(c A)^T = c A^T$が成り立つ。
+ （積の転置）任意の$A in upright(M)_(M times L) (K)$と$B in upright(M)_(L times N) (K)$に対して$(A B)^T = B^T A^T$が成り立つ。

四番目の性質は転置を取ると積の順序が逆になることに注意する。

また、この性質を使えば可逆行列$A$に対して転置行列$A^T$も可逆で
$
(A^T)^(-1) = (A^(-1))^T
$
が成り立つことがわかる。

#definition([対称行列])[
$N$次正方行列$A = (a_(i j))^(i = 1, dots, N)_(j = 1, dots, N)$に対して転置をとったものが元の行列と等しい、つまり
$
A^T = A
$
の場合、$A$は_対称_あるいは_対称行列_であるという。
成分で書けば
$
a_(j i) = a_(i j) quad (i, j = 1, dots, N)
$
である。
]

スカラーは常に対称である。

== 行列の区分け

行列をいくつかの小さな行列の並びとみなせると計算が楽になることが多い。
そこでまず小さな行列をもとに大きな行列を作ることを許すことにする。
つまり、$M_1, dots, M_I = 1, 2, 3, dots$と$N_1, dots, N_J = 1, 2, 3, dots$として、$K$上の$M_i times N_j$型の行列$A_(i j)$が与えられたとする($i = 1, dots, I$,
$j = 1, dots, J$)、
このとき$A_(i j)$の成分をすべて並べて得られる$K$上の$(M_1+dots+M_I) times (N_1+dots+N_J)$型の行列を
$
mat(A_(1 1), dots.c, A_(1 J); dots.v, dots.down, dots.v; A_(I 1), dots.c, A_(I J);)
$
と書く。
反対に$(M_1+dots+M_I) times (N_1+dots+N_J)$型の行列$A$が与えられた時に上記のように小さな行列に分けることを行列の_区分け_という。

#example[
$bold(e)_1, dots, bold(e)_N$を$N$次の縦の標準基底ベクトルとする。
つまり、
$
bold(e)_1 = vec(1, 0, dots.v, 0)
,
quad dots,
quad bold(e)_N = vec(0, dots.v, 0, 1)
$
である。 このとき$N$次の単位行列$I_N$は
$
I_N = mat(bold(e)_1, dots.c, bold(e)_N)
$
と区分けされる。
]

区分けされた行列に対しては演算規則が自然と拡張され、
特に区分けされた行列の積は以下のように計算できる。

#proposition([区分けされた行列の積])[
区分けされた$(M_1+dots+M_I) times (L_1+dots+L_H)$型の行列$A = (A_(i j))$と$(L_1+dots+L_H) times (N_1+dots+N_J)$型の行列$B = (B_(i j))$に対して、
$
mat(A_(1 1), dots.c, A_(1 H); dots.v, dots.down, dots.v; A_(I 1), dots.c, A_(I H);) mat(B_(1 1), dots.c, B_(1 J); dots.v, dots.down, dots.v; B_(H 1), dots.c, B_(H J);)
= mat(A_(1 1) B_(1 1)+dots+A_(1 H) B_(H 1), dots.c, A_(1 1) B_(1 J)+dots+A_(1 H) b_(H J); dots.v, dots.down, dots.v; A_(I 1) B_(1 1)+dots+A_(I H) B_(H 1), dots.c, A_(I 1) B_(1 J)+dots+A_(I H) b_(H J);)
$
が成り立つ。
特に$M times L$型の行列$A$と$L times N$型の行列$B$に対して、$B$の$N$個の列を構成する$L$次の縦ベクトルを$bold(b)_1, dots, bold(b)_N$とすると、
$
A B
= A vec(bold(b)_1, dots.c, bold(b)_N)
= vec(A bold(b)_1, dots.c, A bold(b)_N)
$
が成り立つ。
]

#proof[
]

#example[
$A$を$N_1$次の正則行列、$D$を$N_2$次の正則行列として$N_1+N_2$次の正方行列
$
mat(A, B; O, D)
$
は正則であり、逆行列は
$
mat(A^(-1), -A^(-1) B D^(-1); O, D^(-1))
$
で与えられる。
実際、積を計算すると
$
mat(A, B; O, D)mat(A^(-1), -A^(-1) B D^(-1); O, D^(-1))
= mat(A A^(-1), -A A^(-1) B D^(-1)+B D^(-1); O, D D^(-1))
= mat(I, O; O, I),
$
$
mat(A^(-1), -A^(-1) B D^(-1); O, D^(-1))mat(A, B; O, D)
= mat(A^(-1) A, A^(-1) B-A^(-1) B D^(-1) D; O, D^(-1) D)
= mat(I, O; O, I)
$
であることからわかる。
] <t_blockinv>

#example[
実数$theta$に対して、$4$次正方行列
$
A
= mat(
	cos theta, -sin theta, -cos theta, -sin theta;
	sin theta, cos theta, sin theta, -cos theta;
	cos theta, sin theta, cos theta, -sin theta;
	-sin theta, cos theta, sin theta, cos theta;
)
$
は
$
A = mat(R(theta), -R(-theta); R(-theta), R(theta);)
$
とみなすことができる。
]

== ベクトルのテンソル積

$bold(a)$と$bold(b)$をそれぞれ$M$次と$N$次のベクトルとする時、
$bold(a)$を$M$次の縦ベクトル、$bold(b)^T$を$N$次の横ベクトルとみなして行列の積$bold(a)bold(b)^T$は$M times N$型の行列であり、ベクトル$bold(a)$と$bold(b)$の_テンソル積_と呼ばれ$bold(a) times.o bold(b)$とも書かれる。
成分を使って書けば
$
bold(a) times.o bold(b)
= bold(a)bold(b)^T
= mat(a_1; dots.v; a_M) mat(b_1, dots.c, b_N)
= mat(a_1 b_1, dots.c, a_1 b_N; dots.v, dots.down, dots.v; a_M b_1, dots.c, a_M b_N)
$
である。

また、$bold(a)$と$bold(b)$を$N$次のベクトルとする時、
$bold(a)^T$を横ベクトル、$bold(b)$を縦ベクトルとみなして行列の積$bold(a)^T bold(b)$はスカラーであり、ベクトル$bold(a)$と$bold(b)$の_スカラー積_と呼ばれ$bold(a) dot bold(b)$とも書かれる。
成分を使って書けば
$
bold(a) dot bold(b)
= bold(a)^T bold(b)
= mat(a_1, dots.c, a_N) mat(b_1; dots.v; b_N)
= a_1 b_1+dots+a_N b_N
$
である。
行列の積には交換法則は一般には成り立たないが、スカラー積に対しては交換法則が成り立つことに注意する。
つまり、任意の$N$次のベクトル$bold(a)$と$bold(b)$に対して、
$
bold(a) dot bold(b) = bold(b) dot bold(a)
$
が成り立つ。

ここで、$bold(a)$と$bold(b)$を$N$次ベクトルとする時のテンソル積である$N$次の正方行列$A = bold(a) times.o bold(b)$の$n$乗を考える。
$2$乗を計算すると、
$
A^2
= (bold(a)bold(b)^T)(bold(a)bold(b)^T)
= bold(a)(bold(b)^T bold(a))bold(b)^T
= (bold(b) dot bold(a))A
= (bold(a) dot bold(b))A
$
とスカラー積倍になる。
よってこれを繰り返し用いることで、
$
A^n = (bold(a) dot bold(b))^(n-1) A
quad (n = 1, 2, 3, dots)
$
を得る。
