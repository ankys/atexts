
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "@preview/physica:0.9.4": dd
#let area = $op("area")$
#let vol = $op("vol")$

= 種々の計算

== 正測体と正軸体の体積

正測体とは線分、正方形、立方体といったものを次元について一般化したもので、
原点を中心とした半径$a > 0$の$N$次元_正測体_を
$
C_N (a) = { (x_1, dots, x_N) in RR^N mid(|) max{ abs(x_1), dots, abs(x_N) } <= a }
$
として定義される。
これは$C_N (a) = [-a, +a]^N$とも表記されるため、一辺の長さが$2 a$とも言えるが、次に述べる正軸体との兼ね合いで半径$a$という用語を使って表現する。
この$N$次元正測体の体積は$N$次元立方体の体積なので、
$
vol(C_N (a)) = (2 a)^N = 2^N a^N
$
である。

正軸体は線分、正方形、正八面体の一般化で、
原点を中心とした半径$a > 0$の$N$次元_正軸体_を
$
D_N (a) = { (x_1, dots, x_N) in RR^N mid(|) abs(x_1)+dots+abs(x_N) <= a }
$
として定義される。
この正軸体の体積はカヴァリエリの原理より次数についての帰納法で求めることができる。
つまり、$D_(N+1) (a)$において$x_(N+1) = y$を固定した時の切り口は$D_N(a-abs(y))$より
$
vol(D_(N+1) (a))
= integral_(-a)^(+a) area(D_N (a-abs(y))) dd(y)
= 2 integral_0^1 area(D_N ((1-t) a)) a dd(t).
$
ここで$vol(D_N (a)) = c_N a^N$とできると考えられ、
$
vol(D_(N+1) (a))
= 2 integral_0^1 c_N (1-t)^N a^(N+1) dd(t)
= 2/(N+1) c_N a^(N+1).
$
よって、
$
c_(N+1) = frac(2, N+1) c_N,
quad c_1 = 2
$
なので、$c_N = 2^N/(n!)$であり、
$
vol(D_N (a)) = 2^N/(n!) a^N
$
を得る。

== 球の体積

原点を中心とした半径$a > 0$の$N$次元_球_
$
B_N (a) = { (x_1, dots, x_N) in RR^N mid(|) x_1^2+dots+x_N^2 <= a^2 }
$
の体積を考える。
正軸体の体積同様、カヴァリエリの原理より
$
vol(B_(N+1) (a))
= integral_(-a)^(+a) area(B_N (sqrt(a^2-y^2)))dd(y)
= 2 integral_0^1 area(B_N(sqrt(1-t^2) a))a dd(t)
$
で$B_1 (a) = 2 a$に注意して、$vol(B_N (a)) = c_N a^N$とできることがわかる。
このとき$c_N$を求めることは積分
$
integral_0^1 (1-t^2)^(N/2) dd(t)
$
の計算に帰着される。

この計算はできないことはないが面倒なのでここでは別のアプローチを取る。
つまりカヴァリエリの原理を適用するときに$2$変数分使って$D(a) = { (x, y) in RR^2 mid(|) x^2+y^2 <= a^2 }$として
$
vol(B_(N+2) (a))
= c_(N+2) a^(N+2)
= integral.double_(D(a)) area(B_N (sqrt(a^2-x^2-y^2))) dd((x, y))
= integral.double_(D(a)) c_N sqrt(a^2-x^2-y^2)^N dd((x, y))
$
となり、極座標変換$x = a r cos theta, y = a r sin theta$により
$
c_(N+2) a^(N+2)
= c_N a^(N+2) integral_0^1 integral_0^(2 pi) sqrt(1-r^2)^N r dd(theta) dd(r)
= 2 pi c_N a^(N+2) integral_0^1 sqrt(1-r^2)^N r dd(r)
= (2 pi)/(N+2) c_N a^(N+2).
$
つまり、
$
c_(N+2) = (2 pi)/(N+2) c_N, quad c_1 = 2, quad c_2 = pi
$
より$c_N$を$N$の偶奇に分けて計算すると
$
vol(B_N (a))
= cases(
	(2^M pi^(M-1))/((2 M-1)(2 M-3)dots 3 dot 1) a^(2 M-1) & (N = 2 M-1),
	(2^M pi^M)/((2 M)(2 M-2)dots 4 dot 2) a^(2 M) & (N = 2 M)
)
$
がわかる。
なおこれはガンマ関数$Gamma(s)$を使えば、$Gamma(s+1) = s Gamma(s)$, $Gamma(1) = 1$, $Gamma(1/2) = sqrt(pi)$より、
$
vol(B_N (a)) = (pi^(N/2))/(Gamma(N/2+1) a^N
$
と表すことができる。

== ガウス積分
ガウス積分とはガウス関数の広義積分
$
I
= integral_(-oo)^(+oo) exp(-x^2) dd(x)
= integral_(-oo)^(+oo) e^(-x^2) dd(x)
= sqrt(pi)
$
のことである。

ここでは重積分の極座標変換を用いたガウス積分の計算を紹介する。
まず、重積分にするためにガウス積分の二乗を考えると
$
I^2
= integral_(-oo)^(+oo) exp(-x^2) dd(x) integral_(-oo)^(+oo) exp(-y^2) dd(y)
= integral_(RR^2) e^(-x^2-y^2) dd((x, y))
$
となる。
ここで極座標変換$x = r cos theta, y = r sin theta$をするとヤコビアンは$r$で$x y$平面での$RR^2$（正確には面積零集合である$x$軸の$0$以上の部分を除いたもの）は$r theta$平面での$(0, oo) times (0, 2 pi)$に対応するので、
$
I^2
= integral_(RR^2) e^(-x^2-y^2) dd((x, y))
= integral_0^oo integral_0^(2 pi) e^(- r^2) r dd(theta) dd(r)
= 2 pi integral_0^oo r e^(-r^2) dd(r)
= pi.
$
以上よりガウス積分の値$I = sqrt(pi)$を得る。
感覚的な説明としてはこの通りだが、細かいことを言うと広義累次積分の定理が使えるのは広義重積分が収束する場合なので、
先に広義重積分を極座標変換で収束することを示しておく方が厳密な議論としては適切である。

この他にも$x > 0$を固定した時の$y = x s$という変換により
$
I^2
= 2 integral_0^oo integral_(-oo)^(+oo) e^(-x^2-y^2) dd(y) dd(x)
= 2 integral_0^oo integral_(-oo)^(+oo) e^(-(1+s^2) x^2) x dd(s) dd(x).
$
ここでフビニの定理より
$
I^2
= 2 integral_(-oo)^(+oo) integral_0^oo e^(-(1+s^2) x^2) x dd(x) dd(s)
= integral_(-oo)^(+oo) 1/(1+s^2) dd(s)
= pi
$
となる。

== ベータ関数

ガンマ関数が階乗の実数への拡張だったように、二項係数の実数への拡張がベータ関数である。
ベータ関数は二変数である。
二項係数は階乗を使って表されるように、ベータ関数$B(x, y)$はガンマ関数$Gamma$を使って
$
B(x, y) = (Gamma(x) Gamma(y))/Gamma(x+y)
$
となるように設計される。
実際のところ上記をベータ関数の定義としても良いが、ここでは以下のようにして定義する。

#definition([ベータ関数])[
二つの正の実数$x, y$に対して積分
$
B (x, y) = integral_0^1 t^(x-1) (1-t)^(y-1) dd(t)
$
を対応させる関数を_ベータ関数_という。
]

$0 < x < 1$または$0 < y < 1$の場合、この積分は広義積分となるが$t = 0, 1$の周辺で$t$の$-1$より大きい次数なので積分は常に収束し、ベータ関数は$(0, oo)^2$で定義される。

ここで$t = cos^2 theta$と置換することで
$
B(x, y) = 2 integral_0^(pi/2) cos^(2 x-1) theta sin^(2 y-1) theta dd(theta)
$
であることに注意する。

#theorem([ベータ関数とガンマ関数])[
$x, y > 0$に対して
$
B(x, y) = (Gamma(x) Gamma(y))/Gamma(x+y)
$
が成り立つ。
]

#proof[
ガンマ関数は$t = u^2$と置換し
$
Gamma(x)
= integral_0^oo t^(x-1) e^(-t) dd(t)
= 2 integral_0^oo u^(2 x-1) e^(-u^2) dd(p)
$
であることに注意する。 よって、
$
Gamma(x) Gamma(y)
= 4 integral.double_(\[0, oo\) times \[0, oo\)) u^(2 x-1) v^(2 y-1) e^(-u^2-v^2) dd((u, v)) $
である。 ここで極座標変換$u = r cos theta$, $v = r sin theta$することで
$
Gamma(x) Gamma(y)
= 4 integral_0^oo integral_0^(pi/2) r^(2 x+2 y-1) cos^(2 x-1) theta sin^(2 y-1) theta e^(-r^2) dd(theta) dd(r)
= Gamma(x+y)B(x, y) $
を得る。
]

== ディリクレ積分

条件収束するシンク関数の広義積分の値は
$
integral_(-oo)^(+oo) sinc x dd(x)
= integral_(-oo)^(+oo) (sin x)/x dd(x)
= pi,
quad
integral_0^oo sinc x dd(x)
= integral_0^oo (sin x)/x dd(x)
= pi/2
$
であり、_ディリクレ積分_として知られている。
ここではディリクレ積分の値を一様収束を使った議論で導出する。

まず、$x eq.not 0$に対して
$
integral_0^1 cos x y dd(y)
= [(sin x y)/x]_0^1
= (sin x)/x
= sinc x
$
であることに注意する。
さらにこの式は$x = 0$でも、$sinc x = 0$なので、成立する。
そのためディリクレ積分は累次積分
$
integral_0^oo sinc x dd(x)
= integral_0^oo integral_0^1 cos x y dd(y) dd(x)
$
となることから積分の順序交換をしたいが、この積分領域$\[0, oo\) times [0, 1]$上の広義積分は絶対収束しないので直接は利用できない。
そこで常套手段として$x -> oo$で早く減少する$e^(-a x)$ ($a > 0$)を付け加えた重積分
$
I = integral.double_(\[0, oo\) times [0, 1]) e^(-a x) cos x y dd((x, y))
$
を代わりに考える。
この積分は
$
integral.double_(\[0, oo\) times [0, 1]) abs(e^(-a x) cos x y) dd((x, y))
<= integral.double_(\[0, oo\) times [0, 1]) e^(-a x) dd((x, y))
= integral_0^oo e^(-a x) dd(x)
= 1/a
< oo
$
なので、広義積分可能である。
先に$x$で積分することを考えると$b in [0, 1]$に対して
$
integral e^(-a x) cos b x dd(x)
= -1/a e^(-a x) cos b x-b/a integral e^(-a x) sin b x dd(x)
= -1/a e^(-a x) cos b x+b/a^2 e^(-a x) sin b x-b^2/a^2 integral e^(-a x) cos b x dd(x)
$
より
$
integral e^(-a x) cos b x dd(x)
= -a/(a^2+b^2) e^(-a x) cos b x+b/(a^2+b^2) e^(-a x) sin b x+C
$
なので、
$
I
= integral_0^1 integral_0^oo e^(-a x) cos x y dd(x) dd(y)
= integral_0^1 a/(a^2+y^2) dd(y)
= arctan 1/a
= pi/2-arctan a,
$
つまり
$
integral_0^oo e^(-a x) sinc x dd(x) = pi/2-arctan a
$
を得る。
ここで$e^(-a x) sinc x$は$(a, x) in \[0, oo\) times RR$上の連続関数で、$abs(sinc x) <= 1$よりワイエルシュトラスのM判定法から左辺の広義積分は$a in \[0, oo\)$について一様収束するので、収束先も連続関数であることから
$
lim_(a -> 0) integral_0^oo e^(-a x) sinc x dd(x)
= integral_0^oo sinc x dd(x)
= pi/2
$
を得る。

上記の方法は$a, x, y$という三つの変数の組み合わせをうまく取り替えることでディリクレ積分を計算したが、$x > 0$に対して
$
integral_0^oo e^(-x y) dd(y) = 1/x
$
であることに注目するとディリクレ積分は累次積分
$
integral_0^oo integral_0^oo e^(-x y) sin x dd(y) dd(x)
$
の積分の順序交換に帰着される。
これは$t > 0$を固定すると
$
integral_0^t integral_0^oo abs(e^(-x y) sin x) dd(y) dd(x)
= integral_0^t 1/x abs(sin x) dd(x)
<= integral_0^t dd(x)
= t
< oo
$
より、積分の順序交換により
$
integral_0^t integral_0^oo e^(-x y) sin x dd(y) dd(x)
&= integral_0^oo integral_0^t e^(-x y) sin x dd(x) dd(y)
= integral_0^oo [-e^(-x y)/(1+y^2) (y sin x+cos x)]_(x = 0)^t dd(y) \
&= integral_0^oo (1/(1+y^2)-e^(-t y)/(1+y^2) (y sin t+cos t)) dd(y) \
&= pi/2-integral_0^oo e^(-t y)/(1+y^2) (y sin t+cos t) dd(y)
$
あとは$t -> oo$として最後の積分項が$0$に収束することを示す。
実際、
$
abs(integral_0^oo e^(-t y)/(1+y^2) (y sin t+cos t) dd(y))
<= integral_0^oo e^(-t y)/(1+y^2) abs(y sin t+cos t) dd(y)
<= integral_0^oo e^(-t y)/sqrt(1+y^2) dd(y)
<= integral_0^oo e^(-t y) dd(y)
= 1/t
-> 0
$
であるので、 ディリクレ積分とその収束の速さ
$
integral_0^oo sinc x dd(x) = pi/2,
quad abs(integral_0^t sinc x dd(x)-pi/2) <= 1/t
$
が正当化される。

== フレネル積分

次の条件収束する広義積分とその値
$
integral_(-oo)^(+oo) sin t^2 dd(t)
= integral_(-oo)^(+oo) cos t^2 dd(t)
= sqrt(pi/2),
quad
integral_0^oo sin t^2 dd(t)
= integral_0^oo cos t^2 dd(t)
= 1/2 sqrt(pi/2)
$
を_フレネル積分_という。
$x = t^2$と置換することでこの積分は
$
integral_0^oo (sin x)/sqrt(x) dd(x)
= integral_0^oo (cos x)/sqrt(x) dd(x)
= sqrt(pi/2)
$
に帰着される。
ここではこのフレネル積分の値をディリクレ積分の値の二つ目の導出法を参考に計算する。

まず、ガウス積分により$x > 0$に対して
$
integral_0^oo e^(-x y^2) dd(y) = sqrt(pi)/2 1/sqrt(x)
$
であるから
$
integral_0^oo (sin x)/sqrt(x) dd(x)
= 2/sqrt(pi) integral_0^oo integral_0^oo e^(-x y^2) sin x dd(y) dd(x)
$
となる。
これはやはり$b > 0$を固定すると
$
2/sqrt(pi) integral_0^b integral_0^oo abs(e^(-x y^2) sin x) dd(y) dd(x)
= integral_0^b abs(sin x)/sqrt(x) dd(x)
<= integral_0^b sqrt(x) dd(x)
= 2/3 sqrt(b)^3
$
なので、積分の順序交換により
$
integral_0^b (sin x)/sqrt(x) dd(x)
&= 2/sqrt(pi) integral_0^b integral_0^oo e^(-x y^2) sin x dd(y) dd(x)
= 2/sqrt(pi) integral_0^oo integral_0^b e^(-x y^2) sin x dd(x) dd(y) \
&= 2/sqrt(pi) integral_0^oo [-e^(-x y^2)/(1+y^4) (y^2 sin x+cos x)]_(x = 0)^b dd(y)
= 2/sqrt(pi) integral_0^oo (1/(1+y^4)-e^(-b y^2)/(1+y^4) (y^2 sin b+cos b)) dd(y) \
&= sqrt(pi/2)-2/sqrt(pi) integral_0^oo e^(-b y^2)/(1+y^4) (y^2 sin b+cos b) dd(y)
$
ここで
$
abs(2/sqrt(pi) integral_0^oo e^(-b y^2)/(1+y^4) (y^2 sin b+cos b) dd(y))
<= 2/sqrt(pi) integral_0^oo e^(-b y^2) dd(y)
= 1/sqrt(b)
$
なので、フレネル積分とその収束の速さ
$
integral_0^oo (sin x)/sqrt(x) dd(x) = sqrt(pi/2),
quad
abs(integral_0^b (sin x)/sqrt(x) dd(x)-sqrt(pi/2)) <= 1/sqrt(b)
$
を得る。

== バーゼル問題

バーゼル問題とは正の整数の自乗の逆数の和
$
I = sum_(n = 1)^oo 1/n^2 = 1/1+1/4+1/9+dots
$
を考える問題である。
答えから述べるとこの級数は収束してその値は$pi^2/6$である。
バーゼル問題を解く方法は様々なものが知られているが、ここではこれまでの知識でこの問題に取り組んでみる。
答えに円周率が出ることから計算途中に円の面積や三角関数が現れることに注意する。
