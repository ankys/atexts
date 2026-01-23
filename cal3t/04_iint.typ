
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": dd
#let area = $op("area")$
#let vol = $op("vol")$
#let diag = $op("diag")$

= 重積分

== 重積分

一変数の積分は関数のグラフがなす図形の面積という側面と微分の逆作用素としての側面があったが、
多変数の積分すなわち重積分はどちらかというとグラフのなす図形の体積によって定義される。

一変数の定積分を思い出すと有界閉区間上定義された関数を定義域を分割して分割の幅を小さくしていくのであった。
それと同様のことを$N$次元有界閉矩形$[a_1, b_1] times dots times [a_N, b_N]$上の有界な$N$変数関数$f(x_1, dots, x_N)$について考える。
各区間$[a_i, b_i]$を分割$a_i = p^i_0 <= p^i_1 <= p^i_2 <= p^i_3 <= dots <= p^i_(K_i) = b_i$してその分割を$P_i$とおく。
_上リーマン和_と_下リーマン和_は次によって定義される。
$
overline(S)(f, P_1, dots, P_N) & = sum_(k_1 = 1)^(K_1) dots sum_(k_N = 1)^(K_N) sup_(x_1 in [p^1_(k_1-1), p^1_(k_1)]) dots sup_(x_N in [p^N_(k_N-1), p^N_(k_N)]) f(x_1, dots, x_N) (p^1_(k_1)-p^1_(k_1-1)) dots (p^N_(k_N)-p^N_(k_N-1)), \
underline(S)(f, P_1, dots, P_N) & = sum_(k_1 = 1)^(K_1) dots sum_(k_N = 1)^(K_N) inf_(x_1 in [p^1_(k_1-1), p^1_(k_1)]) dots inf_(x_N in [p^N_(k_N-1), p^N_(k_N)]) f(x_1, dots, x_N) (p^1_(k_1)-p^1_(k_1-1)) dots (p^N_(k_N)-p^N_(k_N-1)).
$
このリーマン和は一変数の場合と同様に大小関係について良い性質を持っており、上リーマン和の$P_1, dots, P_N$についての下限を上積分、下リーマン和の上限を下積分としてそれらが一致するとき$f$は有界閉矩形$[a_1, b_1] times dots times [a_N, b_N]$上で_重積分可能_あるいは_重可積分_または重積分は収束するといい値を_重積分_
$
integral dots integral_([a_1, b_1] times dots times [a_N, b_N]) f(x_1, dots, x_N) dd((x_1, dots, x_N))
$
と表す。
この時の$[a_1, b_1] times dots times [a_N, b_N]$を_積分領域_、$f$を_被積分関数_と呼ぶ。

定義としては上記の通りであるがいちいち成分を書いていたら大変なのでいくつかの記号を導入して記述を短縮する。
まず、$x = (x_1, dots, x_N)$として、積分領域を$D = [a_1, b_1] times dots times [a_N, b_N]$と被積分関数を$f(x)$と表す。
分割$P_1, dots, P_N$に対して$P = (P_1, dots, P_N)$とおくと$P$は積分領域$D = [a_1, b_1] times dots times [a_N, b_N]$を$K_1 dots K_N$個に分割したものと考えられ、
分割の一つの部分を$C = [p^1_(k_1-1), p^1_(k_1)] times dots times [p^N_(k_N-1), p^N_(k_N)]$とおいて、
その$N$次元_面積_を
$
area(C) = (p^1_(k_1)-p^1_(k_1-1)) dots (p^N_(k_N)-p^N_(k_N-1))
$
とする。
この時、上リーマン和と下リーマン和は以下のようになる。
$
overline(S)(f, P) = sum_(C in P) sup_C f area(C),
quad underline(S)(f, P) = sum_(C in P) inf_C f area(C).
$
さらに上積分と下積分は以下で定義される。
$
overline(integral)_D f(x) dd(x) = overline(S)(f) = inf_P sum_(C in P) sup_C f area(C),
quad underline(integral)_D f(x) dd(x) = underline(S)(f) = sup_P sum_(C in P) inf_C f area(C).
$
有界関数$f$が有界閉矩形$D$上で重積分可能であるとはこの二つの値が一致する場合で重積分は
$
integral_D f(x) dd(x)
$
と表される。

有界閉矩形$tilde(D)$の部分集合つまり有界集合$D$上の関数$f$の重積分は$0$で定義域を$tilde(D)$に拡張する。
つまり
$
tilde(f)(x) = cases(
  f(x) & (x in D)",",
  0 & (x in tilde(D)\\D),
)
$
として、
$tilde(f)$が$tilde(D)$上で重積分可能なとき$f$は$D$上で重積分可能といい、
$
integral_D f(x) dd(x) = integral_(tilde(D)) tilde(f)(x) dd(x)
$
と定義する。
ここで点集合$D$に対して_特性関数_
$
1_D (x) = cases(
  1 & (x in D)",",
  0 & (x in.not D),
)
$
を導入すると、
$f$が$D$上で重積分可能とは$tilde(f)(x) = f(x) 1_D (x)$が重積分可能と表現することができる。

$f$が定数関数$1$の時の重積分
$
integral_D 1 dd(x) = integral_D dd(x)
$
が収束する時、 有界な積分領域$D$は_面積確定_といい、
重積分の値を$D$の面積といい$area(D)$と表す。
$D$が面積確定であることは特性関数$1_D$が積分可能であることと同値である。
有界閉矩形は面積確定であり、その面積は重積分の定義で現れた面積と一致する。

#remark[
ここでいう面積確定や面積はジョルダン可測やジョルダン測度と呼ばれる面積の測り方の一種であり、
リーマン積分はその測度に基づく積分と表現することができる。
実用上のだいたいの集合や関数はジョルダン可測、リーマン積分可能であるが、
極限操作、例えば無限個のジョルダン可測集合の共通部分はジョルダン可測になるかは難しい問題になってしまう。
そこで一般にはより多くの操作を保証するルベーグ可測やルベーグ測度、ルベーグ積分の方が広く使われている積分の理論であるが、
本テキストでは古典的な理論としてジョルダン可測、ジョルダン測度、リーマン積分を扱う。
]

$area(D) = 0$となるような集合$D$を_面積零集合_という。
面積零集合上の（有界）関数の積分は常に$0$である。

#proposition([面積確定])[
有界集合$X$が面積確定であるための必要十分条件は境界$partial X$が面積零集合であることである。
]

#proof[
分割$P$に対して小矩形$C in P$が$partial X$と交わりを持つことが重要でありそのような小矩形$C$の集合を$Q$とおく。
そうでないような小矩形$C$に対しては$X$の内部に包含されるか外部に包含されるかなので、
$
sum_(C in P) (sup_C 1_X-inf_C 1_X) area(C)
= sum_(C in Q) (sup_C 1_X-inf_C 1_X) area(C)
<= sum_(C in Q) area(C)
= sum_(C in P) sup_C 1_(partial X) area(C)
$
が成り立ち、
ここから直ちに$partial X$が面積零なら$X$は面積確定がわかる。

逆を言うにはもう少し細かい議論が必要になる。
$C in Q$であって$sup_C 1_X-inf_C 1_X$が$1$にならない場合は$C$上で$1_X$が定数の場合で$C subset X$または$C subset X^c$の場合、つまり$C$の内部に$X$の境界点がないとなる。
したがって、$P$の細分を取ればそのような$C$のうちいくらかの部分上で$1_X$は定数関数になり、細分を細かくすると$C$の面積のうちいくらでも取り除けるので、$abs(P) -> 0$で
$
sum_(C in P) sup_C 1_(partial X) area(C)-sum_(C in P) (sup_C 1_X-inf_C 1_X) area(C)
-> 0
$
となり、$X$が面積確定なら$partial X$は面積零もいえる。
]

重積分では一変数の場合の定積分と同様のことが成立する。

#proposition([積分の線形性])[
有界集合$D$上の積分可能な関数$f, g$と実数$c$に対して、
$
integral_D (f(x)+g(x)) dd(x) = integral_D f(x) dd(x)+integral_D g(x) dd(x),
quad integral_D c f(x) dd(x) = c integral_D f(x) dd(x)
$
が成り立つ。
]

#proposition([積の積分])[
有界集合$D$上の積分可能な関数$f, g$に対して、積$f(x)g(x)$は積分可能である。
]

#remark[
和や定数倍の時と違って、積分可能はわかっても積分値についてはわからないので注意すること。
]

#proof[
任意の$x, y in D$に対して
$
abs(f(x)g(x)-f(y)g(y))
<= abs(f(x))abs(g(x)-g(y))+abs(g(y))abs(f(x)-f(y))
<= sup abs(f)abs(g(x)-g(y))+sup abs(g)abs(f(x)-f(y))
$
よって、$f, g$が積分可能なので、$f g$も積分可能である。
]

#proposition([積分領域の分割])[
二つの有界集合$D_1, D_2$上で積分可能な関数$f$に対して$f$は$D_1 union D_2, D_1 inter D_2$上でも積分可能で、
$ integral_(D_1) f(x) dd(x)+integral_(D_2) f(x) dd(x) = integral_(D_1 union D_2) f(x) dd(x)+integral_(D_1 inter D_2) f(x) dd(x) $
が成り立つ。 特に$D_1 inter D_2$が面積零集合のとき
$ integral_(D_1 union D_2) f(x) dd(x) = integral_(D_1) f(x) dd(x)+integral_(D_2) f(x) dd(x) $
が成り立つ。
]

#proof[
まず$g(x) = f(x) 1_(D_1) (x) 1_(D_2) (x)$は積分可能な関数の積より、
$f$は$D_1 inter D_2$上で積分可能であることに注意する。
$D_1 union D_2$上定義された関数$f$に対して、$f_1 (x) = f(x) 1_(D_1) (x)$と$f_2 (x) = f(x) 1_(D_2) (x)$とおけば、
$f = f_1+f_2-g$より積分の線形性から
$
integral_(D_1 union D_2) f(x) dd(x)
& = integral_(D_1 union D_2) f_1 (x) dd(x)+integral_(D_1 union D_2) f_2 (x) dd(x)-integral_(D_1 union D_2) g(x) dd(x) \
& = integral_(D_1) f(x) dd(x)+integral_(D_2) f(x) dd(x)-integral_(D_1 inter D_2) f(x) dd(x)
$
を得る。
]

#proposition([絶対値の積分])[
有界集合$D$上の積分可能な関数$f$に対して絶対値$abs(f(x))$は積分可能である。
さらに積分可能な関数$f, g$に対して最大$max { f(x), g(x) }$および最小$min { f(x), g(x) }$は積分可能である。
]

#proof[
任意の$x, y in D$に対して三角不等式より
$
abs(abs(f(x))-abs(f(y)))
<= abs(f(x)-f(y)).
$
よって、$f$が積分可能なので、$abs(f)$も積分可能である。

最大と最小は
$
max { f(x), g(x) } = (f(x)+g(x))/2+abs(f(x)-g(x))/2,
quad min { f(x), g(x) } = (f(x)+g(x))/2-abs(f(x)-g(x))/2,
$
なので積分可能である。
]

積の積分同様、絶対値の積分も積分値を元の関数の積分で表すことは一般にはできないが、以下の不等式が成り立ち今後の議論において重要である。

#proposition([積分の大小関係])[
有界集合$D$上の積分可能な関数$f, g$が各$x in D$に対して$f(x) <= g(x)$を満たすとき、
$
integral_D f(x) dd(x) <= integral_D g(x) dd(x)
$
が成り立つ。
特に有界集合$D$上で積分可能な関数$f$に対して、
$
abs(integral_D f(x) dd(x)) <= integral_D abs(f(x)) dd(x)
$
が成り立つ。
]

== 連続関数の可積分性

一次元の定積分において有界閉区間上の連続関数は積分可能だったように重積分でも有界閉矩形上の連続関数は積分可能だが、
これを有界閉集合に広げようとすると面積確定のもとで拡張される。

#theorem([連続関数の可積分性])[
面積確定有界閉集合上の連続関数は積分可能である。
] <t_contint>

#proof[
有界閉集合$X$上の連続関数$f$は有界かつ一様連続であることに注意する。
分割$P$の小矩形$C in P$に対して$partial X$と交わりを持つようなもの全体を$Q$と、$X$に包含されるもの全体を$macron(P)$とおくと、
$
sum_(C in P) (sup_C f 1_X-inf_C f 1_X) area(C)
&<= sum_(C in Q) M area(C)+sum_(C in macron(P)) (sup_C f-inf_C f) area(C) \
&<= M sum_(C in P) sup 1_(partial X) area(C)+omega(abs(P)) area(X)
$
が成り立つ。
ここで面積確定有界閉集合$X$の境界$partial X$は面積零集合なので、分割$P$を細かくするとこれは$0$に収束するので、
$f$は$X$上積分可能である。
]

この定理の証明でも使っている通り面積確定であるための条件は境界が面積零であることだが、
ではどのような場合に境界が面積零になるだろうか。

基本的に次数が低いと考えられる集合は面積零である。

#proposition[
$M = 1, 2, 3, dots, N-1$として$D$を$M$次元面積確定集合とすると$N$次元点集合
$
X = { (x, 0) in RR^N = RR^M times RR^(N-M) mid(|) x in D }
$
は面積零である。
]

なぜなら有界閉矩形は面積確定なのでその境界と境界の部分集合とみなすことのできる$X$は面積零である。
または次節の累次積分の議論を使えば@t_repvol の系としても示すことができる。

== 累次積分

重積分は定積分同様定義にもとづいて具体的に積分を計算するのはかなり大変である。
// さらに重積分の場合には微分積分学の基本定理のようなものがない。
そこで実用上は重積分を積分の積分とみなすことで一変数の定積分に帰着させるということが行われる。
この積分の積分のことを累次積分といい、次の定理が基本になる。

#theorem([累次積分])[
$A, B$を有界集合として、$f(x, y)$を$A times B$上の積分可能関数とする。
ここで各$x in A$に対して$f(x, y)$は$y$について$B$上積分可能としてその積分値を$F(x)$とする時、
$F(x)$は$A$上積分可能であって
$
integral.double_(A times B) f(x, y) dd((x, y))
= integral_A F (x) dd(x)
= integral_A integral_B f(x, y) dd(y) dd(x) $
が成り立つ。
同様に各$y in B$に対して$f(x, y)$は$x$について$A$上積分可能としてその積分値を$G(y)$とする時、
$G(y)$は$B$上積分可能であって
$
integral.double_(A times B) f(x, y) dd((x, y))
= integral_B G (y) dd(y)
= integral_B integral_A f(x, y) dd(x) dd(y)
$
が成り立つ。
特に各積分が収束するならば$N$変数関数$f(x_1, dots, x_N)$について
$
integral dots integral_([a_1, b_1] times dots times [a_N, b_N]) f(x_1, dots, x_N) dd((x_1, dots, x_N))
= integral_(a_1)^(b_1) dots integral_(a_N)^(b_N) f(x_1, dots, x_N) dd(x_N) dots dd(x_1)
$
が成り立つ。
]

#proof[
まず一般に$f(x, y)$が上に有界の時、上積分について
$
overline(integral.double)_(A times B) f(x, y) dd((x, y))
>= overline(integral)_A overline(integral)_B f(x, y) dd(y) dd(x)
$
が成り立つことを示す。
$A$の分割の一つの矩形を$C_A$、$B$のを$C_B$とおくと
$
overline(integral)_(C_A) overline(integral)_(C_B) f(x, y) dd(y) dd(x)
<= overline(integral)_(C_A) overline(integral)_(C_B) sup_(x in C_A, y in C_B) f(x, y) dd(y) dd(x)
= sup_(C_A times C_B) f area(C_A) area(C_B)
$
なので、これらを集めることで上の上積分についての不等式を得る。
同様にして下積分について
$
underline(integral.double)_(A times B) f(x, y) dd((x, y))
<= underline(integral)_A underline(integral)_B f(x, y) dd(y) dd(x)
$
も得る。
ここで
$
underline(integral.double)_(A times B) f(x, y) dd((x, y))
<= underline(integral)_A underline(integral)_B f(x, y) dd(y) dd(x)
<= underline(integral)_A overline(integral)_B f(x, y) dd(y) dd(x)
<= overline(integral)_A overline(integral)_B f(x, y) dd(y) dd(x)
<= overline(integral.double)_(A times B) f(x, y) dd((x, y)),
$
$
underline(integral.double)_(A times B) f(x, y) dd((x, y))
<= underline(integral)_A underline(integral)_B f(x, y) dd(y) dd(x)
<= overline(integral)_A underline(integral)_B f(x, y) dd(y) dd(x)
<= overline(integral)_A overline(integral)_B f(x, y) dd(y) dd(x)
<= overline(integral.double)_(A times B) f(x, y) dd((x, y))
$
なので、重積分可能条件より最左辺と最右辺が等しいことから全ての等号が成り立つ、つまり
$
integral.double_(A times B) f(x, y) dd((x, y))
= integral_A underline(integral)_B f(x, y) dd(y) dd(x)
= integral_A overline(integral)_B f(x, y) dd(y) dd(x)
$
である。
特に$y$について積分可能性があれば定理の前半部分が証明される。
後半も同様（証明省略）。
]

#corollary([フビニの定理])[
$A, B$を有界集合として、$f(x, y)$を$A times B$上の積分可能関数とする。
ここで各$x in A$に対して$f(x, y)$は$y$について$B$上積分可能、各$y in B$に対して$f(x, y)$は$x$について$A$上積分可能とする時、
$
integral_A integral_B f(x, y) dd(y) dd(x)
= integral_B integral_A f(x, y) dd(x) dd(y)
$
が成り立つ。
つまり積分順序の交換ができる。
]

#corollary([変数分離の重積分])[
変数分離された関数$f(x) g(y)$に対して
$
integral.double_(A times B) f(x) g(y) dd((x, y))
= integral_A f(x) dd(x) integral_B g(y) dd(y)
$
が成り立つ。
]

#example[
重積分
$
I = integral.double_([0, 1] times [0, 1]) x y dd((x, y))
$
を考える。
これを重積分の定義に従って計算すると、特殊な分割として二つの区間$[0, 1]$を$K = 1, 2, 3, dots$等分して$k, l = 1, dots, K$に対して$(x, y) = (k/K, l/K)$での値を考えることで
$
I
= lim_(K -> oo) sum_(k = 1)^K sum_(l = 1)^K k/K l/K 1/K^2
= lim_(K -> oo) 1/K^4 dot 1/2 K (K+1) dot 1/2 K (K+1) = 1/4 $
を得る。
一方で累次積分を使うと、
$
I
= integral_0^1 x dd(x) integral_0^1 y dd(y)
= 1/2 dot 1/2
= 1/4
$
と計算される。
一般に数列和の計算は大変で積分の方が計算しやすいので、積分の積分すなわち累次積分を利用すると良い。
]

上記の例では$x$と$y$が対称であったが、非対称な問題ではどちらの変数で先に積分するかで計算の手間が変わる場合がある。
そのような問題では原始関数が計算しやすい方の変数で先に積分すると良い。

#example[
重積分
$
I = integral.double_([0, 1] times [0, 1]) x^2 y e^(x y^2) dd((x, y))
$
を考える。
$x$で先に積分すると、原始関数が
$
integral x^2 y e^(x y^2) dd(x)
& = integral x^2 1/y (e^(x y^2))' dd(x)
= x^2 1/y e^(x y^2)-integral 2 x 1/y e^(x y^2) dd(x) \
&= x^2 1/y e^(x y^2)-integral 2 x 1/y^3 (e^(x y^2))' dd(x)
= x^2 1/y e^(x y^2)-2 x 1/y^3 e^(x y^2)+integral 2 1/y^3 e^(x y^2) dd(x) \
&= x^2 1/y e^(x y^2)-2 x 1/y^3 e^(x y^2)+2 1/y^5 e^(x y^2)+C
$
より、
$
integral_0^1 x^2 y e^(x y^2) dd(x)
= [x^2 1/y e^(x y^2)-2 x 1/y^3 e^(x y^2)+2 1/y^5 e^(x y^2)]_0^1
= 1/y e^(y^2)-2 1/y^3 e^(y^2)+2 1/y^5 e^(y^2)-2 1/y^5
$
となり、頑張れば
$
integral (1/y e^(y^2)-2 1/y^3 e^(y^2)+2 1/y^5 e^(y^2)-2 1/y^5) dd(y)
= (e^(y^2) y^2-e^(y^2)+1)/(2 y^4)
= 1/4+1/6 y^2+dots
$
がわかるので、最初の重積分は
$
I
= integral_0^1 (1/y e^(y^2)-2 1/y^3 e^(y^2)+2 1/y^5 e^(y^2)-2 1/y^5) dd(y)
= 1/4
$
である。
その一方$y$で先に積分すると、原始関数が
$
integral x^2 y e^(x y^2) dd(y) = 1/2 x e^(x y^2)+C
$
より、
$
integral_0^1 x^2 y e^(x y^2) dd(y)
= [1/2 x e^(x y^2)]_0^1
= 1/2 x e^x-1/2 x
$
なので、
$
I
= integral_0^1 (1/2 x e^x-1/2 x) dd(x)
= [1/2 (x e^x-e^x)-1/4 x^2]_0^1
= 1/4
$
となる。
計算結果は同じだが、そこに行き着く労力には大きな差がある。
特に先に原始関数が簡単にわかる方で計算することで次の積分がより計算しやすい形になっている。
]

以上は長方形領域での議論であるが、一般の形状の積分領域においては$x$（または$y$）を固定すると$y$ ($x$)の動く範囲が$x$ ($y$)によって変わることになる。
つまり、$(x, y)$が動く集合$D subset A times B$が$x in A$を固定するごとに$y$が$B(x)$を動くとすると
$
D = { (x, y) mid(|) x in A, y in B(x) }
$
と表されて、この時$D$は_縦線集合_と呼ばれる。
同様に$y in B$を固定するごとに$x$が$A (y)$を動くとすると
$
D = { (x, y) mid(|) y in B, x in A(y) }
$
と表されて、この時$D$は_横線集合_と呼ばれる。

#corollary([一般領域での累次積分])[
$f(x, y)$を縦線集合$D = { (x, y) mid(|) x in A, y in B(x) }$上の積分可能な関数であり各$x in A$に対して$f(x, y)$は$y$について$B(x)$上積分可能とする時、
$
integral.double_D f(x, y) dd((x, y))
= integral_A integral_(B(x)) f(x, y) dd(y) dd(x)
$
が成り立つ。
$f(x, y)$を横線集合$D = { (x, y) mid(|) y in B, x in A(y) }$上の積分可能な関数であり各$y in B$に対して$f(x, y)$は$x$について$A(y)$上積分可能とする時、
$
integral.double_D f(x, y) dd((x, y))
= integral_B integral_(A(y)) f(x, y) dd(x) dd(y)
$
が成り立つ。
]

よくある適用例は積分の積分が与えられた時に積分順序を入れ替えることである。
その場合には縦線集合と横線集合の変換をする必要があるので注意する。

#example[
$x$軸と$y$軸と直線$x+y = 1$で囲まれた部分を$D$とおいて重積分
$
I = integral.double_D x y dd((x, y))
$
を考える。
この時、$D$は縦線集合
$
D = { (x, y) mid(|) 0 <= x <= 1, 0 <= y <= 1-x }
$
とみなせるので、
$
I
= integral_0^1 integral_0^(1-x) x y dd(y) dd(x)
= integral_0^1 1/2 x (1-x)^2 dd(x)
= 1/24
$
と計算される。
]

#example[
積分の積分
$
I = integral_0^1 integral_x^1 e^(-y^2) dd(y) dd(x)
$
を考える。
実は$e^(-y^2)$は原始関数が初等関数では表せない関数なので、このままでは内側の積分が計算できない。
そこで積分の順序交換を行うために積分領域を縦線集合から横線集合に変更すると
$
{ (x, y) mid(|) 0 <= x <= 1, x <= y <= 1 }
= { (x, y) mid(|) 0 <= y <= 1, 0 <= x <= y }
$
より、
$
I
= integral_0^1 integral_0^y e^(-y^2) dd(x) dd(y)
= integral_0^1 y e^(-y^2) dd(y)
= [-1/2 e^(-y^2)]_0^1
= (e-1)/(2 e)
$
と計算される。
]

特に$f$を定数関数$1$とすると集合の体積（今までは面積と呼んでいたが次数が上がるので体積と呼ぶ）について次が得られる。

#corollary([カヴァリエリの原理])[
縦線集合$D = { (x, y) mid(|) x in A, y in B(x) }$の体積は
$
vol(D)
= integral_A area(B(x)) dd(x)
$
で与えられ、
横線集合$D = { (x, y) mid(|) y in B, x in A(y) }$の体積は
$
vol(D)
= integral_B area(A(y)) dd(y)
$
で与えられる。
] <t_repvol>

#example[
単位球$B = { (x, y, z) in  RR^3 mid(|) x^2+y^2+z^2 <= 1 }$の体積を考える。
これは縦線集合あるいは横線集合として
$
B
&= { (x, y, z) in RR^3 mid(|) x^2+y^2 <= 1, -sqrt(1-x^2-y^2) <= z <= +sqrt(1-x^2-y^2) } \
&= { (x, y, z) in RR^3 mid(|) -1 <= z <= +1, x^2+y^2 <= 1-z^2 }
$
として表される。
そのため半径$r$の円板を\$D(r) =  { (x, y) in  RR^2 mid(|) x^2+y^2 <= r^2 }\$として、
$
vol(B)
= integral_(D(1)) 2 sqrt(1-x^2-y^2) dd((x, y))
= integral_(-1)^(+1) area(D(sqrt(1-z^2))) dd(z)
$
と二通りの計算法があることがわかる。
球の体積について詳しくは次章で述べる。
]

== 変数変換の公式

#theorem([重積分の変数変換])[
$x = Phi(u)$は$u$が動く開集合$U$を$x$が動く開集合$X$に一対一に移す$C^1$級変換としてヤコビアン$det J Phi(u)$の値は全ての$u in U$で非零とする。
この時、$X$の面積確定有界閉部分集合$D$とその上の連続関数$f(x)$に対して
$
integral_D f(x) dd(x)
= integral_(Phi^(-1) (D)) f(Phi(u)) abs(det J Phi(u)) dd(u)
$ <e_cvcpt>
が成り立つ。
]

この定理の重要な点は$x = Phi (u)$と変数変換すると$dd(x) = abs(det J Phi(u))dd(u)$と考えられるところである。
一変数の置換積分の際にはなかった絶対値がついているのは積分の向きが重積分では考慮されていないためである。

#corollary([一次変換])[
二次元の一次変換$x = a u+b v$, $y = c u+d v$を考えると、ヤコビアン$a d-b c$が非零である限り
$
integral.double_X f(x, y) dd((x, y))
= integral.double_U f(a u+b v, c u+d v) abs(a d-b c) dd((u, v))
$
が成り立つ。
]

#corollary([極座標変換])[
二次元の極座標変換$x = r cos theta$, $y = r sin theta$を考えると、
$
integral.double_X f(x, y) dd((x, y))
= integral.double_U f(r cos theta, r sin theta) r dd((r, theta))
$
が成り立つ。
]

変数変換の公式の証明をするために次の補題を準備する。

#lemma[
$D$を面積確定有界閉集合として$f$をその上の連続関数とする。
この時、度合い関数$omega$が存在して次のようにできる。
$P$を$D$の分割、つまり$D$の面積確定有界閉部分集合$E$の集合で、任意の$E_1, E_2 in P$, $E_1 eq.not E_2$に対して$E_1 inter E_2$は面積零集合で$union.big_(E in P) E = D$を満たすとする。
この時、各$E$の任意の点$hat(x) in E$に対して
$
abs(sum_(E in P) f(hat(x)) area(E)-integral_D f(x) dd(x))
<= omega(max_(E in P) diag(E)) area(D)
$
が成り立つ。
ただし、$diag(E)$は$E$の二点の最大距離、つまり
$diag(E) = sup_(x, y in E) d(x, y)$
を表す。
]

この補題は重積分の定義で分割を小さな矩形でしていたのをもっと一般の図形で分割しても積分値は変わらないことを意味している。

#proof[
$f$は$D$上一様連続より連続性の度合いを$omega$とすると、
$
abs(sum_(E in P) f(hat(x)) area(E)-integral_D f(x) dd(x))
&= abs(sum_(E in P) integral_E f(hat(x)) dd(x)-sum_(E in P) integral_E f(x) dd(x))
<= sum_(E in P) integral_E abs(f(x)-f(hat(x))) dd(x) \
&<= sum_(E in P) integral_E omega(diag(E)) dd(x)
<= omega(max_(E in P) diag(E)) area(D)
$
である。
]

#remark[
ここでは$f$は連続関数として証明したが、より一般の重積分可能関数に対しても類似の結果を得ることができる（らしい）。
]

#proof([重積分の変数変換の証明])[
まず、$f$が定数関数$1$で$Phi(u)$がベクトル$u$に行列$A$をかける操作$Phi(u) = A u$として$D = Phi([0, 1]^N)$の場合を考える。
この時、$A = mat(a_1, dots.c, a_N)$として、$D$は$N$個の$N$次元ベクトル$a_1, dots, a_N$が張る平行四辺形（の$N$次元版）であり、示すべき式は
$
area(D) = abs(det A)$
となる。
このことの証明は省略する。
平行移動と拡大縮小すれば$Phi(u) = A u+b$で$D$が有界閉矩形$R$の像の時も
$
area(D) = abs(det A)area(R)
$
が成り立つことに注意する。

次に一般の$C^1$級変換$x = Phi (u)$と$Phi^(-1) (D)$が点$P_0 (u_1, dots, u_N)$を含み一辺の長さが$h > 0$の正方形（の$N$次元版）$R_(u, h) = [u_1, u_1+h] times dots times [u_N, u_N+h]$の場合について、
$
lim_(h -> 0) area(Phi(R_(u, h)))/area(R_(u, h))
= abs(det J Phi(u))
$
が成り立つことを示す。
ただし、$area(R_(u, h)) = h^N$であることに注意する。
TODO

一般の$f$, $Phi$と$X$の面積確定有界閉部分集合$D$に対して@e_cvcpt を示す。
ここで$u in D$についての関数$f(Phi(u))abs(det J Phi(u))$は連続なので右辺の重積分は収束することに注意する。
$n = 0, 1, 2, 3, dots$に対して、全空間$RR^N$を一辺の長さが$h = 2^(-n)$の$N$次元正方形$R_(u, h)$ ($u = (h i_1, dots, h i_N)$, $i_1, dots, i_N in ZZ$)に分割する。
$P_n$を$U$に含まれるような正方形$R_u = R_(u, h)$全体として、$P_n$の正方形$R_u$を$Phi$で移した図形$E_x$ ($x = Phi(u)$)の集合を$Q_n$とおく。
この時、$tilde(f)(x) = f(x) 1_D (x)$として$n -> oo$において
$
sum_(E_x in Q_n) tilde(f)(x) area(E_x)
-> integral_D f(x) dd(x),
quad sum_(R_u in P_n) tilde(f)(Phi(u))abs(det J Phi(u))area(R_u)
-> integral_(Phi^(-1) (D)) f(Phi(u))abs(det J Phi(u)) dd(u)
$
であることに注意する。
ここで、
$
&abs(sum_(E_x in Q_n) f(x) area(E_x)-sum_(R_u in P_n) f(Phi(u))abs(det J Phi(u))area(R_u)) \
&quad <= sum_(R_u in P_n) abs(f(Phi(u)))abs(area(Phi(R_u))-abs(det J Phi(u))area(R_u)) \
&quad <= sum_(R_u in P_n) abs(f(Phi(u)))abs(det J Phi(u))area(R_u)omega(h)
$
なので、
$n -> oo$とすると$h -> 0$であり$omega (h) -> 0$より等式@e_cvcpt が得られる。
]

== 多変数の微分積分学の基本定理

一変数の微分積分学の基本定理は微分と積分が逆の操作であるという内容で、不定積分は原始関数であるつまり積分の微分は元の関数になるという主張
$
(integral_a^x f(t) dd(t))' = f(x)
$
と定積分は原始関数を使って計算されるつまり微分の積分が元の関数で計算されるという主張
$
integral_a^b f'(x) dd(x) = f(b)-f(a)
$
からなる。
ここで紹介する多変数の微分積分学の基本定理は微分の積分が元の関数で計算されるという主張の拡張である。
多変数関数$f$の変数のうち一つを$y$としてその他をまとめて$x$とすると、偏微分$f_y$の重積分は以下のように計算される。

#theorem([多変数の微分積分学の基本定理１])[
$f(x, y)$を縦線集合$D = { (x, y) mid(|) x in A, a(x) <= y <= b(x) }$を含む開集合上の$C^1$級関数であり、$A$は面積確定有界閉集合で$a(x), b(x)$は$A$上の連続関数とする。
このとき
$
integral.double_D f_y (x, y) dd((x, y))
= integral_A (f(x, b(x))-f(x, a(x))) dd(x)
$
が成り立つ。
]

#proof[
重積分を累次積分にして$y$での積分を一変数の微分積分学の基本定理で計算すると
$
integral.double_D f_y (x, y) dd((x, y))
= integral_A integral_(a(x))^(b(x)) f_y (x, y) dd(y) dd(x)
= integral_A (f(x, b(x))-f(x, a(x))) dd(x)
$
である。
]

この定理は証明を見ても大したことをしていないように見えるが、実際には重積分を境界
$
partial D = { (x, y) mid(|) x in A, y = a(x) } union { (x, y) mid(|) x in A, y = b(x) } union { (x, y) mid(|) x in partial A, a(x) <= y <= b(x) }
$
での積分に帰着させるとても重要な定理である。
実際、$a(x), b(x)$が$C^1$級の時には$n_y$を$partial D$のいわゆる外向き単位法線ベクトル$n$の$y$成分として定理の右辺は
$
integral_(partial D) f(x, y) n_y (x, y) dd(S(x, y))
$
と書くことができる。
ただし、$dd(S)$はいわゆる面積要素である。
定理の設定においては$y = b(x)$上では$n = 1/sqrt(1+abs(gradient b(x))^2) vec(-gradient b(x), 1)$, $dd(S(x, y)) = sqrt(1+abs(gradient b(x))^2) dd(x)$、$y = a(x)$上では$n = 1/sqrt(1+abs(gradient a(x))^2) vec(gradient a(x), -1)$, $dd(S(x, y)) = sqrt(1+abs(gradient a(x))^2) dd(x)$、$x in partial A$上では$n_y = 0$なので、
$
integral_(partial D) f(x, y) n_y (x, y) dd(S(x, y))
= integral_A (f(x, b(x))-f(x, a(x))) dd(x)
$
となる。

上記の定理は$f$の偏微分を取る方向$y$と境界$y = a(x), b(x)$が解かれる方向$y$が一致している場合であるが、
一致しない場合は次のようになる。

#theorem([多変数の微分積分学の基本定理２])[
$f(x, y, z)$を縦線集合$D = { (x, y, z) mid(|) x in A, a <= y <= b, c(x, y) <= z <= c(x, y)+d }$を含む開集合上の$C^1$級関数であり、$A$は面積確定有界閉集合、$a, b, d$は定数で$c(x, y)$は$A times [a, b]$上の連続関数とする。
このとき
$
&integral.triple_D f_y (x, y, z) dd((x, y, z)) \
&= integral_A integral_0^d [f(x, b, c(x, b)+t)-f(x, a, c(x, a)+t)] dd(t)dd(x)-integral_A integral_a^b [f(x, y, c(x, y)+d)-f(x, y, c(x, y))]c_y (x, y) dd(y)dd(x)
$
が成り立つ。
]

#proof[
$z = c(x, y)+t$と置換することで、
$
integral.triple_D f_y (x, y, z) dd((x, y, z))
= integral_A integral_a^b integral_(c(x, y))^(c(x, y)+d) f_y (x, y, z) dd(z)dd(y)dd(x)
= integral_A integral_a^b integral_0^d f_y (x, y, c(x, y)+t) dd(t)dd(y)dd(x)
$
である。
ここで、合成関数の微分法より
$
(f(x, y, c(x, y)+t))_y
&= f_y (x, y, c(x, y)+t)+f_z (x, y, c(x, y)+t) c_y (x, y) \
&= f_y (x, y, c(x, y)+t)+(f(x, y, c(x, y)+t) c_y (x, y))_t
$
なので、
$
integral.triple_D f_y (x, y, z) dd((x, y, z))
= integral_A integral_a^b integral_0^d [(f(x, y, c(x, y)+t))_y-(f(x, y, c(x, y)+t) c_y (x, y))_t] dd(t)dd(y)dd(x)
$
となり、右辺を計算すれば証明が完了する。
]

この定理においても複雑な右辺は境界での積分として解釈でき、二つの定理をより洗練された形でまとめると、明確に定義されていない記号もあるが、次の定理が成り立つことが知られている。

#theorem([ガウス・グリーンの定理])[
$D$を有界開集合の閉包として境界$partial D$は$C^1$級で$f(x) = f(x_1, dots, x_N)$を$D$を含む開集合上の$C^1$級関数とする。
このとき各$i = 1, dots, N$に対して
$
integral_D f_(x_i) (x) dd(x)
= integral_(partial D) f(x) n_i (x) dd(S(x))
$
が成り立つ。
]

このガウス・グリーンの定理とガウスの発散定理などの関連する定理はベクトル解析のテキストで詳しく説明する。

== 広義重積分

$N$次元有界集合$D$上の有界関数$f$で定義された重積分$integral_D f(x) dd(x)$であるが、
全体集合$RR^N$やその開集合などもっと一般の集合$X$に対してその上の有界とは限らない関数の重積分を定義したいことがある。
このような積分を広義重積分と呼ぶ。

本テキストで紹介する広義重積分は積分領域を面積確定有界閉集合で内側から近似するという方法で定義する。

#definition([積分領域の近似列])[
点集合$X$に対して次を満たす面積確定有界閉集合の列$(D_n)$を$X$の_近似列_という。

- 各自然数$n$に対して$D_n subset X$と$D_(n+1) supset D_n$が成り立つ。
- 任意の$x in X$に対してある自然数$n$が存在して$x in D_n$である。

つまり$D_n$は単調に大きくなって$union.big_n D_n = X$が成り立つ。
]

なお、全体集合$RR^N$をはじめとして基本的な点集合$X$には近似列が存在することに注意する。
近似列が存在しないのは無理数の集合のような病的な場合である。
以下では点集合$X$は近似列を持つものとする。

ここで、広義重積分$integral_X f(x) dd(x)$を面積確定有界閉集合上の重積分$integral_(D_n) f(x) dd(x)$の極限として捉えたいが、
近似列の取り方によって極限が変わると困るのでそれがないことを保証する必要がある。

点集合$X$上の関数$f$であって$X$に包含される任意の面積確定有界閉集合$D$上で（有界かつ）積分可能な時、$f$は_局所重積分可能_という。
連続関数は局所可積分である。

#definition[
$X$上の非負値の局所重積分可能関数$f$が
$
inf_((D_n)) liminf_n integral_(D_n) f(x) dd(x)
= sup_((D_n)) limsup_n integral_(D_n) f(x) dd(x)
$
を満たすとき$X$上で_広義重積分可能_といい、その値を
$
integral_X f(x) dd(x) 
$
と表し_広義重積分_という。
ただし、この式において下限と上限は$X$の近似列$(D_n)$について取る。

非負値とは限らない$X$上の関数$f$に対してはその正部分と負部分
$
f^+ (x) = max { f(x), 0 },
quad f^-(x) = max { -f(x), 0 }
$
の両方が広義重積分可能な時、$f$は_広義重積分可能_といい、
$
integral_X f(x) dd(x) = integral_X f^+ (x) dd(x)-integral_X f^- (x) dd(x)
$
を$f$の$X$上での_広義重積分_という。
]

#remark[
この広義重積分は一変数関数にも定義されるが、一変数の区間上の広義積分と微妙に定義が異なることに注意する。
つまり広義重積分$integral_((a, b)) f(x) dd(x)$は任意の近似列を通して定義するが、一変数広義積分$integral_a^b f(x) dd(x)$は特殊な近似のみを考える。
その結果、一変数広義積分では条件収束の場合が発生したが、広義重積分においては絶対収束のみで条件収束は起こらない。
]

重積分可能性と同様に広義重積分可能性を個別の問題で確認するのは大変なので、
十分条件（実際には必要十分条件になる）として次の定理を示す。

#lemma([非負値関数の広義重積分可能性])[
$X$上の非負値局所重積分可能関数$f$に対して、
$f$が$X$上で広義重積分可能であることは、
$X$のある近似列$(D_n)$が存在して、
$
sup_n integral_(D_n) f(x) dd(x) < oo
$
が成り立つことと同値である。
]

#proof[
$f$が広義重積分可能という条件は任意の近似列に対するとても強い条件なので、ある近似列に対して数列$(integral_(D_n) f(x) dd(x))_n$は収束し特に有界である。
逆について、$f$が非負値より数列$(integral_(D_n) f(x) dd(x))_n$は単調増加であり、仮定より有界なので収束する。
この極限値を$I$とおく。
ここで別の近似列$(D '_n)$に対して、$m = m_n$を十分大きくとれば$D'_n subset D_(m_n)$とできる。
よって、
$
integral_(D'_n) f(x) dd(x) <= integral_(D_(m_n)) f(x) dd(x) <= I
$
なので、数列$(integral_(D'_n) f(x) dd(x))_n$も有界で収束し極限値を$I'$とおくと$I' <= I$が成り立つ。
$(D_n)$と$(D '_n)$を入れ替えて同じ議論をすれば$I <= I'$がわかるので、二つ目の条件が成り立つ。
]

#remark[
$(integral_(D_n) f(x) dd(x))_n$が有界でない時は、
$
lim_n integral_(D'_n) f(x) dd(x) = lim_n integral_(D_n) f(x) dd(x) = oo
$
が成り立つ。
]

#theorem([広義重積分可能性])[
$X$上の局所重積分可能関数$f$に対して以下の条件は同値である。

+ $f$は$X$上で広義重積分可能である。
+ $abs(f)$は$X$上で広義重積分可能である。
+ $X$のある近似列$(D_n)$が存在して、
  $
  sup_n integral_(D_n) abs(f(x)) dd(x) < oo
  $
  が成り立つ。
]
この定理により今回の広義重積分可能性は絶対収束を意味する。

#proof[
二つ目と三つ目の条件の同値性は補題から従う。
二つ目の条件が成り立つ時、$f^+ (x), f^- (x) <= abs(f(x))$より、$f^+, f^-$はともに非負値広義重積分可能より一つ目の条件が成り立つ。
一つ目の条件が成り立つ時、$abs(f(x)) = f^+ (x)+f^- (x)$も広義重積分可能である。
]

以下では広義重積分を広義積分の広義積分つまり広義累次積分として計算する手法を紹介する。

#theorem([広義累次積分])[
$X, Y$を集合として、$f(x, y)$を$X times Y$上の広義積分可能関数とする。
ここで各$x in X$に対して$f(x, y)$は$y$について$Y$上広義積分可能とする時、
$
integral.double_(X times Y) f(x, y) dd((x, y))
= integral_X integral_Y f(x, y) dd(y) dd(x)
$
が成り立つ。
同様に各$y in Y$に対して$f(x, y)$は$x$について$X$上広義積分可能とする時、
$
integral.double_(X times Y) f(x, y) dd((x, y))
= integral_Y integral_X f(x, y) dd(x) dd(y)
$
が成り立つ。
]

#proof[
$X$の近似列として$(A_n)$を$Y$の近似列として$(B_n)$をそれぞれ取ると、
$(A_n times B_n)$は$X times Y$の近似列になっていることに注意する。
$f$は広義積分可能より
$
integral.double_((X times Y)\\(A_n times B_n)) abs(f(x, y)) dd((x, y))
-> 0
$
である。
ここで、
$
abs(integral.double_(A_n times B_n) f(x, y) dd((x, y))-integral_(A_n) integral_Y f(x, y) dd(y) dd(x))
<= integral_(A_n) integral_(Y\\B_n) abs(f(x, y)) dd(y) dd(x)
<= integral.double_((X times Y)\\(A_n times B_n)) abs(f(x, y)) dd((x, y))
-> 0
$
なので、定理が証明される。
後半部分も同様（証明省略）。
]

#example[
$X = \(0, 1\]^2$上の二変数関数
$
f(x, y) = (x^2-y^2)/(x^2+y^2)^2
$
の積分を考える。
この関数は$(x, y) = (0, 0)$では発散することに注意する。
ここで$y$で先に積分すると
$
integral_0^1 integral_0^1 (x^2-y^2)/(x^2+y^2)^2 dd(y) dd(x)
= integral_0^1 [y/(x^2+y^2)]_0^1 dd(x)
= integral_0^1 1/(x^2+1) dd(x)
= pi/4
$
で、$x$で先に積分すると
$
integral_0^1 integral_0^1 (x^2-y^2)/(x^2+y^2)^2 dd(x) dd(y)
= integral_0^1 [-x/(x^2+y^2)]_0^1 dd(y)
= integral_0^1 -1/(1+y^2) dd(y)
= -pi/4
$
となり積分順序の交換が行えない例となっている。
これは$f$が$X$上で広義重積分可能でないことに起因しており、
実際$X$の近似列として$D_n = [n^(-1), 1] times \(0, 1\]$として取るのと$D'_n = \(0, 1\] times [n^(-1), 1]$を取るのとで積分値が上記の通り異なっている。
]

変数変換の定理も広義重積分に拡張される。

#theorem([広義重積分の変数変換])[
$x = Phi(u)$は$u$が動く面積確定開集合$U$を$x$が動く面積確定開集合$X$に一対一に移す$C^1$級変換としてヤコビアン$det J Phi(u)$の値は全ての$u in U$で非零とする。
この時、$X$上の連続関数$f(x)$に対して
$
integral_X f(x) dd(x) = integral_U f(Phi(u))abs(det Phi(u)) dd(u)
$
が成り立つ。
]

#corollary([極座標変換])[
二次元の極座標変換$x = r cos theta$, $y = r sin theta$を考えると、
$
integral.double_X f(x, y) dd((x, y))
= integral.double_U f(r cos theta, r sin theta) r dd((r, theta))
$
が成り立つ。
]
