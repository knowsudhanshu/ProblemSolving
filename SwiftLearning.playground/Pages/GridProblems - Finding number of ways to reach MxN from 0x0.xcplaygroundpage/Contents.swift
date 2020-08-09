

func numberOfWaysToReach(coordinate: GridDimension) -> Int {
    var numberOfWaysGrid: [[Int]] = GridHelper.shared.getEmptyGrid()
    for i in 0..<coordinate.M {
        numberOfWaysGrid[i][0] = 1
    }
    for j in 0..<coordinate.N {
        numberOfWaysGrid[0][j] = 1
    }
    GridHelper.print(grid: numberOfWaysGrid)


    for i in 1..<coordinate.M {
        for j in 1..<coordinate.N {
            numberOfWaysGrid[i][j] = numberOfWaysGrid[i - 1][j] + numberOfWaysGrid[i][j-1]
        }
    }
    GridHelper.print(grid: numberOfWaysGrid)

    return numberOfWaysGrid[coordinate.M - 1][coordinate.N - 1]
}


GridHelper.shared.dimension = GridDimension(m: 4, n: 4)
let grid = GridHelper.shared.getPositiveIntGrid()
print("input ====")
GridHelper.print(grid: grid)

let coordinate =  GridDimension(m: 3, n: 3)

let answer = numberOfWaysToReach(coordinate: coordinate)

print("input ====")
print(answer)


