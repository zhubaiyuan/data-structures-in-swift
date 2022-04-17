class GraphNode {
    var visited = false
    var connections: [Connection] = []
}

class Connection {
    public let toNode: GraphNode
    public let cost: Int

    public init(to node: GraphNode, cost: Int) {
        assert(cost >= 0, "Cost has to be equal or greater than zero")
        self.toNode = node
        self.cost = cost
    }
}

class Path {
    public let cumulativeCost: Int
    public let node: GraphNode
    public let previousPath: Path?

    init(to node: GraphNode, via connection: Connection? = nil, previousPath path: Path? = nil) {
        if let previousPath = path, let viaConnection = connection {
            self.cumulativeCost = viaConnection.cost + previousPath.cumulativeCost
        } else {
            self.cumulativeCost = 0
        }
        self.node = node
        self.previousPath = path
    }
}

func dijskastraShortestPath(source: GraphNode, destination: GraphNode) -> Path? {
    var pathCollection: [Path] = [] {
        didSet {
            pathCollection.sort { return $0.cumulativeCost < $1.cumulativeCost }
        }
    }
    pathCollection.append(Path(to: source))
    while !pathCollection.isEmpty {
        let cheapestPathInPathCollection = pathCollection.removeFirst()
        guard !cheapestPathInPathCollection.node.visited else {
            continue
        }
        if cheapestPathInPathCollection.node === destination {
            return cheapestPathInPathCollection
        }
        cheapestPathInPathCollection.node.visited = true
        for connection in cheapestPathInPathCollection.node.connections where !connection.toNode.visited {
            pathCollection.append(Path(to: connection.toNode, via: connection, previousPath: cheapestPathInPathCollection))
        }
    }
    return nil
}

class sampleGraphNode: GraphNode {
    let name: String
    init(name: String) {
        self.name = name
        super.init()
    }
}

let nodeA3 = sampleGraphNode(name: "A")
let nodeB3 = sampleGraphNode(name: "B")
let nodeC3 = sampleGraphNode(name: "C")
let nodeD3 = sampleGraphNode(name: "D")
let nodeE3 = sampleGraphNode(name: "E")
let nodeF3 = sampleGraphNode(name: "F")
let nodeG3 = sampleGraphNode(name: "G")
nodeA3.connections.append(Connection(to: nodeB3, cost: 2))
nodeA3.connections.append(Connection(to: nodeC3, cost: 5))
nodeB3.connections.append(Connection(to: nodeC3, cost: 6))
nodeB3.connections.append(Connection(to: nodeD3, cost: 1))
nodeB3.connections.append(Connection(to: nodeE3, cost: 3))
nodeC3.connections.append(Connection(to: nodeF3, cost: 8))
nodeD3.connections.append(Connection(to: nodeE3, cost: 4))
nodeE3.connections.append(Connection(to: nodeG3, cost: 9))
nodeF3.connections.append(Connection(to: nodeG3, cost: 7))
let sourceNode = nodeA3
let destinationNode = nodeG3
var path = dijskastraShortestPath(source: sourceNode, destination: destinationNode)
if let succession: [String] = path?.array.reversed().compactMap({ $0 as? sampleGraphNode}).map({$0.name}) {
  print("Quickest path: \(succession)")
} else {
    print("No path between \(sourceNode.name) & \(destinationNode.name)")
}
// Output
// "Quickest path: ['A', 'B', 'E', 'G']"
