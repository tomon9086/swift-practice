let rootDirectory = Directory(name: "root", parent: nil)
let process = Process(root: rootDirectory)

process.mkdir(path: "/home")
process.mkdir(path: "/home/swift")

process.run(homePath: "/home/swift")
