public class Directory: Accessable {
	let parent: Directory?
	var name: String
	var path: String
	var children: [String: Accessable] = [:]

	init(name: String, parent: Directory?) {
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
}
