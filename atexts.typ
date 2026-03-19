
#let title = [数学]
#let author = "中安淳"
#import "version.typ": date

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

// #import "references.typ": get_all_labels
// #let custom_labels = get_all_labels()
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

#part[線形代数学１]
#include "lin1t/01_twodimension.typ"
#include "lin1t/02_matrix.typ"
#include "lin1t/03_linearsystem.typ"
#include "lin1t/04_determinant.typ"
#include "lin1t/05_linearspace.typ"
#include "lin1t/06_eigenproblem.typ"
#include "lin1t/07_diagonalization.typ"
#include "lin1t/08_triangularization.typ"
#include "lin1t/09_variousclass.typ"
#include "lin1t/10_quadratic.typ"

#part[微分積分学３]
#include "cal3t/01_tuple.typ"
#include "cal3t/02_space.typ"
#include "cal3t/03_pdiff.typ"
#include "cal3t/04_iint.typ"
#include "cal3t/05_fseq.typ"
#include "cal3t/06_calc.typ"
#include "cal3t/07_limint.typ"

#bibliography("references.yml")
