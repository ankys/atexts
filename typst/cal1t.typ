
#let title = [微分積分学１]
#let author = "中安淳"
#import "/version.typ": date

#import "/deps/jsbook.typ": *
#show: jsbook.with(
	paper: "a4",
	lang: "ja",
)

#import "/deps/theorem.typ": *
#show: show-theorem.with()

#import "/deps/autoeqnum.typ": autoeqnum
#show heading.where(level: 2): it => {
	counter(math.equation).update(0)
	it
}
#show: autoeqnum.with(mode: "ref", numbering: it => {
	let count = counter(heading).get()
	numbering("(1.1)", ..count, it)
})

// #import "/deps/outputtools.typ": *
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

#import "/src/references.typ": get_all_labels
#let all_labels = get_all_labels()
#import "/src/cal1t/references.typ": custom_labels
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

#include "/src/cal1t/00_preface.typ"

#outline()

#include "/src/cal1t/01_set.typ"
#include "/src/cal1t/02_number.typ"
#include "/src/cal1t/03_supinf.typ"
#include "/src/cal1t/04_sequence.typ"
#include "/src/cal1t/05_limit.typ"
#include "/src/cal1t/06_functions.typ"
#include "/src/cal1t/07_equidist.typ"

#bibliography("/src/references.yml")
