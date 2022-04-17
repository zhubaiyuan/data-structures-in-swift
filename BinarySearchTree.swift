class BTNode<T> {
    var value: T
    var leftChild: BTNode?
    var rightChild: BTNode?

    init(value: T, leftChild: BTNode? = nil, rightChild: BTNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

class BinarySearchTree<T: Comparable & CustomStringConvertible> {
    private var rootNode: BTNode<T>?

    //Insert
    func insert(insertedValue: T) {
        let inNode = BTNode(value: insertedValue)
        if let rootNode = self.rootNode {
            self.insertNode(rootNode: rootNode, inNode: inNode)
        } else {
            self.rootNode = inNode
        }
    }

    private func insertNode(rootNode: BTNode<T>, inNode: BTNode<T>) {
        if rootNode.value > inNode.value {
            if let leftChild = rootNode.leftChild {
                self.insertNode(rootNode: leftChild, inNode: inNode)
            } else {
                rootNode.leftChild = inNode
            }
        } else {
            if let rightChild = rootNode.rightChild {
                self.insertNode(rootNode: rightChild, inNode: inNode)
            } else {
                rootNode.rightChild = inNode
            }
        }
    }

    //Search
    func searchValue(sValue: T) {
        self.searchNode(rootNode: self.rootNode, searchValue: sValue)
    }

    private func searchNode(rootNode: BTNode<T>?, searchValue: T) {
        guard let rootNode = rootNode else {
            print("The node of \(searchValue) does not exist")
            return
        }
        print("Root Node \(rootNode.value)")
        if searchValue > rootNode.value {
            self.searchNode(rootNode: rootNode.rightChild, searchValue: searchValue)
        } else if searchValue < rootNode.value {
            self.searchNode(rootNode: rootNode.leftChild, searchValue: searchValue)
        } else {
            print("Node found: \(rootNode.value)")
        }
    }

    //Delete
    func removeValue(sValue: T) {
        rootNode = removeNode(rNode: rootNode, value: sValue)
    }

    private func removeNode(rNode: BTNode<T>?, value: T) -> BTNode<T>? {
        guard let node = rNode else {
            return nil
        }
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = removeNode(rNode: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = removeNode(rNode: node.leftChild, value: value)
        } else {
            node.rightChild = removeNode(rNode: node.rightChild, value: value)
        }
        return node
    }
}

extension BTNode {
    var min: BTNode {
        return leftChild?.min ?? self
    }
}

//Insert and Search
var binaryST = BinarySearchTree<Int>()
for i in 0..<5 {
    binaryST.insert(insertedValue: i)
}
binaryST.searchValue(sValue: 4)
// Output
// "Root Node 0"
// "Root Node 1"
// "Root Node 2"
// "Root Node 3"
// "Root Node 4"
// "Node found: 4"

//Delete
var binaryST2 = BinarySearchTree<Int>()
for i in 0..<5 {
    binaryST2.insert(insertedValue: i)
}
binaryST2.searchValue(sValue: 4)
binaryST2.removeValue(sValue: 4)
binaryST2.searchValue(sValue: 4)
// Output
// "Root Node 0"
// "Root Node 1"
// "Root Node 2"
// "Root Node 3"
// "Root Node 4"
// "Node found: 4"
// "Root Node 0"
// "Root Node 1"
// "Root Node 2"
// "Root Node 3"
// "The node of 4 does not exist"
