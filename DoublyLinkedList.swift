import Foundation

//Doubly Linked List
public class DoubleNode<nodeType> {
    var value: nodeType
    var next: DoubleNode<nodeType>?
    weak var previous: DoubleNode<nodeType>?

    init(value: nodeType) {
        self.value = value
    }
}

extension DoubleNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

public class DoublyLinkedList<listType> {
    var head: DoubleNode<listType>?
    private var tail: DoubleNode<listType>?

    public var isEmpty: Bool {
        return head == nil
    }

    public func nodeAt(index: Int) -> DoubleNode<listType>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }

    // Insert
    func insert(node: DoubleNode<listType>, at index: Int) {
        if index == 0,
           tail == nil {
            head = node
            tail = node
        } else {
            guard let nodeAtIndex = nodeAt(index: index) else {
                print("Index out of bounds.")
                return
        }
        if nodeAtIndex.previous == nil {
                head = node
        }
            node.previous = nodeAtIndex.previous
            nodeAtIndex.previous?.next = node
            node.next = nodeAtIndex
            nodeAtIndex.previous = node
        }
    }

    //Remove Node Method
    public func remove(node: DoubleNode<listType>) -> listType {
        let previousNode = node.previous
        let nextNode = node.next
        if let prev = previousNode {
            prev.next = nextNode
        } else {
            head = nextNode
        }
        nextNode?.previous = previousNode
        if nextNode == nil {
            tail = previousNode
        }
        node.previous = nil
        node.next = nil
        return node.value
    }

    //Remove(at:)
    func remove(at index: Int) {
        var toDeleteNode = nodeAt(index: index)
        guard toDeleteNode != nil else {
            print("Index out of bounds.")
            return
        }
        let previousNode = toDeleteNode?.previous
        let nextNode = toDeleteNode?.next
        if previousNode == nil {
            head = nextNode
        }
        if toDeleteNode?.next == nil {
            tail = previousNode
        }
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
        toDeleteNode = nil
    }
}


//Adding New Values to a Doubly Linked List
//insert(node:, at:) - To insert a double node at a position we need to

// Insert
var newList = DoublyLinkedList<Int>()
print("newList: \(newList)")
newList.insert(node: DoubleNode(value: 1), at: 0)
print("1 has been added to index 0: \(newList)")
newList.insert(node: DoubleNode(value: 3), at: 0)
print("3 has been added to index 0: \(newList)")
newList.insert(node: DoubleNode(value: 5), at: 1)
print("5 has been added to index 1: \(newList)")
// Output
// newList: DoublyLinkedList.DoublyLinkedList<Swift.Int>
// 1 has been added to index 0: DoublyLinkedList.DoublyLinkedList<Swift.Int>
// 3 has been added to index 0: DoublyLinkedList.DoublyLinkedList<Swift.Int>
// 5 has been added to index 1: DoublyLinkedList.DoublyLinkedList<Swift.Int>

// Remove
print("Initial list: \(newList)")
newList.remove(at: 2)
print("Index 2 is removed: \(newList)")
newList.remove(at: 0)
print("Index 0 is removed: \(newList)")
// Output
// Initial list: DoublyLinkedList.DoublyLinkedList<Swift.Int>
// Index 2 is removed: DoublyLinkedList.DoublyLinkedList<Swift.Int>
// Index 0 is removed: DoublyLinkedList.DoublyLinkedList<Swift.Int>
