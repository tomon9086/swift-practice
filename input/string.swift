print("Type your name.")
var name = readLine() ?? "anonymous"
name = name[name.startIndex].uppercased() + name[name.index(name.startIndex, offsetBy: 1) ..< name.endIndex]
print("Hello, \(name)!")
