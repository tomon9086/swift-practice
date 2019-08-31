print("Type numbers separated with space.")
let numsStr = readLine() ?? "0"
let nums = numsStr.split(separator: " ").map({ Int($0) ?? 0 })
print(nums)
