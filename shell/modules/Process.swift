public class Process {
	let root: Directory
	var home = "/"
	var workingAt: Directory
	var workingPath: String

	init(root: Directory) {
		self.root = root
		self.workingAt = self.root
		self.workingPath = self.home
	}
	func run(homePath: String) {
		self.cd(path: homePath)
		self.home = self.workingPath

		while true {
			print("> ", terminator: "")
			let command = (readLine() ?? "").split(separator: " ")
			if command.count > 0 {
				switch command[0] {
				case "echo":
					print(command.suffix(command.count - 1).joined(separator: " "))
				case "pwd":
					self.pwd()
				case "cd":
					let path = command.count >= 2 ? String(command[1]) : ""
					self.cd(path: path)
				case "ls":
					let path = command.count >= 2 ? String(command[1]) : ""
					self.ls(path: path)
				case "mkdir":
					let name = command.count >= 2 ? String(command[1]) : ""
					self.mkdir(path: name)
				default:
					print("\(command[0]): command not found.")
				}
			}
		}
	}

	func pwd() {
		print(self.workingPath)
	}

	func cd(path: String) {
		if path.count == 0 {
			return self.cd(path: self.home)
		}
		if let destination = self._access(path: path) {
			self.workingAt = destination
			self.workingPath = destination.path
		} else {
			print("\(path) no such directory.")
		}
	}

	func ls(path: String) {
		if path.count == 0 {
			return self.ls(path: self.workingPath)
		}
		if let directory = self._access(path: path) {
			print(directory.children.sorted(by: { $0.0 < $1.0 }).map({ (key: String, accessable: Accessable) in "\(key)" }).joined(separator: "\n"))
		} else {
			print("\(path) no such file or directory.")
		}
	}

	func mkdir(path: String) {
		let splittedPath = self._toAbsolute(path: path).split(separator: "/")
		let name = String(splittedPath[splittedPath.endIndex - 1])
		let parentPath = "/\(splittedPath[splittedPath.startIndex ..< splittedPath.endIndex - 1].joined(separator: "/"))"
		if let directory = self._access(path: parentPath) {
			let exist: Accessable? = directory.children[name]
			if exist is Directory {
				print("\(name) directory exists.")
			}
			directory.children[name] = Directory(name: name, parent: directory)
		} else {
			print("\(parentPath) no such directory.")
		}
	}

	func _toAbsolute(path: String) -> String {
		let isAbsolute = path[path.startIndex] == "/"
		var splittedPath = path.split(separator: "/")
		if !isAbsolute {
			splittedPath = self.workingPath.split(separator: "/") + splittedPath
		}
		return "/\(splittedPath.joined(separator: "/"))"
	}

	func _access(path: String) -> Directory? {
		let splittedPath = self._toAbsolute(path: path).split(separator: "/")
		return splittedPath.map({ String($0) }).reduce(self.root, { (directory: Directory?, directoryName: String) -> Directory? in
			if let ret = directory?.children[directoryName] {
				return ret as? Directory
			} else {
				return nil
			}
		})
	}
}
