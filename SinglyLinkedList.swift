import Foundation

//Node
public class Node<nodeType> {
    public var value: nodeType
    public var next: Node?

    public init(value: nodeType) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " " 
    }
}

//Singly Linked List
public class SinglyLinkedList<listType> {
    public var head: Node<listType>?
    public var tail: Node<listType>?

    public var isEmpty: Bool {
        return head == nil
    }

    //Append
    public func append(value: listType) {
        let newNode = Node(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
        } else {
            head = newNode
        }
    }

    //Insert
    func insert(value: listType, index: Int) {
        let newNode = Node(value: value)
        if (index == 0) {
            newNode.next = head
            head = newNode
        } else {
            var prev = head
            var cur = head
            for _ in 0..<index {
                prev = cur
                cur = cur?.next
            }
            newNode.next = prev?.next
            prev?.next = newNode
        }
    }

    //removeLast
    public func removeLast() -> listType? {
        if let h = head {
            if h.next == nil {
                defer {
                    head = nil
                    tail = nil
                }
                return h.value
            }
            var prev = h
            var curr = h
            while let next = curr.next {
                prev = curr
                curr = next
            }
            prev.next = nil
            tail = prev
            return curr.value
        } else {
            return nil
        }
    }

    //remove(at:)
    func remove(at position: Int) {
        if head == nil {
            return
        }
        var h = head
        if (position == 0) {
            head = h?.next
            return
        }
        for _ in 0..<position-1 where h != nil {
            h = h?.next
        }
        if h == nil || h?.next == nil {
            return
        }
        let nextToNextNode = h?.next?.next
        h?.next = nextToNextNode
    }
}

extension SinglyLinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

//Adding New Values to a Linked List
//append - New value is added at the end of the list
//insert(value:, index:) - To insert an element at a position we need to

//Append
var newList = SinglyLinkedList<Int>()
newList.append(value: 2)
newList.append(value: 4)
newList.append(value: 6)
newList.append(value: 8)
print(newList)
// Output
// "2 -> 4 -> 6 -> 8"

//Insert
print("newList: \(newList)")
newList.insert(value: 1, index: 0)
print("1 has been added to index 0: \(newList)")
newList.insert(value: 3, index: 2)
print("3 has been added to index 2: \(newList)")
newList.insert(value: 5, index: 4)
print("5 has been added to index 4: \(newList)")
// Output
// "newList: 2 -> 4 -> 6 -> 8"
// "1 has been added to index 0: 1 -> 2 -> 4 -> 6 -> 8"
// "3 has been added to index 2: 1 -> 2 -> 3 -> 4 -> 6 -> 8"
// "5 has been added to index 4: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 8"

//Removing New Values from a LinkedList
//removeLast - Removes the value at the end of the list
//remove(at:) - Removes a value anywhere in the list

//removeLast and remove(at:)
print("Initial list: \(newList)")
newList.remove(at: 2)
print("Index 2 is removed: \(newList)")
newList.remove(at: 0)
print("Index 0 is removed: \(newList)")
// Output
// "Initial list: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 8"
// "Index 2 is removed: 1 -> 2 -> 4 -> 5 -> 6 -> 8"
// "Index 0 is removed: 2 -> 4 -> 5 -> 6 -> 8"
