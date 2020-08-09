
import Foundation

open class GridDimension {
    public let M: Int
    public let N: Int
    
    public init(m: Int, n: Int) {
        M = m
        N = n
    }
}
open class GridHelper {
    
    public static let shared: GridHelper = GridHelper()
    public var dimension: GridDimension = GridDimension(m: 3, n: 3)
    public func getPositiveIntGrid() -> [[Int]] {
        var grid: [[Int]] = []
        var value: Int = 0
        for _ in 0..<dimension.M {
            var column: [Int] = []
            for _ in 0..<dimension.N {
                value += 1
                column.append(value)
            }
            if !column.isEmpty {
                grid.append(column)
            }
        }
        
        return grid
    }
    
    public func getEmptyGrid(with element: Int = 0) -> [[Int]] {
        var grid: [[Int]] = []
        
        for _ in 0..<dimension.M  {
            var column: [Int] = []
            for _ in 0..<dimension.N {
                column.append(element)
            }
            if !column.isEmpty {
                grid.append(column)
            }
        }
        
        return grid
    }
    
    
    public static func print(grid: [[Int]]) {
        for x in grid {
            Swift.print(x)
        }
        Swift.print("=============")
    }

}
