
#import "autoeqnum.typ": autoeqnum
#import "theorem.typ": show-theorem

#let jtemplate(body) = {
	set text(lang: "ja")
	show ref: it => {
		if query(it.target).len() == 0 {
			it.target
		} else {
			it
		}
	}
	show: autoeqnum.with(mode: "ref", numbering: it => {
		let count = counter(heading).get()
		numbering("(1.1)", ..count, it)
	})
	show: show-theorem
	body
}
