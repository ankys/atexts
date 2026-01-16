
#let tostring(content) = {
	if content.has("text") {
		if type(content.text) == "string" {
			content.text
		} else {
			tostring(content.text)
		}
	} else if content.has("children") {
		content.children.map(tostring).join()
	} else if content.has("body") {
		tostring(content.body)
	} else if content == [ ] {
		" "
	}
}
#let output_outline() = context {
	let hs = query(heading)
	for h in hs {
		let level = h.level;
		let body = h.body;
		let n = h.numbering;
		let loc = h.location();
		let indent = if level == 1 { "" } else if (level == 2) { "  " }
		let number = if n == none { "" } else {
			numbering(n, ..counter(heading).at(loc))
		}
		// [#(indent)- #(number) #(body)\ ]
		raw((indent, "- ", number, " ", tostring(body), "\n").join())
	}
}
