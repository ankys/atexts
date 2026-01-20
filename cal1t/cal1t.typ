
#let title = [微分積分学１]
#let author = "中安淳"
// #let date = datetime.today()
#let date = [2026年1月5日]

#import "../deps/jsbook.typ": *
#show: jsbook.with(
	paper: "a4",
	lang: "ja",
)

#import "@preview/ctheorems:1.1.3": thmrules
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

#include "00_preface.typ"

#outline()

#include "01_set.typ"
#include "02_number.typ"
#include "03_supinf.typ"
#include "04_sequence.typ"
#include "05_limit.typ"
#include "06_functions.typ"
#include "07_equidist.typ"

#bibliography("../references.yml")
