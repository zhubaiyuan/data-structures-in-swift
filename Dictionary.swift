var myDict = ["Miller" : "a person who owns or works in a corn mill", "Programmer" : "a person who writes computer programs"]

var myDict2 : [String : String] = ["Miller" : "a person who owns or works in a corn mill", "Programmer" : "a person who writes computer programs"]

//Three was of dictionary declaration
//1st
var myDictionary = Dictionary<Int, String>()
//2nd
var myDictionary2 = [Int : String]()
//3rd
var myDictionary3: [Int : String] = [:]

let countryKeys = ["US", "UK", "AZ"]
let countryValues = ["United States", "United Kingdom", "Azerbaijan"]
let newDictionary = Dictionary(uniqueKeysWithValues: zip(countryKeys, countryValues))
print(newDictionary)
// Output
// ["UK": "United Kingdom", "AZ": "Azerbaijan", "US": "United States"]

//Accessing Values in a Dictionary
//Using optional binding
var myDictionary4 : [Int: String] = [1: "One", 2: "Two", 3: "Three"]
if let optValue = myDictionary4[4] {
    print(optValue)
} else {
    print("Key not found")
}
//Output
//Key not found

//Using forced unwrapping
let forcedValue = myDictionary4[3]!
print(forcedValue)
// Output
// Three

for (key, value) in myDictionary4 {
    print("The value for \(key) is \(value)")
}
// Output
// The value for 1 is One
// The value for 3 is Three
// The value for 2 is Two

let sortedArray = myDictionary4.sorted(by: {$0.0 < $1.0})
for (key) in sortedArray.map({$0.0}) {
    print("The key: \(key)")
}
// Output
// The key: 1
// The key: 2
// The key: 3

for (value) in sortedArray.map({$0.1}) {
    print("The value: \(value)")
}
// Output
// The value: One
// The value: Two
// The value: Three

//Adding/Modifying to a Dictionary
//Add a new element to the dictionary
myDictionary4.updateValue("Four", forKey: 4)

//Add a new element using subscript notation
myDictionary4[5] = "Five"

//Removing a Value from a Dictionary
//Remove a value from a dictionary using the method
let removedValue = myDictionary4.removeValue(forKey: 1)

//Remove a value using subscript notation
myDictionary4[2] = nil

//Built-in Functions and Properties
//isEmpty
print(myDictionary4.isEmpty)
// Output
// false

//First
let myDictionary5 : [Int: String] = [1: "One", 2: "Two", 3: "Three"]
print(myDictionary5.first as Any)
// Output
// Optional((key: 3, value: "Three"))

//Count
print(myDictionary5.count)
// Output
// 3

//Keys
let dictKeys = Array(myDictionary5.keys)
print(dictKeys)
// Output
// [3, 2, 1]
