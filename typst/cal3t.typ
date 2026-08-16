
#let title = [微分積分学３]
#let author = "中安淳"
#import "/version.typ": date

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

#include-chapter("/src/cal3t/00_preface.typ", <h_cal3t_preface>)

#outline()

#include-chapter("/src/cal3t/01_tuple.typ", <h_cal3t_tuple>)
#include-chapter("/src/cal3t/02_space.typ", <h_cal3t_space>)
#include-chapter("/src/cal3t/03_pdiff.typ", <h_cal3t_pdiff>)
#include-chapter("/src/cal3t/04_iint.typ", <h_cal3t_iint>)
#include-chapter("/src/cal3t/05_fseq.typ", <h_cal3t_fseq>)
#include-chapter("/src/cal3t/06_calc.typ", <h_cal3t_calc>)
#include-chapter("/src/cal3t/07_limint.typ", <h_cal3t_limint>)

#bibliography("/src/references.yml")
