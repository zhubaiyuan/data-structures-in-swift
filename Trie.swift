//Implementation
public class TrieNode<K: Hashable> {
    var value: K?
    weak var parent: TrieNode?
    var children: [K: TrieNode] = [:]
    var isFinal = false

    init(value: K? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
}

public class Trie {
    private let rootNode: TrieNode<Character>

    init() {
        rootNode = TrieNode<Character>()
    }

    //Insert
    func insert(word: String) {
        guard !word.isEmpty else { return }
        var curNode = rootNode
        let characters = Array(word.lowercased())
        var curIndex = 0
        while curIndex < characters.count {
            let character = characters[curIndex]
            if let child = curNode.children[character] {
                curNode = child
            } else {
                curNode.children[character] = TrieNode(value: character, parent: curNode)
                curNode = curNode.children[character]!
            }
            curIndex += 1
            if curIndex == characters.count {
                curNode.isFinal = true
            }
        }
    }

    //Query
    func query(word: String) -> Bool {
        let characters = Array(word.lowercased())
        var node: TrieNode? = rootNode
        for character in characters {
            node = node?.children[character]
            if node == nil {
                return false
            }
        }
        return node!.isFinal
    }

    //Remove
    func remove(word: String) {
        let characters = Array(word.lowercased())
        var node: TrieNode? = rootNode
        for character in characters {
            node = node?.children[character]
            if node == nil {
                return
            }
        }
        node!.isFinal = false
    }
}

//Insert
var myTrie = Trie()
myTrie.insert(word: "code")
myTrie.insert(word: "comb")

//Query and Remove
print(myTrie.query(word: "code"))
myTrie.remove(word: "code")
print(myTrie.query(word: "code"))
//Output
// "true"
// "false"
