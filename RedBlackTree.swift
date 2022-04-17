private enum RBNodeColor {
    case red
    case black
}

private enum RotationDirection {
    case left
    case right
}

public class RBNode<T: Comparable>: Equatable {
    fileprivate var color: RBNodeColor = .black
    var key: T?
    var leftChild: RBNode<T>?
    var rightChild: RBNode<T>?
    weak var parent: RBNode<T>?

    var isRootNode: Bool {
        return parent == nil
    }

    var isLeafNode: Bool {
        return rightChild == nil && leftChild == nil
    }

    var isNullLeaf: Bool {
        return key == nil && isLeafNode && color == .black
    }

    var isLeftNode: Bool {
        return parent?.leftChild === self
    }

    var isRightNode: Bool {
        return parent?.rightChild === self
    }

    var grandparentNode: RBNode? {
        return parent?.parent
    }

    var siblingNode: RBNode? {
        if isLeftNode {
            return parent?.rightChild
        } else {
            return parent?.leftChild
        }
    }

    var uncleNode: RBNode? {
        return parent?.siblingNode
    }

    public init(key: T?, leftChild: RBNode<T>?, rightChild: RBNode<T>?, parent: RBNode<T>?) {
        self.key = key
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
        self.leftChild?.parent = self
        self.rightChild?.parent = self
    }

    public convenience init(key: T?) {
        self.init(key: key, leftChild: RBNode(), rightChild: RBNode(), parent: RBNode())
    }

    //For initializing the nullLeaf
    public convenience init() {
        self.init(key: nil, leftChild: nil, rightChild: nil, parent: nil)
        self.color = .black
    }
}

//Equatable protocol
extension RBNode {
    static public func == <T>(lhs: RBNode<T>, rhs: RBNode<T>) -> Bool {
        return lhs.key == rhs.key
    }
}

public class RedBlackTree<T: Comparable> {
    public typealias RBTreeNode = RBNode<T>
    private var root: RBTreeNode
    private var size = 0
    let nullLeaf = RBTreeNode()

    public init() {
        root = nullLeaf
    }

    //Rotation
    private func rotate(node A: RBTreeNode, direction: RotationDirection) {
        var nodeB: RBTreeNode? = RBNode()
        //Step 1
        switch direction {
        case .left:
            nodeB = A.rightChild
            A.rightChild = nodeB?.leftChild
            A.rightChild?.parent = A
        case .right:
            nodeB = A.leftChild
            A.leftChild = nodeB?.rightChild
            A.leftChild?.parent = A
        }
        //Step 2
        nodeB?.parent = A.parent
        if A.isRootNode {
            if let node = nodeB {
                root = node
            }
        } else if A.isLeftNode {
            A.parent?.leftChild = nodeB
        } else if A.isRightNode {
            A.parent?.rightChild = nodeB
        }
        //Step 3
        switch direction {
        case .left:
            nodeB?.leftChild = A
        case .right:
            nodeB?.rightChild = A
        }
        A.parent = nodeB
    }

    //fixInsert - rotates nodes to maintain Red-Black tree rules
    private func fixInsert(node z: RBTreeNode) {
        if !z.isNullLeaf {
            guard let parentZ = z.parent else {
                return
            }
            //If both Z and its parent are red -> violation of red-black tree property, so we need to fix it.
            if parentZ.color == .red {
                guard let uncle = z.uncleNode else {
                    return
                }
                //Case 1: Uncle red -> recolor and move z.
                if uncle.color == .red {
                    parentZ.color = .black
                    uncle.color = .black
                    if let grandParentZ = parentZ.parent {
                        grandParentZ.color = .red
                        //Move z to the grandparent and check again.
                        fixInsert(node: grandParentZ)
                    }
                }
            } else {
                //Case 2: Uncle black
                var zNew = z
                //Case 2.1: z right node -> rotate
                if parentZ.isLeftNode && z.isRightNode {
                    zNew = parentZ
                    rotate(node: zNew, direction: .left)
                } else if parentZ.isRightNode && z.isLeftNode {
                    zNew = parentZ
                    rotate(node: zNew, direction: .right)
                }
                //Case 2.2: z is left child -> recolor + rotate
                zNew.parent?.color = .black
                if let grandparentZnew = zNew.grandparentNode {
                    grandparentZnew.color = .red
                    if z.isLeftNode {
                        rotate(node: grandparentZnew, direction: .right)
                    } else {
                        rotate(node: grandparentZnew, direction: .left)
                    }
                }
            }
        }
        root.color = .black
    }

    //addAsLeftNode - Adds a child as a left node, sets the color to red, and fixes violation
    private func addAsLeftNode(child: RBTreeNode, parent: RBTreeNode) {
        parent.leftChild = child
        child.parent = parent
        child.color = .red
        fixInsert(node: child)
    }

    //addAsRightNode - Adds a child as a right node, sets the color to red, and fixes violation
    private func addAsRightNode(child: RBTreeNode, parent: RBTreeNode) {
        parent.rightChild = child
        child.parent = parent
        child.color = .red
        fixInsert(node: child)
    }

    //Insert
    private func insert(input: RBTreeNode, node: RBTreeNode) {
        guard let inputKey = input.key, let nodeKey = node.key else { return }
        if inputKey < nodeKey {
            guard let child = node.leftChild else {
                addAsLeftNode(child: input, parent: node)
                return
            }
            if child.isNullLeaf {
                addAsLeftNode(child: input, parent: node)
            } else {
                insert(input: input, node: child)
            }
        } else {
            guard let child = node.rightChild else {
                addAsRightNode(child: input, parent: node)
                return
            }
            if child.isNullLeaf {
                addAsRightNode(child: input, parent: node)
            } else {
                insert(input: input, node: child)
            }
        }
    }
    
    //fixDelete - rotates nodes to maintain Red-Black tree rules
    private func fixDelete(node y: RBTreeNode) {
        var yTemp = y
        if y.isRootNode && y.color == .black {
            guard var siblingNode = y.siblingNode else {
                return
            }
            //Case 1: Sibling of y is red.
            if siblingNode.color == .red {
                //Change color
                siblingNode.color = .black
                if let yParent = y.parent {
                    yParent.color = .red
                    //Rotate
                    if y.isRightNode {
                        rotate(node: yParent, direction: .right)
                    } else {
                        rotate(node: yParent, direction: .left)
                    }
                    //Update sibling
                    if let sibling = y.siblingNode {
                        siblingNode = sibling
                    }
                }
            }
            //Case 2: Sibling of y is black with two black children.
            if siblingNode.leftChild?.color == .black && siblingNode.rightChild?.color == .black {
                //Change color
                siblingNode.color = .red
                //Move black unit upward
                if let yParent = y.parent {
                    fixDelete(node: yParent)
                }
            } else {
                //Case 3.1: Sibling is black and with one black child to the left.
                if y.isLeftNode && siblingNode.rightChild?.color == .black {
                    //Change color
                    siblingNode.leftChild?.color = .black
                    siblingNode.color = .red
                    //Rotation to the right
                    rotate(node: siblingNode, direction: .right)
                    //Update the sibling of y
                    if let sibling = y.siblingNode {
                        siblingNode = sibling
                    } // Case 3.2: One black child to the left
                    else if y.isRightNode && siblingNode.leftChild?.color == .black {
                        //Change color
                        siblingNode.rightChild?.color = .black
                        siblingNode.color = .red
                        //Rotation to the left
                        rotate(node: siblingNode, direction: .left)
                        //Update the sibling of y
                        if let sibling = y.siblingNode {
                            siblingNode = sibling
                        }
                    }
                }
                // Case 4: Sibling is black with red right child.
                if let yParent = y.parent {
                    siblingNode.color = yParent.color
                    yParent.color = .black
                    //Case a: y is left and sibling with red right child
                    if y.isLeftNode {
                        siblingNode.rightChild?.color = .black
                        rotate(node: yParent, direction: .left)
                    }
                    //Case b: y is right and sibling with red left child
                    else {
                        siblingNode.leftChild?.color = .black
                        rotate(node: yParent, direction: .right)
                    }
                    yTemp = root
                }
            }
            yTemp.color = .black
        }
    }
}
