import Foundation

var memo: [Int?] = []

func fib(n: Int) -> Int {
	if memo.count <= n {
		memo += Array(repeating: nil, count: n - memo.count + 1)
	}
	// print(n, memo)
	var ret = 0
	if let m = memo[n] {
		ret = m
	} else {
		if n == 0 {
			ret = 1
		} else if n == 1 {
			ret = 1
		} else {
			ret = fib(n: n - 1) + fib(n: n - 2)
		}
		memo[n] = ret
	}
	return ret
}

let startTime = Date()
for i in 0 ... 90 {
	print(i, fib(n: i))
}
print("Time:", Date().timeIntervalSince(startTime) * 1000, "ms")
