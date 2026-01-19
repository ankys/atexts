
#let tostring(x) = {
	if (type(x) == content) {
		if (x.has("text")) {
			tostring(x.text)
		} else if (x.has("children")) {
			x.children.map(tostring).join()
		} else if (x.has("body")) {
			tostring(x.body)
		} else {
			" "
		}
	} else {
		str(x)
	}
}
#let output_outline(fmt: (level, number, body) => [#("  " * (level - 1))- #number #body\ ]) = context {
	let hs = query(heading)
	let content = []
	for h in hs {
		let level = h.level
		let body = h.body
		let n = h.numbering
		let loc = h.location()
		let number = if n == none { "" } else {
			numbering(n, ..counter(heading).at(loc))
		}
		content += fmt(level, number, body)
	}
	return content
}
#let output_labels(fmt: (key, value) => [#key: #value\ ]) = context {
	let targets = query(selector.or(heading, figure, math.equation))
	let labels = targets.filter(t => t.has("label")).map(t => t.label)
	let content = []
	for l in labels {
		let key = str(l)
		let value = ref(l)
		let indent = "  "
		content += fmt(key, value)
	}
	return content
}
