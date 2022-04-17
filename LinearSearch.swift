func linearSearch<inputType: Comparable>(_ inputArray: [inputType], searchValue: inputType) -> String {
    let n = inputArray.count
    for i in 0..<n {
        if inputArray[i] == searchValue {
            return "The element is found at index \(i)"
        }
    }
    return "The element is not found"
}

var testArray = [1, 2, 3, 4, 5, 6]
print(linearSearch(testArray, searchValue: 6))
// Output
// "The element is found at index 5"