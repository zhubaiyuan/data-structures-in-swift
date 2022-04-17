var intArray = Array<Int>()

//Shows the array capacity
print(intArray.capacity)
intArray.reserveCapacity(500)
print(intArray.capacity)

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

for element in myIntArray {
    print(element)
}

//Adding Elements to an Array
myIntArray.append(11)
print(myIntArray)

myIntArray.insert(12, at: 3)
print(myIntArray)

//Removing Elements from an Array
myIntArray.removeLast()
myIntArray.removeFirst()
myIntArray.remove(at: 1)
myIntArray.removeAll()

//Built-in Functions and Properties
//isEmpty
let myIntArray2: [Int] = [1, 3, 5, 6]
print(myIntArray2.isEmpty)

//First and Last
print(myIntArray2.first as Any)
print(myIntArray2.last as Any)

//Reversed and Reverse
let reversedArray = Array(myIntArray2.reversed())
print(reversedArray)

//Count
print(myIntArray2.count)

var myIntArray3 = [1, 3, 5, 7]
if let index = myIntArray3.firstIndex(of: 5) {
    print("found index")
    let val = myIntArray3.remove(at: index)
    print(val)
}

//Important: Be sure to not go out of bounds
//print(myIntArray2[-1])
//Output
//fatal error: Index out of range
