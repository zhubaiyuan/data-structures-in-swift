func partition<inputType: Comparable>(_ inputArray: inout [inputType], lowIndex: Int, highIndex: Int) -> Int {
    let pivot = inputArray[highIndex]
    var i = lowIndex
    for j in lowIndex..<highIndex {
        if inputArray[j] <= pivot {
            inputArray.swapAt(i, j)
            i += 1
        }
    }
    inputArray.swapAt(i, highIndex)
    return i
}

func quickSort<inputType: Comparable>(_ inputArray: inout [inputType], lowIndex: Int, hiIndex: Int) {
    if lowIndex < hiIndex {
        let pivot = partition(&inputArray, lowIndex: lowIndex, highIndex: hiIndex)
        quickSort(&inputArray, lowIndex: lowIndex, hiIndex: pivot - 1)
        quickSort(&inputArray, lowIndex: pivot + 1, hiIndex: hiIndex)
    }
}
