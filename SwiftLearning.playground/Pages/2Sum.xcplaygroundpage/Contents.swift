import Foundation


func twoSum(_ array: [Int], _ SUM: Int) -> [[Int]] {
    
    var sums: [[Int]] = []
    var hashTable: [String: Int] = [:]
    for index in 0..<array.count {
        let sumMinusElement = SUM - array[index]
        
        if hashTable["\(sumMinusElement)"] != nil {
            sums.append([array[index], sumMinusElement])
        }
        
        hashTable["\(array[index])"] = array[index]
    }
    
    return sums
    
}

let value = twoSum([3, 5, 2, -4, 8, 11], 7)
print(value)

