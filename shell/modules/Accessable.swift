protocol Accessable {
	var parent: Directory? { get set }
	var name: String { get set }
	var path: String { get set }

	func move(to: Directory) -> Void
	func rename(name: String) -> Void
}
