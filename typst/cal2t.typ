
#let title = [微分積分学２]
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

#include-chapter("/src/cal2t/00_preface.typ", <h_cal2t_preface>)

#outline()

#include-chapter("/src/cal2t/01_differential.typ", <h_cal2t_differential>)
#include-chapter("/src/cal2t/02_integral.typ", <h_cal2t_integral>)
#include-chapter("/src/cal2t/03_series.typ", <h_cal2t_series>)
#include-chapter("/src/cal2t/04_functions.typ", <h_cal2t_functions>)

#bibliography("/src/references.yml")
