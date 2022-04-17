public func insertionSort<inputType: Comparable>(_ inputArray: inout [inputType]) {
    for currentIndex in 1..<inputArray.count {
        for swap in (1...currentIndex).reversed() {
            if inputArray[swap] < inputArray[swap - 1] {
                inputArray.swapAt(swap, swap - 1)
            } else {
                break
            }
        }
    }
}

var testArray3 = [9, 2, 6, 4, 5, 10, 8, 12, 16, 11]
print("Initial array: \(testArray3)")
insertionSort(&testArray3)
print("Sorted array: \(testArray3)")
// Output
// "Initial array: [9, 2, 6, 4, 5, 10, 8, 12, 16, 11]"
// "Sorted array: [2, 4, 5, 6, 8, 9, 10, 11, 12, 16]"