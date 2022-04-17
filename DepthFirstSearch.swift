public class DFNode<inputType> {
    public var value: inputType
    public var children: [DFNode] = []

    public init(_ value: inputType) {
        self.value = value
    }

    public func addChild(_ child: DFNode) {
        children.append(child)
    }

    public func depthFirstSearch(visit: (DFNode) -> Void) {
        visit(self)
        children.forEach {
            $0.depthFirstSearch(visit: visit)
        }
    }
}

let nodeA2 = DFNode("A")
let nodeB2 = DFNode("B")
let nodeC2 = DFNode("C")
let nodeD2 = DFNode("D")
let nodeE2 = DFNode("E")
let nodeF2 = DFNode("F")
let nodeG2 = DFNode("G")
nodeA2.addChild(nodeB2)
nodeA2.addChild(nodeC2)
nodeB2.addChild(nodeE2)
nodeB2.addChild(nodeF2)
nodeE2.addChild(nodeG2)
nodeA2.depthFirstSearch {
    print($0.value)
}
// Output
// "A"
// "B"
// "E"
// "G"
// "F"
// "C"
