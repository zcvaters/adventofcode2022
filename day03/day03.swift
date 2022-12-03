import Foundation

let lines = try String(contentsOfFile: "input.txt", encoding: .utf8).split(separator: "\n")

func rucksackPriority(_ char: Character) -> Int {
  let ascii = Int(String(char).unicodeScalars.first!.value)
  if ascii >= 97 && ascii <= 122 {
    return ascii - 96
  } else if ascii >= 65 && ascii <= 90 {
    return ascii - 38
  } else {
    return 0
  }
}

func partOne() -> Int {
  var sum = 0
  for line in lines {
    let firstHalf = line.prefix(line.count / 2)
    let secondHalf = line.suffix(line.count / 2)
    var appeared = Set<String>()
    for char in firstHalf {
      if secondHalf.contains(char) && !appeared.contains(String(char)) {
        sum += rucksackPriority(char)
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
        sum += rucksackPriority(char)
        appeared.insert(String(char))
      }
    }
  }
  return sum
}

print("Part one:", partOne())
print("Part two:", partTwo())
