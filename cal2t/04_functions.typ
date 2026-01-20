
= 種々の関数２

#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": dd, evaluated

== 複素指数関数

指数関数はテーラー展開@e_exp_power が知られているが、
べき級数の節で触れたようにべき級数の理論は複素数の範囲に自然と拡張できるので、
指数関数をべき級数によって定義することで定義される範囲を拡張することができる。
つまり、複素数$z$に対して
$
exp(z) = e^z = sum_(n = 0)^oo 1/(n!) z^n = 1+z+1/2 z^2+1/6 z^3+dots
$
とする。

このとき、べき級数を比較すると、オイラーの公式
$
e^(i theta) = cos theta+i sin theta,
quad e^(-i theta) = cos theta-i sin theta
$
が成立することがわかる。
そこで、これまで明確に定義されていなかった三角関数を複素指数関数を使って、
$
cos x = (e^(i x)+e^(-i x))/2,
quad sin x = (e^(i x)-e^(-i x))/(2 i)
$
によって定義することができる。
この形によっても三角関数が双曲線関数と似ていることがわかる。

この三角関数が必要な要件を満たしていることを確認していく。
まず、複素指数関数のテーラー展開から三角関数のテーラー展開が得られる。
特に、実数$x$に対して$cos x$, $sin x$は実数値連続関数である。

証明は本テキストの範囲外なので省略するが、指数法則
$
e^(z+w) = e^z e^w
$
が複素数$z, x$に対して成り立つことを認めれば、三角関数の加法定理が導かれる。
また、$sin x$のべき級数表示から極限
$
lim_(x -> 0) (sin x)/x = 1
$
がわかる。

指数法則を使えば指数関数や三角関数の和について以下がわかる。

#proposition[
複素数$x$に対して
$
sum_(n = M)^N e^(n x)
= cases(
	(e^((N+1) x)-e^(M x))/(e^x-1) & (e^x eq.not 1)",",
	N-M+1 & (e^x = 1)".",
)
$
$
sum_(n = M)^N sin n x =
$
]

== シンク関数
今まで例などで度々登場していた関数$(sin x)/x$はシンク関数と呼ばれる。
正確には実数全体で定義された関数
$
sinc x = cases(
	(sin x)/x & (x eq.not 0)",",
	1 & (x = 0)
)
$
を_シンク関数_という。

シンク関数は極限の式から$RR$上の連続関数であることがわかるが、
べき級数での表示
$
sinc x
= sum_(k = 0)^oo ((-1)^k)/((2 k+1)!) x^(2 k)
= 1-1/6 x^2+1/120 x^4-dots
$
が成り立つので、無限回微分可能な関数である。

シンク関数が登場した場面を思い出すと広義積分と級数の条件収束の例としてである。

ここでは広義積分$integral_0^oo sinc x dd(x)$が収束するが、絶対収束しないことを示そう。
まず、$integral_0^1 sinc x dd(x)$は通常の定積分であることに注意する。
$t > 1$に対して部分積分より
$
integral_1^t sinc x dd(x)
= integral_1^t (-cos x)'/x dd(x)
= evaluated([(-cos x)/x])_1^t-integral_1^t (cos x)/(x^2) dd(x)
$
となる。
ここで、
$
abs((cos x)/x^2) <= 1/(x^2),
quad integral_1^oo 1/(x^2) dd(x) < oo
$
なので、広義積分$integral_1^oo (cos x)/(x^2) dd(x)$は収束し、広義積分$integral_0^oo sinc x dd(x)$も収束が言える。
一方で自然数$N = 0, 1, 2, 3, dots$に対して
$
integral_0^(2 pi N) abs(sinc x) dd(x)
= sum_(n = 1)^N integral_(2 pi (n-1))^(2 pi n) abs(sin x)/x dd(x)
>= sum_(n = 1)^N integral_(2 pi (n-1))^(2 pi n) abs(sin x)/(2 pi n) dd(x)
= sum_(n = 1)^N 2/(pi n)
$
であり、$N -> oo$とすると右辺は正の無限大に発散するので、広義積分$integral_0^oo sinc x dd(x)$は絶対収束しない。

ちなみに広義積分$integral_0^oo sinc x dd(x)$の値は$pi/2$であることが知られていて_ディリクレ積分_と呼ばれるが、証明には複素解析学あるいは二変数の微分積分学の知識が必要であり本テキストの範囲を逸脱するので取り扱わない。

== ガウス関数

やはり広義積分の部分で登場した$x$についての関数
$
exp(-x^2) = e^(-x^2)
$
は_ガウス関数_と呼ばれる。
あるいは実数定数$a$と正定数$c$をつけて
$
1/(sqrt(2 pi) c) exp(-(x-a)^2/(2 c^2))
= 1/(sqrt(2 pi) c) e^(-(x-a)^2/(2 c^2))
$
と一般化することもあるが、最初のもののみ考える。
ガウス関数は確率統計学で現れ、正規分布と強い結びつきのある重要な関数である。

ガウス関数はべき級数での表示
$
exp(-x^2)
= sum_(n = 0)^oo 1/(n!) (-x^2)^n
= 1-1/2 x^2+1/24 x^4-1/720 x^6+dots
$
があり、収束半径は$oo$である。

一方で原始関数はこれまでに登場した関数で表すことができないことが知られている（ガウスの誤差関数と呼ばれる）。
しかしながら広義積分
$
integral_(-oo)^(+oo) exp (-x^2) dd(x)
= integral_(-oo)^(+oo) e^(-x^2) dd(x)
$
の値は計算できる。
これを_ガウス積分_という。

ガウス積分の標準的かつ簡便な計算方法は重積分の極座標変換を用いるものだが、本テキストの範囲外なので、ここでは煩雑ではあるが範囲内の知識で説明できる方法を紹介する。

#theorem([ガウス積分])[
$
integral_0^oo exp (-x^2) dd(x)
= integral_0^oo e^(-x^2) dd(x)
= sqrt(pi)/2,
quad integral_(-oo)^(+oo) exp (-x^2) dd(x)
= integral_(-oo)^(+oo) e^(-x^2) dd(x)
= sqrt(pi)
$
]

#proof[
まず不等式
$
1-x^2 <= e^(-x^2) <= 1/(1+x^2)
$
を用意する。
これは微分法により任意の実数$y$に対して$e^y >= 1+y$であることから、$y = plus.minus x^2$を当てはめて整理すれば得られる。
この不等式を$n = 1, 2, 3, dots$乗して積分すると次が得れれる。
$
integral_0^1 (1-x^2)^n dd(x)
<= integral_0^1 e^(-n x^2) dd(x)
<= integral_0^1 1/(1+x^2)^n dd(x).
$
ここで、左辺は$x = sin theta$と置換することにより
$
integral_0^1 (1-x^2)^n dd(x) = integral_0^(pi/2) cos^(2 n+1) theta dd(theta),
$
真ん中の式は$sqrt(n) x$を$x$と置換することにより
$
integral_0^1 e^(-n x^2) dd(x) = integral_0^(sqrt(n)) 1/sqrt(n) e^(-x^2) dd(x),
$
右辺は$x = tan theta$と置換することにより
$
integral_0^1 1/(1+x^2)^n dd(x) = integral_0^(pi/4) cos^(2 n-2) theta dd(theta) <= integral_0^(pi/2) cos^(2 n-2) theta dd(theta)
$
なので、
ウォリス積分$I_n = integral_0^(pi/2) cos^(2 n+1) theta dd(theta)$を用いて、
$
sqrt(n) I_(2 n+1) <= integral_0^(sqrt(n)) e^(-x^2) dd(x) <= sqrt(n) I_(2 n-2)
$
である。
したがって、$n -> oo$とするとウォリスの公式（@t_wallis_limit）より、
ガウス積分の値が
$
integral_0^oo e^(-x^2) dd(x)
= 1/sqrt(2) dot sqrt(pi/2)
= sqrt(pi)/2
$
であることがわかる。
さらにガウス関数は偶関数であることに注意して、
$
integral_(-oo)^(+oo) e^(-x^2) dd(x)
= 2 integral_0^oo e^(-x^2) dd(x)
= sqrt(pi)
$
である。
]

== ガンマ関数

正の実数$s > 0$に対して広義積分
$
integral_0^oo x^(s-1) e^(-x) dd(x)
$
は収束する。
これを示すためには被積分関数$f(x) = x^(s-1) e^(-x)$に対して優関数を$g(x) = 1/x^2$の定数倍として取るために
$
(f(x))/(g(x)) = x^(s+1) e^(-x) =: h(x)
$
の有界性を示す。
実際、
$
h'(x) = (s+1) x^s e^(-x)-x^(s+1) e^(-x) = (s+1-x) x^s e^(-x)
$
より$h (x)$は$[0, s+1]$で単調増加し、$\[s+1, oo\)$で単調減少するので、$x = s+1$で最大となる。
よって、$f(x) <= max h 1/x^2$であり積分$integral_1^oo 1/x^2 dd(x)$は収束するので、
広義積分$integral_1^oo x^(s-1) e^(-x) dd(x)$も収束する。
$integral_0^1 x^(s-1) e^(-x) dd(x)$については$f(x) <= x^(s-1)$であり、$s > 0$に注意すると、積分$integral_0^1 x^(s-1) dd(x)$は収束するので、やはり収束する。

以上より$s > 0$に対して広義積分の値を取る関数
$
Gamma(s) = integral_0^oo x^(s-1) e^(-x) dd(x)
$
が定義でき、_ガンマ関数_という。

ガンマ関数を特徴づける性質として次がある。

#proposition[
任意の$s > 0$に対して、
$
Gamma(s+1) = s Gamma(s)
$
が成り立つ。
]

#proof[
部分積分により
$
Gamma(s+1)
= integral_0^oo x^s e^(-x) dd(x)
= integral_0^oo x^s (-e^(-x))' dd(x)
= evaluated(-x^s e^(-x))_0^oo+integral_0^oo s x^(s-1) e^(-x) dd(x)
= s Gamma(s)
$
である。
]

この等式を繰り返し用いることでガンマ関数は階乗の拡張になっていることがわかる。

#proposition[
任意の$n = 0, 1, 2, 3, dots$に対して、
$
Gamma(n+1) = n!
$
が成り立つ。
]

#proof[
$n = 0$のときは
$
Gamma(1) = integral_0^oo e^(-x) dd(x) = [-e^(-x)]_0^oo = 1
$
なので成立する。
$n$で成立するつまり$Gamma(n+1) = n!$と仮定するとき、前の命題より
$
Gamma((n+1)+1) = (n+1) Gamma(n+1) = (n+1) dot n! = (n+1)!
$
なので$n+1$でも成立する。
以上より数学的帰納法から$Gamma(n+1) = n!$が成り立つことがわかる。
]

特に$Gamma(1) = 1$であるが、もう一つ$Gamma(1/2)$の値も有名であり、ガウス積分と関係が深い。

#proposition[
$
Gamma(1/2) = 2 integral_0^oo e^(-x^2) dd(x) = sqrt(pi)
$
]

#proof[
$x = y^2$と置換すると、
$
Gamma(1/2)
= integral_0^oo x^(-1/2) e^(-x) dd(x)
= 2 integral_0^oo e^(-y^2) dd(y)
= sqrt(pi)
$
である。
]

#remark[
この証明を一般化すると、
任意の$s > 0$に対して$x = y^s$と置換することにより
$
Gamma(s) = 1/s integral_0^oo exp(-y^(1/s)) dd(x)
$
がわかる。
]
