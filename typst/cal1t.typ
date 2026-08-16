
#let title = [微分積分学１]
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

#include-chapter("/src/cal1t/00_preface.typ", <h_cal1t_preface>)

#outline()

#include-chapter("/src/cal1t/01_set.typ", <h_cal1t_set>)
#include-chapter("/src/cal1t/02_number.typ", <h_cal1t_number>)
#include-chapter("/src/cal1t/03_supinf.typ", <h_cal1t_supinf>)
#include-chapter("/src/cal1t/04_sequence.typ", <h_cal1t_sequence>)
#include-chapter("/src/cal1t/05_limit.typ", <h_cal1t_limit>)
#include-chapter("/src/cal1t/06_functions.typ", <h_cal1t_functions>)
#include-chapter("/src/cal1t/07_equidist.typ", <h_cal1t_equidist>)

#bibliography("/src/references.yml")
