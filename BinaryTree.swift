class BTNode<T> {
    var value: T
    var leftChild: BTNode<T>?
    var rightChild: BTNode<T>?

    init(_ value: T, _ leftChild: BTNode?, _ rightChild: BTNode?) {
        self.value = value
        self.rightChild = rightChild
        self.leftChild = leftChild
    }

    //In-order traversal
    func inorderTraversal(_ btNode: BTNode<T>?) {
        guard let _ = btNode else { return }
        self.inorderTraversal(btNode?.leftChild)
        print("\(btNode!.value)", terminator: "  ")
        self.inorderTraversal(btNode?.rightChild)
    }

    //Pre-order traversal
    func preorderTraversal(_ btNode: BTNode<T>?) {
        guard let _ = btNode else { return }
        print("\(btNode!.value)", terminator: "  ")
        self.preorderTraversal(btNode?.leftChild)
        self.preorderTraversal(btNode?.rightChild)
    }

    //Post-order traversal
    func postorderTraversal(_ btNode: BTNode<T>?) {
        guard let _ = btNode else { return }
        self.postorderTraversal(btNode?.leftChild)
        self.postorderTraversal(btNode?.rightChild)
        print("\(btNode!.value)", terminator: "  ")
    }
}

//Tree Traversal (Also Known As Tree Search)
//In-order - leftChild -> parent -> rightChild
let node3 = BTNode(3, nil, nil)
let node12 = BTNode(12, nil, nil)
let node17 = BTNode(17, nil, nil)
let node28 = BTNode(28, nil, nil)
let node9 = BTNode(9, node3, node12)
let node23 = BTNode(23, node17, node28)
let root = BTNode(15, node9, node23)
let t = BTNode(0, nil, nil)
t.inorderTraversal(root)
// Output
// "3 9 12 15 17 23 28"

//Pre-order - parent -> leftChild -> rightChild
let v = BTNode(0, nil, nil)
v.preorderTraversal(root)
// Output
// "15 9 3 12 23 17 28"

//Post-order - leftChild -> rightChild -> parent
let u = BTNode(0, nil, nil)
u.postorderTraversal(root)
// Output
// "3 12 9 17 28 23 15"
