public class Cell {
	let x: Int
	let y: Int
	var alive = false
	var nextState = false
	var around: [Cell?] = Array(repeating: nil, count: 8)

	init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}

	func setNextState() {
		var count = 0
		self.around.forEach({ another in
			another.map({ cell in
				if cell.alive {
					count += 1
				}
			})
		})
		if self.alive {
			self.nextState = 1 < count && count < 4
		} else {
			self.nextState = count == 3
		}
	}

	func update() {
		self.alive = self.nextState
	}
}
