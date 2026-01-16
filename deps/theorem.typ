
#import "@preview/ctheorems:1.1.3": thmplain, thmbox, thmproof
#let theorem = thmbox("theorem", "定理", stroke: black)
#let lemma = thmbox("theorem", "補題", stroke: black)
#let proposition = thmbox("theorem", "命題", stroke: black)
#let definition = thmbox("theorem", "定義", stroke: black)
#let corollary = thmbox("theorem", "系", stroke: black)
#let example = thmplain("theorem", "例")
#let xca = thmplain("theorem", "練習問題")
#let remark = thmplain("theorem", "注意")
// #let proof = thmproof("proof", "証明")
#let proof = (..args, body) => {
	let name = "証明"
	if args != none and args.pos().len() > 0 {
		name = args.pos().first()
	}
	return block[
		【#name】#body#h(1fr)【証明終わり】
	]
}
