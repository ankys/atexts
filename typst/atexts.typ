
#let title = [数学]
#let author = "中安淳"
#import "/version.typ": date

#import "/deps/jsbook.typ": *
#show: jsbook.with(
	paper: "a4",
	lang: "ja",
)

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

#let include-chapter(path, label, numbering: true) = context {
	let frontmatter = query(<frontmatter>).find(it => ("label" in it.value) and (it.value.label == label))
	let chapter-title = if frontmatter == none { label } else { frontmatter.value.title }
	[
		#if numbering == none [
			#heading(level: 1, numbering: none)[#chapter-title]
		] else [
			= #chapter-title
		]
		#include path
	]
}

#include-chapter("/src/preface.typ", <h_preface>, numbering: none)

#outline-part()

#part[微分積分学１]
#include-chapter("/src/cal1t/01_set.typ", <h_cal1t_set>)
#include-chapter("/src/cal1t/02_number.typ", <h_cal1t_number>)
#include "/src/cal1t/03_supinf.typ"
#include "/src/cal1t/04_sequence.typ"
#include "/src/cal1t/05_limit.typ"
#include "/src/cal1t/06_functions.typ"
#include "/src/cal1t/07_equidist.typ"

#part[微分積分学２]
#include "/src/cal2t/01_differential.typ"
#include "/src/cal2t/02_integral.typ"
#include "/src/cal2t/03_series.typ"
#include "/src/cal2t/04_functions.typ"

#part[線形代数学１]
#include "/src/lin1t/01_twodimension.typ"
#include "/src/lin1t/02_matrix.typ"
#include "/src/lin1t/03_linearsystem.typ"
#include "/src/lin1t/04_determinant.typ"
#include "/src/lin1t/05_linearspace.typ"
#include "/src/lin1t/06_eigenproblem.typ"
#include "/src/lin1t/07_diagonalization.typ"
#include "/src/lin1t/08_triangularization.typ"
#include "/src/lin1t/09_variousclass.typ"
#include "/src/lin1t/10_quadratic.typ"

#part[微分積分学３]
#include "/src/cal3t/01_tuple.typ"
#include "/src/cal3t/02_space.typ"
#include "/src/cal3t/03_pdiff.typ"
#include "/src/cal3t/04_iint.typ"
#include "/src/cal3t/05_fseq.typ"
#include "/src/cal3t/06_calc.typ"
#include "/src/cal3t/07_limint.typ"

#bibliography("/src/references.yml")
