public class BFSNode<T> {
    public var nodeValue: T
    public var nodeNeighbors: [BFSNode]
    public var visitedNode: Bool

    public init(value: T, neighbors: [BFSNode], visited: Bool) {
        self.nodeValue = value
        self.nodeNeighbors = neighbors
        self.visitedNode = visited
    }

    public func addNeighbor(node: BFSNode) {
        self.nodeNeighbors.append(node)
        node.nodeNeighbors.append(self)
    }

    public static func breadthFirstSearch(first: BFSNode) {
        var queue: [BFSNode] = []
        queue.append(first)
        while queue.isEmpty == false {
            if let node = queue.first {
                print(node.nodeValue)
                node.visitedNode = true
                for child in node.nodeNeighbors {
                    if child.visitedNode == false {
                        queue.append(child)
                    }
                }
                queue.removeFirst()
            }
        }
    }
}

let nodeA = BFSNode(value: "A", neighbors: [], visited: false)
let nodeB = BFSNode(value: "B", neighbors: [], visited: false)
let nodeC = BFSNode(value: "C", neighbors: [], visited: false)
let nodeD = BFSNode(value: "D", neighbors: [], visited: false)
let nodeE = BFSNode(value: "E", neighbors: [], visited: false)
let nodeF = BFSNode(value: "F", neighbors: [], visited: false)
nodeA.addNeighbor(node: nodeB)
nodeC.addNeighbor(node: nodeB)
nodeD.addNeighbor(node: nodeB)
nodeE.addNeighbor(node: nodeB)
nodeF.addNeighbor(node: nodeD)
BFSNode.breadthFirstSearch(first: nodeA)
// Output
// "A"
// "B"
// "C"
// "D"
// "E"
// "F"
