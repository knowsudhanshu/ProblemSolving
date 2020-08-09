

/// Finding minimum-cost path in a 2-D Matrix

/// Problem statement:
/// Given a cost matrix Cost[][]
/// where Cost[i][j] denotes the cost of visiting cell with coordinates (i,j),
/// find a min-cost path to reach a cell (x,y) from cell (0,0)
/// under the condition that you can only travel one step to the right or down.
///
/// Assumption: All costs are positive numbers

func findMinCost(_ grid: [[Int]]) -> [[Int]] {
    
    var minCost: [[Int]] = [[0,0,0],
                            [0,0,0],
                            [0,0,0]]
    
     minCost[0][0] = grid[0][0]
    
    /// Prepare first row
    for j in 1..<3 {
        
        minCost[0][j] = minCost[0][j-1] + grid[0][j]
    }
    
    /// Prepare first column
    for i in 1..<3 {
        minCost[i][0] = minCost[i-1][0] + grid[i][0]
    }
    
    /// Prepare inner body of minCost
    for i in 1..<3 {
        for j in 1..<3 {
            minCost[i][j] = min(minCost[i-1][j], minCost[i][j-1]) + grid[i][j]
        }
    }
    return minCost
}

let CostGrid = [[1,2,3],
                 [4,5,6],
                 [7,8,9]]

let minCost = findMinCost(CostGrid)

print(minCost)


