public class Map {
	var field: [[Cell]]
	
	init(width: Int, height: Int) {
		field = (0 ..< height).map({ y in
			(0 ..< width).map({ x in Cell(x: x, y: y) })
		})
		for (y, row) in field.enumerated() {
			for (x, cell) in row.enumerated() {
				let px = x - 1
				let nx = x + 1
				let py = y - 1
				let ny = y + 1

				/*
				0 1 2
				3 _ 4
				5 6 7
				*/

				cell.around[0] = px >= 0 && py >= 0 ? field[py][px] : nil
				cell.around[1] = py >= 0 ? field[py][x] : nil
				cell.around[2] = nx < width && py >= 0 ? field[py][nx] : nil
				cell.around[3] = px >= 0 ? field[y][px] : nil
				cell.around[4] = nx < width ? field[y][nx] : nil
				cell.around[5] = px >= 0 && ny < height ? field[ny][px] : nil
				cell.around[6] = ny < height ? field[ny][x] : nil
				cell.around[7] = nx < width && ny < height ? field[ny][nx] : nil
			}
		}
	}

	func randomize() {
		self.field.forEach({ row in
			row.forEach({ cell in
				cell.alive = Bool.random()
			})
		})
	}

	func update() {
		self.field.forEach({ row in
			row.forEach({ cell in
				cell.setNextState()
			})
		})
		self.field.forEach({ row in
			row.forEach({ cell in
				cell.update()
			})
		})
	}

	func output() {
		let str = self.field.map({ row in
			row.map({ cell in
				cell.alive ? "@" : "_"
			}).joined(separator: "")
		}).joined(separator: "\n")
		print(str)
		print("")
	}
}
