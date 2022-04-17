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

for (key, value) in myDictionary4 {
    print("The value for \(key) is \(value)")
}

let sortedArray = myDictionary4.sorted(by: {$0.0 < $1.0})
for (key) in sortedArray.map({$0.0}) {
    print("The key: \(key)")
}
for (value) in sortedArray.map({$0.1}) {
    print("The value: \(value)")
}

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

//First
let myDictionary5 : [Int: String] = [1: "One", 2: "Two", 3: "Three"]
print(myDictionary5.first as Any)

//Count
print(myDictionary5.count)

//Keys
let dictKeys = Array(myDictionary5.keys)
print(dictKeys)
