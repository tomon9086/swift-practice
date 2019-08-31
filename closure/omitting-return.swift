let arr = ([Int])(1 ... 10)
let sum = arr.reduce(0, { p, c in p + c })
print(sum)
