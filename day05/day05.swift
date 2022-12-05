import Foundation


func parseInput(_ input: String) -> ([[Character]], [(number: Int, from: Int, to: Int)]) {
	let parts = input.split(separator: "\n\n")
	let crates = parseCrates(String(parts[0]))
	let moves = parseMoves(String(parts[1]))
	return (crates, moves)
}

func parseCrates(_ input: String) -> [[Character]] {
	let parts = input.split(separator: "\n")
	let stacks = String(parts.last!)
		.trimmingCharacters(in: .whitespaces)
		.split(separator: "   ")
		.count
	var result: [[Character]] = Array(repeating: [], count: stacks)
	for line in parts.dropLast(1).reversed() {
		for (n, ch) in line.enumerated() {
			if ch != "[", ch != "]", ch != " " {
				result[n / 4].append(ch)
			}
		}
	}
	return result
}

func parseMoves(_ input: String) -> [(number: Int, from: Int, to: Int)] {
	let parts = input.split(separator: "\n")
	var result: [(number: Int, from: Int, to: Int)] = []
	for part in parts {
		let words = part.split(separator: " ")
		let number = Int(words[1])!
		let from = Int(words[3])! - 1
		let to = Int(words[5])! - 1
		result.append((number: number, from: from, to: to))
	}
	return result
}

func moveCrates(_ crates: [[Character]], _ moves: [(number: Int, from: Int, to: Int)], reverse: Bool) -> String {
	let result = moves.reduce(crates) { crates, move in
		var crates = crates
		let moved = crates[move.from].suffix(move.number)
		crates[move.from].removeLast(move.number)
		let movedCrates = reverse ? Array(moved.reversed()) : Array(moved)
		crates[move.to].append(contentsOf: movedCrates)
		return crates
	}
	return String(result.map { $0.last! })
}

let input = try String(contentsOfFile: "./input.txt", encoding: .utf8)
let (crates, moves) = parseInput(input)
print("Part one:", moveCrates(crates, moves, reverse: true))
print("Part two:", moveCrates(crates, moves, reverse: false))