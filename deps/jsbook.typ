
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
	// part heading
	counter("jsbook-part").update(0)
	// level 1 heading
	set heading(numbering: "第1章")
	// level 2 heading
	show heading.where(level: 2): set heading(numbering: "1.1")
	body
}

#let part(body) = context {
	counter("jsbook-part").step()
	let number = numbering("第I部", counter("jsbook-part").get().at(0))
	pagebreak(to: "odd", weak: true)
	set page(header: none)
	block[
		// #set par(first-line-indent: 0em, spacing: 3 * fontsize, leading: 3 * fontsize)
		// #let baselineskip = auto
		#v(1fr)
		#text(size: 3em, number)
		#linebreak()
		#text(size: 4.5em, baseline: 1em, body)
		#v(2fr)
	]
	pagebreak(to: "odd", weak: true)
	set page(header: auto)
}
