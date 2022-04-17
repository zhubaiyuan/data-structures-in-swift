//Full syntax declaration
var intSet = Set<Int>()

//Initialize a set from an array literal
var stringSet: Set = ["One", "Two", "Three"]

//Accessing,Adding, and Removing an Element of a Set
//Accessing an Element
for num in stringSet {
    print(num)
}
// Output
// One
// Three
// Two

//Ordered iteration
for num in stringSet.sorted() {
    print(num)
}
// Output
// One
// Three
// Two

//Check if the element exists
if stringSet.contains("One") {
    print("Element found")
} else {
    print("Element not found")
}
// Output
// Element found

//Adding an Element
//Insert a new element
stringSet.insert("Four")
print(stringSet)
// Output
// ["Three", "Two", "One", "Four"]

//Removing Elements
//remove(_:) - To remove an element when you have an instance of it
//remove(at:) - To remove the element when you know the index
//removeFirst() - To remove the first element and the starting index
//removeAll() or removeAll(keepCapacity) - To remove all elements

//Remove an element
stringSet.remove("Four")

//Remove an element in an index
if let idx = stringSet.firstIndex(of: "One") {
    stringSet.remove(at: idx)
}

//Remove first
stringSet.removeFirst()

//Remove all
stringSet.removeAll()

//Comparison Operations
//Union
let A: Set = [1, 3, 5, 7]
let B: Set = [0, 2, 4, 6]
print(A.union(B))
// Output
// [3, 7, 4, 6, 2, 1, 5, 0]

//Intersection
let C: Set = [1, 2, 3, 4, 5]
let D: Set = [0, 2, 4, 6, 8]
print(C.intersection(D))
// Output
// [2, 4]

//Subtracting
var E: Set = [1, 3, 5, 7, 9]
let F: Set = [0, 3, 7, 6, 8]
print(E.subtracting(F))
// Output
// [5, 9, 1]

//Symmetric difference
var G: Set = [1, 2, 3, 4, 5]
var H: Set = [0, 2, 4, 6, 8]
print(G.symmetricDifference(H))
// Output
// [1, 3, 8, 5, 0, 6]

//Membership and Equality Operations
//Set Equality
let I: Set = [2, 4, 6, 8, 10]
let J: Set = [0, 3, 7, 6, 8]
let K: Set = [10, 8, 4, 2, 6]
if I == J {
    print("I and J are equal")
} else {
    print("I and J are different")
}
if I == K {
    print("I and K are equal")
} else {
    print("I and K are different")
}
// Output
// I and J are different
// I and K are equal

//Set Membership
//isSubset(of:) - Use this method to determine if all of the values of a set are contained in a specified set.
//isStrictSubset(of:) - Use this method to determine if a set is a subset, but not equal to the specified set.
//isSuperset(of:) - Use this method to determine if a set contains all of the values of the specified set.
//isStrictSuperset(of:) - Use this method to determine if a set is a superset, but not equal to the specified set.
//isDisjoint(with:) - Use this method to determine if the two have the same values in common.
let L: Set = [2, 4, 6, 8, 10]
let M: Set = [0, 4, 2, 6, 7, 9, 10, 8]
print("isSubset:", L.isSubset(of: M))
print("isSuperset:", M.isSuperset(of: L))
print("isStrictSubset:", L.isStrictSubset(of: M))
print("isDisjointWith:", L.isDisjoint(with: M))
// Output
// isSubset: true
// isSuperset: true
// isStrictSubset: true
// isDisjointWith: false
