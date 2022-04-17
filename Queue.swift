//Queue methods

//enqueue() - Add an element at the end of the queue
//dequeue() - Remove and return the first element from the queue
//peek() - Return the first element from queue, but not remove it
//count - Return the number of elements in the queue
//clear() - Reset the queue to an empty state
//isEmpty() - Return true if the queue is empty
//isFull() - Return true if the queue if full

//Implementation
import Foundation
public struct Queue<T> {
    private var data: [T] = []
    //Enqueue method
    public mutating func enqueue(element: T) {
        data.append(element)
    }
    //Dequeue method
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    //Peek method
    public func peek() -> T? {
        return data.first
    }
    //Clear
    public mutating func clear() {
        return data.removeAll()
    }
    //Count
    public var count: Int {
        return data.count
    }
    //Capacity will be used for isFull() method
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    //isFull method
    public func isFull() -> Bool {
        return count == data.capacity
    }
    //isEmpty() method
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
}

var cusTomQueue = Queue<Int>()
cusTomQueue.enqueue(element: 1)
cusTomQueue.enqueue(element: 2)
cusTomQueue.enqueue(element: 3)
print(cusTomQueue)
// Output
// Queue<Int>(data: [1, 2, 3])

extension Queue: CustomStringConvertible {
    public var description: String {
        return data.description
    }
}
// Output
// [1, 2, 3]

print(cusTomQueue.dequeue() as Any)
print(cusTomQueue.peek() as Any)
// Output
// "Optional(1)"
// "Optional(2)"
