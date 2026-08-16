
#import "autoeqnum.typ": autoeqnum
#import "theorem.typ": show-theorem

#let jtemplate(body) = context {
	// lang
	set text(lang: "ja")
	// emph
	// show emph: it => {
	// 	strong(it.body)
	// }
	// indent
	set par(first-line-indent: (all: false, amount: 1em))
	show heading: it => {
		it
		h(1em)
	}
	show math.equation.where(block: true): block.with(width: 100%)
	// equation
	show: autoeqnum.with(mode: "ref", numbering: it => {
		let count = counter(heading).get()
		numbering("(1.1)", ..count, it)
	})
	// theorem
	show: show-theorem
	// ref
	if query(<debug_mode>).any(it => it.value) {
		show ref: it => {
			if query(it.target).len() == 0 {
				it.target
			} else {
				it
			}
		}
		body
	} else {
		body
	}
}
