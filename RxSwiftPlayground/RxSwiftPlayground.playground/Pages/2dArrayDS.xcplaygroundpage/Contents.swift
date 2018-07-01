import Foundation

/*
let array: [[Int]] = [
    [-9, -9, -9,  1, 1, 1],
    [ 0, -9,  0,  4, 3, 2],
    [-9, -9, -9,  1, 2, 3],
    [ 0,  0,  8,  6, 6, 0],
    [ 0,  0,  0, -2, 0, 0],
    [ 0,  0,  1,  2, 4, 0],
]
 -1 -1 0 -9 -2 -2
 -2 -1 -6 -8 -2 -5
 -1 -1 -1 -2 -3 -4
 -1 -9 -2 -4 -4 -5
 -7 -3 -3 -2 -9 -9
 -1 -3 -1 -2
 */
let array: [[Int]] = [
    [-1, -1,  0, -9, -2, -2],
    [-2, -1, -6, -8, -2, -5],
    [-1, -1, -1, -2, -3, -4],
    [ 1, -9, -2, -4, -4, -5],
    [-7, -3, -3, -2, -9, -9],
    [-1, -3, -1, -2]
]

// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {
    var hourglassesSums: [Int] = []
    var hourglasses: [[Int]] = []
    
    for index in 0...15 {
        let hg = hourglassAt(index, onArray: arr)
        hourglasses.append(hg)
        let hgSum = hourglasses[index].reduce(0, +)
        hourglassesSums.append(hgSum)
    }
    
    let first = hourglassesSums.first
    
    return hourglassesSums.reduce(first ?? 0) { (result, number) -> Int in
        if result > number {
            return result
        }
        return number
    }
}

func hourglassAt(_ index:Int, onArray arr:[[Int]]) -> [Int] {
    let indexes = [
        [0, 0],[0, 1],[0, 2],[0, 3],
        [1, 0],[1, 1],[1, 2],[1, 3],
        [2, 0],[2, 1],[2, 2],[2, 3],
        [3, 0],[3, 1],[3, 2],[3, 3]
    ]
    let hourglassPos = indexes[index]
    var subHourglass = [[Int]]()
    var hourglass = [Int]()
    for (linIndex, line) in arr.enumerated() {
        for (colIndex, column) in line.enumerated() {
            let isAtPosition = hourglassPos[0] == linIndex && hourglassPos[1] == colIndex
            if isAtPosition {
                let midLine = arr[linIndex + 1]
                let footLine = arr[linIndex + 2]
                
                let lineEnd = colIndex + 2 < line.count ? colIndex + 2 : line.count - 1
                let midLineEnd = colIndex + 1 < midLine.count ? colIndex + 1 : midLine.count - 1
                let footLineEnd = colIndex + 2 < footLine.count ? colIndex + 2 : footLine.count - 1
                
                subHourglass.append(Array(line[colIndex...lineEnd]))
                subHourglass.append(Array(midLine[colIndex + 1...midLineEnd]))
                subHourglass.append(Array(footLine[colIndex...footLineEnd]))
            }
        }
    }
    
    for line in subHourglass {
        for col in line {
            hourglass.append(col)
        }
    }
    return hourglass
}

print("Total: \(hourglassSum(arr: array))")
