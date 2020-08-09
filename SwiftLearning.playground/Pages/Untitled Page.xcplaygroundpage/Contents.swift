
import Foundation
var ansIndex: Int = 0
while ansIndex <= 20 {
    guard ansIndex%2 == 0 else {
        ansIndex += 1
        print("Else: \(ansIndex)")
        continue
    }
    ansIndex += 1
    print(ansIndex)
}


/*
class FirstClass {
    init () {
        
    }
}
struct FirstStruct {
    
    var firstClass = [FirstClass]()
    func updateFirstClass () {
        firstClass.append(FirstClass())
    }
}

let firstStruct = FirstStruct()
firstStruct.updateFirstClass()
*/


var array: [Int] = [1, 2, 3, 4]
array.append(contentsOf: array)
print(array)


func anotherSyncTestFunc() {
    var x = 5
    DispatchQueue.main.async {
        x = 1
    }
    print(x)
}
anotherSyncTestFunc()


func syncTestFunc() {
    defer {
        print("defer")
    }
    print("start")
    DispatchQueue.global().async {
        print("1. main.sync")
        
    }
    
    DispatchQueue.global().async {
        print("2. main.async")
    }
    
    DispatchQueue.main.async {
        print("3. main.async")
    }
    print("end")
}

syncTestFunc()




//import PlaygroundSupport
//PlaygroundPage.current


let someArr = [1,2,3,nil]
for some in someArr where some != nil {
    print(some)
}




// Recursive enumeration 'indirect'

/// @autoclosure

extension UserDefaults {
    associatedtype x: Item
    var userId: Bool {
        get { return bool(forKey: #function)}
        set { set(newValue, forKey: #function)}
    }
}

let userDefaults = UserDefaults()
userDefaults.userId = true
print(userDefaults.userId)



/**
 * - parameter result: It takes string
 */
func printTest1(with result: @autoclosure () -> Void) {
    print("Before")
    let someValue = 0
    if someValue == 0 {
        result()
    }
    print("After")
}

printTest1(print("result"))
printTest1(<#T##result: Void##Void#>)

assert(<#T##condition: Bool##Bool#>)


//////
let negativeInt = -4
let unsignedInt = UInt(bitPattern: negativeInt)
print(unsignedInt)



import Foundation
struct Pizza {
  let ingredients: [String]
}

protocol Pizzeria {
  func makePizza(_ ingredients: [String]) -> Pizza
  func makeMargherita() -> Pizza
}

extension Pizzeria {
  func makeMargherita() -> Pizza {
    print("tomato, mozzarella")
    return makePizza(["tomato", "mozzarella"])
  }
}

struct Lombardis: Pizzeria {
  func makePizza(_ ingredients: [String]) -> Pizza {
    return Pizza(ingredients: ingredients)
  }

  func makeMargherita() -> Pizza {
    print("tomato, basil, mozzarella")
    return makePizza(["tomato", "basil", "mozzarella"])
  }
}


let lombardis1: Pizzeria = Lombardis()
let lombardis2: Lombardis = Lombardis()

lombardis1.makeMargherita()
lombardis2.makeMargherita()
////////////////////////////

precedencegroup ExponentPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: right
}

infix operator ^^: ExponentPrecedence
func ^^(base: Int, exponent: Int) -> Int {
    let l = Double(base)
    let e = Double(exponent)
    let r = pow(l, e)
    return Int(r)
}


print(2^^3*3)

public struct Thermometer {
    public var temperature: Double
    public init(temperature: Double) {
        self.temperature = temperature
    }
}


extension Thermometer: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(temperature: value)
    }
}

let thermometer: Thermometer = 37.0
thermometer.temperature

extension Array where Element: Comparable {
    func countUniques() -> Int {
        let sorted = self.sorted()
        let initial: (Element?, Int) = (.none, 0)
        let reduced = sorted.reduce(initial) {
            ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
        }
        return reduced.1
    }
}

let array: Array = [1,2,3,3]
array.countUniques()

//class Person {
//    var name: String = ""
//    var age: Int = 0
//}
//
//class Home {
//    private var person = Person() {
//        didSet {
//            print("person set")
//        }
//    }
//    var anotherPreson: Person {
//        get {
//            return person
//        }
//        set {
//            print(newValue.name, newValue.age)
//            person = newValue
//        }
//    }
//
//    func update() {
//        anotherPreson.name = "Sudhanshu"
//        anotherPreson.age = 33
//    }
//}
//
//let home = Home()
//home.update()




/*
 
 9 What is the output of below code

 struct Person : CustomStringConvertible {
     fileprivate var name:String = ""
     fileprivate var age:Int = 0
     
     var description: String {
         return "My name is \(name) and my age is \(age)"
     }
 }

 protocol PersonUpdater : class {
     var data: Person  { get set }
     func  update()
 }

 extension PersonUpdater {
     func update(){
         data.name = "John"
         data.age = 30
     }
 }

 class PersonUpdateClass {
     private var _data:Person = Person()
 }

 extension PersonUpdateClass : PersonUpdater {
     var data: Person {
         get {
             return _data
         }
         set {
             print(newValue.description)
             _data = newValue
         }
     }
 }

 PersonUpdateClass().update()

 Ans
 My name is John and my age is 0
 My name is John and my age is 30
 */
