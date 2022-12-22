import Foundation

let lines = try String(contentsOfFile: "./base.txt", encoding: .utf8).split(separator: "\n")

struct SensorData {
    let sensorCoordinates: (x: Int, y: Int)
    let beaconCoordinates: (x: Int, y: Int)

    init(sensorCoordinates: (x: Int, y: Int), beaconCoordinates: (x: Int, y: Int)) {
        self.sensorCoordinates = sensorCoordinates
        self.beaconCoordinates = beaconCoordinates
    }
}

let pattern = "x=(-?\\d+), y=(-?\\d+)"
let regex = try! NSRegularExpression(pattern: pattern)
var data = [SensorData]()
for line in lines {
    let matches = regex.matches(in: String(line), range: NSRange(line.startIndex..., in: line))

    let sensorCoordinates = (x: Int(line[Range(matches[0].range(at: 1), in: line)!])!,
                             y: Int(line[Range(matches[0].range(at: 2), in: line)!])!)

    let beaconCoordinates = (x: Int(line[Range(matches[1].range(at: 1), in: line)!])!,
                             y: Int(line[Range(matches[1].range(at: 2), in: line)!])!)

    let sensorData = SensorData(sensorCoordinates: sensorCoordinates, beaconCoordinates: beaconCoordinates)
    data.append(sensorData)
}

// find the min and max x and y values
let minSensorX = data.map { $0.sensorCoordinates.x }.min()!
let maxSensorX = data.map { $0.sensorCoordinates.x }.max()!
let minSensorY = data.map { $0.sensorCoordinates.y }.min()!
let maxSensorY = data.map { $0.sensorCoordinates.y }.max()!

let minBeaconX = data.map { $0.beaconCoordinates.x }.min()!
let maxBeaconX = data.map { $0.beaconCoordinates.x }.max()!
let minBeaconY = data.map { $0.beaconCoordinates.y }.min()!
let maxBeaconY = data.map { $0.beaconCoordinates.y }.max()!

let minX = min(minSensorX, minBeaconX)
let maxX = max(maxSensorX, maxBeaconX)

let minY = min(minSensorY, minBeaconY)
let maxY = max(maxSensorY, maxBeaconY)

print("minX: \(minX), maxX: \(maxX), minY: \(minY), maxY: \(maxY)")

// create a grid
var grid = [[String]]()
for _ in minY...maxY {
    var row = [String]()
    for _ in minX...maxX {
        row.append(".")
    }
    grid.append(row)
}

// add the sensors
for sensorData in data {
    let x = sensorData.sensorCoordinates.x - minX
    let y = sensorData.sensorCoordinates.y - minY
    grid[y][x] = "S"
}

// add the beacons
for sensorData in data {
    let x = sensorData.beaconCoordinates.x - minX
    let y = sensorData.beaconCoordinates.y - minY
    grid[y][x] = "B"
}



for row in grid {
    print(row.joined())
}

