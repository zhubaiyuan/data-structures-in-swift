var intArray = Array<Int>()

//Shows the array capacity
print(intArray.capacity)
// Output
// 0

intArray.reserveCapacity(500)
print(intArray.capacity)
// Output
// 508

//Create an array using full array syntax
var intArray2 = Array<Int>()

//Create an array using shorthand syntax
intArray2 = [Int]()

//Use array literal declaration
var intLiteralArray: [Int] = [1, 2, 3]

//Use shorthand literal declaration
var intLiteralArray2 = [1, 2, 3]

//Create an array with a default value
var intLiteralArray3 = [Int](repeating: 2, count: 5)

//Retrieving Elements from an Array
var myIntArray = [1, 2, 3, 4, 5]
var aNumber = myIntArray[2]
print(aNumber)
// Output
// 3

for element in myIntArray {
    print(element)
}
// Output
// 1
// 2
// 3
// 4
// 5

//Adding Elements to an Array
myIntArray.append(11)
print(myIntArray)
// Output
// [1, 2, 3, 4, 5, 11]

myIntArray.insert(12, at: 3)
print(myIntArray)
// Output
// [1, 2, 3, 12, 4, 5, 11]

//Removing Elements from an Array
myIntArray.removeLast()
myIntArray.removeFirst()
myIntArray.remove(at: 1)
myIntArray.removeAll()

//Built-in Functions and Properties
//isEmpty
let myIntArray2: [Int] = [1, 3, 5, 6]
print(myIntArray2.isEmpty)
// Output
// false

//First and Last
print(myIntArray2.first as Any)
// Output
// Optional(1)
print(myIntArray2.last as Any)
// Output
// Optional(6)

//Reversed and Reverse
let reversedArray = Array(myIntArray2.reversed())
print(reversedArray)
// Output
// [6, 5, 3, 1]

//Count
print(myIntArray2.count)
// Output
// 4

var myIntArray3 = [1, 3, 5, 7]
if let index = myIntArray3.firstIndex(of: 5) {
    print("found index")
    let val = myIntArray3.remove(at: index)
    print(val)
}
// Output
// found index
// 5

//Important: Be sure to not go out of bounds
//print(myIntArray2[-1])
//Output
//fatal error: Index out of range
