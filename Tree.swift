//Creation
class Node<T: Comparable> {
    var data: T
    weak var parent: Node?
    var children: [Node] = []

    init(data: T) {
        self.data = data
    }

    func printNodeData() -> [String] {
        return ["\(self.data)"] + self.children.flatMap{$0.printNodeData()}.map{"   "+$0}
    }

    func printTree() {
        let text = printNodeData().joined(separator: "\n")
        print(text)
    }

    //Insertion
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }

    //Searching Data
    func search(element: T) -> Node? {
        if element == self.data {
            return self
        }
        for child in children {
            if let result = child.search(element: element) {
                return result
            }
        }
        return nil
    }
}

//Insertion
let drinks = Node(data: "Drinks")
let type1 = Node<String>(data: "Cold")
let type2 = Node<String>(data: "Hot")
drinks.add(child: type1)
drinks.add(child: type2)
type2.add(child: Node(data: "Latte"))
type1.add(child: Node(data: "Cola"))
type1.add(child: Node(data: "Fanta"))
drinks.printTree()
// Output
// "Drink"
//      "Cold"
//           "Cola"
//           "Fanta"
//      "Hot"
//           "Latte"

//Searching Data
let latte = drinks.search(element: "Latte")
if let result = latte {
    result.printTree()
}
// Output
// "Latte"
