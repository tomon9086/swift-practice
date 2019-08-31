import Foundation

func fib(n: Int) -> Int {
	if(n == 0) {
		return 1
	} else if(n == 1) {
		return 1
	}
	return fib(n: n - 1) + fib(n: n - 2)
}

let startTime = Date()
for i in 0 ... 90 {
	print(i, fib(n: i))
}
print("Time:", Date().timeIntervalSince(startTime) * 1000, "ms")
