import Foundation

let input = try String(contentsOfFile: "./input.txt", encoding: .utf8)

func findMarkers(_ input: String, _ size: Int) -> Int {
  var processedCharacters = 0
  var recentCharacters = [Character]()
  for character in input {
    recentCharacters.append(character)
    if recentCharacters.count > size {
      recentCharacters.removeFirst()
    }
    if Set(recentCharacters).count == size {
      return processedCharacters + 1
    }
    processedCharacters += 1
  }

  return -1
}

print("Part 1", findMarkers(input, 4))
print("Part 2", findMarkers(input, 14))