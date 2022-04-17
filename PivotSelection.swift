private func getMedian<inputType: Comparable>(_ inputArray: inout [inputType], lowIndex: Int, highIndex: Int) -> inputType {
    let center = lowIndex + (highIndex - lowIndex) / 2
    if inputArray[lowIndex] > inputArray[center] {
        inputArray.swapAt(lowIndex, center)
    }
    if inputArray[lowIndex] > inputArray[highIndex] {
        inputArray.swapAt(lowIndex, highIndex)
    }
    if inputArray[center] > inputArray[highIndex] {
        inputArray.swapAt(lowIndex, highIndex)
    }
    inputArray.swapAt(center, highIndex)
    return inputArray[highIndex]
}
