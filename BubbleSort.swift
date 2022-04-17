public func bubbleSort<inputType: Comparable>(_ inputArray: inout [inputType]) {
    for endofArray in (1..<inputArray.count).reversed() {
        var swapped = false
        for currentIndex in 0..<endofArray {
            if inputArray[currentIndex] > inputArray[currentIndex + 1] {
                inputArray.swapAt(currentIndex, currentIndex + 1)
                swapped = true
            }
        }
        if !swapped {
            return
        }
    }
}

var testArray = [9, 2, 6, 4, 5]
print("Initial array: \(testArray)")
bubbleSort(&testArray)
print("Sorted array: \(testArray)")
// Output
// "Initial array: [9, 2, 6, 4, 5]"
// "Sorted array: [2, 4, 5, 6, 9]"
