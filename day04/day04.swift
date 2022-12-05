import Foundation

let pairs = try String(contentsOfFile: "input.txt", encoding: .utf8).split(separator: "\n").map {
    let assignments = $0.split(separator: ",")
    return assignments.map {
        let range = $0.split(separator: "-")
        return (start: Int(range[0])!, end: Int(range[1])!)
    }
}

func partOne() -> Int {
    var count = 0
    for pair in pairs {
        if pair[0].start <= pair[1].start && pair[0].end >= pair[1].end {
            count += 1
        }
        else if pair[1].start <= pair[0].start && pair[1].end >= pair[0].end {
            count += 1
        } 
    }

    return count
}

func partTwo() -> Int {
    var count = 0
    for pair in pairs {
        if !(pair[0].end < pair[1].start || pair[1].end < pair[0].start) {
            count += 1 
        }
    }
    return count
}


print(partOne())
print(partTwo())
