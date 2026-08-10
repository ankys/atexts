#let merge_dict(base, dict, callback) = {
	for key in dict.keys() {
		let value = callback(dict.at(key))
		base.insert(key, value)
	}
	return base
}
#let get_all_labels() = {
	let labels = ().to-dict()
	import "cal1t/references.typ": custom_labels
	labels = merge_dict(labels, custom_labels, value => [@r_cal1t[#value]])
	// import "cal2t/references.typ": custom_labels
	// labels = merge_dict(labels, custom_labels)
	return labels
}
