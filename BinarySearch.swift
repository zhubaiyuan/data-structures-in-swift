func binarySearch<inputType: Comparable>(inputArray: Array<inputType>, searchValue: inputType) -> Int? {
    var lowerIndex = 0
    var upperIndex = inputArray.count - 1
    while (true) {
        let currentIndex = (lowerIndex + upperIndex) / 2
        if (inputArray[currentIndex] == searchValue) {
            return currentIndex
        } else if (lowerIndex > upperIndex) {
            return nil
        } else {
            if (inputArray[currentIndex] > searchValue) {
                upperIndex = currentIndex + 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
    }
}

var testArray2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 20]
if let searchIndex = binarySearch(inputArray: testArray2, searchValue: 5) {
    print("The element is found at index: \(searchIndex)")
}
// Output
// "The element is found at index: 4"