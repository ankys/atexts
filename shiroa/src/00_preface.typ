
#import "@preview/shiroa:0.4.0": x-current

#let path = x-current

#context {
	let title = query(<frontmatter>).first().value.title
	// import "/shiroa/book.typ": book-page
	// show: book-page.with(title: title)
  import "@preview/shiroa-starlight:0.4.0": starlight
  starlight(
    include "/shiroa/book.typ",
		include path,
    title: title,
  )
	title
}
#include path

// #import "/shiroa/book.typ": book-page
// #show: book-page.with(title: frontmatter.title)
