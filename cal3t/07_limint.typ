
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": dd

= 積分の極限

== 一様収束とディニの補題

== アルツェラの定理

== リーマン・ルベーグの補題

#theorem([リーマン・ルベーグの補題])[
$f$を有界閉区間$[a, b]$を含む開区間上の$C^1$級関数とする。
この時、$n = 1, 2, 3, dots$として
$
lim_(n -> oo) integral_a^b f(x) cos n x dd(x)
= lim_(n -> oo) integral_a^b f (x) sin n x dd(x)
= 0
$
が成り立つ。
]

#proof[
$cos$について示す。
部分積分により
$
integral_a^b f(x) cos n x dd(x)
= integral_a^b f(x) (1/n sin n x)' dd(x)
= 1/n f(x) [sin n x]_a^b-1/n integral_a^b f'(x) sin n x dd(x).
$
よって、$n -> oo$で
$
abs(integral_a^b f(x) cos n x dd(x)-0)
<= 1/n abs(f(b))+1/n abs(f(a))+1/n integral_a^b abs(f'(x)) dd(x)
-> 0
$
なので、定理の等式を得る。
$sin$の式も同様なので詳細は省略する。
]

== 周期関数の積分

#theorem([周期関数の積分])[
$[a, b]$を有界閉区間として、$f(x, y)$を$[a, b] times RR$上の連続関数であって$y$について周期$L > 0$を持つ、
つまり
$
f(x, y+L) = f(x, y)
$
が成り立つものとする。
この時、$epsilon > 0$や$n = 1, 2, 3, dots$として
$
lim_(epsilon -> 0) integral_a^b f(x, x/epsilon) dd(x)
= lim_(n -> oo) integral_a^b f(x, n x) dd(x)
= integral_a^b 1/L integral_0^L f(x, y) dd(y) dd(x)
$
が成り立つ。
特に連続関数$f(x)g(y)$に対しては
$
lim_(epsilon -> 0) integral_a^b f(x)g(x/epsilon) dd(x)
= lim_(n -> oo) integral_a^b f(x)g(n x) dd(x)
= integral_a^b f(x) dd(x) 1/L integral_0^L g(y) dd(y)
$
が成り立つ。
]

#remark[
この定理は容易に多次元化される。
]

#proof[
まず、$L = 1$の時のみ考えれば十分なことを示す。
実際、$f(x, y)$が$y$について周期$L$の時、
$
tilde(f)(x, y) = f(x, L y)
$
とおくと$tilde(f)(x, y)$は$y$について周期$1$であり
$
1/L integral_0^L f(x, y) dd(y)
= 1/L integral_0^1 tilde(f)(x, y/L) dd(y)
= integral_0^1 tilde(f)(x, y) dd(y)
$
となる。

そのため$f(x, y)$は$y$について周期$1$として、
$
lim_(n -> oo) integral_a^b f(x, n x) dd(x)
= integral_a^b integral_0^1 f (x, y) dd(y) dd(x)
$
を示す（$epsilon$の方は同様に示されるので詳細は省略する）。
$y = n x$と置換すると
$
integral_a^b f(x, n x) dd(x)
= 1/n integral_(a n)^(b n) f(y/n, y) dd(y)
$
である。
ここで積分区間$[a n, b n]$からできるだけ多くの周期$1$の部分を取り出すことをする。
$[a n]$を$a n$と$b n$の間の整数で最も$a n$に近いものとし、
$[b n]$を$a n$と$b n$の間の整数で最も$b n$に近いものとする。
ただし、そのような整数が存在することが問題になるが、$a = b$の場合は積分が$0$になるので等式が言えて$a eq.not b$の場合は$n$を十分大きく取ればよい。
$abs(a n-[a n]) <= 1$, $abs(b n-[b n]) <= 1$に注意する。
この時、
$
integral_a^b f(x, n x) dd(x)
= 1/n integral_(a n)^([a n]) f(y/n, y) dd(y)+1/n integral_([a n])^([b n]) f(y/n, y) dd(y)+1/n integral_([b n])^(b n) f(y/n, y) dd(y)
$
で、右辺の最初と最後の項は$f$が有界閉矩形上の連続関数より有界であることから
$
abs(1/n integral_(a n)^([a n]) f(y/n, y) dd(y))
<= 1/n integral_(a n)^([a n]) sup abs(f(y/n, y)) dd(y)
<= 1/n sup abs(f)
-> 0
$
となる。
真ん中の項を変形すると
$
1/n integral_([a n])^([b n]) f(y/n, y) dd(y)
= 1/n sum_(k = [a n]+1)^([b n]) integral_(k-1)^k f(y/n, y) dd(y)
= 1/n sum_(k = [a n]+1)^([b n]) integral_0^1 f((y+k-1)/n, y+k-1) dd(y)
$
で、$f (x, y)$は$y$について周期$1$なので、
$
1/n integral_([a n])^([b n]) f(y/n, y) dd(y)
= integral_0^1 1/n sum_(k = [a n]+1)^([b n]) f((k-1+y)/n, y) dd(y)
$
となる。

ここで最右辺の被積分関数は$y$を固定するごとに定積分$integral_a^b f (x, y) dd(x)$のリーマン和になっているので、区分求積法により$n -> oo$で積分に収束することを言いたいがそのためにこの収束が$y$について一様収束になっていることを示す。
$0 <= y <= 1$に対して定積分$integral_a^b f(x, y) dd(x)$の方を変形すると
$
integral_a^b f(x, y) dd(x)
= integral_a^([a n]/n) f(x, y) dd(x)+integral_([a n]/n)^([b n]/n) f(x, y) dd(x)+integral_([b n]/n)^b f(x, y) dd(x)
$
で、
$
abs(integral_a^([a n]/n) f(x, y) dd(x))
<= integral_a^([a n]/n) sup abs(f) dd(x)
<= 1/n sup abs(f)
-> 0
$
である。
ここで
$
integral_([a n]/n)^([b n]/n) f(x, y) dd(x)
= sum_(k = [a n]+1)^([b n]) integral_((k-1)/n)^(k/n) f(x, y) dd(x)
$
であり、$f$は有界閉矩形上の連続関数より一様連続で連続性の度合い$omega$があるので、
$
&abs(1/n sum_(k = [a n]+1)^([b n]) f((k-1+y)/n, y)-sum_(k = [a n]+1)^([b n]) integral_((k-1)/n)^(k/n) f(x, y) dd(x)) \
&quad <= sum_(k = [a n]+1)^([b n]) abs(1/n f((k-1+y)/n, y)-integral_((k-1)/n)^(k/n) f(x, y) dd(x))
<= sum_(k = [a n]+1)^([b n]) integral_((k-1)/n)^(k/n) abs(f(x, y)-f((k-1+y)/n, y)) dd(x) \
&quad <= sum_(k = [a n]+1)^([b n]) integral_((k-1)/n)^(k/n) omega(abs(x-(k-1+y)/n)) dd(x)
<= sum_(k = [a n]+1)^([b n]) integral_((k-1)/n)^(k/n) omega(n^(-1)) dd(x)
<= ([b n]-[a n])/n omega(n^(-1)) \
&quad <= (b-a) omega(n^(-1))
-> 0
$
ここから一様収束が言えるので、以上の内容をまとめると
$
lim_(n -> oo) integral_a^b f(x, n x) dd(x)
= lim_(n -> oo) integral_0^1 1/n sum_(k = [a n]+1)^([b n]) f((k-1+y)/n, y) dd(y)
= integral_0^1 integral_a^b f(x, y) dd(x) dd(y)
$
であり、
$f (x, y)$は$[a, b] times [0, 1]$上積分可能なので積分の順序交換をして、定理の等式を得る。
]
