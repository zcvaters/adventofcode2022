import Foundation

func readInputFile(_ file: String) -> String {
    let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    let fileURL = currentDirectoryURL.appendingPathComponent(file)

    do {
        return try String(contentsOf: fileURL, encoding: .utf8)
    }
    catch {
        print("Error: \(error)")
    }
    return ""
}

var input: [Int] = readInputFile("input.txt").split(separator: "\n", omittingEmptySubsequences: false).map { Int($0) ?? -1 }

// Part 1
print(input.reduce((0, 0), { (result, number) -> (Int, Int) in
    if number == -1 {
        return (max(result.0, result.1), 0)
    } else {
        return (result.0, result.1 + number)
    }
}).0)

// Part 2
var elfSumsArray: [Int] = []
var currentSum: Int = 0
for i in 0..<input.count {
    if input[i] == -1 {
        elfSumsArray.append(currentSum)
        currentSum = 0
        continue
    }
    currentSum += input[i]
}

print(elfSumsArray.sorted().suffix(3).reduce(0, +))
