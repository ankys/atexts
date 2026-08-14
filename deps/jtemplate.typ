
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
	show: show-theorem
	body
}
