
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": dd, dv, evaluated
#let area = $op("area")$

= 関数列

== 各点収束と一様収束

関数列とは共通の定義域をもつ関数からなる列のことである。
つまり、自然数$n$に対して集合$X$上の実数値関数$f_n$が与えられた時、$(f_n)$を$X$上の_関数列_という。
各関数が同じ種類の関数の場合が重要であり、各$f_n$が連続関数ならば連続関数列などのように表現する。

関数列の収束として容易に思いつくのが次の各点収束である。

#definition([各点収束])[
$(f_n)$を集合$X$上の関数列とする。
各$x in X$に対して値の列$(f_n (x))_n$は実数列だがこれが収束する時、収束先を$f(x)$とおくと$(f_n)$は$f$に$X$上_各点収束_するという。
このとき各点収束先$f$を_極限関数_といい、$lim_n f_n$と表現することがある。
]

$X$上の関数列の各点収束先は$X$上の関数である。
しかしながら連続関数列が各点収束しても収束先は連続関数とは限らない。

#example[
直線上の連続関数列を$n = 1, 2, 3, dots$に対して
$
f_n (x) = cases(
  0 & (x <= 0),
  n x & (0 <= x <= 1/n),
  1 & (x >= 1/n),
)
$
で定義する。 この関数列は
$
f(x) = cases(
  0 & (x <= 0),
  1 & (x > 0),
)
$
に各点収束するが、これは連続ではない。
]

関数列の重要な応用例として定積分の列の極限の問題を関数列の収束先の定積分で捉えるという、極限と積分の交換があるがこのままでは極限関数の可積分性も怪しい状況になる。

そこで各点収束に代わる関数列の収束性として一様収束を導入する。

#definition([一様収束])[
$(f_n)$を集合$X$上の関数列とし、$f$を$X$上の関数とする。
ここで実数列$(sup_(x in X) abs(f_n (x)-f(x)))$が$0$に収束する時、$(f_n)$は$f$に$X$上_一様収束_するという。
つまり、
$
norm(f_n-f) = sup_(x in X) abs(f_n (x)-f(x)) -> 0
$
が成り立つということであり、右辺の$norm(f_n-f)$を関数$f_n-f$の_一様収束ノルム_あるいは_上限ノルム_という。
]

一様収束は各点収束より強い条件であり、一様収束のことを強収束、各点収束のことを弱収束と表現したりする。

関数列$f_n$においては添え字$n$は自然数であったがこれを実数や平面の点に拡張したものを一般に関数族という。

#definition([関数族])[
$N$次元空間の点$b$を極限点とする点集合$Y$に対して二変数関数$f(x, y)$を$x in X$と点$y in Y$に対して定義するとき、$f(x, y)$を$b$の近くの点$y$に対して$x in X$の関数を対応させる_関数族_と呼ぶことにする。

ここで、各$x in X$ごとに$y -> b$で$f(x, y)$が収束するとき、収束先を$l(x) = lim_(y -> b) f(x, y)$と書いて$f(x, y)$は$y -> b$で$l(x)$に_各点収束_するといい、
$y -> b$で$sup_(x in X) abs(f(x, y)-l(x)) -> 0$となるとき、$f(x, y)$は$y -> b$で$l(x)$に_一様収束_するという。
]

関数族$f$が一様収束するための十分条件は二変数関数の連続性で表される。

#proposition[
$X$は有界閉集合とする。
$f(x, y)$を$X times Y$上の連続関数とするとき、$Y$の極限点$b$で$b in Y$になっているものに対して、
関数族$f(x, y)$は$y -> b$で$l(x) = f(x, b)$に一様収束する。
]

#proof[
$b$に収束する$Y$上の点列$(y_n)$を固定する。
各$y_n$に対して最大値最小値定理より$abs(f(x_n, y_n)-f(x_n, b)) = sup_(x in X) abs(f(x, y_n)-f(x, b))$となる$x_n in X$が存在する。
ここで$(x_n)$が収束するとき$x_n -> a$とおくと、
$
sup_(x in X) abs(f(x, y_n)-f(x, b))
= abs(f(x_n, y_n)-f(x_n, b))
-> abs(f(a, b)-f(a, b))
= 0
$
なので、@t_cptfconv より$(x_n)$が収束しなくても$sup_(x in X) abs(f(x, y_n)-f(x, b)) -> 0$である。
あとは@t_seqcont より$y -> b$で$sup_(x in X) abs(f(x, y)-f(x, b)) -> 0$がわかる。
]

関数列に対して級数をとったものが関数項級数である。

#definition([関数項級数])[
集合$X$上の関数列$(f_n (x))_(n = 0)^oo$に対して級数
$
sum_(n = 0)^oo f_n (x) = f_0 (x)+f_1 (x)+f_2 (x)+f_3 (x)+dots
$
のことを_関数項級数_という。

より詳しくは$N = 0, 1, 2, 3, dots$に対して、第$N$項までの_部分和_
$
F_N (x) = sum_(n = 0)^N f_n (x) = f_0 (x)+f_1 (x)+f_2 (x)+f_3 (x)+dots+f_N (x)
$
を取り、関数列$(F_N (x))_(N = 0)^oo$を定める。
ここで$(F_N (x))$が各点収束または一様収束するとき、関数項級数$sum_n f_n (x)$は_各点収束_または_一様収束_するという。
]

この定義を見てわかる通り関数項級数の理論は関数列の理論がそのまま適用できるが、さらに特別な取り扱いができる。
また、べき級数
$
sum_(n = 0)^oo a_n (x-a)^n = a_0+a_1 (x-a)+a_2 (x-a)^2+a_3 (x-a)^3+dots
$
は関数項級数の特殊な場合である。

さらに一変数広義積分も考えられる。

#definition([関数項積分])[
集合$X$上の関数族$f(x, y)$に対して$f(x, y)$は$y in \[c, b\)$について連続として広義積分
$
integral_c^b f(x, y) dd(y)
$
のことを_関数項積分_という。

より詳しくは$t in \[c, b\)$に対して、$[c, t]$上の積分
$
F(x, t) = integral_c^t f(x, y) dd(y)
$
を取り、関数族$F(x, t)$を定める。
ここで$F(x, t)$が$t -> b$で各点収束または一様収束するとき、関数項積分$integral_c^b f(x, y) dd(y)$は_各点収束_または_一様収束_するという。
]

#theorem([ワイエルシュトラスのM判定法])[
集合$X$に対して以下が成り立つ。

- $X$上の関数項級数$sum_n f_n (x)$について、非負数列$(M_n)$であって
  $
  abs(f_n (x)) <= M_n,
  quad sum_n M_n < oo
  $
  を満たすものがあるとき、
  関数項級数$sum_n f_n (x)$は$X$上一様収束する。
- $X$上の関数項積分$integral_c^b f(x, y) dd(y)$について、非負連続関数$M(y)$であって
  $
  abs(f(x, y)) <= M(y),
  quad integral_c^b M(y) < oo
  $
  を満たすものがあるとき、
  関数項積分$integral_c^b f(x, y) dd(y)$は$X$上一様収束する。
]

#proof[
級数に対してのみ示す。
まず各$x in X$に対して、級数$sum_n f_n (x)$は
$
sum_n abs(f_n (x)) <= sum_n M_n < oo
$
より絶対収束する。
つまり関数項級数$sum_n f_n (x)$は$X$上各点収束するので収束先を$F(x)$とおくと、
$
abs(sum_(n <= N) f_n (x)-F(x))
= abs(sum_(n = N+1)^oo f_n (x))
<= sum_(n = N+1)^oo abs(f_n (x))
<= sum_(n = N+1)^oo M_n.
$
ここで最右辺は$x$によらない数で$N -> oo$とすると
$
sup_(x in X) abs(sum_(n <= N) f_n (x)-F(x))
<= sum_n M_n-sum_(n <= N) M_n
-> 0
$
なので、$sum_n f_n (x)$は$X$上一様収束することが示された。
]

#example[
関数項級数$sum_(n = 1)^oo (sin n x)/(n^2)$は$RR$上一様収束する。
]

#example([高木関数])[
関数項級数
$
T(x) = sum_(n = 0)^oo (s(2^n x))/(2^n),
quad s(t) = max_(n in ZZ) (t-n)
$
は$0 <= s (t) <= 1$に注意すれば、$RR$上絶対収束し$T$は連続関数である。
その一方で$T$は至る所微分不可能であることが知られていて、高木関数と呼ばれる。
]

== 一様収束と連続性

いくらかの仮定のもとで連続関数の一様収束極限は連続関数である。

#proposition([一様収束と連続性])[
$X$の全ての点が$X$の極限点となるような集合$X$に対して以下が成り立つ。

- 連続関数の列$(f_n)$が関数$f$に$X$上一様収束するとき、$f$は$X$上の連続関数である。
- 連続関数の族$f(x, y)$が$y -> b$で関数$l$に$X$上一様収束するとき、$l$は$X$上の連続関数である。
- 連続関数の列$(f_n)$に対して関数項級数$sum_n f_n (x)$が$X$上一様収束するとき、$sum_n f_n (x)$は$X$上の連続関数である。
- $X times \[ c, b \)$上の連続関数$f(x, y)$に対して関数項積分$integral_c^b f(x, y) dd(y)$が$X$上一様収束するとき、$integral_c^b f(x, y) dd(y)$は$X$上の連続関数である。

また、上記の内容は連続を一様連続に置き換えても成立する。
]

#proof[
最初の関数列に対してのみ示す。
任意の$a, x in X$と自然数$n$に対して、
$
abs(f(x)-f(a))
<= abs(f(x)-f_n (x))+abs(f_n (x)-f_n (a))+abs(f_n (a)-f(a))
<= 2 norm(f_n-f)+omega_(f_n, a) (d(a, x))
$
が成り立つ。
よって、$epsilon > 0$に対して、十分大きい$n$を一つ取ることで$norm(f_n-f) <= 1/3 epsilon$とでき、
その$n$に対して$omega_(f_n, a) (delta) < 1/3 epsilon$となる$delta > 0$を取れば、
$d (a, x) < delta$なる$x in X$に対して$abs(f(x)-f(a)) < epsilon$が成り立ち、$f$は連続である。
一様連続も同様。
]

#proposition([点列収束])[
$X$を全ての点が$X$の極限点となるような集合として、$(f_n)$を$X$上の連続関数列、$f$を$X$上の連続関数とする。
ここで$(f_n)$が$f$に$X$上一様収束するならば、$X$上の任意の収束する点列$x_n -> x$に対して$f_n (x_n) -> f(x)$が成り立つ。
また$X$を有界閉集合とするとき、逆も成り立つ。
]

#proof[
$f$が$X$上の連続関数であることに注意して、差を評価すると
$
abs(f_n (x_n)-f(x))
<= abs(f_n (x_n)-f(x_n))+abs(f(x_n)-f(x))
<= norm(f_n-f)+omega_(f, x) (d(x, x_n))
-> 0.
$
よって$f_n (x_n) -> f(x)$が成り立つ。

逆については各自然数$n$に対して、$abs(f_n (x)-f(x))$は有界閉集合$X$上の連続関数より最大値を達成する点$a_n in X$が存在して、
$
abs(f_n (a_n)-f(a_n)) = norm(f_n-f)
$
が成り立つ。
ここで$(a_n)$は収束するとして$a_n -> a$とおくと仮定より
$
abs(f_n (a_n)-f(a_n)) -> abs(f(a)-f(a)) = 0.
$
よって@t_cptfconv より、$norm(f_n-f) -> 0$が従い、一様収束が言えた。
]

== 極限と積分の順序交換

関数列や関数族、関数項級数は一様収束の下で積分との順序交換ができる。

#theorem([極限と積分の交換])[
面積確定集合$X$に対して以下が成り立つ。

- $(f_n)$を$X$上の積分可能な関数の列とする。
  ここで$(f_n)$がある関数$f = lim_n f_n$に$X$上一様収束するとき、
  $f$も$X$上積分可能で
  $
  integral_X f(x) dd(x)
  = integral_X lim_n f_n (x) dd(x)
  = lim_n integral_X f_n (x) dd(x)
  $
  が成り立つ。
- $f(x, y)$を点$b$の近くの点$y$に対して$x in X$で積分可能な関数を対応させる関数の族とする。
  ここで$f(x, y)$が$y -> b$で$X$上一様収束するとき、
  $l(x) = lim_(y -> b) f(x, y)$も$X$上積分可能で
  $
  integral_X l(x) dd(x)
  = integral_X lim_(y -> b) f(x, y) dd(x)
  = lim_(y -> b) integral_X f(x, y) dd(x)
  $
  が成り立つ。
- $(f_n)$を$X$上の積分可能な関数の列とする。
  ここで関数項級数$sum_n f_n (x)$が$X$上一様収束するとき、
  $F(x) = sum_n f_n (x)$も$X$上積分可能で
  $
  integral_X F(x) dd(x)
  = integral_X sum_n f_n (x) dd(x)
  = sum_n integral_X f_n (x) dd(x)
  $
  が成り立つ。
]

最後の関数項級数に対する定理はしばしば項別積分と呼ばれる。

#proof[
最初の関数列に対してのみ示す。
差を評価すると
$
abs(integral_X f_n (x) dd(x)-integral_X f(x) dd(x))
<= integral_X sup_(x in X) abs(f_n (x)-f(x)) dd(x)
= norm(f_n-f) area(X)
-> 0.
$
よって定理の内容が従う。
]

== 極限と微分の順序交換

微分積分学の基本定理より微分と積分はつながっている関係で、極限と積分の交換の内容をもとに極限と微分の交換を示すことができる。

#theorem([極限と微分の交換])[
開区間$X$に対して以下が成り立つ。

- $(f_n)$を$X$上の$C^1$級関数の列とする。
  ここで$(f_n ')$がある関数に$X$上一様収束し$f_n (a)$が収束するような点$a$が存在するとき、
  $(f_n)$は$X$上各点収束し$f = lim_n f_n$も$X$上微分可能で
  $
  f'(x) = (lim_n f_n (x))' = lim_n f_n '(x)
  $
  が成り立つ。
- $f(x, y)$を点$b$の近くの点$y$に対して$x in X$で$C^1$級関数を対応させる関数の族とする。
  ここで$f_x (x, y)$が$y -> b$で$X$上一様収束し$f(a, y)$が収束するような点$a$が存在するとき、
  $f(x, y)$は$X$上各点収束し$l(x) = lim_(y -> b) f(x, y)$も$X$上微分可能で
  $
  l'(x) = (lim_(y -> b) f(x, y))' = lim_(y -> b) f_x (x, y)
  $
  が成り立つ。
- $(f_n)$を$X$上の$C^1$級関数の列とする。
  ここで関数項級数$sum_n f_n ' (x)$が$X$上一様収束し$sum_n f_n (a)$が収束するような点$a$が存在するとき、
  $sum_n f_n (x)$は$X$上各点収束し$F(x) = sum_n f_n (x)$も$X$上微分可能で
  $
  F'(x) = (sum_n f_n (x))' = sum_n f_n '(x)
  $
  が成り立つ。
]

最後の関数項級数に対する定理はしばしば項別微分と呼ばれる。

#proof[
最初の関数列に対してのみ示す。
$x in X$を固定する。
微分積分学の基本定理より
$
f_n (x) = integral_a^x f_n '(x) dd(x)+f_n (a).
$
仮定より$n$についての極限で右辺は収束するので、
$
lim_n f_n (x)
= lim_n integral_a^x f_n '(x) dd(x)+lim_n f_n (a)
= integral_a^x lim_n f_n '(x) dd(x)+lim_n f_n (a).
$
この両辺を微分して
$
(lim_n f_n (x))' = lim_n f_n '(x)
$
を得る。
]

== 微分と積分の順序交換

微分は極限で定義されるので、極限と積分の交換の内容をもとに微分と積分の交換を示すことができる。

#theorem([極限と微分の交換])[
$X$を面積確定集合、$Y$を開区間とする。
$X times Y$上定義された二変数関数$f(x, y)$が各$y in Y$に対して$x in X$で積分可能で各$x in X$に対して$y in Y$について$C^1$級で$y -> b$で$f_y (x, y)$は$f_y (x, b)$に一様収束するとする。
このとき、$f_y (x, b)$も$x in X$で積分可能で
$
integral_X f_y (x, b) dd(x) = evaluated((integral_X f(x, y) dd(x))')_(y = b)
$
が成り立つ。
]

#proof[
微分の定義より
$
evaluated((integral_X f(x, y) dd(x))')_(y = b)
&= lim_(h -> 0) (integral_X f(x, b+h) dd(x)-integral_X f(x, b) dd(x))/h \
&= lim_(h -> 0) integral_X 1/h (f(x, b+h)-f(x, b)) dd(x)
$
なので、$h -> 0$で$1/h (f(x, b+h)-f(x, b))$が$f_y (x, b)$に一様収束することを示せばよい。
$f(x, y)$は$y$について$C^1$級であることから、微分積分学の基本定理より
$
1/h (f(x, b+h)-f(x, b)) = 1/h integral_0^h f_y (x, b+r) dd(r)
$
なので、
$
abs(1/h integral_0^h f_y (x, b+r) dd(r)-f_y (x, b))
<= 1/h integral_0^h abs(f_y (x, b+r)-f_y (x, b)) dd(r)
$
ここで$f_y (x, y)$が一様収束するという仮定より度合い関数$omega$が存在して
$
abs(f_y (x, b+r)-f_y (x, b)) <= omega(r) <= omega(h)
$
なので、$h -> 0$で
$
sup_(x in X) abs(1/h integral_0^h f_y (x, b+r) dd(r)-f_y (x, b))
<= 1/h integral_0^h omega(h) dd(r)
= omega(h)
-> 0
$
よって$1/h (f(x, b+h)-f(x, b))$は$f_y (x, b)$に一様収束し、
定理が証明される。
]
