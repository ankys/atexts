#let merge_dict(base, dict) = {
	for key in dict.keys() {
		base.insert(key, dict.at(key))
	}
	return base
}
#let get_all_labels() = {
	let labels = ().to-dict()
	import "cal1t/references.typ": custom_labels
	labels = merge_dict(labels, custom_labels)
	import "cal2t/references.typ": custom_labels
	labels = merge_dict(labels, custom_labels)
	return labels
}
