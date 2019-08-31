let arr = ([Int])(1 ... 10)
let sum = arr.reduce(0) {
	$0 + $1
}
print(sum)
