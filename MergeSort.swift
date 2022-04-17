public func mergeSort<inputType: Comparable>(_ inputArray: [inputType]) -> [inputType] {
    if inputArray.count < 2 {
        return inputArray
    }
    let center = (inputArray.count) / 2
    return merge(mergeSort([inputType](inputArray[0..<center])), rightList: mergeSort([inputType](inputArray[center..<inputArray.count])))
}

private func merge<inputType: Comparable>(_ leftList: [inputType], rightList: [inputType]) -> [inputType] {
    var leftIndex = 0
    var rightIndex = 0
    var tmpList = [inputType]()
    tmpList.reserveCapacity(leftList.count + rightList.count)
    while (leftIndex < leftList.count && rightIndex < rightList.count) {
        if leftList[leftIndex] < rightList[rightIndex] {
            tmpList.append(leftList[leftIndex])
            leftIndex += 1
        } else if leftList[leftIndex] > rightList[rightIndex] {
            tmpList.append(rightList[rightIndex])
            rightIndex += 1
        } else {
            tmpList.append(leftList[leftIndex])
            tmpList.append(rightList[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    tmpList += [inputType](leftList[leftIndex..<leftList.count])
    tmpList += [inputType](rightList[rightIndex..<rightList.count])
    return tmpList
}

var testArray4 = [9, 2, 6, 4, 5, 10, 8, 12, 16, 11]
print("Initial array: \(testArray4)")
print("Result array: \(mergeSort(testArray4))")
// Output
// "Initial array: [9, 2, 6, 4, 5, 10, 8, 12, 16, 11]"
// "Result array: [2, 4, 5, 6, 8, 9, 10, 11, 12, 16]"