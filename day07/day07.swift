import Foundation


struct File {
    let name: String
    let size: Int
}

let input = try String(contentsOfFile: "./base.txt", encoding: .utf8).split(separator: "\n")
// let fileStructure = ["/": FileSystem(input)]
let fileSystem: Dictionary<String, [File]>
for prompt in input {
    if (prompt.starts(with: "$")) {
        print("command")
    } else if (prompt.starts(with: "dir")) {
        let dirCommand = prompt.split(separator: " ")
        print(dirCommand)
    }
}


