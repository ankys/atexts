
#let title = [線形代数学１]
#let author = "中安淳"
#import "/version.typ": date

#metadata(true) <debug_mode>

#import "/deps/jsbook.typ": *
#show: jsbook.with(
	paper: "a4",
	lang: "ja",
)

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

// #import "/src/references.typ": get_all_labels
// #let all_labels = get_all_labels()
// #import "/src/cal1t/references.typ": custom_labels
// #show ref: it => {
// 	let key = str(it.target)
// 	if key in custom_labels {
// 		it
// 	} else if key in all_labels {
// 		all_labels.at(key)
// 	} else {
// 		it
// 	}
// }

#include-chapter("/src/lin1t/00_preface.typ", <h_lin1t_preface>)

#outline()

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

#bibliography("/src/references.yml")
