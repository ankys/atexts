
#import "../deps/theorem.typ": theorem, lemma, proposition, definition, corollary, example, xca, remark, proof
#import "../deps/physics.typ": dd, pdv, grad, div

= 物理学への応用

== 逆二乗の法則の積分

ニュートン力学において、三次元空間に二つの質点$1, 2$があるとしてそれぞれ位置が$P_1, P_2$で質量が$m_1, m_2$とすると、二つの質点にはそれぞれ万有引力と呼ばれる引力が働き、その大きさは$m_1$と$m_2$と二点間の距離$r = d(P_1, P_2)$の逆二乗に比例するのであった。
つまり、質点$2$に働く質点$1$からの万有引力は向きも考慮に入れると
$
bold(F)
= -G (m_1 m_2)/r^2 arrow(P_1 P_2)/abs(arrow(P_1 P_2))
= -G m_1 m_2 arrow(P_1 P_2)/abs(arrow(P_1 P_2))^3
$
となり、質点$1$に働く質点$2$からの万有引力はその逆向きになる。

太陽と地球のように質点間の距離$r$が十分大きく質点が点とみなせる時はこれで良いかもしれないが、
地球と地表上の物体のように質点間の距離が小さくなると、質点は点とみなすことはできない。
そのような場合、地表上の物体を点とみなしたとして、その点に働く力はどのようになるのだろうか。
地球をたくさんの質点の集まりとしてそれぞれからの物体に働く万有引力の合計を求めることで、地表上の物体に働く力を求めることができる。
この合計の力はまさしくベクトル場の積分となり、本テキストの重要な応用の一つである。

仮に地球が中心が$P_1 in RR^3$にあり半径が$R > 0$の点集合$B_R (P_1)$でその中で密度が一定値$rho > 0$とすると、
位置$P_2 in RR^3$にある質量$m_2$の物体に働く万有引力の合計は
$
bold(F)
= -integral_(B_R (P_1)) G m_2 rho arrow(P P_2)/abs(arrow(P P_2))^3 dd(P)
= G m_2 rho integral_(B_R (P_1)) arrow(P_2 P)/abs(arrow(P_2 P))^3 dd(P)
$
となる。
ここで地球の中心を原点だと思って$arrow(P_2 P) = arrow(P_1 P)-arrow(P_1 P_2) = bold(x)-bold(a)$とおくと、
この積分の計算は
$
bold(I) = integral_(B_R) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3 dd(bold(x))
$
に帰着される。
空間の次元が$3$で、被積分関数の大きさは$1/abs(bold(x)-bold(a))^2$と$-2$次で足すと正なので、この積分は$bold(a)$が$B_R$の中に入っている、つまり$P_2 in B_R (P_1)$の場合でも収束することに注意する。

この積分の値を計算してみよう。
座標軸を適宜回転させて取り直すことで、$bold(a) = vec(a, 0, 0)$ ($a > 0$)の場合のみ考えれば良い。
$bold(x) = vec(x, y, z)$とおくと、
$
bold(I) = integral.triple_(x^2+y^2+z^2 <= R^2) 1/sqrt((x-a)^2+y^2+z^2)^3 vec(x-a, y, z) dd(x, y, z)
$
である。
球座標変換$(x, y, z) = (r cos theta, r sin theta cos phi, r sin theta sin theta)$するとヤコビアンは$abs(pdv((x, y, z), (r, theta, phi))) = r^2 sin theta$であることを思い出して、
$
bold(I) = integral_0^R integral_0^pi integral_0^(2 pi) (r^2 sin theta)/sqrt((r cos theta-a)^2+r^2 sin^2 theta)^3 vec(r cos theta-a, r sin theta cos phi, r sin theta sin phi) dd(phi)dd(theta)dd(r)
$
となる。
$phi$での積分を実行すると$y, z$成分は消えて、
$
bold(I)
&= integral_0^R integral_0^pi (r^2 sin theta)/sqrt((r cos theta-a)^2+r^2 sin^2 theta)^3 vec(2 pi r cos theta-a, 0, 0) dd(theta)dd(r) \
&= integral_0^R integral_0^pi (2 pi r^2 (r cos theta-a)sin theta)/sqrt((r cos theta-a)^2+r^2 sin^2 theta)^3 dd(theta)dd(r) vec(1, 0, 0)
$
となる。
このスカラーな積分を$I$とおく、つまり
$
I = 2 pi integral_0^R integral_0^pi (r^2 (r cos theta-a)sin theta)/sqrt(r^2-2 a r cos theta+a^2)^3 dd(theta)dd(r)
$
で$t = cos theta$と置換すると、
$
I = -2 pi integral_0^R integral_(+1)^(-1) (r^2 (r t-a))/sqrt(r^2-2 a r t+a^2)^3 dd(t)dd(r)
$
である。
分母は$t$について一次式の平方根なので丸ごと新しい変数に置換するのが正攻法である。
つまり$s = sqrt(r^2-2 a r t+a^2)$とおくと、
$t$が$+1$から$-1$を動く時$s$は$abs(r-a)$から$abs(r+a) = r+a$を動き、$t = (r^2+a^2-s^2)/(2 a r)$なので、
$
I
= -2 pi integral_0^R integral_(abs(r-a))^(r+a) (r^2 ((r^2+a^2-s^2)/(2 a)-a))/s^3 (-s)/(a r) dd(s)dd(r)
= pi/a^2 integral_0^R integral_(abs(r-a))^(r+a) (r (r^2-a^2-s^2))/s^2 dd(s)dd(r)
$
被積分関数は$r((r^2-a^2)s^(-2)-1)$で不定積分は$r(-(r^2-a^2)s^(-1)-s)+C$なので、
$
I
&= pi/a^2 integral_0^R r(-(r^2-a^2)(1/(abs(r-a))-1/(r+a))-((r+a)-abs(r-a))) dd(s)dd(r) \
&= -(2 pi)/a^2 integral_0^R (1-(r-a)/(abs(r-a)))r^2 dd(r)
$
ここで$1-(r-a)/(abs(r-a))$の値は$r < a$なら$2$で$r > a$なら$0$であることに注意する。
よって、$a > R$のときは常に$r <= R < a$なので、
$
I
= -(2 pi)/a^2 integral_0^R 2 r^2 dd(r)
= -4/3 pi R^3 1/a^2
$
で、$a <= R$のときは
$
I
= -(2 pi)/a^2 integral_0^a 2 r^2 dd(r)
= -4/3 pi a
$
となる。

この結果をもとに考察すると、物体が地表から離れた位置にある場合つまり$a > R$のときは$4/3 pi R^3$は球$B_R$の体積なので、万有引力の合計は地球の質量を$m_1 = rho times 4/3 pi R^3$として
$
bold(F) = -G m_1 m_2 1/a^2 vec(1, 0, 0)
$
となり、
ベクトル$vec(1, 0, 0)$は地球から物体に向かうベクトル$bold(a) = arrow(P_1 P_2)$の方向で$a$はその大きさなので、
$
bold(F) = -G m_1 m_2 arrow(P_1 P_2)/abs(arrow(P_1 P_2))^3
$
とあたかも地球の全質量が中心$P_1$に集中している場合の万有引力と同じになる。
このことは物体が地表にある場合つまり$a = R$のときも同じで万有引力の合計は地球の全質量が中心$P_1$に集中している場合の万有引力と同じになる。
一方、物体が地球の内部にある場合つまり$a < R$のときは地球の中心から$a$以上離れている部分の質量が無視されてそれ以下の部分の質量のみが物体に働く万有引力の合計となる。

この積分$bold(I)$は、被積分関数がスカラーポテンシャルを持つので、ガウス・グリーンの定理を使うことでも計算できる。
つまり、
$
grad (-1/abs(bold(x)-bold(a))) = (bold(x)-bold(a))/abs(bold(x)-bold(a))^3
$
に注目すると
$
bold(I)
= integral_(B_R) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3 dd(bold(x))
= integral_(partial B_R) (-1/abs(bold(x)-bold(a))) bold(n)(bold(x)) dd(S(bold(x)))
$
となる。
ここで$partial B_R$は$B_R$の境界つまり球面で、
その上の点$bold(x) in partial B_R$において外向き単位法線ベクトルは$bold(n)(bold(x)) = bold(x)/abs(bold(x))$であり、
$bold(x) = (R cos theta, R sin theta cos phi, R sin theta sin phi)$とパラメータ付けると面積要素は$dd(S(bold(x))) = R^2 sin theta$なので、
$
bold(I)
&= -integral_(partial B_R) 1/abs(bold(x)-bold(a)) bold(x)/abs(bold(x)) dd(S(bold(x))) \
&= -integral_0^pi integral_0^(2 pi) (R^2 sin theta)/sqrt((R cos theta-a)^2+R^2 sin^2 theta) vec(cos theta, sin theta cos phi, sin theta sin phi) dd(phi)dd(theta)
$
である。
$phi$での積分を実行すると、
$
bold(I)
= -2 pi integral_0^pi (R^2 cos theta sin theta)/sqrt(R^2-2 a R cos theta+a^2) dd(theta) vec(1, 0, 0)
=: I vec(1, 0, 0).
$
先ほどと同様に$t = cos theta$, $s = sqrt(R^2-2 a R t+a^2)$と置換すると、
$
I
&= 2 pi R^2 integral_(abs(R-a))^(R+a) (R^2+a^2-s^2)/(2 a R s) (-2 s)/(2 a R) dd(s)
= -pi/a^2 integral_(abs(R-a))^(R+a) (R^2+a^2-s^2) dd(s) \
&= -2/3 pi/a^2 ((R^3+a^3)-abs(R^3-a^3)) \
&= cases(
	-4/3 pi R^3 1/a^2"," (a >= R),
	-4/3 pi a"," (a <= R)
)
$
となり、先ほどと同じ結果が得られる。

以降ではこの万有引力の合計の計算の拡張を試みる。
先ほどの設定の中で特に現実的でないと思われるのは、地球の密度が一定であるところである。
そこで地球の密度$rho$が位置$P$によって変化する場合として、地球の中心$P_1$からの相対的な位置といえる$bold(x) = arrow(P_1 P)$に依存する密度関数$rho(bold(x)) = rho(arrow(P_1 P))$を考える。
$P$は空間全体を動くとして$rho$はある半径より離れたところでは$0$とする。
先ほどの設定では$rho(bold(x))$が$abs(bold(x)) <= R$では一定値$rho$でそうでない場合は$0$であった。
密度が位置に依存する場合の万有引力の合計は
$
bold(F)
= -integral_(RR^3) G m_2 rho(arrow(P_1 P)) arrow(P P_2)/abs(arrow(P P_2))^3 dd(P)
= G m_2 bold(I),
quad
bold(I)
= integral_(RR^3) rho(bold(x)) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3 dd(bold(x))
$
となる。
この積分$bold(I)$の具体的な計算は一般の密度関数$rho(bold(x))$に対しては難しいが、
半径$abs(bold(x))$のみに依存する場合の密度関数（これも$rho$で表し$rho(bold(x)) = rho(abs(bold(x)))$とする）に対しては最初のように球座標変換による計算が可能である。
それを行うと$bold(a) = vec(a, 0, 0)$として
$
bold(I)
= -(2 pi)/a^2 integral_0^oo (1-(r-a)/(abs(r-a)))rho(r)r^2 dd(r) vec(1, 0, 0)
= -(4 pi)/a^2 integral_0^a rho(r)r^2 dd(r) vec(1, 0, 0).
$
ここで地球の質量のうち中心からの距離が$a$以下の部分あるものを集めた量は
$
m_(1, a)
= integral_(B_a) rho(bold(x)) dd(bold(x))
= integral_0^a integral_0^pi integral_0^(2 pi) rho(r) r^2 sin theta dd(phi)dd(theta)dd(r)
= 4 pi integral_0^a rho(r) r^2 dd(r)
$
なので、
この場合もやはり万有引力の合計は$P_1$から$P_2$よりも離れた部分は無視してそれ以内の部分の質量がすべて$P_1$に集中しているとみなして
$
bold(F)
= -G m_(1, abs(arrow(P_1 P_2))) m_2 arrow(P_1 P_2)/abs(arrow(P_1 P_2))^3
$
となることがわかる。

以降では一般の密度関数$rho(bold(x))$に対して積分の計算がある程度できることを示す。
そのために重要な視点が積分$bold(F)$が物体の位置$P_2$に依っている、つまり
$
bold(I)(bold(a))
= integral_(RR^3) rho(bold(x)) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3 dd(bold(x))
$
とできることである。
そしてこれにはスカラーポテンシャルが存在する。
実際、被積分関数について
$
grad_(bold(a)) (rho(bold(x))/abs(bold(x)-bold(a)))
= rho(bold(x)) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3
$
なので、積分記号の下での微分により
$
Phi(bold(a)) = -integral_(RR^3) rho(bold(x))/abs(bold(x)-bold(a)) dd(bold(x))
$
とおくと$bold(I)(bold(a)) = -grad Phi(bold(a))$である。
したがってこのスカラーポテンシャル$Phi(bold(a))$を求めることができれば、万有引力の合計$bold(F)$も求めることができる。
このスカラーポテンシャル$Phi$のことを重力ポテンシャルあるいはニュートンポテンシャルという。
ここでもう一階$bold(a)$で微分して、ラプラシアン$laplace Phi(bold(a)) = -div bold(I)(bold(a))$を考える。
先に被積分関数の微分を計算すると$bold(a) eq.not bold(x)$において
$
laplace_(bold(a)) (rho(bold(x))/abs(bold(x)-bold(a)))
&= rho(bold(x)) div_(bold(a)) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3
= rho(bold(x)) tr grad_(bold(a)) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3 \
&= rho(bold(x)) tr [-I_3/abs(bold(x)-bold(a))^3+3 ((bold(x)-bold(a)) times.o (bold(x)-bold(a)))/abs(bold(x)-bold(a))^5]
= rho(bold(x)) [-3/abs(bold(x)-bold(a))^3+3 1/abs(bold(x)-bold(a))^3] \
&= 0
$
であり、
$bold(a) = bold(x)$においては発散してしまうので、
この微分は通常の関数としては捉えられず特に微分と積分の交換が保証されない。
しかしながら交換できるとして$bold(x)$についての積分を、
$(bold(x)-bold(a))/abs(bold(x)-bold(a))^3$の形から$bold(a)$での発散を$bold(x)$での発散にマイナスしたもので置き換え、
$bold(x) eq.not bold(a)$で被積分関数が$0$より$rho(bold(x))$を$rho(bold(a))$で置き換えると、
$integral_(RR^3) laplace_(bold(a)) (rho(bold(x))/abs(bold(x)-bold(a))) dd(bold(x))$は次の値で代用できる。
$
-integral_(B_r (bold(a))) rho(bold(a)) div_(bold(x)) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3 dd(bold(x))
&= -rho(bold(a)) integral_(partial B_r (bold(a))) (bold(x)-bold(a))/abs(bold(x)-bold(a))^3 dot (bold(x)-bold(a))/abs(bold(x)-bold(a)) dd(S(bold(x))) \
&= -rho(bold(a)) integral_(partial B_r (bold(a))) 1/r^2 dd(S(bold(x)))
= -4 pi rho(bold(a)).
$
つまり以上の置き換えのもとで
$
laplace Phi(bold(a)) = -4 pi rho(bold(a))
$
が得られる。
この$Phi$についての方程式はポアソン方程式と呼ばれる偏微分方程式の一種で、
$rho$が多少変な関数であっても解を持つことが知られている。
つまり密度関数$rho(bold(x))$が与えられたらポアソン方程式を解いてその勾配を計算することで万有引力の合計$bold(F)$を求めることができる。
