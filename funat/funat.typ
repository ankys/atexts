
#let title = [関数解析学]
#let author = "中安淳"
#import "../version.typ": date

#import "../deps/jsbook.typ": *
#show: jsbook.with(
	paper: "a4",
	lang: "ja",
)

#import "../deps/theorem.typ": thmrules
#show: thmrules.with()

// #import "../deps/outputtools.typ": *
// #output_outline()
// #output_outline(fmt: (level, number, body) => [#("  " * (level - 1))- #number #body\\n])
// #pagebreak()
// #output_labels()
// #output_labels(fmt: (key, value) => [  #key: \[#value\],\\n])
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

#include "01_metric.typ"
// #include "02_number.typ"
// #include "03_supinf.typ"
// #include "04_sequence.typ"
// #include "05_limit.typ"
// #include "06_functions.typ"
// #include "07_equidist.typ"

#bibliography("../references.yml")
