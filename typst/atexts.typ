
#let title = [数学]
#let author = "中安淳"
#import "/version.typ": date

#metadata(true) <debug_mode>

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

#include-chapter("/src/preface.typ", <h_preface>)

#outline-part()

#part[微分積分学１]
#include-chapter("/src/cal1t/01_set.typ", <h_cal1t_set>)
#include-chapter("/src/cal1t/02_number.typ", <h_cal1t_number>)
#include-chapter("/src/cal1t/03_supinf.typ", <h_cal1t_supinf>)
#include-chapter("/src/cal1t/04_sequence.typ", <h_cal1t_sequence>)
#include-chapter("/src/cal1t/05_limit.typ", <h_cal1t_limit>)
#include-chapter("/src/cal1t/06_functions.typ", <h_cal1t_functions>)
#include-chapter("/src/cal1t/07_equidist.typ", <h_cal1t_equidist>)

#part[微分積分学２]
#include-chapter("/src/cal2t/01_differential.typ", <h_cal2t_differential>)
#include-chapter("/src/cal2t/02_integral.typ", <h_cal2t_integral>)
#include-chapter("/src/cal2t/03_series.typ", <h_cal2t_series>)
#include-chapter("/src/cal2t/04_functions.typ", <h_cal2t_functions>)

#part[線形代数学１]
#include-chapter("/src/lin1t/01_twodimension.typ", <h_lin1t_twodimension>)
#include-chapter("/src/lin1t/02_matrix.typ", <h_lin1t_matrix>)
#include-chapter("/src/lin1t/03_linearsystem.typ", <h_lin1t_linearsystem>)
#include-chapter("/src/lin1t/04_determinant.typ", <h_lin1t_determinant>)
#include-chapter("/src/lin1t/05_linearspace.typ", <h_lin1t_linearspace>)
#include-chapter("/src/lin1t/06_eigenproblem.typ", <h_lin1t_eigenproblem>)
#include-chapter("/src/lin1t/07_diagonalization.typ", <h_lin1t_diagonalization>)
#include-chapter("/src/lin1t/08_triangularization.typ", <h_lin1t_triangularization>)
#include-chapter("/src/lin1t/09_variousclass.typ", <h_lin1t_variousclass>)
#include-chapter("/src/lin1t/10_quadratic.typ", <h_lin1t_quadratic>)

#part[微分積分学３]
#include-chapter("/src/cal3t/01_tuple.typ", <h_cal3t_tuple>)
#include-chapter("/src/cal3t/02_space.typ", <h_cal3t_space>)
#include-chapter("/src/cal3t/03_pdiff.typ", <h_cal3t_pdiff>)
#include-chapter("/src/cal3t/04_iint.typ", <h_cal3t_iint>)
#include-chapter("/src/cal3t/05_fseq.typ", <h_cal3t_fseq>)
#include-chapter("/src/cal3t/06_calc.typ", <h_cal3t_calc>)
#include-chapter("/src/cal3t/07_limint.typ", <h_cal3t_limint>)

#bibliography("/src/references.yml")
