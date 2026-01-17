
#import "@preview/js:0.1.3": js, maketitle
#let jsbook(
	lang: "ja",
	paper: "a4",
	body
) = {
	show: js.with(
		book: true,
		lang: lang,
		paper: paper,
		// seriffont: "New Computer Modern",
		// seriffont-cjk: "Harano Aji Mincho",
		// sansfont: "Source Sans Pro",
		// sansfont-cjk: "Harano Aji Gothic",
	)
	set ref(supplement: auto)
	set par(first-line-indent: 1em) // why
	show math.equation.where(block: true): block.with(width: 100%)
	body
}
