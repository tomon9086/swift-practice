import Foundation

let map = Map(width: 30, height: 15)
map.randomize()
for _ in 0 ..< 100 {
	map.output()
	map.update()
	usleep(300000)
}
