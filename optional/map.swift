func square(n: Int?) -> Int? {
	return n.map({ $0 * $0 })
}

[8, nil, 7, 2, nil, 3, 9].forEach({
	square(n: $0).map({ print($0) })
})
