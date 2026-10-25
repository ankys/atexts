
#let title = [ベクトル解析学]
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

#include-chapter("/src/vecat/00_preface.typ", <h_vecat_preface>)

#outline()

#include-chapter("/src/vecat/01_vecmat.typ", <h_vecat_vecmat>)
#include-chapter("/src/vecat/02_field.typ", <h_vecat_field>)
#include-chapter("/src/vecat/03_diff.typ", <h_vecat_diff>)
#include-chapter("/src/vecat/04_int.typ", <h_vecat_int>)
#include-chapter("/src/vecat/05_intdiff.typ", <h_vecat_intdiff>)
#include-chapter("/src/vecat/06_diffint.typ", <h_vecat_diffint>)
#include-chapter("/src/vecat/07_physics.typ", <h_vecat_physics>)

#bibliography("/src/references.yml")
