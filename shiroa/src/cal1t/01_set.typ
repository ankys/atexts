
#import "@preview/shiroa:0.4.0": x-current

#let path = x-current

#let text = read(path)
#let match = text.match(regex("(?s)^\\s*---\\s*(.*?)\\s*---\\s*(.*)$"))
#let (frontmatter, body) = if match == none {
	("", text)
} else {
	(match.captures.at(0), match.captures.at(1))
}
#let frontmatter = yaml(bytes(frontmatter))
#let body = eval(body, mode: "markup")

#import "/shiroa/book.typ": book-page
#show: book-page.with(title: frontmatter.title)

#body
