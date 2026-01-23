
#let title = [微分積分学３]
#let author = "中安淳"
#import "../version.typ": date

#import "../deps/jsbook.typ": *
#show: jsbook.with(
	paper: "a4",
	lang: "ja",
)

#import "../deps/theorem.typ": thmrules
#show: thmrules.with()

#import "../deps/autoeqnum.typ": autoeqnum
#show heading.where(level: 2): it => {
	counter(math.equation).update(0)
	it
}
#show: autoeqnum.with(mode: "ref", numbering: it => {
	let count = counter(heading).get()
	numbering("(1.1)", ..count, it)
})

// #import "deps/outputtools.typ": *
// #output_outline()
// #output_outline(fmt: (level, number, body) => [#("  " * (level - 1))- #number #body\\n])
// #pagebreak()
// #output_labels()
// #output_labels(fmt: (key, value) => [  #key: \@\[#value\],\\n])
// #pagebreak()

#maketitle(
	title: title,
	authors: author,
	date: date,
)

#import "../references.typ": get_all_labels
#let all_labels = get_all_labels()
#import "references.typ": custom_labels
#show ref: it => {
	let key = str(it.target)
	if key in custom_labels {
		it
	} else if key in all_labels {
		all_labels.at(key)
	} else {
		it
	}
}

#include "00_preface.typ"

#outline()

#include "01_tuple.typ"
#include "02_space.typ"
#include "03_pdiff.typ"
#include "04_iint.typ"
#include "05_fseq.typ"
#include "06_calc.typ"
#include "07_limint.typ"

#bibliography("../references.yml")
