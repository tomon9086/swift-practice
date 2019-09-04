public class Directory: Accessable {
	private let isRoot: Bool
	var parent: Directory?
	var name: String
	var path: String
	var children: [String: Accessable] = [:]

	init(name: String, parent: Directory?) {
		self.isRoot = parent == nil
		self.parent = parent
		self.name = name
		if let parentDirectory = parent {
			self.path = parentDirectory.parent == nil ? "\(parentDirectory.path)\(self.name)" : "\(parentDirectory.path)/\(self.name)"
			children[".."] = parentDirectory
		} else {
			self.path = "/"
			children[".."] = self
		}
		children["."] = self
	}

	func move(to: Directory) {
		if self.isRoot {
			print("root directory can not be moved.")
			return
		}
		self.parent = to
		self.children[".."] = self.parent
	}

	func rename(name: String) {
		let filteredChildlen = self.parent?.children.filter({ $0.1.name == self.name }) ?? []
		print(filteredChildlen)
		if filteredChildlen.count > 0 {
		}
	}
}
