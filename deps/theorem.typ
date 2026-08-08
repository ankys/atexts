
#import "@preview/theorion:0.6.0": make-frame, theorion-i18n-map, cosmos
#import cosmos.rainbow: definition, theorem, lemma, proposition, corollary, example, remark

#import cosmos.rainbow: render-fn
#let (proof-counter, proof-box, proof, show-proof) = make-frame(
  "proof",
  theorion-i18n-map.at("proof"),
  render: render-fn.with(fill: gray.darken(20%)),
)
#let proof = proof-box

#import cosmos.rainbow: show-theorion
#let show-theorem(body) = {
	show: show-theorion
	show: show-proof
	body
}
