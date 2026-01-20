
#let title = [数学テキスト]
#let author = "中安淳"
// #let date = datetime.today()
#let date = [2026年1月5日]

#import "deps/jsbook.typ": *
#show: jsbook.with(
	paper: "a4",
	lang: "ja",
)

#import "deps/theorem.typ": thmrules
#show: thmrules.with()

#import "deps/autoeqnum.typ": autoeqnum
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

// #import "98_ref.typ": custom_labels
// #show ref: it => {
// 	let key = str(it.target)
// 	if key in custom_labels {
// 		custom_labels.at(key)
// 	} else {
// 		it
// 	}
// }

#include "00_preface.typ"

#outline-part()

#part[微分積分学１]
#include "cal1t/01_set.typ"
#include "cal1t/02_number.typ"
#include "cal1t/03_supinf.typ"
#include "cal1t/04_sequence.typ"
#include "cal1t/05_limit.typ"
#include "cal1t/06_functions.typ"
#include "cal1t/07_equidist.typ"

#part[微分積分学２]
#include "cal2t/01_differential.typ"
#include "cal2t/02_integral.typ"
#include "cal2t/03_series.typ"
#include "cal2t/04_functions.typ"

#bibliography("references.yml")
