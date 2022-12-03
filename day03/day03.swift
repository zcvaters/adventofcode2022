import Foundation

let lines = try String(contentsOfFile: "input.txt", encoding: .utf8).split(separator: "\n")

let priorityMap: [String: Int] = [
  "a": 1,
  "b": 2,
  "c": 3,
  "d": 4,
  "e": 5,
  "f": 6,
  "g": 7,
  "h": 8,
  "i": 9,
  "j": 10,
  "k": 11,
  "l": 12,
  "m": 13,
  "n": 14,
  "o": 15,
  "p": 16,
  "q": 17,
  "r": 18,
  "s": 19,
  "t": 20,
  "u": 21,
  "v": 22,
  "w": 23,
  "x": 24,
  "y": 25,
  "z": 26,
  "A": 27,
  "B": 28,
  "C": 29,
  "D": 30,
  "E": 31,
  "F": 32,
  "G": 33,
  "H": 34,
  "I": 35,
  "J": 36,
  "K": 37,
  "L": 38,
  "M": 39,
  "N": 40,
  "O": 41,
  "P": 42,
  "Q": 43,
  "R": 44,
  "S": 45,
  "T": 46,
  "U": 47,
  "V": 48,
  "W": 49,
  "X": 50,
  "Y": 51,
  "Z": 52,
]

func partOne() -> Int {
  var sum = 0
  for line in lines {
    let firstHalf = line.prefix(line.count / 2)
    let secondHalf = line.suffix(line.count / 2)
    var appeared = Set<String>()
    for char in firstHalf {
      if secondHalf.contains(char) && !appeared.contains(String(char)) {
        sum += priorityMap[String(char)]!
        appeared.insert(String(char))
      }
    }
  }
  return sum
}

func partTwo() -> Int {
  var sum = 0
  for i in stride(from: 0, to: lines.count, by: 3) {
    let firstLine = lines[i]
    let secondLine = lines[i + 1]
    let thirdLine = lines[i + 2]
    var appeared = Set<String>()
    for char in firstLine {
      if secondLine.contains(char) && thirdLine.contains(char) && !appeared.contains(String(char)) {
        sum += priorityMap[String(char)]!
        appeared.insert(String(char))
      }
    }
  }
  return sum
}

print("Part one:", partOne())
print("Part two:", partTwo())
